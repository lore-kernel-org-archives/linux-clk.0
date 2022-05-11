Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2943BC433FE
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:43:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241596AbiEKOnV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232218AbiEKOnU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:43:20 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E2537A452
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:43:19 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id AECF23200994;
        Wed, 11 May 2022 10:43:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 11 May 2022 10:43:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652280197; x=1652366597; bh=+C
        /8GQFuo8NKij8Lyze69bvaX5PuqgSGVWjUhaseyHk=; b=WRPv0hfMAlaka7pV0o
        9VWQ4crXxg9IyTU8GX+HZOqxCVnPiv2HxssN7Euj15If9rHD86hNemmvAkiFb3gj
        5F0IK81WGNCEBo0S/Nwik6G0lpbo1vQHjklhSzqfMbCFHO+wLpCG+8KDb/Aku3ME
        A865x1MFldCmC1flgV3QK0wDmEcfMPIy3wReeK5vcrSWHMTmpNPeoAIfUfvoyfwe
        Gb+kaiApJzupwvzrirCClpzwGhCZS4yrqcuhucI8MHDe7yC3OLhhwcoAQcUjHG71
        62Ze5xrH0C8KUUrNPXk8l35xfVvdKg3Lq+z9hpLclDAaBGbJEwvbUQXcVqCH2r2N
        5Vww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652280197; x=1652366597; bh=+C/8GQFuo8NKij8Lyze69bvaX5PuqgSGVWj
        UhaseyHk=; b=p1/7gMeicpdxBFWrfTzKqDFdPUuRb3pBnW5TCQ253A0b2PuHVmO
        P709KMoV7pO1Ar7jMpRlHyEfto2W9zgjg/aHSKe36079kwCzjVnxEFJgpBOA3wWP
        euRLcP45W4k5Yh3/2qkEBAMW9GpvUKgPHNehq8mR3UM7o4sUyd2kRJRvnnQw8wi2
        qGJimuVENVfVrUImSngnkh+X+DId13r3QyNpcDlDJJpUMvO60SRjoSAM2y+YO2Au
        uHdU7eN1cSueeyqZH2Xm9wpXL8WUmxRJdmPMf1SzMQCPl0WHUEWTvvMOZRGQc7Bd
        k5j9aPDiRlvi3RtuzlsaVAdv0PfpMXp9+FQ==
X-ME-Sender: <xms:hct7Yieo9ReKr3gco131fyBNoinXoj5im9Yy6mObnIE2nzlceo-5Pg>
    <xme:hct7YsO-lQZKYoSRGEAcUb7HvSNVvuW-mpHxNXBFyQtt-XzXVLc51vBbO03F2pLb-
    xe5xT1MxlePQOIbbd0>
X-ME-Received: <xmr:hct7YjjDSURzJBbC4to1UDyOQ2uY_6cszy236q_iFkBs78pXpwwdj3o-9gsVxIGshsxnI9coDcNqrX1mGZ3raZZ83HAE1EYgTtQtC2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hct7Yv_aTyW4uGo9qHiDsoQMs_x6Mn-VLvsBfuCUC1pwhilXN5DH5A>
    <xmx:hct7YuscGeN-YnhYa-JY-T6zUS_CPFmZ7FxaVaK5HrUeJz1eSfHAew>
    <xmx:hct7YmEONzUoSJUbEKSdjSiaOoqkTpH7521fgyCKI9pR4P8SvRtRZg>
    <xmx:hct7Yvm_fKasMhFLpSjvDU3_SrwBmTweyIFPJp28QmLt2jnNsuySnA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:43:16 -0400 (EDT)
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
Subject: [PATCH v3 06/28] clk: Clarify clk_get_rate() expectations
Date:   Wed, 11 May 2022 16:42:27 +0200
Message-Id: <20220511144249.354775-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511144249.354775-1-maxime@cerno.tech>
References: <20220511144249.354775-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As shown by a number of clock users already, clk_get_rate() can be
called whether or not the clock is enabled.

Similarly, a number of clock drivers will return a rate of 0 whenever
the rate cannot be figured out.

Since it was a bit ambiguous before, let's make it clear in the
clk_get_rate() documentation.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index c9d7016550a2..95be72f9373e 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1672,8 +1672,9 @@ static unsigned long clk_core_get_rate_recalc(struct clk_core *core)
  * @clk: the clk whose rate is being returned
  *
  * Simply returns the cached rate of the clk, unless CLK_GET_RATE_NOCACHE flag
- * is set, which means a recalc_rate will be issued.
- * If clk is NULL then returns 0.
+ * is set, which means a recalc_rate will be issued. Can be called regardless of
+ * the clock enabledness. If clk is NULL, or if an error occurred, then returns
+ * 0.
  */
 unsigned long clk_get_rate(struct clk *clk)
 {
-- 
2.36.1

