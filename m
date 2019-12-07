Return-Path: <SRS0=FLPw=Z5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2796C3F68F
	for <linux-clk@archiver.kernel.org>; Sat,  7 Dec 2019 20:36:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8533524670
	for <linux-clk@archiver.kernel.org>; Sat,  7 Dec 2019 20:36:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s5bZeDr0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbfLGUgm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 7 Dec 2019 15:36:42 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34235 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbfLGUge (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 7 Dec 2019 15:36:34 -0500
Received: by mail-pf1-f195.google.com with SMTP id n13so5165342pff.1
        for <linux-clk@vger.kernel.org>; Sat, 07 Dec 2019 12:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y5s38wz/6dk76o2wu93apOYv5A1m/3RpeMLEd54gKHA=;
        b=s5bZeDr0Sln+9g/a0EciNEuzuvps+Nd8eSHR6z8G3Ycx0YyHpqr46Js6YGYw7nPhr9
         N2/9cpqmyhIf1JnmNWUN+m+HPBXc6M7Qszc44JENP5u7QgwkD95SjIJE7pr4InM6WYfQ
         X0OlPgXFDJWR3GyD0VXGKwow5ut5scco33KtrJdQVrPCHNv4pAylg6wh7vM/3zS9Skcr
         eSoqV8ar331KUVaLm5vpS2iQOyTlDQymKNY9NCuQnRKN0gYLe6qLoDfrGb6eHamR9FMK
         CUZ0/oWQqk1zHLx4M9guPBwTOlUgdKznrz+z9m90DmzAT7uXI6mOihy4zS+012FGj3u/
         2Vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y5s38wz/6dk76o2wu93apOYv5A1m/3RpeMLEd54gKHA=;
        b=QNKaU9VAL2FG6TlkyaIjmPtO9ICwwz+XVUm4GEcbgtx0MQjJJoVzBtIzyDFaRehYQt
         iYRNbbSceWomK3idzNbrvyV6ku2CUyUI9mx2iIWYFbO5AQuNLPKbfVD9nPxMJ0i7q9BG
         BLOuGTRN46d6KQRyt0sPw6kPzMaz6JqBbH3AQ8dXDIW5vh046wH/kgbUq9RtiX7w+HNj
         LhVvq9fF0eJ8dyoqT/wOO6Y8x+0NlnzOB4jcdG1ot2tb0+UlnvfpKbR9ov3tsnIzs60d
         NqepRf8Y87DAUKtZodiIuIcE/9gomQDwqrPqqkyiPsWgaHkyoVMf27PL35j7Kg7928wH
         PR8A==
X-Gm-Message-State: APjAAAU1CUORTYI2mBktAaftw8ff9UhHtl+D2g8FJgSE71TJL3iEbPJz
        ifcnuKsuF4JfCl9+oZdo74612g==
X-Google-Smtp-Source: APXvYqxPvzGVJHajbJKyNuh/L/VZJpPacmlCJRWlTu4zUkXrUoGgX4pOBwfDBPRMamkQ922x9BnOCg==
X-Received: by 2002:aa7:9118:: with SMTP id 24mr22439749pfh.182.1575750991839;
        Sat, 07 Dec 2019 12:36:31 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d14sm22982186pfq.117.2019.12.07.12.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 12:36:31 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paolo Pisati <p.pisati@gmail.com>
Subject: [PATCH 1/2] clk: qcom: gcc-msm8996: Fix parent for CLKREF clocks
Date:   Sat,  7 Dec 2019 12:36:02 -0800
Message-Id: <20191207203603.2314424-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207203603.2314424-1-bjorn.andersson@linaro.org>
References: <20191207203603.2314424-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The CLKREF clocks are all fed by the clock signal on the CXO2 pad on the
SoC. Update the definition of these clocks to allow this to be wired up
to the appropriate clock source.

Retain "xo" as the global named parent to make the change a nop in the
event that DT doesn't carry the necessary clocks definition.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gcc.yaml   |  6 ++--
 drivers/clk/qcom/gcc-msm8996.c                | 35 +++++++++++++++----
 2 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
index e73a56fb60ca..f8bd902d4e6d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
@@ -41,19 +41,21 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 3
+    maxItems: 4
     items:
       - description: Board XO source
       - description: Board active XO source
       - description: Sleep clock source
+      - description: Second XO source
 
   clock-names:
     minItems: 1
-    maxItems: 3
+    maxItems: 4
     items:
       - const: bi_tcxo
       - const: bi_tcxo_ao
       - const: sleep_clk
+      - const: cxo2
 
   '#clock-cells':
     const: 1
diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index d004cdaa0e39..3c3a7ff04562 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -3046,7 +3046,10 @@ static struct clk_branch gcc_usb3_clkref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_clkref_clk",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "cxo2",
+				.name = "xo",
+			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
@@ -3060,7 +3063,10 @@ static struct clk_branch gcc_hdmi_clkref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_hdmi_clkref_clk",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "cxo2",
+				.name = "xo",
+			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
@@ -3074,7 +3080,10 @@ static struct clk_branch gcc_edp_clkref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_edp_clkref_clk",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "cxo2",
+				.name = "xo",
+			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
@@ -3088,7 +3097,10 @@ static struct clk_branch gcc_ufs_clkref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_clkref_clk",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "cxo2",
+				.name = "xo",
+			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
@@ -3102,7 +3114,10 @@ static struct clk_branch gcc_pcie_clkref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_clkref_clk",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "cxo2",
+				.name = "xo",
+			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
@@ -3116,7 +3131,10 @@ static struct clk_branch gcc_rx2_usb2_clkref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_rx2_usb2_clkref_clk",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "cxo2",
+				.name = "xo",
+			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
@@ -3130,7 +3148,10 @@ static struct clk_branch gcc_rx1_usb2_clkref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_rx1_usb2_clkref_clk",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "cxo2",
+				.name = "xo",
+			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
-- 
2.24.0

