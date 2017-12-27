Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:16792 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751386AbdL0EZc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 Dec 2017 23:25:32 -0500
Date: Wed, 27 Dec 2017 12:25:13 +0800
From: kbuild test robot <fengguang.wu@intel.com>
To: Sergej Sawazki <sergej@taudac.com>
Cc: kbuild-all@01.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@codeaurora.org>
Subject: [clk:clk-next 136/143] drivers/clk/clk-si5351.c:906:6: sparse:
 symbol '_si5351_clkout_reset_pll' was not declared. Should it be static?
Message-ID: <201712271259.pq3B6Kw4%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
head:   cf12ed59508b49c2baaccd7cff68d550c5042b58
commit: b26ff127c52c005ac4eb99ebff7bd17c240c2e89 [136/143] clk: si5351: Apply PLL soft reset before enabling the outputs
reproduce:
        # apt-get install sparse
        git checkout b26ff127c52c005ac4eb99ebff7bd17c240c2e89
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)


Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
