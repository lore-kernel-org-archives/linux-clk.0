Return-Path: <SRS0=O+9D=PA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6196C43387
	for <linux-clk@archiver.kernel.org>; Sun, 23 Dec 2018 23:58:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A4AB52184D
	for <linux-clk@archiver.kernel.org>; Sun, 23 Dec 2018 23:58:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="r0K3Jld5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726493AbeLWX6z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 23 Dec 2018 18:58:55 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33119 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbeLWX6z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 23 Dec 2018 18:58:55 -0500
Received: by mail-wr1-f67.google.com with SMTP id c14so10318679wrr.0
        for <linux-clk@vger.kernel.org>; Sun, 23 Dec 2018 15:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7gXsYZ9CwBHYIPypPRLB1B250Ytze3V+PvoB4AWuujI=;
        b=r0K3Jld5+UwuEw/TsBdshdADtaE0BcRW0RlypsR+vulO9DLJUs1WHUNH1SDNMTvgso
         Rp0SkHEwD+bIB8g0qwDwAqSl3f8OAASNLHdTP8874UK7v54GikdCSNirgeHBdKogdSda
         IYdjBqY+1cYdxbYc3qGOdUOoKDS1HOGklr31Dos1KmBdCuqfB+VMPHER0B0oBo5zfgHE
         SKYGdBRAf31SlfGfiDdi8mJ8AX7qsVctYoTmq2bbOjmCkKI1DG3pDB6mKDbVKYkYxJpj
         cfg3RQwMlJ4fWF9a4aaJ4rIaoaDjni2pgKFRPoUzSmKR1mkuI6lMyd25tBth2GvI1AhB
         JYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7gXsYZ9CwBHYIPypPRLB1B250Ytze3V+PvoB4AWuujI=;
        b=qPHJktjQ2EjyYqL+gpI+xWkCxroPGCT9MEVgKjrYnWwwppac+Lvx5xGYprbtpnEQkc
         9rEW1TMYbnWcf1zRlAxoZg30qJ718Unvo0SlhSv/QVdg0yXtdK1LovKOFxsK4SghxinX
         YFjYe4XHJ60/K3yic621oiwiP9mDWxX8wFjVZ9QByxVs9qi/2kWD6Sy8mFCKE5Q1wuEr
         dv8fdHMM23cVx8LSg9hwwhM0ku9JY2zddyXzfRfKt16RvP1z7u/Bjb+Hfm256LXFzmU8
         4pDswCgGMoH87HYFFqHGpQQR0H8Mz9ejsICND70o0RkoHAiJ6j/veKgDFtrggWjBJW78
         ZCbg==
X-Gm-Message-State: AJcUukfyEaY6KahnebPd+BkmXeIEJWe4HyKt6Amvu1N8ORa7E2/OSYH/
        6owcEm+Lb5widj0ogywCIzU=
X-Google-Smtp-Source: ALg8bN5ONCbI6yuVMym/OHnQZE6EtSmyPQ2M3l0SXAy0aODhRADuTQ83LwuTk8tJA8bsC1qwW1WhbQ==
X-Received: by 2002:adf:ae41:: with SMTP id u1mr9389407wrd.20.1545609532398;
        Sun, 23 Dec 2018 15:58:52 -0800 (PST)
Received: from blackbox.darklights.net (p200300DCD711B0006842FD8F1E9F13DE.dip0.t-ipconnect.de. [2003:dc:d711:b000:6842:fd8f:1e9f:13de])
        by smtp.googlemail.com with ESMTPSA id s1sm28527174wro.9.2018.12.23.15.58.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Dec 2018 15:58:51 -0800 (PST)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     jbrunet@baylibre.com, narmstrong@baylibre.com
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sboyd@kernel.org, mturquette@baylibre.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/1] clk: meson: meson8b: fix naming of the APB clocks
Date:   Mon, 24 Dec 2018 00:58:36 +0100
Message-Id: <20181223235836.12466-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181223235836.12466-1-martin.blumenstingl@googlemail.com>
References: <20181223235836.12466-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix a typo in the APB clock names by renaming them from "abp" to "apb".
No functional changes.

