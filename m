Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A508C4332F
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 16:04:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355992AbiELQEm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 12:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356234AbiELQEa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 12:04:30 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B5DE26607D
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 09:04:27 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id CE9345C01D8;
        Thu, 12 May 2022 12:04:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 12 May 2022 12:04:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652371466; x=1652457866; bh=SG
        8KiB0JOs0eJtOyi8iWf1V92E7PeQYfPsv+1aCaOFI=; b=HB0sCCHP2LHj2SjbA5
        Ax050xhH014bfDqTtV0n4LOJqU8kLkBA4RpDaMBM+7eHzwSAs9nQU1oMqf5D0E9i
        YYDNcuOGPOmFHjb1Qu7dGTq65QtyCBSBuRIK2BvhYJgdTKyzYOJ2beWAUPgbOHfI
        Yds0kChCp1mS/mgSonBCXyIk2+/H0bqpKmBN92cUGgiIMwBP6pzvW9UOJ2Jp1UCw
        ZeNbfiGIl8Nc2dUs2q6av11IRQBp5WijA6/0Vnrs3KOhjouwWEOBwgLMF4evwcBk
        xpJI9FOAk5BE9qd56M6JNNgQtTS4+8x6dF6DGiK+2PV/3lhcKuCacUCb7UbQlCFB
        R3gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652371466; x=1652457866; bh=SG8KiB0JOs0eJtOyi8iWf1V92E7PeQYfPsv
        +1aCaOFI=; b=oG9yqLK2iUPTPmehsxo+rbwIeLBwBeE/4q6gfqRk98ZcZ2qo0iw
        +GFap338Q77a4j3HTLSRiLtaYQI1LRP/ltBMszzBINa7Lr4V3ZJ9hGg/HWGC9pdK
        Avb6ca8MG44KNAkLi4JHPewAJEoGkHy1sDPZ+56vMVCVGLV2sHGHJ8ffjg8eqznF
        DX/TUix34t/f2duhNqfXRrB2Qu+ruov4dOgY2wQmaxxbKJHERTBxqtGYoyG1iPgb
        QnPPjJ4Uc3T/KIFi7qefRP+xtWwhKlSkP1gV9No3ehBbctRf0HOO/nEW+vukBLlI
        MwNLMY+YCwo4sYoRVagZEupQDjUwHNhR7Ww==
X-ME-Sender: <xms:CjB9YrBswasXk8AAuVItz8tjZCC5Rp3YOkNOqb5OBZ9ptYZAWKW1Ww>
    <xme:CjB9YhiDNwMa3pnS1MFgScXPeVQew6J8CTPujpSmrZJcqQanDEQf5c1PlM6Ui85eU
    etQizStn0m2YFjtbc8>
X-ME-Received: <xmr:CjB9Ymm56t_cJduFsbpMAUI40suDTTda4r-WDwW3J_Dq0FXPCHfkkoEQQQCvkHhx8Wxqm3RLCDlQo9PP6P_FU1mixyPWV6-fFty3exI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdelgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:CjB9YtyzNHku60MhMTbeMO4qOepqNqme_hWTh2ROB0-Fk64AybUTRQ>
    <xmx:CjB9YgQBHMh8DoubHGXNW9sbR0ejPY-DfndlIbv89oO9C4dOQARcRQ>
    <xmx:CjB9YgajbEUv0oTW9nenFXE3dCSMBewUTHs-MixBfwm-cQTyr9ZizA>
    <xmx:CjB9YlLcVI3B86TKw_0KnqTEy1eeJ-AApg3H6PordRLfKtWZ6c3-eg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 12:04:26 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 04/28] drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection
Date:   Thu, 12 May 2022 18:03:48 +0200
Message-Id: <20220512160412.1317123-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512160412.1317123-1-maxime@cerno.tech>
References: <20220512160412.1317123-1-maxime@cerno.tech>
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

