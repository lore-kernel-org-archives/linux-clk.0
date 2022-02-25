Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E284C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 14:35:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241817AbiBYOg0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 09:36:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241818AbiBYOgZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 09:36:25 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 300A71AE659
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 06:35:52 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 3C1855C0198;
        Fri, 25 Feb 2022 09:35:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 25 Feb 2022 09:35:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=YG/YzRDoyDY+dcvSDvbUWJ+GXvArvM
        MYZLUzmKGB4FQ=; b=sGx1+MAgJ6+ltjpCFzg3xrP/H2vyTRSxuzJifcnbRoeffR
        VIJCdYgUJg1v6SWlA2amNLTwoJt0j5SvzqmhvaWG2+Q8EouDu35mJDWwv8njnicK
        K56LWsHoBa1XqtuBnbpHINI+oVE8KKnsdjvAW8E2mmeEdDJOVUawHOUw/LHo0U3r
        mQ1q+WomsxXwTHlWJLjcxCP6rcFxQREfMwWXiBsBPFXkWCI+bm4rm+sxmIQqWIdr
        XxrLcD6L7cpIgOm23llJ/benemNus6emt19IovpgWXib3U2ZuTAaFcmL+KITXNjy
        f4xUoUMfbqEz5eGY13+26PavdY9gSZYYN88BNVzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=YG/YzR
        DoyDY+dcvSDvbUWJ+GXvArvMMYZLUzmKGB4FQ=; b=KGIQsyTj6xf1Zxpb/unvsd
        c5w2febF/sTEODhbFe0/GXFUcLoUzNalXuquebYRsOJl4F0FUmI4odK/LnQ5FmnG
        cfAWxe3saDJWJBzRv+4hAGA7fzySfnt4i74MKdSoE3kC1Sj4I2qhKSMizjTh/0V3
        IeGcvVsS0SaamM/0VyAFcOf/VafmlFZwIq1egwstzXBF0ekzOKawgf34i/fbmoLW
        llmLjYJREx3EB9E1K7bm8DRokPz/LnjSncvcO6jGMmX9KJFPuBVD0WgJehYbOIyG
        6vb4phNq5GgZ6CijUPPP0y6GM1xvenLcN80BGoyw/GMAYIP9/F/xkNrM69dx/irQ
        ==
X-ME-Sender: <xms:SOkYYoBwknBtTnksfBE_2KV5u7a43NDBgf4mwcZAo7Jx8XCMvPXShQ>
    <xme:SOkYYqgCY33t3sRQ_rr9AtIzaP-05eMgQ2poubfnXYikIyJ33uzhHsdRifEDak4iS
    h6D1UWZTuUdh8ii2vI>
X-ME-Received: <xmr:SOkYYrlpy3EiNJMRcodYOpBw3rTO__46YVbdXsw7OD7OOplpR6RzzUgGWL7_f4_6yO2Uu_LAcK8Qsg5KPL3o0AFS2-GRvNnlb8HYNTo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:SOkYYuylB15ClJ8hdN0AJ7CAS1LxBWwpB8lRPu0-I_sVRIVvpPg_JA>
    <xmx:SOkYYtRxJ8K61jZSR6iwjIK2GLAD72Q0d4Q31bPqpq2xU0fvOMifbQ>
    <xmx:SOkYYpaLZmP0f0UaLi2_cTS_ao4LpWh1NHnkMjX30vWkM0_YHFZaXg>
    <xmx:SOkYYuSGssJqccTJV1bWRopNMHOrVriUjUra1vob8lN8rJIoq2ABfw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 09:35:51 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v7 08/12] clk: bcm: rpi: Add variant structure
Date:   Fri, 25 Feb 2022 15:35:30 +0100
Message-Id: <20220225143534.405820-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225143534.405820-1-maxime@cerno.tech>
References: <20220225143534.405820-1-maxime@cerno.tech>
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

