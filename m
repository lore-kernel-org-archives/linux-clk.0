Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FE2C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 16:00:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232001AbiGOQAi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 12:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbiGOQAf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 12:00:35 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3ACD6C11B
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 09:00:34 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 73F083200A2E;
        Fri, 15 Jul 2022 12:00:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 15 Jul 2022 12:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657900832; x=1657987232; bh=HJ
        MikLANT0qjwUy9J/ZcLOy/bNPftr83LR8brfc069g=; b=R8uTZyYmvy+VI2MF26
        YyH8VM1BIPwlKGSp/IVWrgpKWZhWB6YEgzKrDO2fE86Tq7oAgA0TuqqHUywtvpx6
        8IeyhEB+LRhmKlxvyvOaWbZVYweBpX6KhqCIizCTAcRl3BgaWfFNy07V+m9nrr+/
        usBQXOum2WEF7joLCeeE9ojUnxvcccL3PgpYzv89ly5LU2xtSwuNV+SLqSCwwljz
        6CpNbw29Doe27cYz8Vd4Tjv6KGeH9BVkqWjDgfGjn1t7rA4eTS1SsgUUPNgdiauF
        MZxSUYgMdIwcpOCJpni/9JpVIjKvH8yCnhg4o+snfs7ec7qXWjNgC2NYR3QCjr1u
        SmeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657900832; x=1657987232; bh=HJMikLANT0qjw
        Uy9J/ZcLOy/bNPftr83LR8brfc069g=; b=r0IiP0mU1aJWTC0J26SOBCGEQD6mR
        0YHPhUG047VtzRokDXsgbFFQTlm4UKZ1wbI3DQQ65y7yUq7z1WDGVgcDn7TlkH7j
        2bUW2eO4KmkEtseQadhkZjb2Fiuv5aQfYdYvf9gIXpJrVR2d2fybyepbLIwUlyCv
        P/od5LuwihcnGqmebtRw4LaT3KIvEDhe6ZG/BtL9HaW3og5rqgTJ4Z4xvjFN2ROi
        aI1E8jhb55nhsDETXQqAV1q5sMaaCMPTOnMuBg+F1sif9TTiP06sYfRlKjEtBRmS
        o/RSSYmwuNxY6Elv5YggNK0ndNkuudBlM5/bdtW0KGICzMk8grnY+1cyg==
X-ME-Sender: <xms:II_RYmJvUj7AMUmXfAb7nfpJPxirhrtz8G80BocT3MgcqFq0xadwgg>
    <xme:II_RYuKUeYteFyggTrdH8sKJv0S56yqjGjIogo0BlzlsV48NKFdJQ8xWPP1DfZgg4
    P2bJdrjLIzN0EbuvOs>
X-ME-Received: <xmr:II_RYmvIP9IKKgWOkxTj4FPxavgSKKFsUybk6PKP_1lZ6Nlt0X7uAY0nksObY-ceaVAQshRv2zDh-kZJGXFZ_lKEIKYL-iHY3Cv0jBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:II_RYrbjv6RX2i8mGuG7RDmR912yUw8mGSnlfg7aYWnhSLqRn5oscw>
    <xmx:II_RYtY8VYibLA401cqyzeswYrBPsyqrcVa6-J84H2TWCTBrfnOpJA>
    <xmx:II_RYnDHIctJf9zR4wmoYXBzPoKmFHuo05exODT5DRIhOtdNqnAKmw>
    <xmx:II_RYqSwfKkCR-vJksslSrUYYIRaDm7z7_4AU4CJLvNtmJxAs4xXdQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 12:00:31 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v7 03/28] drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection
Date:   Fri, 15 Jul 2022 17:59:49 +0200
Message-Id: <20220715160014.2623107-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715160014.2623107-1-maxime@cerno.tech>
References: <20220715160014.2623107-1-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 719a3c3b4ef6..e22872d94cba 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -47,6 +47,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/rational.h>
 #include <linux/reset.h>
+#include <soc/bcm2835/raspberrypi-clocks.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/hdmi-codec.h>
 #include <sound/pcm_drm_eld.h>
@@ -3332,7 +3333,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	if (variant->max_pixel_clock == 600000000) {
 		struct vc4_dev *vc4 = to_vc4_dev(drm);
-		long max_rate = clk_round_rate(vc4->hvs->core_clk, 550000000);
+		unsigned long max_rate = rpi_firmware_clk_get_max_rate(vc4->hvs->core_clk);
 
 		if (max_rate < 550000000)
 			vc4_hdmi->disable_4kp60 = true;
-- 
2.36.1

