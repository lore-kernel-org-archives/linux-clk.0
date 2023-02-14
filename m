Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E912CC61DA4
	for <linux-clk@archiver.kernel.org>; Tue, 14 Feb 2023 16:23:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231966AbjBNQXp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Feb 2023 11:23:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231359AbjBNQXk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Feb 2023 11:23:40 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A23251F5EE
        for <linux-clk@vger.kernel.org>; Tue, 14 Feb 2023 08:23:30 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id qw12so41482276ejc.2
        for <linux-clk@vger.kernel.org>; Tue, 14 Feb 2023 08:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7BAF31xNZhLQjiozp7oE7XGB+UsYThUKP2mrciqqAE=;
        b=jBpCd0t58I+/nL2g//cPlO59Tn0LUn3rVgsOf17FKKlsdvflvv8NoYVcELZqfqW5Xh
         0zqfyNpgAcmofClBwQjBv75eWgYjn7HcTctrRBo9nAoivWC80/CrCSyUY9eDDbfwBbUF
         9crqKXu77XOGQgGZ+ghEv4oRRcnHbSV+6HSjm+G7folh116WMsBpctxmF+YY5r2CnJkh
         Uu4JT9Oq6Hp2c51PCfZq8rGIBT8m2VOR19F2NV/ErldA7s3hMZGzaDnOMgwIWycwgItV
         tzKiXNJ7Dq5md+KHEoHfneHWHqCHAGp8MDgmuX0UMEwIjstXR7Mmftd4srwXWgGakJje
         9nPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z7BAF31xNZhLQjiozp7oE7XGB+UsYThUKP2mrciqqAE=;
        b=zUOMtG9UFw+JgQHOE1QwY5xioaz/rbsSMMzhm3OHaSwTCqw8XvX4rKx7FKQhXm2lrf
         xEFna9czm0wuR4u5LHDG3sXkr2Jb+Pi+0MvtqSQhHqdIuAlb18N2JtrEaT5W1BaFa6NU
         7NvPqn9TWeOMzeMk348udG+Y/E88sa4e/NTqIzYt6rJ2jx38ySrF5u/eyiyrO1XqSADT
         ZZ/oCYRF4ptfoJ8/CsQzZGwuDg3EsJWYrczxCuDCBrC/VWl5wPb4MRXqEZo4J4cmt2vo
         83q8dKAaNWJaReOb8MFi0MiMWZWpR23dx6Ca/6ujUHCAegifBcKUA6OXsRSGUTNROaR6
         RpSw==
X-Gm-Message-State: AO0yUKWaYw4zqZUyv4/SlrbExAz3NrkuVX4B5A/J4nILbDRsARxe1ZR6
        dLqhJd0MXLEy6c4Lr3bojkWU9A==
X-Google-Smtp-Source: AK7set+p5CptRx4PeNMcgVHk94WrFWuJ5ZY5d6pQjfSMzvUc2b5otL61FplrUzLaGupgFSX2EmJawg==
X-Received: by 2002:a17:906:190f:b0:877:6713:7e99 with SMTP id a15-20020a170906190f00b0087767137e99mr3116626eje.58.1676391809030;
        Tue, 14 Feb 2023 08:23:29 -0800 (PST)
Received: from fedora.. (cpezg-94-253-130-165-cbl.xnet.hr. [94.253.130.165])
        by smtp.googlemail.com with ESMTPSA id bp8-20020a170907918800b008806a3c22c5sm1318027ejb.25.2023.02.14.08.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 08:23:28 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 2/7] clk: qcom: gcc-ipq4019: convert XO and sleep clk to parent_data
Date:   Tue, 14 Feb 2023 17:23:20 +0100
Message-Id: <20230214162325.312057-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214162325.312057-1-robert.marko@sartura.hr>
References: <20230214162325.312057-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Start off IPQ4019 GCC conversion by converting XO and sleep clks to
parent data in order to directly pass them.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/clk/qcom/gcc-ipq4019.c | 75 ++++++++++++++++++++--------------
 1 file changed, 45 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index 362c732536cd3..a50887d3626f7 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -657,8 +657,9 @@ static struct clk_branch gcc_dcd_xo_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_dcd_xo_clk",
