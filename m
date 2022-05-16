Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C03C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:26:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243779AbiEPN0Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243646AbiEPNZ4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:25:56 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1E482B6
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:25:55 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id DF06232008FB;
        Mon, 16 May 2022 09:25:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 16 May 2022 09:25:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707553; x=1652793953; bh=+C
        /8GQFuo8NKij8Lyze69bvaX5PuqgSGVWjUhaseyHk=; b=p8ZVO+0cXcTOs5Mry7
        31w8X2BLU47na16gxjvoVpoF9dAyfxIHTCJnyCDBf8Nu1vGNAhMwr+Y5dNalt0Om
        7gjp5wkwsFPUdtmmpHzMcyDIGj603bh0tJ+qnjRYoO50HZGB4ZOkU0QcxWmw/wBK
        xOWGpyO4IpW3uuK9U7TM7bjf7kTyCI3HujwtLnOyPZi2rwcod3uVfsDH6xmye232
        YvbvryVHDGZpCgcDRtfJ17Y8eRELI9BDNMpERbEtdhqeZaDsKJNElOWcFyzP/Qku
        734+16w6WbVQPUX5ADrnb8Ft51IStBxin9/HImafB/dg9lH/BQnOtD9FftLhZIWc
        wCXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707553; x=1652793953; bh=+C/8GQFuo8NKij8Lyze69bvaX5PuqgSGVWj
        UhaseyHk=; b=V4zDVkdec5ZJ4AcIZRHezWSlqZb3VYMeOPfhflicqEQhBK28K04
        0hAAF5UKQCCJYuBLv9xsvRewGgqqy4E2eEikCfLpozwT4ut+3B2iYaH2h+W3CwUz
        w4YvvhEO9XWDkR7v4yDdWSBtuw31ETXW3ux2N21Ro9dXEo8lJvn8inHl52JpTVVY
        VBE73siAUvM/GhW6Y/6FXreF8RiMcjoSGo88Asfb19dc5um7pKwcI2LqnebJ73p8
        hK9GqHY3Mf+Yyf8fP49isziFgQhl3yT0WgVRew9NuZEPJVkeh16Vet4o/pWJy43B
        JduOKu3H0XT8mGgdbGybGRJKUzi9xLz8WPA==
X-ME-Sender: <xms:4VCCYgTkY6xqXgtGItV07cYatzmSy5C_WfcnUsifqly06PRqlpOGtg>
    <xme:4VCCYtzJCRkUD7fDqdzKswuo23QrxP8EHXXOM6oUXcOUd7kJrqHS42QIknogvSEAU
    et4wbKBrjt0xEraBvg>
X-ME-Received: <xmr:4VCCYt3ytkqk3fglQpz10PN2yKLj7F32K052FpneU8kRR1Hm4VBqkxC8le_WMEb9gKSsBskLpSqhiwg2YdRgHau8jlk43EEyeYxBH1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:4VCCYkBit_xaWNrZBxkzIFZm1RQS7cFLiGhneSp63aOsXNP94wlVSg>
    <xmx:4VCCYpgZnquYEn--9Sc3RyiUUH1hUakPYxJSIdjsIDMs51oa2KA0RQ>
    <xmx:4VCCYgoSVgY8X7YyPzmu9TnOm4dx5qU5kdgJwsr-GRUYDE-8HuW2Yw>
    <xmx:4VCCYuZBnvim83WBSnXJlQsayQFchQFg6oTghwxP4Wa5gPH1Q8TxIA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:25:52 -0400 (EDT)
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
Subject: [PATCH v5 06/28] clk: Clarify clk_get_rate() expectations
Date:   Mon, 16 May 2022 15:25:05 +0200
Message-Id: <20220516132527.328190-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
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

