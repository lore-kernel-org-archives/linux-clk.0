Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2C2C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 22 Sep 2021 12:54:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0ECC61181
	for <linux-clk@archiver.kernel.org>; Wed, 22 Sep 2021 12:54:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236016AbhIVM4I (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Sep 2021 08:56:08 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:40193 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236064AbhIVM4H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Sep 2021 08:56:07 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id C2BB2580460;
        Wed, 22 Sep 2021 08:54:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 22 Sep 2021 08:54:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=4e/P9dQE+b90j
        QHmfImUYpGrWO8DGPe+LWkJUYv0Syw=; b=xbhnSNp5VUssGFsGthY3KwxtjkejP
        iTroEfJAsRysfHcmp4ShTRd1lEU3DD3Za8LgTNdOcSlmY/3d0Zl+gyppTZQ8N+h5
        8z4M5bqm7WuecVC9zsUPFU0NATPF5+LURdlzDNCEPDTV6bA/SvJFjmt87HlAvScE
        2iuOpjMHQEc5nE0MSd3QeZSvKK6qDCIzSDtQEfmmDsG19gdrSzyovEnG9b+64wwe
        mbglJLG1gWITR8yw1u+8T+XvXMqMV+rj/NQYF1Y0O+2KZAdk6t7mIrQzJFjVLQWQ
        Llx1ErzMwYvHd1EOT0TNS764rYTs2tItwM0/hKSk84J7mYDBnDiTbz5mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=4e/P9dQE+b90jQHmfImUYpGrWO8DGPe+LWkJUYv0Syw=; b=ocnNNTxe
        zCyItCVcjJj9253OhYSTnswwP8TW2lJiz9LzfcLcQmteqewqlLk9jP3NoqPhUGyH
        UY3BgHKASmEenb7Uek/jQtoTxHicLFoTTV7X2L9a0PCCCohZvW5ts8lCNQWTRy0u
        T7CdmWokwHohjpeiGenYNt/vqXt1PiPdux8ZcUvsMhbZz7BJYgi25m361e3ul6+o
        B1A5zP+ZXOg7utysPXTP3muhHXI36oavBeYTG206/ujstoWGqdZoBzgrD6iLRe0A
        frluPW+HyNrohhoLL/+19ZenXKTPmBAtE1HyX2wyMUR0znFCvuPwiYTjnTUKaQA4
        ajUAawHrpvBlMQ==
X-ME-Sender: <xms:iidLYZibLEmm925tMAZmKEQtDyf7X0N3Aealojls8ba2lplDHcLLDA>
    <xme:iidLYeDr3sMJD_T-nnD6wEIwT4F_kSsm_ygPbWx1br8mpkASFnnsnV9wQhsNXUj2U
    7g7puWFzZdnxdZRBek>
X-ME-Received: <xmr:iidLYZEGtleakq2t_HCMuSFu1138zS4WpoyXWgYawgRabypd5Vkr2bwQwItDIF0-Vof5Ek0MBPkO3BYZ1jOSifCRLgfZHMW6F2ns>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeijedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:iidLYeR99vL4tj-I7BHfwMIF0vgUFkljCJcTCvve2CydravAtXxUWw>
    <xmx:iidLYWw2gupWhga9Kuh0TgvbE68xAfqH5XneyByopxZkjLbeheIUag>
    <xmx:iidLYU7QzCooqHXd6bDIfxnVV2-m_9HmVZEJoWN7j8SgGDBUaXafMA>
    <xmx:iydLYRp-f0e5e8rnXni46WctErVGx2jL3Zmi0eBRc8gRv5IqYYUrKA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Sep 2021 08:54:34 -0400 (EDT)
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
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 3/5] drm/vc4: hdmi: Set a default HSM rate
Date:   Wed, 22 Sep 2021 14:54:17 +0200
Message-Id: <20210922125419.4125779-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210922125419.4125779-1-maxime@cerno.tech>
References: <20210922125419.4125779-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When the firmware doesn't setup the HSM rate (such as when booting
without an HDMI cable plugged in), its rate is 0 and thus any register
access results in a CPU stall, even though HSM is enabled.

Let's enforce a minimum rate at boot to avoid this issue.

Fixes: 4f6e3d66ac52 ("drm/vc4: Add runtime PM support to the HDMI encoder driver")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index b4b4653fe301..74222b12f8c8 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -94,6 +94,7 @@
 # define VC4_HD_M_SW_RST			BIT(2)
 # define VC4_HD_M_ENABLE			BIT(0)
 
+#define HSM_MIN_CLOCK_FREQ	120000000
 #define CEC_CLOCK_FREQ 40000
 
 #define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
@@ -2169,6 +2170,19 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 			vc4_hdmi->disable_4kp60 = true;
 	}
 
+	/*
+	 * If we boot without any cable connected to the HDMI connector,
+	 * the firmware will skip the HSM initialization and leave it
+	 * with a rate of 0, resulting in a bus lockup when we're
+	 * accessing the registers even if it's enabled.
+	 *
+	 * Let's put a sensible default at runtime_resume so that we
+	 * don't end up in this situation.
+	 */
+	ret = clk_set_min_rate(vc4_hdmi->hsm_clock, HSM_MIN_CLOCK_FREQ);
+	if (ret)
+		goto err_put_ddc;
+
 	if (vc4_hdmi->variant->reset)
 		vc4_hdmi->variant->reset(vc4_hdmi);
 
-- 
2.31.1

