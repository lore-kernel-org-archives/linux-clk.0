Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9260AC46467
	for <linux-clk@archiver.kernel.org>; Sat, 14 Jan 2023 23:56:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbjANX4r (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 14 Jan 2023 18:56:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbjANX4r (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 14 Jan 2023 18:56:47 -0500
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DC1D59D6;
        Sat, 14 Jan 2023 15:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=5u34iKrcaHbvlJk09F0Ef8EjfDDeOzVgdxC9SxL137M=; b=ky03I3B6grQ+AfG5j+xZECem4a
        P+P4HH9bV+yCNqsDdvahLcqT1vxLOftq5sysHekdR8jzA6+Ou6dyUAzt01jqH3vW2D4gfOuO85LfQ
        ijKI0FyRAwppWeAW6okeZ2MBKDgEh13JcOVzZUL18FTxsi+EJk3cYxDJYs47HieTIByuIlnkgLDhc
        zXsk+ljwL0qbJpuDVBoCBwua8GZlHdvHxBzqeOkSmzER50zBgHxJtq4Th+Wg8pghav4KKbr1e/TI8
        NvQC+e2EeVWw6FUfAt3W6z9feynor5chnP363QSdSFk9AXsX6XvC6n3T0ZxPjtz7/S4IKo4QRURW0
        R497pW+w==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1pGq3Z-0001ae-F0; Sun, 15 Jan 2023 00:35:25 +0100
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1pGq3Y-0009Au-RE; Sun, 15 Jan 2023 00:35:25 +0100
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 2/3] clk: vc5: Add support for 5P49V60
Date:   Sat, 14 Jan 2023 15:34:59 -0800
Message-Id: <20230114233500.3294789-2-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230114233500.3294789-1-lars@metafoo.de>
References: <20230114233500.3294789-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.7/26781/Sat Jan 14 09:29:51 2023)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The 5P49V60 is very similar to the existing supported clock chips of the
versaclock5 driver and uses the same register map layout. But its maximum
VCO frequency is 2.7 GHz instead of 3 GHz for the other supported devices.

Add a vco_max field to the chip info field to allow to specify a per device
variant maximum VCO frequency.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/clk/clk-versaclock5.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 54fee43d6564..fa71a57875ce 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -122,9 +122,8 @@
 #define VC5_GLOBAL_REGISTER			0x76
 #define VC5_GLOBAL_REGISTER_GLOBAL_RESET	BIT(5)
 
-/* PLL/VCO runs between 2.5 GHz and 3.0 GHz */
+/* The minimum VCO frequency is 2.5 GHz. The maximum is variant specific. */
 #define VC5_PLL_VCO_MIN				2500000000UL
-#define VC5_PLL_VCO_MAX				3000000000UL
 
 /* VC5 Input mux settings */
 #define VC5_MUX_IN_XIN		BIT(0)