-			.parent_names = (const char *[]){
-				"xo",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+				.name = "xo",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -954,8 +955,9 @@ static struct clk_branch gcc_usb2_sleep_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb2_sleep_clk",
-			.parent_names = (const char *[]){
-				"gcc_sleep_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "sleep_clk",
+				.name = "gcc_sleep_clk_src",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1021,8 +1023,9 @@ static struct clk_branch gcc_usb3_sleep_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_sleep_clk",
-			.parent_names = (const char *[]){
-				"gcc_sleep_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "sleep_clk",
+				.name = "gcc_sleep_clk_src",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1110,8 +1113,9 @@ static struct clk_branch gcc_wcss2g_ref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_wcss2g_ref_clk",
-			.parent_names = (const char *[]){
-				"xo",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+				.name = "xo",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1127,8 +1131,9 @@ static struct clk_branch gcc_wcss2g_rtc_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_wcss2g_rtc_clk",
-			.parent_names = (const char *[]){
-				"gcc_sleep_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "sleep_clk",
+				.name = "gcc_sleep_clk_src",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1179,8 +1184,9 @@ static struct clk_branch gcc_wcss5g_ref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_wcss5g_ref_clk",
-			.parent_names = (const char *[]){
-				"xo",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+				.name = "xo",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1196,8 +1202,9 @@ static struct clk_branch gcc_wcss5g_rtc_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_wcss5g_rtc_clk",
-			.parent_names = (const char *[]){
-				"gcc_sleep_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "sleep_clk",
+				.name = "gcc_sleep_clk_src",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1360,8 +1367,9 @@ static struct clk_fepll gcc_apss_cpu_plldiv_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "ddrpllapss",
-			.parent_names = (const char *[]){
-				"xo",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+				.name = "xo",
 			},
 			.num_parents = 1,
 			.ops = &clk_regmap_cpu_div_ops,
@@ -1412,8 +1420,9 @@ static struct clk_fepll gcc_apss_sdcc_clk = {
 	.cdiv.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "ddrpllsdcc",
-			.parent_names = (const char *[]){
-				"xo",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+				.name = "xo",
 			},
 			.num_parents = 1,
 			.ops = &clk_fepll_div_ops,
@@ -1427,8 +1436,9 @@ static struct clk_fepll gcc_fepll125_clk = {
 	.cdiv.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "fepll125",
-			.parent_names = (const char *[]){
-				"xo",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+				.name = "xo",
 			},
 			.num_parents = 1,
 			.ops = &clk_fepll_div_ops,
@@ -1442,8 +1452,9 @@ static struct clk_fepll gcc_fepll125dly_clk = {
 	.cdiv.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "fepll125dly",
-			.parent_names = (const char *[]){
-				"xo",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+				.name = "xo",
 			},
 			.num_parents = 1,
 			.ops = &clk_fepll_div_ops,
@@ -1457,8 +1468,9 @@ static struct clk_fepll gcc_fepll200_clk = {
 	.cdiv.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "fepll200",
-			.parent_names = (const char *[]){
-				"xo",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+				.name = "xo",
 			},
 			.num_parents = 1,
 			.ops = &clk_fepll_div_ops,
@@ -1472,8 +1484,9 @@ static struct clk_fepll gcc_fepll500_clk = {
 	.cdiv.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "fepll500",
-			.parent_names = (const char *[]){
-				"xo",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+				.name = "xo",
 			},
 			.num_parents = 1,
 			.ops = &clk_fepll_div_ops,
@@ -1497,8 +1510,9 @@ static struct clk_fepll gcc_fepllwcss2g_clk = {
 	.cdiv.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "fepllwcss2g",
-			.parent_names = (const char *[]){
-				"xo",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+				.name = "xo",
 			},
 			.num_parents = 1,
 			.ops = &clk_fepll_div_ops,
@@ -1515,8 +1529,9 @@ static struct clk_fepll gcc_fepllwcss5g_clk = {
 	.cdiv.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "fepllwcss5g",
-			.parent_names = (const char *[]){
-				"xo",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+				.name = "xo",
 			},
 			.num_parents = 1,
 			.ops = &clk_fepll_div_ops,
-- 
2.39.1

