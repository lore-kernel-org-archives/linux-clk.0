Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B79DEC77B7A
	for <linux-clk@archiver.kernel.org>; Wed,  7 Jun 2023 10:58:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240115AbjFGK6j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Jun 2023 06:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240124AbjFGK5j (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Jun 2023 06:57:39 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53E9B1BF8
        for <linux-clk@vger.kernel.org>; Wed,  7 Jun 2023 03:57:00 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f6e13940daso72691885e9.0
        for <linux-clk@vger.kernel.org>; Wed, 07 Jun 2023 03:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686135395; x=1688727395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2pAwfeKXSlkwgQLhpYh+A0yvVyA03Idui3jD1HEtDOs=;
        b=lUqUGcDbMLaE9D1D2cBhL6SNfzMKK4GCexRPnS3Es5f5H6nOdgl4ODW/lVNj+dUPLc
         bXsCH6rhQR0bXLmtFYd3z1FhlWtZSWKOgXdE/hqfTtVrnZ1ZqdE4LoXFMGCwitY33mEk
         qPWSrpDvz0u3UrFdC2Q5sjFY/4RqDbweDy4GwPaJQzCyGQQygcsEv3ntQhAxaCA4j2cz
         KL39JdwmggcGR7ut0NtRCzL3J1SVD6z6OPELBHovwc6mSTUu9ulhPLBB7tlZ6XdObj6x
         Af2aPavsFQbPvuSo8Es8p0RpI6jzKHgiE4r0JpRkiDOVp6YdF0HnEdkNt/iRv8ToRGxq
         SS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686135395; x=1688727395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pAwfeKXSlkwgQLhpYh+A0yvVyA03Idui3jD1HEtDOs=;
        b=gWYSKMy+pBVzmSucnej24KA2UHuaQ4Ok3eML3cox6lLeEmtvNrg7ZQ8+QKHDZygUhi
         /gGB7xWp/MeAscEAiu1yNA7n+DOy4IeDLk4t1y/kI2tQHDV55eJ/LFW5s0UHi1fuzdeO
         zMn5K90wyarOUFTyKta7SzEIOsZITGXoEU7N0MiqOIADEqw9mT5FmXGtwvfVSG5MnX1X
         x97mQdUvLz4SMzFWhXGJoPdGEo/+nSjdyL2wk7rBAB0SjpOBvQxzWHKlOacn1NbCZrPF
         jM6DSkmEyao6MW2cS5vJSi864T+dgDy3A+ReYikbi8K/d8YIkanF6R6FnYKtppdIVOSH
         iS6g==
X-Gm-Message-State: AC+VfDxdq/jwmNmUg4LoC4Gsk3ackcxW1ynzW25jB9fC12tP2671pNmF
        siwXuPoTtwRLYI8BJGiG32DA/A==
X-Google-Smtp-Source: ACHHUZ6YlCGfRXGvCOQE4Sq5TsdD+BsI2iyfjyZBsMGTfY6rOdgLhElu8GR6O3EcgPkLTW0iTg3EkA==
X-Received: by 2002:a05:600c:2252:b0:3f6:962d:405c with SMTP id a18-20020a05600c225200b003f6962d405cmr5161920wmm.41.1686135395584;
        Wed, 07 Jun 2023 03:56:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id i10-20020a05600c290a00b003f60faa4612sm1761879wmd.22.2023.06.07.03.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 03:56:35 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 07 Jun 2023 12:56:24 +0200
Subject: [PATCH 13/18] dt-bindings: clk: axg-audio-clkc: expose all clock
 ids
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-13-9676afa6b22c@linaro.org>
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7970;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=v0t4kMMmXofLxOXU+ArmTsNWvwsEg/1Z6HOjQR1R8W4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkgGJTJMyxWNOiaA1l8FQOP8KMBfuTVHc8DTy8QOb5
 Wg501USJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIBiUwAKCRB33NvayMhJ0daND/
 4/ctpxdTow7lf0vT1U1esJZ/8sD8T/CpFPxq5O3siUS5j/YzYWxIzoXQjQPUqib9rWfY9qvkP51FhZ
 s6PIbVjDUuzkd6Zy+TmtbxcKFx1h2ZWAUF1balY+4HLSXylPBUhGBk/LgkXbSFiuR2mnDTxhCWgY6F
 Ncy7BW9vIC7hM7+pwi4lSBwMUt0BeyMo/ulIZieNYgKU4zHxA7Adr6xUVVEJ54I0M60DYmw9shwEmL
 G2d/7f/+mm4TDyck7qAd58v++ebmE7GBrqrTdSG1i0IeQTpAJ6jUhJmb5sd+lU/uQ5fhfYm/6b9amv
 rBf82DJjrS/xznJWxDSzk+m+5ZuDobx3F5XIao2qEgBi9DaakTG3mLMg01OnxsmxoCiplPksAB7ilz
 0vTfj3RBs1sxxE+mF56Y+ToSAtbUTd2ArCpZ59tOVzQR5EedjFFM5WJth9FiAIsGlQ451vxWHI3dDe
 BVuGJYvZ1e6mfp6ceYFfG+l1JGf8OghWT9IKNyEyUKPpCuzHXJhfafplyjXAqp1Xigsq5CHF+5RoA6
 buNkBbo5/X/vrFlF8+x/n4LYkXMPoRErtPC38oR2EzOLn/OqzchTLFBSqj8a6lb0JMr1HYKlL584NA
 tT8uqFyK6cg7ghV60Upt6ahsKw4KZpJqhGebrq4aniKvchz/2OOPQlLGEZ6g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Due to a policy change in clock ID bindings handling, expose
all the "private" clock IDs to the public clock dt-bindings
to move out of the previous maintenance scheme.

This refers to a discussion at [1] & [2] with Krzysztof about
the issue with the current maintenance.

It was decided to move every axg-audio-clkc ID to the public clock
dt-bindings headers to be merged in a single tree so we
can safely add new clocks without having merge issues.

[1] https://lore.kernel.org/all/c088e01c-0714-82be-8347-6140daf56640@linaro.org/
[2] https://lore.kernel.org/all/2fabe721-7434-43e7-bae5-088a42ba128d@app.fastmail.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/axg-audio.h              | 70 ------------------------------
 include/dt-bindings/clock/axg-audio-clkc.h | 65 +++++++++++++++++++++++++++
 2 files changed, 65 insertions(+), 70 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.h b/drivers/clk/meson/axg-audio.h
index d6ed27c77729..faf08748b205 100644
--- a/drivers/clk/meson/axg-audio.h
+++ b/drivers/clk/meson/axg-audio.h
@@ -64,76 +64,6 @@
 #define AUDIO_SM1_SW_RESET1	0x02C
 #define AUDIO_CLK81_CTRL	0x030
 #define AUDIO_CLK81_EN		0x034
-/*
- * CLKID index values
- * These indices are entirely contrived and do not map onto the hardware.
- */
-
-#define AUD_CLKID_MST_A_MCLK_SEL	59
-#define AUD_CLKID_MST_B_MCLK_SEL	60
-#define AUD_CLKID_MST_C_MCLK_SEL	61
-#define AUD_CLKID_MST_D_MCLK_SEL	62
-#define AUD_CLKID_MST_E_MCLK_SEL	63
-#define AUD_CLKID_MST_F_MCLK_SEL	64
-#define AUD_CLKID_MST_A_MCLK_DIV	65
-#define AUD_CLKID_MST_B_MCLK_DIV	66
-#define AUD_CLKID_MST_C_MCLK_DIV	67
-#define AUD_CLKID_MST_D_MCLK_DIV	68
-#define AUD_CLKID_MST_E_MCLK_DIV	69
-#define AUD_CLKID_MST_F_MCLK_DIV	70
-#define AUD_CLKID_SPDIFOUT_CLK_SEL	71
-#define AUD_CLKID_SPDIFOUT_CLK_DIV	72
-#define AUD_CLKID_SPDIFIN_CLK_SEL	73
-#define AUD_CLKID_SPDIFIN_CLK_DIV	74
-#define AUD_CLKID_PDM_DCLK_SEL		75
-#define AUD_CLKID_PDM_DCLK_DIV		76
-#define AUD_CLKID_PDM_SYSCLK_SEL	77
-#define AUD_CLKID_PDM_SYSCLK_DIV	78
-#define AUD_CLKID_MST_A_SCLK_PRE_EN	92
-#define AUD_CLKID_MST_B_SCLK_PRE_EN	93
-#define AUD_CLKID_MST_C_SCLK_PRE_EN	94
-#define AUD_CLKID_MST_D_SCLK_PRE_EN	95
-#define AUD_CLKID_MST_E_SCLK_PRE_EN	96
-#define AUD_CLKID_MST_F_SCLK_PRE_EN	97
-#define AUD_CLKID_MST_A_SCLK_DIV	98
-#define AUD_CLKID_MST_B_SCLK_DIV	99
-#define AUD_CLKID_MST_C_SCLK_DIV	100
-#define AUD_CLKID_MST_D_SCLK_DIV	101
-#define AUD_CLKID_MST_E_SCLK_DIV	102
-#define AUD_CLKID_MST_F_SCLK_DIV	103
-#define AUD_CLKID_MST_A_SCLK_POST_EN	104
-#define AUD_CLKID_MST_B_SCLK_POST_EN	105
-#define AUD_CLKID_MST_C_SCLK_POST_EN	106
-#define AUD_CLKID_MST_D_SCLK_POST_EN	107
-#define AUD_CLKID_MST_E_SCLK_POST_EN	108
-#define AUD_CLKID_MST_F_SCLK_POST_EN	109
-#define AUD_CLKID_MST_A_LRCLK_DIV	110
-#define AUD_CLKID_MST_B_LRCLK_DIV	111
-#define AUD_CLKID_MST_C_LRCLK_DIV	112
-#define AUD_CLKID_MST_D_LRCLK_DIV	113
-#define AUD_CLKID_MST_E_LRCLK_DIV	114
-#define AUD_CLKID_MST_F_LRCLK_DIV	115
-#define AUD_CLKID_TDMIN_A_SCLK_PRE_EN	137
-#define AUD_CLKID_TDMIN_B_SCLK_PRE_EN	138
-#define AUD_CLKID_TDMIN_C_SCLK_PRE_EN	139
-#define AUD_CLKID_TDMIN_LB_SCLK_PRE_EN	140
-#define AUD_CLKID_TDMOUT_A_SCLK_PRE_EN	141
-#define AUD_CLKID_TDMOUT_B_SCLK_PRE_EN	142
-#define AUD_CLKID_TDMOUT_C_SCLK_PRE_EN	143
-#define AUD_CLKID_TDMIN_A_SCLK_POST_EN	144
-#define AUD_CLKID_TDMIN_B_SCLK_POST_EN	145
-#define AUD_CLKID_TDMIN_C_SCLK_POST_EN	146
-#define AUD_CLKID_TDMIN_LB_SCLK_POST_EN	147
-#define AUD_CLKID_TDMOUT_A_SCLK_POST_EN	148
-#define AUD_CLKID_TDMOUT_B_SCLK_POST_EN	149
-#define AUD_CLKID_TDMOUT_C_SCLK_POST_EN	150
-#define AUD_CLKID_SPDIFOUT_B_CLK_SEL	153
-#define AUD_CLKID_SPDIFOUT_B_CLK_DIV	154
-#define AUD_CLKID_CLK81_EN		173
-#define AUD_CLKID_SYSCLK_A_DIV		174
-#define AUD_CLKID_SYSCLK_B_DIV		175
-#define AUD_CLKID_SYSCLK_A_EN		176
-#define AUD_CLKID_SYSCLK_B_EN		177
 
 /* include the CLKIDs which are part of the DT bindings */
 #include <dt-bindings/clock/axg-audio-clkc.h>
diff --git a/include/dt-bindings/clock/axg-audio-clkc.h b/include/dt-bindings/clock/axg-audio-clkc.h
index f561f5c5ef8f..08c82c22fa5f 100644
--- a/include/dt-bindings/clock/axg-audio-clkc.h
+++ b/include/dt-bindings/clock/axg-audio-clkc.h
@@ -37,6 +37,26 @@
 #define AUD_CLKID_SPDIFIN_CLK		56
 #define AUD_CLKID_PDM_DCLK		57
 #define AUD_CLKID_PDM_SYSCLK		58
+#define AUD_CLKID_MST_A_MCLK_SEL	59
+#define AUD_CLKID_MST_B_MCLK_SEL	60
+#define AUD_CLKID_MST_C_MCLK_SEL	61
+#define AUD_CLKID_MST_D_MCLK_SEL	62
+#define AUD_CLKID_MST_E_MCLK_SEL	63
+#define AUD_CLKID_MST_F_MCLK_SEL	64
+#define AUD_CLKID_MST_A_MCLK_DIV	65
+#define AUD_CLKID_MST_B_MCLK_DIV	66
+#define AUD_CLKID_MST_C_MCLK_DIV	67
+#define AUD_CLKID_MST_D_MCLK_DIV	68
+#define AUD_CLKID_MST_E_MCLK_DIV	69
+#define AUD_CLKID_MST_F_MCLK_DIV	70
+#define AUD_CLKID_SPDIFOUT_CLK_SEL	71
+#define AUD_CLKID_SPDIFOUT_CLK_DIV	72
+#define AUD_CLKID_SPDIFIN_CLK_SEL	73
+#define AUD_CLKID_SPDIFIN_CLK_DIV	74
+#define AUD_CLKID_PDM_DCLK_SEL		75
+#define AUD_CLKID_PDM_DCLK_DIV		76
+#define AUD_CLKID_PDM_SYSCLK_SEL	77
+#define AUD_CLKID_PDM_SYSCLK_DIV	78
 #define AUD_CLKID_MST_A_SCLK		79
 #define AUD_CLKID_MST_B_SCLK		80
 #define AUD_CLKID_MST_C_SCLK		81
@@ -49,6 +69,30 @@
 #define AUD_CLKID_MST_D_LRCLK		89
 #define AUD_CLKID_MST_E_LRCLK		90
 #define AUD_CLKID_MST_F_LRCLK		91
+#define AUD_CLKID_MST_A_SCLK_PRE_EN	92
+#define AUD_CLKID_MST_B_SCLK_PRE_EN	93
+#define AUD_CLKID_MST_C_SCLK_PRE_EN	94
+#define AUD_CLKID_MST_D_SCLK_PRE_EN	95
+#define AUD_CLKID_MST_E_SCLK_PRE_EN	96
+#define AUD_CLKID_MST_F_SCLK_PRE_EN	97
+#define AUD_CLKID_MST_A_SCLK_DIV	98
+#define AUD_CLKID_MST_B_SCLK_DIV	99
+#define AUD_CLKID_MST_C_SCLK_DIV	100
+#define AUD_CLKID_MST_D_SCLK_DIV	101
+#define AUD_CLKID_MST_E_SCLK_DIV	102
+#define AUD_CLKID_MST_F_SCLK_DIV	103
+#define AUD_CLKID_MST_A_SCLK_POST_EN	104
+#define AUD_CLKID_MST_B_SCLK_POST_EN	105
+#define AUD_CLKID_MST_C_SCLK_POST_EN	106
+#define AUD_CLKID_MST_D_SCLK_POST_EN	107
+#define AUD_CLKID_MST_E_SCLK_POST_EN	108
+#define AUD_CLKID_MST_F_SCLK_POST_EN	109
+#define AUD_CLKID_MST_A_LRCLK_DIV	110
+#define AUD_CLKID_MST_B_LRCLK_DIV	111
+#define AUD_CLKID_MST_C_LRCLK_DIV	112
+#define AUD_CLKID_MST_D_LRCLK_DIV	113
+#define AUD_CLKID_MST_E_LRCLK_DIV	114
+#define AUD_CLKID_MST_F_LRCLK_DIV	115
 #define AUD_CLKID_TDMIN_A_SCLK_SEL	116
 #define AUD_CLKID_TDMIN_B_SCLK_SEL	117
 #define AUD_CLKID_TDMIN_C_SCLK_SEL	118
@@ -70,8 +114,24 @@
 #define AUD_CLKID_TDMOUT_A_LRCLK	134
 #define AUD_CLKID_TDMOUT_B_LRCLK	135
 #define AUD_CLKID_TDMOUT_C_LRCLK	136
+#define AUD_CLKID_TDMIN_A_SCLK_PRE_EN	137
+#define AUD_CLKID_TDMIN_B_SCLK_PRE_EN	138
+#define AUD_CLKID_TDMIN_C_SCLK_PRE_EN	139
+#define AUD_CLKID_TDMIN_LB_SCLK_PRE_EN	140
+#define AUD_CLKID_TDMOUT_A_SCLK_PRE_EN	141
+#define AUD_CLKID_TDMOUT_B_SCLK_PRE_EN	142
+#define AUD_CLKID_TDMOUT_C_SCLK_PRE_EN	143
+#define AUD_CLKID_TDMIN_A_SCLK_POST_EN	144
+#define AUD_CLKID_TDMIN_B_SCLK_POST_EN	145
+#define AUD_CLKID_TDMIN_C_SCLK_POST_EN	146
+#define AUD_CLKID_TDMIN_LB_SCLK_POST_EN	147
+#define AUD_CLKID_TDMOUT_A_SCLK_POST_EN	148
+#define AUD_CLKID_TDMOUT_B_SCLK_POST_EN	149
+#define AUD_CLKID_TDMOUT_C_SCLK_POST_EN	150
 #define AUD_CLKID_SPDIFOUT_B		151
 #define AUD_CLKID_SPDIFOUT_B_CLK	152
+#define AUD_CLKID_SPDIFOUT_B_CLK_SEL	153
+#define AUD_CLKID_SPDIFOUT_B_CLK_DIV	154
 #define AUD_CLKID_TDM_MCLK_PAD0		155
 #define AUD_CLKID_TDM_MCLK_PAD1		156
 #define AUD_CLKID_TDM_LRCLK_PAD0	157
@@ -90,5 +150,10 @@
 #define AUD_CLKID_FRDDR_D		170
 #define AUD_CLKID_TODDR_D		171
 #define AUD_CLKID_LOOPBACK_B		172
+#define AUD_CLKID_CLK81_EN		173
+#define AUD_CLKID_SYSCLK_A_DIV		174
+#define AUD_CLKID_SYSCLK_B_DIV		175
+#define AUD_CLKID_SYSCLK_A_EN		176
+#define AUD_CLKID_SYSCLK_B_EN		177
 
 #endif /* __AXG_AUDIO_CLKC_BINDINGS_H */

-- 
2.34.1

