Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:46410 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932272AbdA0JKu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 27 Jan 2017 04:10:50 -0500
From: Jeremy McNicoll <jeremymc@redhat.com>
To: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc: andy.gross@linaro.org, sboyd@codeaurora.org, robh@kernel.org,
        arnd@arndb.de, bjorn.andersson@linaro.org, riteshh@codeaurora.org,
        git@kchr.de, ulf.hansson@linaro.org, jszhang@marvell.com,
        jeremymc@redhat.com
Subject: [PATCH V4 2/6] dt-bindings: qcom: clk: Add missing binding for SDCHI enablement on Nexus 5X/6P
Date: Fri, 27 Jan 2017 01:10:01 -0800
Message-Id: <1485508205-1904-3-git-send-email-jeremymc@redhat.com>
In-Reply-To: <1485508205-1904-1-git-send-email-jeremymc@redhat.com>
References: <1485508205-1904-1-git-send-email-jeremymc@redhat.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

AHB clock branch is needed in order to enable SDHCI
on msm899(2/4).

Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
---
 include/dt-bindings/clock/qcom,gcc-msm8994.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-msm8994.h b/include/dt-bindings/clock/qcom,gcc-msm8994.h
index 8fa535b..df47da0 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8994.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8994.h
@@ -133,5 +133,6 @@
 #define GCC_USB30_MOCK_UTMI_CLK			115
 #define GCC_USB3_PHY_AUX_CLK			116
 #define GCC_USB_HS_SYSTEM_CLK			117
+#define GCC_SDCC1_AHB_CLK			118
 
 #endif
-- 
2.6.1

