Return-Path: <dinguyen@opensource.altera.com>
From: <dinguyen@opensource.altera.com>
To: <sboyd@codeaurora.org>, <mturquette@linaro.org>
CC: <dinh.linux@gmail.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: [PATCHv3 0/2] clk: of: add helper function to fill parent clock array
Date: Fri, 5 Jun 2015 11:26:12 -0500
Message-ID: <1433521574-31052-1-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: dinguyen@opensource.altera.com
List-ID: <linux-clk.vger.kernel.org>

From: Dinh Nguyen <dinguyen@opensource.altera.com>

Hi,

As suggested by Stephen Boyd, this patch adds a helper function that will fill
the parent clock array.

Since the following code is sprinkled all over the platform clock drivers:

for (i = 0; i < num_parents; ++i)
        parent_names[i] = of_clk_get_parent_name(np, i);

The above code can be replace by of_clk_parent_fill(). And since the logic
of the of_clk_parent_fill is to walk the clock node to find the parent, it is
easy to just return the number of parents as well.

The second patch makes use of the new helper function in the SoCFPGA platform.
If this patch is accepted, I can go through and replace the other platforms
after that.

v3: shorten and clean up function comment, use EXPORT_SYMBOL_GPL
v2: use unsigned int for size

Thanks,

Dinh Nguyen (2):
  clk: of: helper for filling parent clock array and return num of
    parents
  clk: socfpga: make use of of_clk_parent_fill helper function

 drivers/clk/clk.c              | 20 ++++++++++++++++++++
 drivers/clk/socfpga/clk-gate.c |  6 +-----
 drivers/clk/socfpga/clk-pll.c  |  7 +------
 include/linux/clk-provider.h   |  1 +
 4 files changed, 23 insertions(+), 11 deletions(-)

-- 
2.2.1
