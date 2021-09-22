Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE36C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 22 Sep 2021 12:54:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80780611B0
	for <linux-clk@archiver.kernel.org>; Wed, 22 Sep 2021 12:54:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236016AbhIVM4N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Sep 2021 08:56:13 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:34485 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236001AbhIVM4N (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Sep 2021 08:56:13 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id 61D722B015E3;
        Wed, 22 Sep 2021 08:54:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 22 Sep 2021 08:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=/i2wIOW8fG63Q
        +xqJpbK2PRWLCguAPaHH1zfAMA+Z2g=; b=et5KajvVXSLjYc0w39FhVvyrcYBuf
        2CpC9e58Ine7wjkWb9o2lPvQlsnxhsy4naoRM3rX3VuGF03V7rW9P5+uKV9bf7X8
        ZvgRwxuYEX10jEX1i60jDIxX40sLdXyQNdqHWGacnv8k9An4coIPmM4QlFVSjnU4
        khWug5WBYCzBDYeWCoY1eSPUkCqooB2Qry2mBzaK9LZRI14TfFxLDBpPmHjJIFP9
        xwwbulmQhQwLnXAMiavnnGlmPThsEdOBFMm4qw3xGHzuJmfkBdHUtMco2Fd7SgSv
        jNnteCch2lfmS7DW5ZP0W0C1YOTfapVkKDTnwzFcHl4yvpWc5Vu5LeM+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=/i2wIOW8fG63Q+xqJpbK2PRWLCguAPaHH1zfAMA+Z2g=; b=qWbANZJB
        KvPmz172JXRBJQPkJJVfpzxMpMlcz7++0tcme5yY/YSV95ixoA+xfI29zqFGyiZR
        l523IzmZ2Y/XvLF7N8bGjqfa6OD25aywEKAYC+UHRQ8iGAQ7uAdJUzOm+44Yy1ab
        o7+SWyJDXbEDQslvCs82e27yy+0+zAciYwU0EDlnZS9OwM2SZ9IQlOFWdZdUfl1V
        seDAEA2U5OULoaGZ2EQfJrSvSjdaVWRkBHt9jPtGKZVTGWdL1iiRZPZKqIX4lVzs
        nsLaOnFcMRqKRwF+h63P9OcLlw1NoobBwO3wf4uuI+Z017RHC9FbzSAcMpXDfYDt
        X2i10U+t95/8aQ==
X-ME-Sender: <xms:kSdLYZEQ3SVJ8O34hb6YC_ET0KVdJeciYlj-2byBobo6B_EXgiOt1w>
    <xme:kSdLYeVvpAdgZF67zP5tfHGQ7ug0veEhlkrcorlhUhAvJZ4vYi3mEt3rjV82it5_G
    Pw9e-HoySGi7WRdDbs>
X-ME-Received: <xmr:kSdLYbK6B7LwnIfB6rUNYCTMoBiUVO3FfRMSO5OpJsP6jZdUjKBzeP7jitjoAydVQW122jFqLuRtbNggaP3XXcmJe3CArXd4m0xc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeijedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:kSdLYfHVAXwiJmA4WQ_Hx6KzOOEGDJyJbPYaYTPnoSCk37DQDSBH7A>
    <xmx:kSdLYfVhbufLj8LwBt8RX0aO_xCICKolc52w3Z5kJ5ZuSptlkbJvxg>
    <xmx:kSdLYaNvxPr4Fbs8aciGTO1wuSAEumJn_q23oI1PjfmWfUrpDmpQCQ>
    <xmx:kidLYcXlfe3YE53RWmhBMORG91ZS-jL4zzhRYRxSbMRv61KpL9IfkWHugfs>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Sep 2021 08:54:41 -0400 (EDT)
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
Subject: [PATCH 5/5] drm/vc4: hdmi: Make sure the controller is powered in detect
Date:   Wed, 22 Sep 2021 14:54:19 +0200
Message-Id: <20210922125419.4125779-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210922125419.4125779-1-maxime@cerno.tech>
References: <20210922125419.4125779-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

If the HPD GPIO is not available and drm_probe_ddc fails, we end up
reading the HDMI_HOTPLUG register, but the controller might be powered
off resulting in a CPU hang. Make sure we have the power domain and the
HSM clock powered during the detect cycle to prevent the hang from
happening.

Fixes: 4f6e3d66ac52 ("drm/vc4: Add runtime PM support to the HDMI encoder driver")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 630b84ab73a2..8e6d7e1af200 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -168,6 +168,8 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	bool connected = false;
 
+	WARN_ON(pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev));
+
 	if (vc4_hdmi->hpd_gpio &&
 	    gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio)) {
 		connected = true;
@@ -188,10 +190,12 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 			}
 		}
 
+		pm_runtime_put(&vc4_hdmi->pdev->dev);
 		return connector_status_connected;
 	}
 
 	cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
+	pm_runtime_put(&vc4_hdmi->pdev->dev);
 	return connector_status_disconnected;
 }
 
-- 
2.31.1

