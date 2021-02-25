Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73195C433E6
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 16:00:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2024D64E7A
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 16:00:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbhBYQAL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Feb 2021 11:00:11 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:44683 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232761AbhBYQAH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Feb 2021 11:00:07 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.west.internal (Postfix) with ESMTP id 8F9BDB45;
        Thu, 25 Feb 2021 10:59:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 25 Feb 2021 10:59:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=Loy9FhN7/85ws
        fGGp6ErhbCy3uYURUfybTrDurLYpmc=; b=HaGayoGiziPYXKKkaUYKueI8mW0W7
        OHu7uLC10EjgMmbPV6YEmRFi0NJO90eGkqNjuGxm1YL9Th9AoR5Gyf3UJ2q8THiN
        YAk5eaN+YHbjYr3x09VJT1sZoX/Fmy5XMOEIGlqmr6tT3ekXpTguP3XWanfMAbiA
        3o3zXCU4VIMskda6G+zMlWFPkXP7vZ6fdcI0gRr9tY/ixK49AfOreOFAEsZ4STN8
        aVLNwzdgrIFI4bFWeFhLd0MoRublbWRGyoYYNXRMKB/0OTXCzOKObV1g90OzOKVI
        KOJKd0nJzrnPlzxprFVbtVICSm08DK+FMsyYogaD0DaNHGRriZL0ItxjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=Loy9FhN7/85wsfGGp6ErhbCy3uYURUfybTrDurLYpmc=; b=cwd3OUtP
        cL4/7gALQPt7KcaWq6BYCd+qt0mh+a2pJBT18ZnbkC4VwBOBr7laZ8qGgL1jeI+P
        fZqf6fg+s/PzrnEYx/ISZM18ccAECZGrJVAyA4bR5C5odjC9DHHdkPMCfs5R3+SF
        aeArzwMK1vvHef7Jn43Ki/iKX4JSybx1FOVvvRv2votrxNlNRweaWNAOTCjGhdt7
        IJU55yffQBY7qjirQxdww2/NaEbvt0n1splcF2JUKLkM1XV4zw64UQ/iR2NPmcVd
        e3KloUHWhCVM2rEsz4uXzWCPT3KJCoRaNGNDMAt8FpxnPJRsL4RwrHTlFkqCULTk
        aMxU5tFlvNkvAw==
X-ME-Sender: <xms:VMk3YKeJ5XqUbhUqcetXbagWq2WE4Ae5w26gEPEK6ntaxfh3AschTw>
    <xme:VMk3YGMRfsFbtFdHHL3CLdLtsn30WYSobHel9Gg598mMIj8Woi-YyA2FCI80ANM_v
    7Y1agY98-ucI6ILY3c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeelgdekhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:VMk3YE7aBfBNKvR2Zh1Td2Ts63eiVmJvy2jFdqG_XgAIz2BkNs2s5A>
    <xmx:VMk3YKL8rPmsu1YGmCyPGPgm1i0IMfUdhbfHn2bmgI_bkvm6ZljKLQ>
    <xmx:VMk3YOcJpNxzIeNUFHRhTzJLhObVXphikwpYVBrAK466X2okKGTJRw>
    <xmx:Vsk3YEQy9XnlC-zB2Fuh3ujjEKef9LBcNu-8Lcw8ZfURbDmaGDRJAvrxLtk>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8F8A3108005C;
        Thu, 25 Feb 2021 10:59:16 -0500 (EST)
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
Subject: [PATCH 2/8] drm/vc4: hvs: Make the HVS bind first
Date:   Thu, 25 Feb 2021 16:59:03 +0100
Message-Id: <20210225155909.1853812-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210225155909.1853812-1-maxime@cerno.tech>
References: <20210225155909.1853812-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We'll need to have the HVS binding before the HDMI controllers so that
we can check whether the firmware allows to run in 4kp60. Reorder a bit
the component list, and document the current constraints we're aware of.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 556ad0f02a0d..0310590ee66e 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -303,12 +303,21 @@ static const struct component_master_ops vc4_drm_ops = {
 	.unbind = vc4_drm_unbind,
 };
 
+/*
+ * This list determines the binding order of our components, and we have
+ * a few constraints:
+ *   - The TXP driver needs to be bound before the PixelValves (CRTC)
+ *     but after the HVS to set the possible_crtc field properly
+ *   - The HDMI driver needs to be bound after the HVS so that we can
+ *     lookup the HVS maximum core clock rate and figure out if we
+ *     support 4kp60 or not.
+ */
 static struct platform_driver *const component_drivers[] = {
+	&vc4_hvs_driver,
 	&vc4_hdmi_driver,
 	&vc4_vec_driver,
 	&vc4_dpi_driver,
 	&vc4_dsi_driver,
-	&vc4_hvs_driver,
 	&vc4_txp_driver,
 	&vc4_crtc_driver,
 	&vc4_v3d_driver,
-- 
2.29.2