Fixes: 8e1dd17c8b0e3f ("dt-bindings: clock: meson8b: export the CPU post dividers")
Fixes: a7d19b05ce817d ("clk: meson: meson8b: add the CPU clock post divider clocks")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c              | 22 +++++++++++-----------
 drivers/clk/meson/meson8b.h              |  2 +-
 include/dt-bindings/clock/meson8b-clkc.h |  2 +-
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 950d0e548c75..fa15ba9f4327 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -803,16 +803,16 @@ static struct clk_fixed_factor meson8b_cpu_clk_div8 = {
 	},
 };
 
-static u32 mux_table_abp[] = { 1, 2, 3, 4, 5, 6, 7 };
-static struct clk_regmap meson8b_abp_clk_sel = {
+static u32 mux_table_apb[] = { 1, 2, 3, 4, 5, 6, 7 };
+static struct clk_regmap meson8b_apb_clk_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_SYS_CPU_CLK_CNTL1,
 		.mask = 0x7,
 		.shift = 3,
-		.table = mux_table_abp,
+		.table = mux_table_apb,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "abp_clk_sel",
+		.name = "apb_clk_sel",
 		.ops = &clk_regmap_mux_ops,
 		.parent_names = (const char *[]){ "cpu_clk_div2",
 						  "cpu_clk_div3",
@@ -825,16 +825,16 @@ static struct clk_regmap meson8b_abp_clk_sel = {
 	},
 };
 
-static struct clk_regmap meson8b_abp_clk_gate = {
+static struct clk_regmap meson8b_apb_clk_gate = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_SYS_CPU_CLK_CNTL1,
 		.bit_idx = 16,
 		.flags = CLK_GATE_SET_TO_DISABLE,
 	},
 	.hw.init = &(struct clk_init_data){
-		.name = "abp_clk_dis",
+		.name = "apb_clk_dis",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_names = (const char *[]){ "abp_clk_sel" },
+		.parent_names = (const char *[]){ "apb_clk_sel" },
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1781,8 +1781,8 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
 		[CLKID_CPU_CLK_DIV6]	    = &meson8b_cpu_clk_div6.hw,
 		[CLKID_CPU_CLK_DIV7]	    = &meson8b_cpu_clk_div7.hw,
 		[CLKID_CPU_CLK_DIV8]	    = &meson8b_cpu_clk_div8.hw,
-		[CLKID_ABP_SEL]		    = &meson8b_abp_clk_sel.hw,
-		[CLKID_ABP]		    = &meson8b_abp_clk_gate.hw,
+		[CLKID_APB_SEL]		    = &meson8b_apb_clk_sel.hw,
+		[CLKID_APB]		    = &meson8b_apb_clk_gate.hw,
 		[CLKID_PERIPH_SEL]	    = &meson8b_periph_clk_sel.hw,
 		[CLKID_PERIPH]		    = &meson8b_periph_clk_gate.hw,
 		[CLKID_AXI_SEL]		    = &meson8b_axi_clk_sel.hw,
@@ -1943,8 +1943,8 @@ static struct clk_regmap *const meson8b_clk_regmaps[] = {
 	&meson8b_fixed_pll_dco,
 	&meson8b_hdmi_pll_dco,
 	&meson8b_sys_pll_dco,
-	&meson8b_abp_clk_sel,
-	&meson8b_abp_clk_gate,
+	&meson8b_apb_clk_sel,
+	&meson8b_apb_clk_gate,
 	&meson8b_periph_clk_sel,
 	&meson8b_periph_clk_gate,
 	&meson8b_axi_clk_sel,
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index 87fba739af81..3cac2be7138b 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -91,7 +91,7 @@
 #define CLKID_CPU_CLK_DIV6	120
 #define CLKID_CPU_CLK_DIV7	121
 #define CLKID_CPU_CLK_DIV8	122
-#define CLKID_ABP_SEL		123
+#define CLKID_APB_SEL		123
 #define CLKID_PERIPH_SEL	125
 #define CLKID_AXI_SEL		127
 #define CLKID_L2_DRAM_SEL	129
diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index 5fe2923382d0..cd11628f50f8 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -103,7 +103,7 @@
 #define CLKID_MPLL1		94
 #define CLKID_MPLL2		95
 #define CLKID_NAND_CLK		112
-#define CLKID_ABP		124
+#define CLKID_APB		124
 #define CLKID_PERIPH		126
 #define CLKID_AXI		128
 #define CLKID_L2_DRAM		130
-- 
2.20.1

