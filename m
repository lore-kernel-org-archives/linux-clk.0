Return-Path: <SRS0=uDsh=AH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8992BC433E0
	for <linux-clk@archiver.kernel.org>; Fri, 26 Jun 2020 11:25:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 690A320791
	for <linux-clk@archiver.kernel.org>; Fri, 26 Jun 2020 11:25:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="Ug+Y9w9D";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tpJ033FD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728437AbgFZLZT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Jun 2020 07:25:19 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:54365 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728381AbgFZLZS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Jun 2020 07:25:18 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 1D995AD9;
        Fri, 26 Jun 2020 07:25:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 26 Jun 2020 07:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=lCyW8UhTCKFXXsGQB/N7TX+wEw
        1X06QJIp+fcNRp2W8=; b=Ug+Y9w9DwfS43kIFB9lpFUfhRv2IBcIm9Rqp/026Rb
        HBdJ7xTnUqHzDBFg+4pga8zOQ/y+xMdvB3zsbhULImAZ8joQycZXA+wB/GAi1eCq
        JH0u6/3COCtJHzwAHFhdjylfEHbwyExZZz4WPt6uyiqNpqmkPwSereMhRGYTD805
        Ea31r/t1Yc6EbKdAx6/V+KZ41WjVrd4vbc8x1e8v4KfQYMcnhuxDaFId2KioXtNJ
        KMR/7IVFOfbkF+GbSC7APgqup3/HAUorcLxtU09ZdbXW7WHxlgcuN9I0EdVkBKj0
        0VdylLxdyMSat5MRexaLFNx0SqtkBHAq5bDhNv8Jxaxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=lCyW8UhTCKFXXsGQB
        /N7TX+wEw1X06QJIp+fcNRp2W8=; b=tpJ033FDnXZa61k17nbdTZVj7/29Gcha9
        wJrf9bPH2uaxbtqXpPiLAJI09hEZArxYBqh3OIYbcmGYHPLKxqxNeOHfmPAbbdQs
        YwoPqRsflDeIYXfD1gI0nSs5XHTDzRl5mSoQsheq52Q7BuJQh+ElSujJjb3byZLO
        vXiD0iQ65pB+Y7ytOw+FbkEEiPAvgR4XBVuK37qTe0im45PReAo+A8HG+ezyxp7h
        vntVT6flhQFwnOqvJHRcib2b6R5mk6OGBhUigNetQgmcVohKU7qPSOCtbK3op/28
        YCD3ydHZJCyYLIux7/Ze8REYDzE2oO2z449TQOUTcZuqZnsyW9YHQ==
X-ME-Sender: <xms:HNv1XjV_Xqga5VloE7MptTvgHV6HBh1QVkubDfciHDzn3rZyYfH3Rw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeluddggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
    tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
    hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
    necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:HNv1XrnjVxmPcVuIImktZNk7LXysbbGJjBYuBjTtjt1TnlfxGDMlXg>
    <xmx:HNv1XvaD8BQEdBzZBxjCxJlDcADX6kmVB2A7tIrIndK64hd9mlJVrA>
    <xmx:HNv1XuWfokA2rbEshIH-wbbu6gY6mcnHbZdMfX3HppMR4gtD7wB3AA>
    <xmx:HNv1XjhytYFTqB6Jh5mpademSJAI1ViKZOdf4Y1c_CSn2qBV7-3M3A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id C7F5D328005D;
        Fri, 26 Jun 2020 07:25:15 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] clk: bcm: dvp: Add missing module informations
Date:   Fri, 26 Jun 2020 13:25:13 +0200
Message-Id: <20200626112513.90816-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The driver for the DVP controller in the BCM2711 was missing the MODULE_*
macros resulting in a modpost warning at compilation.

Fixes: 1bc95972715a ("clk: bcm: Add BCM2711 DVP driver")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-bcm2711-dvp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/bcm/clk-bcm2711-dvp.c b/drivers/clk/bcm/clk-bcm2711-dvp.c
index 84dbc886e303..8333e20dc9d2 100644
--- a/drivers/clk/bcm/clk-bcm2711-dvp.c
+++ b/drivers/clk/bcm/clk-bcm2711-dvp.c
@@ -118,3 +118,7 @@ static struct platform_driver clk_dvp_driver = {
 	},
 };
 module_platform_driver(clk_dvp_driver);
+
+MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
+MODULE_DESCRIPTION("BCM2711 DVP clock driver");
+MODULE_LICENSE("GPL");
-- 
2.26.2

