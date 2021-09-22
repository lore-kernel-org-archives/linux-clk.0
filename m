Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13610C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 22 Sep 2021 12:54:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC508610A0
	for <linux-clk@archiver.kernel.org>; Wed, 22 Sep 2021 12:54:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236045AbhIVM4K (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Sep 2021 08:56:10 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:59873 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236026AbhIVM4J (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Sep 2021 08:56:09 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id EA4C52B015E3;
        Wed, 22 Sep 2021 08:54:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 22 Sep 2021 08:54:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=8/Bpu9acEXldv
        a+wZpg5ifbt3qvSfup55XXA8eYcvds=; b=su9z6mk+4SElcMYFRCSTwtT95CrRw
        VldVXOTdHKJbTmWKCu4ySSPtkqRKuRlhH/0T/DXzf3SGG3dbJqyAiSc3WpHng2P7
        8k0EaEMGG9kBAVHQla8mCevFyn0AKM8Xy7zLV0anXTa4Y+xNzsiSvVVYmrRIBzIp
        vPp0ADsABgr2nXu15diV05BGPLhiCEO7avZdcv1NNF+Yth7FOMsfm+0uITIwQz2f
        lzy2LjHMB1qAicw8GQYFSuYveJbaRE5E4K9qW2oMzAQxzTFv54dU9oF7+wtQFQrQ
        brUT+FtCIEEQU+CS5kpI3beY3XkSY5iNQQQ8VPVS15bRieFA20wt7TWDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=8/Bpu9acEXldva+wZpg5ifbt3qvSfup55XXA8eYcvds=; b=M4PQbjds
        Ooq4L6nbPNXz776XHgRAgs3A1qlIjFTFvEITcJDvEgT7igQZY8yVh4bS4Z9ZlHHA
        lSTVf1oj1qAsDOBVfBM+bcTgrDuk8Afee4gH24I1rumlI/VyoNMWM5YD77gIZwBm
        9VTXPc/DoEnHa2DY/vN+C/bIgySml+0TmdwPerc8MCPWhmeW1VO0K7xzFK88FzRc
        F2PdTBCII89yyAdUGnTo3I/5WkXd5AsTW8zU8OyE5VRGnpYsTeKjY2oOGPdEqGBH
        e4rZVpgO5qEPWp5qZGOwPvKJeQ+1rIis4WDQ55NiOYGJftbptpsE36vKun3M5LAm
        GIlloPcVV2rEgQ==
X-ME-Sender: <xms:jSdLYViSJpbGMT_ZKOKN6MUQfB6L95fFzLMyhbBjDsqFX4zu3SGIEw>
    <xme:jSdLYaB7_RYaOO4wvlgJoKcBTLDXJiAdR2ZRNyWCH7BTp1Lv2aFGxsaeDDdC0PsSD
    M0i_IxYpMzQ5S_ryB4>
X-ME-Received: <xmr:jSdLYVG73zW-P6lVyKsfTJELTLDJfEc2tTVdjc5c8Sh8_qcU4xKWrFRDiHfFYXaSJQiW-usnowasS_o5e2OmJIizZ7izlcPU9iBO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeijedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:jSdLYaTzHCQ_JBxFIp1NZTk6NRtfjRicwhp0bpf_iLCmVL6Z2KJeTQ>
    <xmx:jSdLYSzZrHLvPLpbaYpQfPc5CZDAv1q5FURAizWENka6SrahtDUGgA>
    <xmx:jSdLYQ6cLPxjZp8KstYuV-bn7lgnqcqS2GbA8hBhq5-gdny4-ajRPA>
    <xmx:jidLYWiKVVSO43OA3gDg0b6ZPjci5o8lKaMKgw5bgKuAMf6mLzdIAigzBhI>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Sep 2021 08:54:36 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Michael Stapelberg <michael@stapelberg.ch>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 4/5] drm/vc4: hdmi: Move the HSM clock enable to runtime_pm
Date:   Wed, 22 Sep 2021 14:54:18 +0200
Message-Id: <20210922125419.4125779-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210922125419.4125779-1-maxime@cerno.tech>
References: <20210922125419.4125779-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In order to access the HDMI controller, we need to make sure the HSM
clock is enabled. If we were to access it with the clock disabled, the
CPU would completely hang, resulting in an hard crash.

Since we have different code path that would require it, let's move that
clock enable / disable to runtime_pm that will take care of the
reference counting for us.

Since we also want to change the HSM clock rate and it's only valid
while the clock is disabled, we need to move the clk_set_min_rate() call
on the HSM clock above pm_runtime_get_and_sync().

Fixes: 4f6e3d66ac52 ("drm/vc4: Add runtime PM support to the HDMI encoder driver")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 72 ++++++++++++++++++++++------------
 1 file changed, 46 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 74222b12f8c8..630b84ab73a2 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -628,7 +628,6 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
 		vc4_hdmi->variant->phy_disable(vc4_hdmi);
 
 	clk_disable_unprepare(vc4_hdmi->pixel_bvb_clock);
-	clk_disable_unprepare(vc4_hdmi->hsm_clock);
 	clk_disable_unprepare(vc4_hdmi->pixel_clock);
 
 	ret = pm_runtime_put(&vc4_hdmi->pdev->dev);
@@ -894,28 +893,10 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		conn_state_to_vc4_hdmi_conn_state(conn_state);
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	unsigned long bvb_rate, pixel_rate, hsm_rate;
+	unsigned long pixel_rate = vc4_conn_state->pixel_rate;
+	unsigned long bvb_rate, hsm_rate;
 	int ret;
 
-	ret = pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev);
-	if (ret < 0) {
-		DRM_ERROR("Failed to retain power domain: %d\n", ret);
-		return;
-	}
-
-	pixel_rate = vc4_conn_state->pixel_rate;
-	ret = clk_set_rate(vc4_hdmi->pixel_clock, pixel_rate);
-	if (ret) {
-		DRM_ERROR("Failed to set pixel clock rate: %d\n", ret);
-		return;
-	}
-
-	ret = clk_prepare_enable(vc4_hdmi->pixel_clock);
-	if (ret) {
-		DRM_ERROR("Failed to turn on pixel clock: %d\n", ret);
-		return;
-	}
-
 	/*
 	 * As stated in RPi's vc4 firmware "HDMI state machine (HSM) clock must
 	 * be faster than pixel clock, infinitesimally faster, tested in
@@ -939,10 +920,21 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		return;
 	}
 
-	ret = clk_prepare_enable(vc4_hdmi->hsm_clock);
+	ret = pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev);
+	if (ret < 0) {
+		DRM_ERROR("Failed to retain power domain: %d\n", ret);
+		return;
+	}
+
+	ret = clk_set_rate(vc4_hdmi->pixel_clock, pixel_rate);
 	if (ret) {
-		DRM_ERROR("Failed to turn on HSM clock: %d\n", ret);
-		clk_disable_unprepare(vc4_hdmi->pixel_clock);
+		DRM_ERROR("Failed to set pixel clock rate: %d\n", ret);
+		return;
+	}
+
+	ret = clk_prepare_enable(vc4_hdmi->pixel_clock);
+	if (ret) {
+		DRM_ERROR("Failed to turn on pixel clock: %d\n", ret);
 		return;
 	}
 
@@ -958,7 +950,6 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	ret = clk_set_min_rate(vc4_hdmi->pixel_bvb_clock, bvb_rate);
 	if (ret) {
 		DRM_ERROR("Failed to set pixel bvb clock rate: %d\n", ret);
-		clk_disable_unprepare(vc4_hdmi->hsm_clock);
 		clk_disable_unprepare(vc4_hdmi->pixel_clock);
 		return;
 	}
@@ -966,7 +957,6 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	ret = clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
 	if (ret) {
 		DRM_ERROR("Failed to turn on pixel bvb clock: %d\n", ret);
-		clk_disable_unprepare(vc4_hdmi->hsm_clock);
 		clk_disable_unprepare(vc4_hdmi->pixel_clock);
 		return;
 	}
@@ -2107,6 +2097,29 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int vc4_hdmi_runtime_suspend(struct device *dev)
+{
+	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(vc4_hdmi->hsm_clock);
+
+	return 0;
+}
+
+static int vc4_hdmi_runtime_resume(struct device *dev)
+{
+	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(vc4_hdmi->hsm_clock);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+#endif
+
 static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 {
 	const struct vc4_hdmi_variant *variant = of_device_get_match_data(dev);
@@ -2374,11 +2387,18 @@ static const struct of_device_id vc4_hdmi_dt_match[] = {
 	{}
 };
 
+static const struct dev_pm_ops vc4_hdmi_pm_ops = {
+	SET_RUNTIME_PM_OPS(vc4_hdmi_runtime_suspend,
+			   vc4_hdmi_runtime_resume,
+			   NULL)
+};
+
 struct platform_driver vc4_hdmi_driver = {
 	.probe = vc4_hdmi_dev_probe,
 	.remove = vc4_hdmi_dev_remove,
 	.driver = {
 		.name = "vc4_hdmi",
 		.of_match_table = vc4_hdmi_dt_match,
+		.pm = &vc4_hdmi_pm_ops,
 	},
 };
-- 
2.31.1

