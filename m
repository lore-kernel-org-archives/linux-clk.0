Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/16] clk: a collection of various clean-ups and improvements
Date: Mon, 28 Dec 2015 19:10:13 +0900
Message-Id: <1451297429-21689-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

Many refactoring, with detection of circular parent looping.


Changes in v2:
  - Fix a bug.  Return -EINVAL when parent _is_ NULL.

Masahiro Yamada (16):
  clk: remove unused first argument of __clk_init()
  clk: change the argument of __clk_init() into pointer to clk_core
  clk: rename __clk_init() into __clk_core_init()
  clk: remove unnecessary !core->parents conditional
  clk: change sizeof(struct clk *) to sizeof(*core->parents)
  clk: move core->parents allocation to clk_register()
  clk: simplify clk_core_get_parent_by_index()
  clk: drop the initial core->parents look-ups from __clk_core_init()
  clk: replace pr_warn() with pr_err() for fatal cases
  clk: move checking .git_parent to __clk_core_init()
  clk: simplify __clk_init_parent()
  clk: avoid circular clock topology
  clk: walk the orphan clock list more simply
  clk: make sure parent is not NULL in clk_fetch_parent_index()
  clk: simplify clk_fetch_parent_index() function
  clk: slightly optimize clk_core_set_parent()

 drivers/clk/clk.c | 214 ++++++++++++++++++++++--------------------------------
 1 file changed, 85 insertions(+), 129 deletions(-)

-- 
1.9.1
