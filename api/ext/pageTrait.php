<?php

namespace api\ext;

trait pageTrait
{
    /**
     * 分页
     * @param array $cond
     * @return array
     */
    public function getCondPageDef($cond = [])
    {
        $pageNums = $this->request->param('nums') ?? 10;
        $page = $this->request->param('page') ?? 1;

        if ($pageNums > 200 || $pageNums < 0) {
            $pageNums = 10;
        }
        if ($page < 1 || $page > 10000) {
            $page = 1;
        }

        $cond['page'] = $page;
        $cond['nums'] = $pageNums;
        $cond['offset'] = ($page - 1) * $pageNums;

        return $cond;
    }
}