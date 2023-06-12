Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19830C7EE2E
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 10:25:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234545AbjFLKZe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 06:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236877AbjFLKZP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 06:25:15 -0400
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6DED2F17D
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 03:04:19 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4f6195d2b3fso4850727e87.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 03:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686563868; x=1689155868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I39uT2lPZiNc0FwLn4d+TDJmO4EmqH2LrDi9kfVBS4A=;
        b=LWXcx7bxMZn9QdWZz9rFYFW+7wmdjBPMRKWrLVTFQyEQOvYDP2mOv9k7rouDSUrAlZ
         fm39kKmDQQGBlDp/3O9HvBCgykCclOThUayIl53r7/2qlKpiwYbVAxKAqofFKehEvE/p
         nnOeHOr3Gaqz24EqBVnCZXLgvGWykXA1pAScnpbRaAym1Ng5+Vvi1CZu4rl/xzJAnb0Q
         vbLd/MidrvcvpxJuh35JWgm7pn6PzYRzwU4eSc3dvXKPPvWwKPkRPhPKWVKe1gp5/PYW
         2WyvnvM6roF+iQT84USUPp14G25CXDCEe2KMHSpKEZIBicVjOJu4+c0LlDyHdtL7MJZU
         52Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686563868; x=1689155868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I39uT2lPZiNc0FwLn4d+TDJmO4EmqH2LrDi9kfVBS4A=;
        b=KZHZkBWTugTw0AZEKzq2F0gy9YRK4NzDLkKC30LtVu3w9w0FI9KUWMD9y1roE2wRcy
         DFWlNGABEKk1F6mb+P6JyL7nsc3YIxgoTpbe1NRmlMJDr6ncWc0Yh14wUQeSGFE4bZpB
         yjOYThhUS1btR2FdWPEbM9RDdFXbBKY6XHDtejBDoXi5VEkNVlnQ8fHfhLogJhyUKynl
         YadF6N8XLUkW4zsa5Jy4y7nbReEes/V4fFqShUmTFr2kcJeFAB/CUPsW96TJ9sEJVyW0
         yiUeBLf76JKXVvBSuJzB54gWEDtcQEcf/sdXkh5UKGgo3UJ/m6nw/vrMbMdLw1B08vO0
         XaNA==
X-Gm-Message-State: AC+VfDz870I3tUzTjjpce0/GmEJ2WTOjKbFPK9MajYDFEGXMfZj/xJLw
        O4HKxt3eC95XyY/ubE4iONe12A==
X-Google-Smtp-Source: ACHHUZ5mFXbH+Dti418xRCLwxBwpIU1eXhVSRS31eu3EwUeOTYHHPsN2PB9Ih7HIv/d5+vaej81vLA==
X-Received: by 2002:a19:655d:0:b0:4f3:5038:5857 with SMTP id c29-20020a19655d000000b004f350385857mr3809299lfj.55.1686563868333;
        Mon, 12 Jun 2023 02:57:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f25-20020a7bcd19000000b003f7ff520a14sm10829525wmj.22.2023.06.12.02.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:57:47 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 12 Jun 2023 11:57:31 +0200
Subject: [PATCH v2 14/19] dt-bindings: clk: axg-audio-clkc: expose all
 clock ids
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-14-38172d17c27a@linaro.org>
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org>
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8034;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=l+MHnXn2LAzraSLI1gt+tM7d2z6sSQhrtl8Z0ufzVks=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkhuwKiChr0tJkUuXcvZgCubrPLKKmRditFREXdfWb
 JrqnddKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIbsCgAKCRB33NvayMhJ0VY/EA
 Clsi9+y9jqcGZAGuywlUcfoF66/U/CQIu++2TXrcip0WuZRHLX/SiHjeW/3aiyqyzz/SIJvii6fbK8
 oaQAhOBucHHxunsD1Lez011FXjMzpPWfNLSGIdpoQAfugPdI2BQEkYQu1YVN5f7IONzK/YF/awNckT
 dA0fRldJ1BfQGnhgrGbLUokdN6/kAMefokR42o4oJIgPaJEmclqGcswXY8/swvxAFmG3/lS3Z2+2SK
 +58fhj+VYjWd2i/0f/n5jDaOe6PNT35OM0tGCs3j73gvCo9tBjKUZ3TCes7gyYkI6SX6/4SHy1q0DN
 Jwdp5cXx9GbhO5o1Lva9hzy4Q826kriwt1HCr9PV1ocRNlKfCCcvM4W1pvRuwHdOplgHJequNzk08o
 wRAyz67ocTqG9ZtX2DljnF6EiA9KfhDGAsmhthX0FN8k3WBIH91NjDv/Sa9ym1MgD6JlbjNbA1EX8j
 YZvdg2/b+pQDuMdmoePsDrfKIfKYoSMYDpR2gSM8dy6sTr78076P/ziUEOqOEuUvGes68UGtq4Cpc3
 3+qRgFWvxRLmvXoBbMQBQTIHc6r7zUy0AGis0yd3Wnzuicn6wDZ+Nysu+i52Y7CMvx1vn6Eu0EafBh
 wOw1dz+m8LC0AgMuMBmoCcJgGvNvg+m2Mh34IdMH3ejFsRZFwlWhziufQ+WQ==
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

