Return-Path: <tdas@codeaurora.org>
From: Taniya Das <tdas@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Amit Nischal <anischal@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 0/2] clk: qcom: Add support for RCG to register for DFS
Date: Thu, 28 Jun 2018 17:17:29 +0530
Message-Id: <1530186451-24648-1-git-send-email-tdas@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

 [v2]
  * Move the dfs register function 'qcom_cc_register_rcg_dfs'
    to clk-rcg2.c instead of common.c
  * At boot read the DFS enable register and override the clk_ops
    to be used for dfs or non-dfs RCGs.
  * Remove flag 'dfs_enabled'.
  * Remove functions 'clk_rcg2_dfs_determine_rate_lazy'
  * Remove 'struct dfs_table *dfs_entry'
  * Remove '_freq_tbl_determine_dfs_rate'
  * Combine the function 'clk_index_pre_div_and_mode' and 'calculate_m_and_n'
    to a single function and named it 'clk_rcg2_calculate_m_and_n'.
  * Remove taking M/N/PERF offsets as function arguments.
  * Add clocks in gcc-sdm845.c the DFS clock array to register.

 [v1]
   * Update SPDX for files.
   * Add new clk_ops for DFS mode which would be used if dfs is enabled,
     else fall back to the clk_rcg2_shared_ops.
   * Use kcalloc in place kzalloc.
   * Fixed the return type for 'clk_parent_index_pre_div_and_mode' which
     is now renamed to 'clk_index_pre_div_and_mode'.
   * Removed return of -EPERM from 'clk_rcg2_set_rate' and new dfs
     clk_ops is introduced.
   * Pass frequency table entry structure to function calculate_m_and_n.
   * Remove desc from qcom_cc_register_rcg_dfs and instead pass array of
     clk_rcg2.
   * Add a dfs_enable flag to identify if dfs mode is enabled.

In the cases where a RCG requires a Dynamic Frequency switch support
requires to register which would at runtime read the clock perf level
registers to identify the frequencies supported and update the frequency
table accordingly.

Taniya Das (2):
  clk: qcom: Add support for RCG to register for DFS
  clk: qcom: gcc: Register QUPv3 RCGs for DFS on SDM845

 drivers/clk/qcom/clk-rcg.h    |   5 +
 drivers/clk/qcom/clk-rcg2.c   | 214 ++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/common.c     |  14 +--
 drivers/clk/qcom/common.h     |  16 +---
 drivers/clk/qcom/gcc-sdm845.c |  27 +++++-
 5 files changed, 250 insertions(+), 26 deletions(-)

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
