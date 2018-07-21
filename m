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
	grahamr@qti.qualcomm.com,
	Taniya Das <tdas@codeaurora.org>
Subject: [RFC PATCH 0/4] clk: qcom: Add support to vote to genpd
Date: Sat, 21 Jul 2018 23:44:58 +0530
Message-Id: <1532196902-28570-1-git-send-email-tdas@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

A clock controller could be connected to single or multiple power domains. Add
support for powerdomain_class which would help associate these power domains to
the RCGs and PLLs in the clock controller. Map the domain and the corresponding
frequencies to the clock(RCG/PLL). The clock frequency request from a consumer
would be mapped to the corresponding performance corner, aggregated at the
clock driver and would be vote/unvoted to the genpd framework for the desired
performance state.

This series add an example of power domain class for sdm845 RCG/PLLs and the
corresponding frequency mappings. This depends on power domain drivers of
SDM845 https://lkml.org/lkml/2018/6/27/7.

Taniya Das (4):
  clk: qcom: Add support to request power domain state
  clk: qcom: Initialize the power domain class for each clock
  clk: qcom: Add prepare/unprepare clock ops for PLL/RCG
  clk: qcom: sdm845: Add Power Domain to RCGs and PLL

 arch/arm64/boot/dts/qcom/sdm845.dtsi |   2 +
 drivers/clk/qcom/Makefile            |   1 +
 drivers/clk/qcom/clk-alpha-pll.c     |  52 ++++++++--
 drivers/clk/qcom/clk-pd.c            | 193 +++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-pd.h            |  55 ++++++++++
 drivers/clk/qcom/clk-rcg2.c          |  61 +++++++++--
 drivers/clk/qcom/clk-regmap.h        |   5 +
 drivers/clk/qcom/common.c            |  17 ++-
 drivers/clk/qcom/gcc-sdm845.c        |  83 ++++++++++++---
 9 files changed, 427 insertions(+), 42 deletions(-)
 create mode 100644 drivers/clk/qcom/clk-pd.c
 create mode 100644 drivers/clk/qcom/clk-pd.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
