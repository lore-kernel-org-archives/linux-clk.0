Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9774CC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 22 Feb 2022 13:19:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbiBVNTj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Feb 2022 08:19:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232373AbiBVNTi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Feb 2022 08:19:38 -0500
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C386C3307
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 05:19:13 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id A65C85C02B1;
        Tue, 22 Feb 2022 08:19:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 22 Feb 2022 08:19:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=YG/YzRDoyDY+dcvSDvbUWJ+GXvArvM
        MYZLUzmKGB4FQ=; b=AVzgbNsyXj8GMetfniz1RBd/YSbBO2nc9wnC9wNt+YxQ38
        wPLsIo6NnD2pqcFm0sMwbChcUdooAWmSbTdjMJXrqVzZDxoN4psqPH+N+m+uzvcI
        N8sHrr9UltETA0vgng2Q/duTCgDRdWAGub5gKc0BY/o13IqhPJ8jV4mEHg89Cpen
        p4FVTsn2V2fWEvODelauU/O7gi2EhFeV+uK1Caubck+fnBvSacgr0+VlItBQiIM+
        aET+G1nClk0d9QEqXZ5HjiattarH/qlqrEJZUorRLMtlTaHxNjSI8H/lP2N2tvDv
        jVxz2+CIhrhfY65G1R4rFw2P5606+bkJcKbvWlSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=YG/YzR
        DoyDY+dcvSDvbUWJ+GXvArvMMYZLUzmKGB4FQ=; b=h7jpEzwsRZc9pUdwzqdWAB
        /kUqfMJOF2X0xYzSH6gOzmuFMzbcWQr6k54i+O3d1tXwOA3PKP9iA9vy8sPecHVQ
        AlL38l+PN4rVycAO5ddSSANcAAvB5PntchSdCn+Vwg4FZ+mXdTzsG/kfG7hCtTTu
        T+AgXwQLwrktSBUa5ofdrZh5U8nzn2qq3cPHfTeiHrk6lsQ5yIbm36JcXz0pxSB2
        uQ0uX0DmOfAOPQt9jT1j2FKwlgQQ0nyTpnBQI/9vi1DSs4LmtAlpbEet4xyNdZV/
        W/KyIC5+EBZUk9TPiR+0ZG/JQ8UDUzPRFdqeGajV9hIcsGHs5GLuVFw+LMX3MXXA
        ==
X-ME-Sender: <xms:0OIUYlpDq0kg4h-quCaRx_Qbwvb83DylWAXuW62U978Zmmv-l_7ooA>
    <xme:0OIUYnqlXKc6txg58Fmfv1_ZcZ5PvVMmwlcrmr4i-fVmEgBrOlJ96wDLF8NWDNDXS
    NOLVaJ2sTUb4G_BszM>
X-ME-Received: <xmr:0OIUYiNp9s5EoxAAo2iinZoY_MNfvNffA9wDU4SUAHfYm6shdICGcgml_bV8FEX0vppOr98UOmgBMNSu3FuPgqyecw6SDZlY9EzVjl8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdeglecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0OIUYg6ihwwXHuG411Gsv6AcWEGVzGyaea_qvom3IPsXHtGhtpLArQ>
    <xmx:0OIUYk5YhPZBnPRVaQMYORBHT66QfR3B4UWSbVguHp-nh222U_j-CA>
    <xmx:0OIUYohJfmpWmuTr4277o9kzSD4bGVBbSvLB-egkXlZheGpXHFjPRg>
    <xmx:0OIUYjaCguWpeCPUdbAyB9U5T3ypDoWvQmbLuwQ_PDzxOVmHpc8N2w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 08:19:11 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 07/11] clk: bcm: rpi: Add variant structure
Date:   Tue, 22 Feb 2022 14:18:49 +0100
Message-Id: <20220222131853.198625-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222131853.198625-1-maxime@cerno.tech>
References: <20220222131853.198625-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We only export a bunch of firmware clocks, and some of them require
special treatment.

This has been do so far using some tests on the clock id in various
places, but this is fairly hard to extend and doesn't scale very well.

