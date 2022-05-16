Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E76C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:25:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbiEPNZt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238419AbiEPNZr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:25:47 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3C7CBB
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:25:40 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 2E1A732009FD;
        Mon, 16 May 2022 09:25:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 16 May 2022 09:25:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707538; x=1652793938; bh=g4
        P5DobGsF8A4M+d4ZrXtJWtd8orIRbjRbWtjuqAtRo=; b=FlylexSi8FtbfVhsAi
        jEjJFOxnyADcbrm2eRIlPjCehr7n2jij2z7HXvRTefy4457Gsrrm1sYmbckOtzlh
        iWC7zLNlqob4YAXB6guNYbeAUSLuHsdLQ09rbjw4z4dg1g98dGVQlFBW+QLbCm9R
        Sf7fnn1fu7+1H0UUHAQGATufLRkJsuVT8T3T6OOvaG9dF5/WnZCMbx84+OW+PiwY
        F8u1/dQqJJ0d3ZFUZM8s7sEHGFv2l9GL2IMOMhamL9U+Todaq607JbteEmOGSjdM
        Sk1Yvau0gzbW/xu2JmJrkJVZ+nK6Lt/sOnRwTJDu9uihCbGRSIvLjyeE1Pnr3I9t
        DQRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707538; x=1652793938; bh=g4P5DobGsF8A4M+d4ZrXtJWtd8orIRbjRbW
        tjuqAtRo=; b=hHFsw3H8SqVWrGnUUL10ZenUBLeb91m6GHG2pbynKYcrGtzsu3K
        4j3wcJsKLFx8WL75tiFYi2OEPNCNTTj6drvSjsL1zasxBpEH+oC0Y80hRQ6WLOUR
        vGdZl0CfLz6iAvADlM/ZtyCZzm0yuYl7YNIsl7EFuuyHEwvpM6F2RNBIk6rSwaoc
        5Xl8baVm/x09G0sTT3hmeiZuQ/cIhigxrJdetfGSb5G66BCFcnDUCaZ7LG+BzxOk
        eWp2NcoTpegjN5fKfLAkz7BbnSiUmpveIG97r7qiRvoWRPJbBatBW4yNQjVD+hHl
        OQm6gm1xE0Ik2HSNClNnWt/poSA1qwnH1Wg==
X-ME-Sender: <xms:0lCCYk_K_tYfiEZLg7lphuBeKs87tJUtfiG-sY2018FgzF1pzHytiw>
    <xme:0lCCYss5Cb_C_uhvBXe73SfTofMOeF1f9WrePngSGXMyVRPoXpl7kb1rTPeLd0hbX
    uppCVMiTxTj_U4njyk>
X-ME-Received: <xmr:0lCCYqBVXunPfvFuDDkoogke0hkOqb2qvtQMrggmIYdN_oiW4djo8MSEp6OKUibrV7aYom_3kvKheUjwVWKKm-XMfNehV59qEj-KCZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0lCCYkehexJ2KWF0N75uZ4CRMngHle8k4h7cR3ktSM29hAoAxlCULw>
    <xmx:0lCCYpM5QW1wj49K_oit78mSTrQ_9xHb52suNROF4Ey00NaHbCMxJg>
    <xmx:0lCCYukx6izaGlRz7mgJr5yiXFG221A5IxD0q-r27w-vJBZBOGjf3A>
    <xmx:0lCCYqFWBQeY5FYnTZ3NqbODNo651qMkEydAG-5ryYapOD25x9wl5A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:25:38 -0400 (EDT)
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
Subject: [PATCH v5 02/28] clk: Skip clamping when rounding if there's no boundaries
Date:   Mon, 16 May 2022 15:25:01 +0200
Message-Id: <20220516132527.328190-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
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
index 2a32fa9f7618..d46c00bbedea 100644
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
2.36.1

