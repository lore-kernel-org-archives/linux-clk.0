Return-Path: <eajames@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org, joel@jms.id.au, mturquette@baylibre.com,
        sboyd@kernel.org, eajames@linux.vnet.ibm.com, mine260309@gmail.com,
        ryan_chen@aspeedtech.com
Subject: [PATCH v2 0/2] clk: aspeed: Fix is_enabled and prevent reset if clock enabled
Date: Thu,  8 Mar 2018 14:57:18 -0600
Message-Id: <1520542640-9185-1-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-clk.vger.kernel.org>

Here are two fixes for the Aspeed clock driver. The first fixes the is_enabled
clock function to account for different clock gates getting disabled with
either 0s or 1s. The second patch addresses some issue found with the LPC
controller clock if it gets reset while the clock is enabled, which it is by
default. Thanks to Lei Yu for tracking down the LPC issue.

Changes since v1:
 - Fix is_enabled.
 - Check for enabled in the spinlock in the enable function.
 - Use is_enabled instead of more code to read the register.

Eddie James (2):
  clk: aspeed: Fix is_enabled for certain clocks
  clk: aspeed: Prevent reset if clock is enabled

 drivers/clk/clk-aspeed.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

-- 
1.8.3.1
