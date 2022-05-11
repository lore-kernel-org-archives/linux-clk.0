Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA197C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:43:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244927AbiEKOnN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:43:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244919AbiEKOnM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:43:12 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3946948A
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:43:11 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 26DCA3200994;
        Wed, 11 May 2022 10:43:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 11 May 2022 10:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652280189; x=1652366589; bh=SG
        8KiB0JOs0eJtOyi8iWf1V92E7PeQYfPsv+1aCaOFI=; b=hZk+q5ixAZLJygI5qp
        Ctx1mQSQUidld8TcGb02ZDNntEtsrd00x7wSlojfW0p5TkJk4PDRzte4QpfaAfHQ
        NY1ULtSBYn854UcGe/+NMnB+/KDXzcVBrxC3CcK1U0dFuuTaEUo2+Q9HVXdQnCI4
        M4UdCkQqTLZsWvM2oFi0GMPOAL/oHwshdG+5rHMoIP6pCcSqlGuxik5EmvEtNDhb
        S/zou7I25Ti4H899gDuSV7S/N9ir9CAXSxGSMixArZlcFB41y9665ydZVxyoA/T7
        9CJlWAPudr6OTlCgxzHZ+HEYxgHLV89TFE9jE9cnNhCG+ugak/Asl+FMXQD7GK70
        L4dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652280189; x=1652366589; bh=SG8KiB0JOs0eJtOyi8iWf1V92E7PeQYfPsv
        +1aCaOFI=; b=iIWJLgDV5rw4nlUxxCF3i7xE3YSIu2H9xjdwQB3CXTv0ArXfXNe
        NgHG17VgIZGgB3nQadN10WRuGOLIEo+Z76KWqvIR8EW7pe4KQMKjQerixYO0din3
        29s4+2D1AmY/LGOtGDpEUPCY8Tthe599pq79NzXkZKjqmkMFicpiIKAXRDEVPHXl
        6Ud5PiuA+WcKlOaQoAVgTsoyl4H9gFZDdAu2lkgW6m1TYvtYc2f7jUBxY09nrpgA
        8N3wnrYvCWZdjUb+LFGlc05kGoIEbNwK1DNCLHbiF1vuNlUFDgbzQdrsCq1r4FwH
        e+CM2e5XRDCmm02EaSTyp0sa8FW8c6JpUTQ==
X-ME-Sender: <xms:fct7YnvSfAjmbXBfkDj6Tq8MB3NAl33qI-QZyEiYuHk5gUxgzeDFlQ>
    <xme:fct7Yoc8mr1VXPGqaGADfDvP1RaD8w-yzODqIU922or9iHr-I5C3rHVX86ztMUVxJ
    fgKeARc2H5TmWMBf34>
X-ME-Received: <xmr:fct7Yqxn4SJ4yGJoKF0ZLqD8yTKAJpsWpglYptSu0McF6Dv-iaNxVUyxN3Iyf-xYjKptdwco2Z4DNmefa6MgQZ8ILUNjlTJYz4KviZ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:fct7YmMYkVwJYoU3jU6gakm_CmeIk31vMp3O2Ys18NzQC8_dVgCNGQ>
    <xmx:fct7Yn8YOFeMaatipWSJ7KsKlYTkBhTamLIrzmIXnuueUT_toiuEZQ>
    <xmx:fct7YmUk38B-PSwKjSo90jbilbfFxb9UNArItU9W6QcOfXeQo7YCiw>
    <xmx:fct7Yo3IYd92b8YEy_0-NrFJntWFLkxR7j998sgixzeS0FYb2_6bDg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:43:08 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 04/28] drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection
Date:   Wed, 11 May 2022 16:42:25 +0200
Message-Id: <20220511144249.354775-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511144249.354775-1-maxime@cerno.tech>
References: <20220511144249.354775-1-maxime@cerno.tech>
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

