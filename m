Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Tirupathi Reddy <tirupath@codeaurora.org>
Subject: [PATCH 0/2] Add a devm_of_clk_add_hw_provider() API
Date: Fri,  1 Sep 2017 16:16:39 -0700
Message-Id: <20170901231641.19141-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This cleans up some open-coded versions of this API and makes it official.
It's also another carrot to convert drivers to use the clk hw registration
APIs instead of the clk registration APIs.

Stephen Boyd (2):
  clk: Add devm_of_clk_add_hw_provider()/del_provider() APIs
  clk: qcom: common: Migrate to devm_* APIs for resets and clk providers

 Documentation/driver-model/devres.txt |  1 +
 drivers/clk/clk.c                     | 52 +++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/common.c             | 26 ++----------------
 include/linux/clk-provider.h          | 13 +++++++++
 4 files changed, 68 insertions(+), 24 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
