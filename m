Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2FB7C433F5
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 09:14:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233701AbiDHJQj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233178AbiDHJOh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 05:14:37 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBCA3104A77
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 02:11:20 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 4BEE75C013A;
        Fri,  8 Apr 2022 05:11:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 08 Apr 2022 05:11:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=Rz09iudX4yafJU7T2vgUvqDSNPVZaM
        iyqKTWmIomZ2o=; b=K/VRMknEbZG2rVK1ZxSYSiDidmLZAq7p6lqNJRraKc5lGa
        Drz4HcUAMP/kuRw9D35qE58P6ruzXNmJeZMeGLfhtuJ+fYFY1xqDUiVcQ0WD1Sdu
        xkNzXGDXk0GBFPX6l4ZLHpbredClisTxbjW5FlOJUCV9ifnm/mGpeX1LgrMuXxZD
        KYQG57gKpb2DAG0+lQF5sU0XcztvnFIKxQCo4KD+ccdFLAdc1s9prVJ5IEnxQlIv
        FnzcFZmXx2Pv3w/nidI2ikhM9/RdvOPJAODh1pwzrqnHvyYvePcFcITyXNgLIkQU
        m5SB2tEhSRmxXIMcNuIUfLJ6SnVcpVrKzOYvzN9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Rz09iu
        dX4yafJU7T2vgUvqDSNPVZaMiyqKTWmIomZ2o=; b=eZkjo6c99H3OdMKs9gRDJa
        mgy3ds+cP4vPLd+iu/skKPEsjHkpz7BaX0th8WykDHDKyBiEcg68S1AqSDrExjTp
        E56yQfb/yjucwOuYxPLBoYFMD0WCx5WGVtZnp+wtLgtHD+Igb3vcHxK7yyiUa8B/
        HEp5DtiQktbXc5cKYqpIB6qekHbsg3/bRX7tnKrkBd8xKLqW1IBioSjMnYF2wfiM
        bBO8C9aqhwvBr5bPvx8EKgEjNhdyDeCyGm0WMUjh2nBLPTNmWDOxpYpfC/NKr/fc
        zRD2oCg35I47m2Zj4wh8cv2opg7Tuj5Pm3teCcdNOnSL5/chNwxegwWCflhDCVHw
        ==
X-ME-Sender: <xms:OPxPYroPHl14hbw9gL8WyEhcWiiRAuSI79MlYhbjdo_OO2qmafWIsw>
    <xme:OPxPYlrqW7t0ty5iUbz71A5xhPDqfk_R9z4gzekO59xQiIHe6n-kgB9qKUsksTBjr
    aht4SYKZ6WVaWbPrpc>
X-ME-Received: <xmr:OPxPYoP8B2k6CKnxyRzSm1iODVrj8Wil1GXYcu8--RTUlQU4eCKonmIoZBcoqKqbtSsLMB8AH8flfuVvh63UIliU9ZNB5C7_5N3jO5E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:OPxPYu6h64yAQiaHup6unR0DvrzY4I_AfFvJG-Zub5swjeECShcZlw>
    <xmx:OPxPYq6Ke5svqyxYaysATRe5_J_X1DyuXhaP4OZbU-Y58b8Ux6fIvQ>
    <xmx:OPxPYmj8gG-IOVt9koi3SH2D6Uhd5sgGvffc1wxfJp30ndjfgBwWfA>
    <xmx:OPxPYjEaBVzbpIaxYA6XANv6BlWCjWoMjJFmu9Nu2hOAdP2JS8wVGA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 05:11:19 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 20/22] clk: Zero the clk_rate_request structure
Date:   Fri,  8 Apr 2022 11:10:35 +0200
Message-Id: <20220408091037.2041955-21-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408091037.2041955-1-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In order to make sure we don't carry anything over from an already
existing clk_rate_request pointer we would pass to
clk_core_init_rate_req(), let's zero the entire structure before
initializing it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 53f5f7434be0..3fbd55119215 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1440,6 +1440,8 @@ static void clk_core_init_rate_req(struct clk_core * const core,
 	if (WARN_ON(!core || !req))
 		return;
 
+	memset(req, 0, sizeof(*req));
+
 	req->rate = rate;
 	clk_core_get_boundaries(core, &req->min_rate, &req->max_rate);
 
-- 
2.35.1

