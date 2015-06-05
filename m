Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@linaro.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/5] Add support for more MSM8916 clocks
Date: Fri,  5 Jun 2015 15:40:31 +0300
Message-Id: <1433508036-28644-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This patchset adds support for the iommu, gpu and audio clocks on
the MSM8916 platforms.

Changes since v1:
* Added a set of ops for read-only RCGs and RCGs with shared branches.

Patchset based on clk-next.

Georgi Djakov (5):
  clk: qcom: Add support for read-only rcg2 ops
  clk: qcom: Add MSM8916 iommu clocks
  clk: qcom: Add support for RCGs with shared branches
  clk: qcom: Add MSM8916 gpu clocks
  clk: qcom: Add MSM8916 audio clocks

 drivers/clk/qcom/clk-rcg.h                   |    2 +
 drivers/clk/qcom/clk-rcg2.c                  |   71 ++++
 drivers/clk/qcom/gcc-msm8916.c               |  495 ++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8916.h |   22 ++
 4 files changed, 590 insertions(+)
