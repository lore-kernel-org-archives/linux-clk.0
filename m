Return-Path: <SRS0=Hc98=CM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2526DC433E7
	for <linux-clk@archiver.kernel.org>; Thu,  3 Sep 2020 08:26:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBD01208CA
	for <linux-clk@archiver.kernel.org>; Thu,  3 Sep 2020 08:26:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="ix+8kW94";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="P8gZPsEe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgICI0l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Sep 2020 04:26:41 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:45113 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725984AbgICI0l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Sep 2020 04:26:41 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id BB770B12;
        Thu,  3 Sep 2020 04:26:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:26:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=hI/6B60+xqp09996YeQIHZjVKb
        OZ54NtfhzOMe5IdQM=; b=ix+8kW94mQNH7yAef/mub+NftV1YGRlyFJe8gGRD9a
        0CwuZ6vh7QtNLpzCxeFjn5vJIUji6p0rw3Tt2NDkuWKR2TpITldq02D6uNsGLgha
        iOky/fxwWv++qf5PcQhOXRoq5XU/Lu2zxcLt8/+JTwBJYklsUxOkTMIcKbVA8e5y
        irj6F0vscM6XuwgVXki+xd9A+Qd6VKYyV4h9/CqLi/O72cOWInINqSrC5uAUrdxB
        x7Aje4DTaJR8ZcG0cqNV9O5bZVE38RhZravIuZk263W2+ITf74BUa0Q7IyUX7nny
        QWHxwaD7+H8JTfg4RP6a9f2Q/0E94dLnX5Ud08cqyvBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hI/6B60+xqp09996Y
        eQIHZjVKbOZ54NtfhzOMe5IdQM=; b=P8gZPsEeykGh+sa9AzOgTdv7a0H6e9Kd5
        jtuBhjXqoMGm7mwiUKn4LvhxKz7fVI2G/T6R9USyzRXQLwsMgWOEaNlsk+IYzq+U
        r15vn07upScoG/I81pfdj7xz0RNGdkyoMikKQ7+i8qmMY5nvxCgT0rlKhDEbhkQE
        xQZqe0gZXm0U+BuyK+MoD5qfJZDuqAnXkBaEzpPKt+tf32e8D6x3cirzBPPylziG
        NQ/91kdP9MP8HT2whv126g5FB9iJ+6lr4/pqBYe7tN7yCrklk61a4KRPQFfvFu9n
        xkKp+c6E+XI/D8Odn4l5Erw07dK0cc9FZDOWfKX7+6VTb5F6lKpVQ==
X-ME-Sender: <xms:vqhQX5elHASKnB43ObR1oIy8BFvT3bm1dKgaPZnPGiVj7nsBPGxnwA>
    <xme:vqhQX3NHIl7HdCOmh7t15BdWAGnMmCrE_mFH05S9F7iI9gIt5brwTS-W8MXFRQiuh
    5CvsJD9uQOLnpDH-L0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeguddgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
    tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
    hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
    necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:vqhQXygWLnC82Fjy_i60VTpVxcbdskZHOuLfNUxcH7moW1kQlPIeaw>
    <xmx:vqhQXy_LSo3mXr08rGMZKMMweQZQuJQfgWLu5qP9bnhaYynbv1-2Zw>
    <xmx:vqhQX1uB_KhcwfJLcWrFVewhOm9HrDT9kJH0bbq8VjUJ1wvpRngk5A>
    <xmx:v6hQX2-UyJ2LZYcDbJSyV91ghgJY_sfWZ-CBfnDx5Jk9URYQBGla4A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 621313280060;
        Thu,  3 Sep 2020 04:26:38 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] clk: bcm: dvp: Select the reset framework
Date:   Thu,  3 Sep 2020 10:26:36 +0200
Message-Id: <20200903082636.3844629-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The DVP driver depends both on the RESET_SIMPLE driver but also on the
reset framework itself. Let's make sure we have it enabled.

Fixes: 1bc95972715a ("clk: bcm: Add BCM2711 DVP driver")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/bcm/Kconfig b/drivers/clk/bcm/Kconfig
index 784f12c72365..ec738f74a026 100644
--- a/drivers/clk/bcm/Kconfig
+++ b/drivers/clk/bcm/Kconfig
@@ -5,6 +5,7 @@ config CLK_BCM2711_DVP
 	depends on ARCH_BCM2835 ||COMPILE_TEST
 	depends on COMMON_CLK
 	default ARCH_BCM2835
+	select RESET_CONTROLLER
 	select RESET_SIMPLE
 	help
 	  Enable common clock framework support for the Broadcom BCM2711
-- 
2.26.2