Since we'll need some more cases in the next patches, let's switch to a
variant structure that defines the behaviour we need to have for a given
clock.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-raspberrypi.c | 62 +++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index dd3b71eafabf..f7185d421085 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -56,6 +56,8 @@ static char *rpi_firmware_clk_names[] = {
 #define RPI_FIRMWARE_STATE_ENABLE_BIT	BIT(0)
 #define RPI_FIRMWARE_STATE_WAIT_BIT	BIT(1)
 
+struct raspberrypi_clk_variant;
+
 struct raspberrypi_clk {
 	struct device *dev;
 	struct rpi_firmware *firmware;
@@ -66,10 +68,36 @@ struct raspberrypi_clk_data {
 	struct clk_hw hw;
 
 	unsigned int id;
+	struct raspberrypi_clk_variant *variant;
 
 	struct raspberrypi_clk *rpi;
 };
 
+struct raspberrypi_clk_variant {
+	bool		export;
+	char		*clkdev;
+};
+
+static struct raspberrypi_clk_variant
+raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
+	[RPI_FIRMWARE_ARM_CLK_ID] = {
+		.export = true,
+		.clkdev = "cpu0",
+	},
+	[RPI_FIRMWARE_CORE_CLK_ID] = {
+		.export = true,
+	},
+	[RPI_FIRMWARE_M2MC_CLK_ID] = {
+		.export = true,
+	},
+	[RPI_FIRMWARE_V3D_CLK_ID] = {
+		.export = true,
+	},
+	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
+		.export = true,
+	},
+};
+
 /*
  * Structure of the message passed to Raspberry Pi's firmware in order to
  * change clock rates. The 'disable_turbo' option is only available to the ARM
@@ -183,7 +211,8 @@ static const struct clk_ops raspberrypi_firmware_clk_ops = {
 
 static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 					       unsigned int parent,
-					       unsigned int id)
+					       unsigned int id,
+					       struct raspberrypi_clk_variant *variant)
 {
 	struct raspberrypi_clk_data *data;
 	struct clk_init_data init = {};
@@ -195,6 +224,7 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 		return ERR_PTR(-ENOMEM);
 	data->rpi = rpi;
 	data->id = id;
+	data->variant = variant;
 
 	init.name = devm_kasprintf(rpi->dev, GFP_KERNEL,
 				   "fw-clk-%s",
@@ -228,9 +258,9 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 
 	clk_hw_set_rate_range(&data->hw, min_rate, max_rate);
 
-	if (id == RPI_FIRMWARE_ARM_CLK_ID) {
+	if (variant->clkdev) {
 		ret = devm_clk_hw_register_clkdev(rpi->dev, &data->hw,
-						  NULL, "cpu0");
+						  NULL, variant->clkdev);
 		if (ret) {
 			dev_err(rpi->dev, "Failed to initialize clkdev\n");
 			return ERR_PTR(ret);
@@ -264,27 +294,27 @@ static int raspberrypi_discover_clocks(struct raspberrypi_clk *rpi,
 		return ret;
 
 	while (clks->id) {
-		struct clk_hw *hw;
+		struct raspberrypi_clk_variant *variant;
+
+		if (clks->id > RPI_FIRMWARE_NUM_CLK_ID) {
+			dev_err(rpi->dev, "Unknown clock id: %u", clks->id);
+			return -EINVAL;
+		}
+
+		variant = &raspberrypi_clk_variants[clks->id];
+		if (variant->export) {
+			struct clk_hw *hw;
 
-		switch (clks->id) {
-		case RPI_FIRMWARE_ARM_CLK_ID:
-		case RPI_FIRMWARE_CORE_CLK_ID:
-		case RPI_FIRMWARE_M2MC_CLK_ID:
-		case RPI_FIRMWARE_V3D_CLK_ID:
-		case RPI_FIRMWARE_PIXEL_BVB_CLK_ID:
 			hw = raspberrypi_clk_register(rpi, clks->parent,
-						      clks->id);
+						      clks->id, variant);
 			if (IS_ERR(hw))
 				return PTR_ERR(hw);
 
 			data->hws[clks->id] = hw;
 			data->num = clks->id + 1;
-			fallthrough;
-
-		default:
-			clks++;
-			break;
 		}
+
+		clks++;
 	}
 
 	return 0;
-- 
2.35.1

