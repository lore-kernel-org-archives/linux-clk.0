Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44660C43217
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 16:05:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356241AbiELQFP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 12:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356214AbiELQFL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 12:05:11 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F224462BC1
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 09:05:06 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 629185C01D7;
        Thu, 12 May 2022 12:05:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 12 May 2022 12:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652371506; x=1652457906; bh=HB
        GtpOtyfJD1V629op1Nqk5n94YAhqClHVk7ezAf8jg=; b=h289S9rcrFPJybOi6c
        1RAciJ3ASHQfjFVN/CUuRiT+/DneWUVzXM13aKQBfTqQSnkuSaGoxPL2ovo2M5zs
        S2k7wzGa5MxCnEGz7Uq5fZ91xLZr57eeSaNncWCBpDc2yewjIH8TgAizLQ3y+FSX
        SsrbNV7Cnx/sLOW7p0Rf6frVJMQSn/yW0XYx09GJC/HlMvTyenoeRFzM13XUYr4j
        1xTiVrwfbU1o1/j0hfboyMfeVkdzTy6fYh9eMe0NhYmP6NmoPTZlZy8OXRFpto/J
        WqYGOqGwTeerpMJ72XQDVM/nrhMkOnYGKz31bbgCT4GK3fMMBCxWWLPh3S0Sc6K4
        Onjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652371506; x=1652457906; bh=HBGtpOtyfJD1V629op1Nqk5n94YAhqClHVk
        7ezAf8jg=; b=iF1p82CddZ6J5Jbp/sTPDYId9TrDxyrTpP0Qm/6XKu2cJjljcvf
        /IR2oltJizioCb+EFExYxSbqX4YNyF+2gQLceojttHYkACod4dMLT9qbKRBLBN81
        zlp+SjEL5sxnTSZZ3Z28+wrNed7vDVJvn/1MMmGUGiXWSyODzEGJeeAEczn+KgNQ
        2tCP4HoUcoc6nRu/NLzfxCMq1Kdmuw/q89eyfYlwaYc7zq7nbOhrvRCLw+bLhO1A
        fLGcBUWc+Oy8tPbJd0B2Q7nbVr/BzLnjolJWfLmk0yWECo7QQzMBJhr4htdhOcoj
        B3Sghtb2vZlfo1Whi3HXOBM4ZiJxVyTdj8Q==
X-ME-Sender: <xms:MjB9Yo0PPsnbMTOgTLzaVc2D0yz1aR_HnRkWz4MYW4hIvfsaGOoYGg>
    <xme:MjB9YjFpV1VW-OUI5R7qU_KTNkatMUmUmeQNk-E709-F1BbZkWumi3PN7g5pCrJRk
    Jpptkn_hoG-993bHII>
X-ME-Received: <xmr:MjB9Yg4oRk0OZ-8KEzExCUNJBf7zW5HOgBOFzfp9SlO-sL9B860zOo5x5ZFPmngPYdXzHP_s8hsX4VKDHrOLGmEm1xV7TuEOVBDl3rU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:MjB9Yh0Op0QiwLLwY_jj5_vB64uor9dVc4-_L7Q7e61WTK1sAhTyPw>
    <xmx:MjB9YrHUzrZNO1Xk3tp6uIMST3Vv6DSeb8KXSUwFDPFin5R4dYuHsQ>
    <xmx:MjB9Yq8xOrt2AWTcqxgyP17t18K5ife5iLYMkrKMCLhIGmjjk_SqYA>
    <xmx:MjB9Yj_1x1jVWUfjvpvTmFthi667u2IgjWFMjlpbV5tI13aasMk4FA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 12:05:05 -0400 (EDT)
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
Subject: [PATCH v4 23/28] clk: Zero the clk_rate_request structure
Date:   Thu, 12 May 2022 18:04:07 +0200
Message-Id: <20220512160412.1317123-24-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512160412.1317123-1-maxime@cerno.tech>
References: <20220512160412.1317123-1-maxime@cerno.tech>
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
index df9fca8415a8..d953ca61ea38 100644
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
2.36.1

