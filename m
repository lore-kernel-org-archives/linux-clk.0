Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34DEC28B2B
	for <linux-clk@archiver.kernel.org>; Mon, 15 Aug 2022 15:44:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232097AbiHOPno (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:43:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbiHOPnc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 11:43:32 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C02676563
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 08:43:31 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id F00D63200977;
        Mon, 15 Aug 2022 11:43:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 15 Aug 2022 11:43:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660578209; x=1660664609; bh=Io
        AhjrEVbopScwHZMtud7cnSgwfj52TMNhOJQeF/YFw=; b=trEgTT6krGhEQEo8Zb
        rsfRQr8NfOl0IZEiapA6OeEKJrXzR++bGBJqv9+XTaDapx/v4Tfm7ULUZvCxUJfr
        fRRHhiV9iDYMJucfadhQh9gYRsmQpBjByxOqsGFVf9qJDzGpVZ/hHQwv3XKKjSyi
        5NeAaTYG7KXPgauBF6Q2PhDArKEsz32prfbPBtADNMbZFl5we9b4URy4jpMrC9f1
        4qzuF8herjuaBDItQy/yZY8nMak4xUm8oYdVPEiTadEjf823Oi34crT805znEaVL
        LzEX4iXYnBSuKE10gqG7EGl3SxMciSVV60uDdmUfjKNsJvkAVdhsNtzDIoOYaoc9
        iS2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660578209; x=1660664609; bh=IoAhjrEVbopSc
        wHZMtud7cnSgwfj52TMNhOJQeF/YFw=; b=H8H0+XWfFmN06g8wJ/86wST1sBoIA
        SprrIAcOBynj9MCGsd8XmEMl+fTmRG80PM5vZHXk39oIP8POVHi1YgFw59cK2MTZ
        ic2J6xDHkDoN4D/5PQVyrZRnJVtolpk8TwbBywJW7Ec3J4cFSu2MT4RRFwO4kXkm
        F3dJIS59GUq3YHNlMQORhQqOHhtEJg4ExdtQ3upV4WMd/rLKEi0+7fi1JNmO90Bt
        d3VBJDeYImahWsc9yAyccFyOQXZCNscktGFa+F8hPHAmCuA4mLglbM4PaWt0JH3s
        H8PrGh/ylmjnNzUtVtjKiBFMIWfLfvdI9yEsVlm5xC8dHaUnt6+32cn5w==
X-ME-Sender: <xms:oWn6YvrL6xw7nVl5-Jawf5B047AUNahpunK_-SaD5D7jBrJpOIRCvw>
    <xme:oWn6YpqRFkgmUUnTUsNkSMtZP2upyE7_mDVDBb-y-iCbtUV3_X_rI3bIMCQPmnMJM
    9qqeCk4wcCt6ml2nVU>
X-ME-Received: <xmr:oWn6YsOyxLXRXq1gTkT0RXJfcWEiNVPYji8kx5hLiQZiL9Z38opzrxCc7ZZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oWn6Yi67AkghG8_8nqdEYxgew9QLN8vwanuwPuWe1Vvo_bpkSl3e6Q>
    <xmx:oWn6Yu7KAMzi1SCG-TtYKJkr9IMQGBLtSfk7NoXFKoxOkTW5Y5ae2Q>
    <xmx:oWn6YqjX9ooEzqpUIwVkFG_ck7ajCfnFEviQhSmNSPNHG5wWkqCClA>
    <xmx:oWn6Yrz0B5KkMfCi2s5zJA8ieoi8HCBH2krHJPk73rH85kG9Su0rrA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:43:28 -0400 (EDT)
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
Subject: [PATCH v8 22/25] clk: Zero the clk_rate_request structure
Date:   Mon, 15 Aug 2022 17:41:44 +0200
Message-Id: <20220815154147.1631441-23-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815154147.1631441-1-maxime@cerno.tech>
References: <20220815154147.1631441-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In order to make sure we don't carry anything over from an already
existing clk_rate_request pointer we would pass to
clk_core_init_rate_req(), let's zero the entire structure before
initializing it.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 75865f07b5e5..77601f435f12 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1446,6 +1446,8 @@ static void clk_core_init_rate_req(struct clk_core * const core,
 	if (WARN_ON(!core || !req))
 		return;
 
+	memset(req, 0, sizeof(*req));
+
 	req->rate = rate;
 	clk_core_get_boundaries(core, &req->min_rate, &req->max_rate);
 
-- 
2.37.1

