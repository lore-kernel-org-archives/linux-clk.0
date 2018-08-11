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
Subject: [PATCH v4 0/2] clk: qcom: Add support for RCG to register for DFS
Date: Sat, 11 Aug 2018 07:23:54 +0530
Message-Id: <1533952436-17221-1-git-send-email-tdas@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

 [v4]
  * Add recalc_clk_ops to calculate the clock frequency reading the current
    perf state, also add CLK_GET_RATE_NOCACHE flag.
  * Cleanup 'goto' during mode check in 'clk_rcg2_calculate_freq'.
  * cleanup return from function 'com_cc_register_rcg_dfs'.

 [v3]
  * Rename clk_rcg2_calculate_m_and_n with clk_rcg2_calculate_freq, as this
    function would now calculate the frequency.
  * Rename dfs_freq_tbl to freq_tbl.
  * Remove the logic to remove duplicate frequencies.
  * Remove recalc_rate & set_rate clock ops.
  * clk_rcg2_dfs_ops clock ops is static.
  * Override the clock ops only if DFS mode is enabled.
  * qcom_cc_register_rcg_dfs uses regmap instead of device.
  * Few cleanups : Remove DFS probing after registering clocks.
    sizeof(*init), sizeof(*freq_tbl).

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

 drivers/clk/qcom/clk-rcg.h    |   2 +
 drivers/clk/qcom/clk-rcg2.c   | 224 ++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/gcc-sdm845.c |  25 +++++
 3 files changed, 251 insertions(+)

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
