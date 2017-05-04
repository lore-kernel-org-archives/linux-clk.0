Return-Path: <varada@codeaurora.org>
From: Varadarajan Narayanan <varada@codeaurora.org>
To: robh+dt@kernel.org,
	mark.rutland@arm.com,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linus.walleij@linaro.org,
	andy.gross@linaro.org,
	david.brown@linaro.org,
	catalin.marinas@arm.com,
	will.deacon@arm.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: absahu@codeaurora.org,
	sjaganat@codeaurora.org,
	sricharan@codeaurora.org,
	Varadarajan Narayanan <varada@codeaurora.org>
Subject: [PATCH v2 5/5] arm64: defconfig: Enable QCOM IPQ8074 clock and pinctrl
Date: Thu,  4 May 2017 17:24:01 +0530
Message-Id: <1493898841-20583-6-git-send-email-varada@codeaurora.org>
In-Reply-To: <1493898841-20583-1-git-send-email-varada@codeaurora.org>
References: <1493898841-20583-1-git-send-email-varada@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

From: Abhishek Sahu <absahu@codeaurora.org>

These configs are required for booting kernel in QCOM
IPQ8074 boards.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7c48028..e6aeb69 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -266,6 +266,7 @@ CONFIG_SPI_SPIDEV=m
 CONFIG_SPI_S3C64XX=y
 CONFIG_SPMI=y
 CONFIG_PINCTRL_SINGLE=y
+CONFIG_PINCTRL_IPQ8074=y
 CONFIG_PINCTRL_MAX77620=y
 CONFIG_PINCTRL_MSM8916=y
 CONFIG_PINCTRL_MSM8994=y
@@ -439,6 +440,7 @@ CONFIG_COMMON_CLK_PWM=y
 CONFIG_COMMON_CLK_RK808=y
 CONFIG_CLK_QORIQ=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_IPQ_GCC_8074=y
 CONFIG_MSM_GCC_8916=y
 CONFIG_MSM_GCC_8994=y
 CONFIG_MSM_MMCC_8996=y
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
