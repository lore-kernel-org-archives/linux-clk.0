Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52060C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 16:43:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350244AbiD1QrI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349980AbiD1QrH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 12:47:07 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE018B2467
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 09:43:52 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 152935C015C;
        Thu, 28 Apr 2022 12:43:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 28 Apr 2022 12:43:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1651164232; x=1651250632; bh=yf
        Z3fQDKjqkiicb/vhwGAbGGFTHre2lWmxhgwRRVrYk=; b=cDsB1jsa8WHbfbsKRY
        EmhjsDIeAFRaoM5CNoGkdZI8v3sVDYHcf/9NTfIJWK5inDkL3afMBdrzZsx69/z9
        V8LDBJhCpXAaWYXFCq2Q3rtDyks09pUo17TWpNozpQztI8KtT3i2rMA+A0yR+rZ1
        JUsIAs7Q7QK19KZBWx+ZTWNgu/+WfpNztOsb5f5fomyEwtd0q9eVxj0siOm+ty3Z
        f2Ez3eel4XGzvPE3YH3UNzTaQ5Fcm/UYSd+ZG16/KIsdXCZj4Me3Gp+ivtt1crLG
        t1vo1g9IFi3fSoq77cudJraLUK3YSY7FPcmfvzPujZch5jDbhW8GQZQbwTsvovzb
        lc0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1651164232; x=1651250632; bh=yfZ3fQDKjqkiicb/vhwGAbGGFTHre2lWmxh
        gwRRVrYk=; b=MD+C36N6xifeHAydDu/8wxQocuAbqbRF9A34VcmOWpTTR4Um8hP
        PSMFh5ZULFmz70dsfmPNQX1+rBlr9JPBXF6SAeFO9Gowmdz8BNdTWP90pQrLwf8u
        sqAJJOHl9PiLXnXDPKTbi/ae9O0H6NXyq79OlIMQcyJPRk3ZWPSk2iDlvGkXpq9c
        ay7hf502VXE/FhvPmCt61Z0pVSnsYcGymAyxr/lyef4PmG9biZ04bGJF+P0iWZLw
        suIMzJjtC3wlTFXGPhNrnXqTm3Wfnflj9nQ3HnyjhRA47+e/syS86j9E42fXXvlb
        T3iagWdmXw+fsgCuTvYAShkMgwfSjCw36qw==
X-ME-Sender: <xms:R8RqYv9d0P8R9mxSlHQzo8-zl9zA1G6kSHkEPzOrpKaIGmQOdtoYWQ>
    <xme:R8RqYrs7NTFLJnlXJlMS8YnqiStH6-uJGFoEOKLPUQ35iUy84PPg2oW_DNk9cpJAa
    qZpEFF1TsAXLGb3aRU>
X-ME-Received: <xmr:R8RqYtDIGPn_5LMv7v1Sbn7B3x4OXzr9k7WW58m7TvRu6J_GM5WSfQCKUTn6XDUxNiYdah2z5pf_CscRPXVfmmEV4TPblOPfxizV2KM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddutdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:R8RqYrfMmxg-W0U4buokxGYqWPtdSBpRskZajZRU0rJ3cIk8AarGFg>
    <xmx:R8RqYkNYOhszDqeiJfZ-QyBJfluX4YiAhWfbPgUijpFWdotbGmXj4g>
    <xmx:R8RqYtlizvtMFSN1IeaVhP4SaOz7tQuH1H8F0TuJh9fxlhqvaxAvOQ>
    <xmx:SMRqYlGBQw30f-XA75FHzQeQIeC298SdWApNN1e65UBxj33lSjgsxA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 12:43:51 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 04/28] drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection
Date:   Thu, 28 Apr 2022 18:43:14 +0200
Message-Id: <20220428164338.717443-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428164338.717443-1-maxime@cerno.tech>
References: <20220428164338.717443-1-maxime@cerno.tech>
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
2.35.1

