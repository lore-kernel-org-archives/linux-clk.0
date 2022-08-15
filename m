Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E517BC00140
	for <linux-clk@archiver.kernel.org>; Mon, 15 Aug 2022 15:42:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbiHOPm2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232598AbiHOPmH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 11:42:07 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14DF617074
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 08:42:07 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 8BE6F320095A;
        Mon, 15 Aug 2022 11:42:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 15 Aug 2022 11:42:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660578125; x=1660664525; bh=wk
        0Sqd9dl+QUsXUDPiBpUeqYKlJdHWrgnstCr5mfz3Q=; b=plt54hxdOKpDKRzAJm
        DXYTS3J5d7azsuAWX6CH5MnaEJK30k0XdSsdfkByQVvjnvicg9shpxSu9/8RQaYD
        NTqJKVi+JcN0+/5FYwyFDW/EepvNmZ+WLwtTk9rww55t/Z5yeJRvXCfzwJHOJ3V7
        OPGCodqwATSZ3zq2ZN/lFf2c/TJ0tvkNaZ4mS6kkvdOiivrK2S69AdKyOkyKRooQ
        1KyfnJU4pd03hcZMQvshivOiNSngzxrDVq/s3iVk+oHuzmQir/jHjixy9pX5kcr6
        A97TZjMSILU83EnLecPhN4gbwLSDFZ5coRDvpEyZ6noIBIYzMGExORR+rbGZU8l4
        xcdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660578125; x=1660664525; bh=wk0Sqd9dl+QUs
        XUDPiBpUeqYKlJdHWrgnstCr5mfz3Q=; b=GiW4jck2w8xjiiGNGjuxkU4zZ7Xaz
        tLzBevf+K2vI1yGCnN2A0fQm9mo08pwVTn7ZNYyUtpDREzt0d9QcXoSEHopXbPt8
        FQLEAOFUik6WGsChx2FQ7vtPaMDTl6eo+9Pn3N5+m72+WmHYAYv3vBrp2dZ77yec
        nZUJbV1LDRq/RYcB84sPDU1Yt5bZoJBKZeBlY3iE3JXpQmi5w3389fQfPYfTImYz
        8GUhIn8s+oj9HeBBUcS5lYlrhaKI+AXAnPlq/Rt4QpMiPfitIJ5q5uMBbWelooil
        BE5siLwPbq1jI08UVzhqpl3rfUR/AocTOwDpjK326PyNQsyz4ojk+/k+g==
X-ME-Sender: <xms:TGn6Ym4bVXAAUovW_uKZCzHdAgmjgGS0o1U5sg9cLYLbr5469dQvjQ>
    <xme:TGn6Yv6dP0CFMGb-oJazZ_ZohIPB2emXGGSu6IRw_BqmSzXUvFzqLfVIJyntujo6j
    wgD6I1Dn08hmbSB7Fo>
X-ME-Received: <xmr:TGn6YlfRkGS5JMfW9IFoUs0qIrzP1-gzUr26Ked1ncDXeqoqVL1vLHXOt8kD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:TGn6YjK41KDEHd6tZZ1u6HZs__Btb60wd9UTmZC18c-czvQYl-RXxQ>
    <xmx:TGn6YqIda_72rP8wRE4iIOKyPwD4WE516UGREn1_cQa_dlnxdGg4yw>
    <xmx:TGn6YkzGed4NpWpfh-jIosD9PciLztWZNK1tmtJV92NeZVFRUBmwUQ>
    <xmx:TWn6YnBcPC2aMnSl5hVUjthQaC8HyqsaBZOXtj4x_Sc5PqPC3nlRhw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:42:04 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v8 03/25] clk: Skip clamping when rounding if there's no boundaries
Date:   Mon, 15 Aug 2022 17:41:25 +0200
Message-Id: <20220815154147.1631441-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815154147.1631441-1-maxime@cerno.tech>
References: <20220815154147.1631441-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Commit 948fb0969eae ("clk: Always clamp the rounded rate") recently
started to clamp the request rate in the clk_rate_request passed as an
argument of clk_core_determine_round_nolock() with the min_rate and
max_rate fields of that same request.

While the clk_rate_requests created by the framework itself always have
those fields set, some drivers will create it themselves and don't
always fill min_rate and max_rate.

In such a case, we end up clamping the rate with a minimum and maximum
of 0, thus always rounding the rate to 0.

Let's skip the clamping if both min_rate and max_rate are set to 0 and
complain so that it gets fixed.

Fixes: 948fb0969eae ("clk: Always clamp the rounded rate")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index a5e0ab8bd6be..9d63163244d4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1341,7 +1341,19 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
 	if (!core)
 		return 0;
 
-	req->rate = clamp(req->rate, req->min_rate, req->max_rate);
+	/*
+	 * Some clock providers hand-craft their clk_rate_requests and
+	 * might not fill min_rate and max_rate.
+	 *
+	 * If it's the case, clamping the rate is equivalent to setting
+	 * the rate to 0 which is bad. Skip the clamping but complain so
+	 * that it gets fixed, hopefully.
+	 */
+	if (!req->min_rate && !req->max_rate)
+		pr_warn("%s: %s: clk_rate_request has initialized min or max rate.\n",
+			__func__, core->name);
+	else
+		req->rate = clamp(req->rate, req->min_rate, req->max_rate);
 
 	/*
 	 * At this point, core protection will be disabled
-- 
2.37.1

