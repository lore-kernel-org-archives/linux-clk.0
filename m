Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9447FC433DB
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 16:00:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D27064ED3
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 16:00:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232847AbhBYQAM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Feb 2021 11:00:12 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:59473 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232763AbhBYQAH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Feb 2021 11:00:07 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 03FE7B8B;
        Thu, 25 Feb 2021 10:59:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 25 Feb 2021 10:59:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=HmuRhzlXW6IVz
        2JPi2LFks2m16xhfPi7CMUt7sDDno8=; b=fJAIQ7GDUau/B71Hh+fVpT7HZjpw3
        vsXNASCAZyu5aw4gHLtUEts2bPZuB46BdnMV3IOxebrwZ1s7L2r8cJeb1/hbLcmL
        +b7e4ay/4Y3qbHLhpKbTSln4bC75JPgwXvdoi8Pf3dEcJLVSAGN9oUKHO++huS8d
        W1NJXE2v2xPrZxFNcPh0/15fO9pqeFcECyRJ1lHGRF9Apqc+fPP1F64cQapT2cVw
        SRpAhUvONLBrOWLi6XLRu6665foUvoHTLHHcPKBeBh3YvVYCgWxY7+pB+CxlyIMt
        3GBsZIDAYgFmRKrRU8Ir6cdNqBT+xeXPs4W1YwuJR0TQC5qfR5iAsBVvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=HmuRhzlXW6IVz2JPi2LFks2m16xhfPi7CMUt7sDDno8=; b=bn4ll3bI
        QI7vvrF4OyxspT2B4dE/V5+JUDzk0vG7pHGhCF8cQCFbDdMZgsmF6tykANqh5H/0
        4NnAzPvxmZG2JuGVNMAbDJPJVs1BWAcXMY+a/6Dy7PYRE3glyR8lZJsVSGsGwyrR
        3X5ig+wWnaRiu4QKrXbTL8kc797NgfzoWPyJOtgLHWbt8emfvs2dzyEJ4i86rvX/
        X8aSLeBT8Q/PfO6pjzj+tJyUV2TbS3l2toDdFNF0zDaxlaeeL7sabFY3SJ/kaPVo
        w5iR6nN9QWTkJDAq5kQKb8rTmGnKLaYKTTpL/A40g7+MDGucCirjYlplVhu76PnB
        yUCJ/AxJCITgnA==
X-ME-Sender: <xms:Vsk3YEPrZ0WQOYP-yNdkABPPEJnT_4POSvZeR6ImWV3Zhi4iaslNhg>
    <xme:Vsk3YK95Vy5xN7KfuKC37Z6ShleclKfhPtchLqrkxyM2_b0nMPTMv2We66b99wavP
    luxDDLeSmGJIC1NIag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeelgdekgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Vsk3YLRhRjn3wAMcrf9-t8Q7U1voB-vXYIJFnQMr_1ZU8_LdneLHgQ>
    <xmx:Vsk3YMu9kg34hHxcEvxKRS-9BhacT4sZNtOQG1QuEa8V4VHpXsOaLg>
    <xmx:Vsk3YMf1ZtvJ5w7wjMCxXk5FYPv3GI9iw-GxbWVChWkkZ1f0zRn8PA>
    <xmx:Vsk3YC3DnkOV92RXQ7fjrrTF2-ok3G_Gq146CKFH-HX16wdGXXjGv-nQZcU>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2A1051080064;
        Thu, 25 Feb 2021 10:59:18 -0500 (EST)
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
Subject: [PATCH 3/8] drm/vc4: hdmi: Properly compute the BVB clock rate
Date:   Thu, 25 Feb 2021 16:59:04 +0100
Message-Id: <20210225155909.1853812-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210225155909.1853812-1-maxime@cerno.tech>
References: <20210225155909.1853812-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The BVB clock rate computation doesn't take into account a mode clock of
594MHz that we're going to need to support 4k60.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index eee9751009c2..b5bc742993a4 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -91,7 +91,6 @@
 # define VC4_HD_M_ENABLE			BIT(0)
 
 #define CEC_CLOCK_FREQ 40000
-#define VC4_HSM_MID_CLOCK 149985000
 
 #define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
 
@@ -739,7 +738,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		conn_state_to_vc4_hdmi_conn_state(conn_state);
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	unsigned long pixel_rate, hsm_rate;
+	unsigned long bvb_rate, pixel_rate, hsm_rate;
 	int ret;
 
 	ret = pm_runtime_get_sync(&vc4_hdmi->pdev->dev);
@@ -793,12 +792,8 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 
 	vc4_hdmi_cec_update_clk_div(vc4_hdmi);
 
-	/*
-	 * FIXME: When the pixel freq is 594MHz (4k60), this needs to be setup
-	 * at 300MHz.
-	 */
-	ret = clk_set_min_rate(vc4_hdmi->pixel_bvb_clock,
-			       (hsm_rate > VC4_HSM_MID_CLOCK ? 150000000 : 75000000));
+	bvb_rate = roundup(mode->clock * 1000 / 2, 75000000);
+	ret = clk_set_min_rate(vc4_hdmi->pixel_bvb_clock, bvb_rate);
 	if (ret) {
 		DRM_ERROR("Failed to set pixel bvb clock rate: %d\n", ret);
 		clk_disable_unprepare(vc4_hdmi->hsm_clock);
-- 
2.29.2

