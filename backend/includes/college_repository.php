<?php

/**
 * Fetch colleges with their branch cutoffs and package details.
 *
 * @param mysqli $conn
 * @return array<int, array<string, mixed>>
 */
function getCollegesWithCutoffs(mysqli $conn): array
{
    $colleges = [];

    $collegeSql = "SELECT id, slug, name, location, fees, website, highest_package, avg_package 
                   FROM colleges
                   ORDER BY name ASC";

    if ($result = $conn->query($collegeSql)) {
        while ($row = $result->fetch_assoc()) {
            $dbId = (int) $row['id'];
            $colleges[$dbId] = [
                'db_id' => $dbId,
                'id' => $row['slug'],
                'slug' => $row['slug'],
                'name' => $row['name'],
                'location' => $row['location'],
                'fees' => $row['fees'],
                'website' => $row['website'],
                'packages' => [
                    'high' => $row['highest_package'],
                    'avg' => $row['avg_package'],
                ],
                'cutoffs' => [],
            ];
        }
        $result->free();
    }

    if (empty($colleges)) {
        return [];
    }

    $cutoffSql = "SELECT college_id, branch, category, cutoff FROM branch_cutoffs";
    if ($cutoffResult = $conn->query($cutoffSql)) {
        while ($row = $cutoffResult->fetch_assoc()) {
            $collegeId = (int) $row['college_id'];
            if (!isset($colleges[$collegeId])) {
                continue;
            }

            $branch = $row['branch'];
            $category = strtoupper($row['category']);
            if (!isset($colleges[$collegeId]['cutoffs'][$branch])) {
                $colleges[$collegeId]['cutoffs'][$branch] = [];
            }
            $colleges[$collegeId]['cutoffs'][$branch][$category] = (int) $row['cutoff'];
        }
        $cutoffResult->free();
    }

    // Ensure cutoffs are always an associative array (not stdClass)
    // This ensures proper JSON encoding for JavaScript
    foreach ($colleges as &$college) {
        if (empty($college['cutoffs'])) {
            $college['cutoffs'] = [];
        } else {
            // Ensure it's an array, not stdClass
            $college['cutoffs'] = (array) $college['cutoffs'];
        }
    }
    unset($college);

    return array_values($colleges);
}

?>

