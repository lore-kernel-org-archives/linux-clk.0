Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8026CC433E6
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 16:01:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4479164ED3
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 16:01:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbhBYQB1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Feb 2021 11:01:27 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:38439 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232949AbhBYQBO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Feb 2021 11:01:14 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 69010B77;
        Thu, 25 Feb 2021 10:59:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 25 Feb 2021 10:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=sRNO0ReEEWwLa
        bTWRSjhfPjtyQxPG1rXo9Lu0AoR/OQ=; b=cPonwAXD/UhcBBn6rbM0tozLBDjhc
        PP1hQDnpu2ousQjOepi+LslV6QwLz3kSydM+0fc1UEaGm2d0v9HqjBTgpRIg6YgX
        xRLBasJq5UA5tnSLjhyjxae9GffBZagiTr4E/CSSWpyWBlMyph+g+6j4lXtTKVHs
        YX/RRDcSz++z5awTrrK94jUDT4YMnEj3ejOL5Rf4ZdUFqQ6MU2w46e0G2H1PmIM5
        Zby8xRBCy1uFMiBWGmDbO6PJFIcYHNHlsG4FhExGN2J/ZoUqodOjKD4Tlwo2v5PI
        7oFSMHtMn9xrgXJwH5xx68qhO342NpYo9wVAPxcbJj8OGqqd9P/N8Dt4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=sRNO0ReEEWwLabTWRSjhfPjtyQxPG1rXo9Lu0AoR/OQ=; b=jjOselDB
        4ND4YhV2BV8peo0kywUpKNtoQVNz6Rv5yEf6aSY1yOwr/LMzmHkLEAxKypcUQITV
        QNoyCnTtRiYuL4fsl44ueNTR8g1DJWYxzPIoGXd1G7n4qj6dZJmC3/gy/qSbwYKT
        ZcdEl57iH72Dzd5C+Rzo3cE36eFIQPJlNiby6O57XtQr/9Jgj9kEFRAppU5MvxS/
        luR7p/x20KIS10XJAvdaP1/9RH2t4uPAzqxj85/YdcJKVEOpJ4p2GSMp82MO4enJ
        bsRoa3UYysKDVEjrX8hMeEayyjaCEJh92jCmrDFXOWi3oeuDmmkaPNLX3uDaZCf1
        L/JxDHzoaNdd1g==
X-ME-Sender: <xms:XMk3YP3cRPbaicGmUo3OX6u4grdhrDT9zpgud5HTJAS4I4xuBlKezw>
    <xme:XMk3YApGzQu66vz2f5vWC715dvY81EUQbYPd3CzXQpmN8Wv2lsuo5Ecdq7WMAa9Tk
    0p5wrtXvlmCeJOl8jI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeelgdekgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XMk3YDijqTcER9a4_02Bz3HvMlrY38enRfVSwwF_deHuWv-sDqmlvg>
    <xmx:XMk3YE-ECzH29Opw6V9i0rRbF62mB7iSarXdhfozqYEWfC0HVY0z4w>
    <xmx:XMk3YHV_GjeQ07nr_4kYzxeRhW1NkKwgem5seD01Zr19rVvRISsihw>
    <xmx:Xsk3YOdxcih8drielNvDdf9YbIjoeuuXBUDsSoMWwIO4Tk_e37MTBVnEUWw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 66672108005F;
        Thu, 25 Feb 2021 10:59:24 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     Phil Elwell <phil@raspberrypi.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Tim Gover <tim.gover@raspberrypi.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Subject: [PATCH 7/8] drm/vc4: plane: Fix typo in scaler width and height
Date:   Thu, 25 Feb 2021 16:59:08 +0100
Message-Id: <20210225155909.1853812-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210225155909.1853812-1-maxime@cerno.tech>
References: <20210225155909.1853812-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 4a075294ff4c..5e8b7f72dc05 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -912,9 +912,9 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 		if (!vc4_state->is_unity) {
 			vc4_dlist_write(vc4_state,
 					VC4_SET_FIELD(vc4_state->crtc_w,
-						      SCALER_POS1_SCL_WIDTH) |
+						      SCALER5_POS1_SCL_WIDTH) |
 					VC4_SET_FIELD(vc4_state->crtc_h,
-						      SCALER_POS1_SCL_HEIGHT));
+						      SCALER5_POS1_SCL_HEIGHT));
 		}
 
 		/* Position Word 2: Source Image Size */
-- 
2.29.2

