Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A875EC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:26:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237402AbiEPN0Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238419AbiEPNZu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:25:50 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6471C20C
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:25:48 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id E648B32009CD;
        Mon, 16 May 2022 09:25:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 16 May 2022 09:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707546; x=1652793946; bh=SG
        8KiB0JOs0eJtOyi8iWf1V92E7PeQYfPsv+1aCaOFI=; b=ChX9ZZJ8RUlQY3Qf8z
        IKYJo36bG7enDH/XDRq/MfkwkHCoFn/LqV8aqpK61dvMJ+1xLxhVk11wzwv8VLVd
        JtmTWJKwhjXiquWiyBl1TK4JDmQzeBTv7cxybVHP05QpLQIELGj3IV87zrtthQdw
        mVLM2JaJu7AHpLg/Nmo/vKKRFmvR9JW6H3f0b2lAfQeM70kK+yFyhenvvPisxk9Y
        Z80giaZiBDF6K90zdegkOebRR78BuewjnYGAi3TOxpl2uDZmKg4nXDceHQAxTWZz
        WOXbZcDN0XFcTtPzf44HWuC34BSSWi7F4ZsVMaXwsBx0ObK/APMmfYYJU5PV1EGP
        rQeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707546; x=1652793946; bh=SG8KiB0JOs0eJtOyi8iWf1V92E7PeQYfPsv
        +1aCaOFI=; b=VI4r5B3bdQ0iZzE9lOMf81Bsb11/zsFLdmaRXsgxBeXVYn2oupw
        qGiVk9JXzmhx493d11WPwxfILx5CLFyjqJqL/pehVFrZCM+8mI2oCuBfosYSq1L2
        XFrbxCdcsMeSlSMr8Lc/pZbk6XB3IM186WsDl7LexRN5t61HNiVfIQ9Tc9/EyCyP
        /5mJvLIjYgr44/JhdrzblvaJp/VYQ25eEeJnN5RkgTzx3Vf4yZsZXShgRwFXNv/a
        e2z40nMkvHCM9A9u8Si74r0MIYutuBQfU2YQYpFeMwTBoHl808p038mNCogBAYJj
        PUKh4195mgG7Kk8OmTrbAqJxQlCIC1+Ji5Q==
X-ME-Sender: <xms:2lCCYuws_cUeHluyuLP5Nr048ycRaEqZKdrsi0H5geJ3SvZwyUVB2A>
    <xme:2lCCYqRErhwcwKujQV2Sn7HyCuj5Q3ElQJjxgtEcKl4ZwOhJpE41Eu5brK08GSwIk
    MBCLpEFqyVpzvSPCbY>
X-ME-Received: <xmr:2lCCYgXqbj4zeYcInhM_4nTtDoh5wCgy18RoWggOvcRqQhdhNe2r1WEw77a6UQF8aYpDxlkEIn27IQGokdzXVjTBKLFTTWbK6IVxmCs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2lCCYkiO-ZLixWlm_MkdJIpDVUfwlOL-tuhhIbAQuePqAWQuD_gaNQ>
    <xmx:2lCCYgAJuqB7Pw4FfarmpmDl5x_R88xV67qyU_rNMXW_qecT9ne1vw>
    <xmx:2lCCYlJxMmB9bPFE8FrgssOert-Az9tTlMVK4k4FnmoO6mqzZCmDng>
    <xmx:2lCCYk7btOcLR-4Xjeu-gpmKanLy3H7eB0Yya6rCn-5YLZ4-KhsUAw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:25:45 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 04/28] drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection
Date:   Mon, 16 May 2022 15:25:03 +0200
Message-Id: <20220516132527.328190-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In order to support higher HDMI frequencies, users have to set the
hdmi_enable_4kp60 parameter in their config.txt file.

We were detecting this so far by calling clk_round_rate() on the core
clock with the frequency we're supposed to run at when one of those
modes is enabled. Whether or not the parameter was enabled could then be
inferred by the returned rate since the maximum clock rate reported by
the firmware was one of the side effect of setting that parameter.

However, the recent clock rework we did changed what clk_round_rate()
was returning to always return the minimum allowed, and thus this test
wasn't reliable anymore.

Let's use the new clk_get_max_rate() function to reliably determine the
maximum rate allowed on that clock and fix the 4k@60Hz output.

Fixes: e9d6cea2af1c ("clk: bcm: rpi: Run some clocks at the minimum rate allowed")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 6aadb65eb640..962a1b9b1c4f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2891,7 +2891,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	if (variant->max_pixel_clock == 600000000) {
 		struct vc4_dev *vc4 = to_vc4_dev(drm);
-		long max_rate = clk_round_rate(vc4->hvs->core_clk, 550000000);
+		unsigned long max_rate = clk_get_max_rate(vc4->hvs->core_clk);
 
 		if (max_rate < 550000000)
 			vc4_hdmi->disable_4kp60 = true;
-- 
2.36.1

