Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v5 0/4] Add support for more MSM8916 clocks
Date: Thu, 17 Sep 2015 19:39:25 +0300
Message-Id: <1442507969-18062-1-git-send-email-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patchset adds support for iommu, gpu and audio clocks on
the MSM8916 platforms.

Changes since v4 (https://lkml.org/lkml/2015/9/16/391)
* Implement recalc_rate() operation to initially assign the
  current frequency value.

Changes since v3 (https://lkml.org/lkml/2015/8/13/393)
* Use recalc_rate() to find current frequency when enabling
  a shared branch clock and there is no cached frequency yet.

Changes since v2 (https://lkml.org/lkml/2015/6/5/324)
* Dropped patch for read-only RCGs as it is not needed.
* Updated RCGs with shared branches patch and addressed various issues
  pointed by Stephen.
* Rebased on clk-next.

Changes since v1
* Added a set of ops for read-only RCGs and RCGs with shared branches.

Georgi Djakov (4):
  clk: qcom: Add MSM8916 iommu clocks
  clk: qcom: Add support for RCGs with shared branches
  clk: qcom: Add MSM8916 gpu clocks
  clk: qcom: Add MSM8916 audio clocks

 drivers/clk/qcom/clk-rcg.h                   |    4 +-
 drivers/clk/qcom/clk-rcg2.c                  |   91 +++++
 drivers/clk/qcom/gcc-msm8916.c               |  497 ++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8916.h |   22 ++
 4 files changed, 613 insertions(+), 1 deletion(-)