@@ -150,6 +149,7 @@ enum vc5_model {
 	IDT_VC5_5P49V5925,
 	IDT_VC5_5P49V5933,
 	IDT_VC5_5P49V5935,
+	IDT_VC6_5P49V60,
 	IDT_VC6_5P49V6901,
 	IDT_VC6_5P49V6965,
 	IDT_VC6_5P49V6975,
@@ -161,6 +161,7 @@ struct vc5_chip_info {
 	const unsigned int	clk_fod_cnt;
 	const unsigned int	clk_out_cnt;
 	const u32		flags;
+	const unsigned long	vco_max;
 };
 
 struct vc5_driver_data;
@@ -446,10 +447,11 @@ static long vc5_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 			       unsigned long *parent_rate)
 {
 	struct vc5_hw_data *hwdata = container_of(hw, struct vc5_hw_data, hw);
+	struct vc5_driver_data *vc5 = hwdata->vc5;
 	u32 div_int;
 	u64 div_frc;
 
-	rate = clamp(rate, VC5_PLL_VCO_MIN, VC5_PLL_VCO_MAX);
+	rate = clamp(rate, VC5_PLL_VCO_MIN, vc5->chip_info->vco_max);
 
 	/* Determine integer part, which is 12 bit wide */
 	div_int = rate / *parent_rate;
@@ -1209,6 +1211,7 @@ static const struct vc5_chip_info idt_5p49v5923_info = {
 	.clk_fod_cnt = 2,
 	.clk_out_cnt = 3,
 	.flags = 0,
+	.vco_max = 3000000000UL,
 };
 
 static const struct vc5_chip_info idt_5p49v5925_info = {
@@ -1216,6 +1219,7 @@ static const struct vc5_chip_info idt_5p49v5925_info = {
 	.clk_fod_cnt = 4,
 	.clk_out_cnt = 5,
 	.flags = 0,
+	.vco_max = 3000000000UL,
 };
 
 static const struct vc5_chip_info idt_5p49v5933_info = {
@@ -1223,6 +1227,7 @@ static const struct vc5_chip_info idt_5p49v5933_info = {
 	.clk_fod_cnt = 2,
 	.clk_out_cnt = 3,
 	.flags = VC5_HAS_INTERNAL_XTAL,
+	.vco_max = 3000000000UL,
 };
 
 static const struct vc5_chip_info idt_5p49v5935_info = {
@@ -1230,6 +1235,15 @@ static const struct vc5_chip_info idt_5p49v5935_info = {
 	.clk_fod_cnt = 4,
 	.clk_out_cnt = 5,
 	.flags = VC5_HAS_INTERNAL_XTAL,
+	.vco_max = 3000000000UL,
+};
+
+static const struct vc5_chip_info idt_5p49v60_info = {
+	.model = IDT_VC6_5P49V60,
+	.clk_fod_cnt = 4,
+	.clk_out_cnt = 5,
+	.flags = VC5_HAS_PFD_FREQ_DBL | VC5_HAS_BYPASS_SYNC_BIT,
+	.vco_max = 2700000000UL,
 };
 
 static const struct vc5_chip_info idt_5p49v6901_info = {
@@ -1237,6 +1251,7 @@ static const struct vc5_chip_info idt_5p49v6901_info = {
 	.clk_fod_cnt = 4,
 	.clk_out_cnt = 5,
 	.flags = VC5_HAS_PFD_FREQ_DBL | VC5_HAS_BYPASS_SYNC_BIT,
+	.vco_max = 3000000000UL,
 };
 
 static const struct vc5_chip_info idt_5p49v6965_info = {
@@ -1244,6 +1259,7 @@ static const struct vc5_chip_info idt_5p49v6965_info = {
 	.clk_fod_cnt = 4,
 	.clk_out_cnt = 5,
 	.flags = VC5_HAS_BYPASS_SYNC_BIT,
+	.vco_max = 3000000000UL,
 };
 
 static const struct vc5_chip_info idt_5p49v6975_info = {
@@ -1251,6 +1267,7 @@ static const struct vc5_chip_info idt_5p49v6975_info = {
 	.clk_fod_cnt = 4,
 	.clk_out_cnt = 5,
 	.flags = VC5_HAS_BYPASS_SYNC_BIT | VC5_HAS_INTERNAL_XTAL,
+	.vco_max = 3000000000UL,
 };
 
 static const struct i2c_device_id vc5_id[] = {
@@ -1258,6 +1275,7 @@ static const struct i2c_device_id vc5_id[] = {
 	{ "5p49v5925", .driver_data = IDT_VC5_5P49V5925 },
 	{ "5p49v5933", .driver_data = IDT_VC5_5P49V5933 },
 	{ "5p49v5935", .driver_data = IDT_VC5_5P49V5935 },
+	{ "5p49v60", .driver_data = IDT_VC6_5P49V60 },
 	{ "5p49v6901", .driver_data = IDT_VC6_5P49V6901 },
 	{ "5p49v6965", .driver_data = IDT_VC6_5P49V6965 },
 	{ "5p49v6975", .driver_data = IDT_VC6_5P49V6975 },
@@ -1270,6 +1288,7 @@ static const struct of_device_id clk_vc5_of_match[] = {
 	{ .compatible = "idt,5p49v5925", .data = &idt_5p49v5925_info },
 	{ .compatible = "idt,5p49v5933", .data = &idt_5p49v5933_info },
 	{ .compatible = "idt,5p49v5935", .data = &idt_5p49v5935_info },
+	{ .compatible = "idt,5p49v60", .data = &idt_5p49v60_info },
 	{ .compatible = "idt,5p49v6901", .data = &idt_5p49v6901_info },
 	{ .compatible = "idt,5p49v6965", .data = &idt_5p49v6965_info },
 	{ .compatible = "idt,5p49v6975", .data = &idt_5p49v6975_info },
-- 
2.30.2

