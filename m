Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67593CCA481
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 16:01:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232788AbiGOQBC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 12:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232754AbiGOQA7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 12:00:59 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884636F7CF
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 09:00:54 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id EEAF23200A14;
        Fri, 15 Jul 2022 12:00:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 15 Jul 2022 12:00:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657900852; x=1657987252; bh=yv
        9KGhC+qy1VsuXD+drVzU1oBKbOW0RK5GDUKIeq44I=; b=c5RYJ9gV/wXS6qEXMC
        KNWaqNpJ9RAXUvIyKEyyZm3uAqdHn32cN2G/pMiQ++vGyNviWJWGSIMIEXZ2Fi1E
        coo/MHzEbesySllMwsEE9q8+kChKClkoWLGp/k9Qt/WhmL2t7ZbKfQ8CEBECqbOP
        UFzq0JgVOekJO2if0oboCWmatnMxqRGxiZNTJu+Mm4YxWtTpoPVC6oeXIpgLkuzF
        E7JDMEsQQbXfV+0gf+mnEVd25PoSURKY0a4JZVSWxAkvbuYceVKDcz40YEns2vNx
        V1BLv9E6eQPD8qDzW0D7PYh0O8CmQWGvh6m3H20DpkCFaeUFSWjouNt0cTwSjIUc
        zC9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657900852; x=1657987252; bh=yv9KGhC+qy1Vs
        uXD+drVzU1oBKbOW0RK5GDUKIeq44I=; b=Tl4ZHZ2IXAM/5XSVMRY5i92ABwsza
        uYlFCZp0lWOKkTMwZaJwcD0WKH8zP8AAGVdolrv7fqIOjP+q1Z2xR/AQGsYMYWA6
        RTc/UZTi6txPCMnDy8OMgaDoMnWiaU8fXs6etI0a1jl7mOHz3kqAqnGLwJRniOF8
        l1SSBJOPJ2FgIZp4HIY9xyY4YrtHF0SRAeELsLKDw0c1ec6nhnHbY3dbIum6EgcT
        yk1nH6mdTobIT1+QeXkI88SoKwHYjslh0NkF7aLiN70fBAXkS0aOuslMdk/FWtf7
        QJGtchtDztcTrNZl1IwARrJBmbrRUXf67ytfU1L4yW0AEx4eTnC/hOEhg==
X-ME-Sender: <xms:M4_RYjbbuWYl42NCH65CjR-sOxrNPhZpOdzcgSssib3Dz8f369j3tw>
    <xme:M4_RYib20uneGcW7UBORze7YA5jCkSgUvx125EVuuluFxQrI941jC6D_AmgfJHdSD
    Li2u4T3Yr1DuHBGd2s>
X-ME-Received: <xmr:M4_RYl9KYe7mcSBNqSnHVCG-TVANOxeSXvFeWjH-hwIz4lXAcvBodLmZV5iQ9gEa-ztIeMn7YOSzmZjAQ0DglN2rJG572QopKpj9_Hs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:NI_RYppwtR6TeVHivbZatGYmsc13U01k28yZaYI3L-g6V2oLuU4KYg>
    <xmx:NI_RYuoRp6wiOyuTbI8LLvTclGLjOv0sakjA7BFOZ5y8UieH3RvVPw>
    <xmx:NI_RYvR42Y1UO9jHBUdzDzWqxedyijhZbRT40WPwKWRwWB3PV2MSyQ>
    <xmx:NI_RYrjy_ZIuVvRHP6JQIw250srVlAPnt8NExmImaWl0k6bQtMtY-A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 12:00:51 -0400 (EDT)
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
Subject: [PATCH v7 08/28] clk: Clarify clk_get_rate() expectations
Date:   Fri, 15 Jul 2022 17:59:54 +0200
Message-Id: <20220715160014.2623107-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715160014.2623107-1-maxime@cerno.tech>
References: <20220715160014.2623107-1-maxime@cerno.tech>
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
index 9d63163244d4..caa2eb640441 100644
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

