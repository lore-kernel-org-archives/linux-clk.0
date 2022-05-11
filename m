Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF69C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:43:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244934AbiEKOn3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:43:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232218AbiEKOn1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:43:27 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18779980BF
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:43:27 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 4360D3200993;
        Wed, 11 May 2022 10:43:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 11 May 2022 10:43:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652280204; x=1652366604; bh=oE
        f8FfAdZoUiidhzeTrstrBgTDnXc/Y0GGXvEBeWstI=; b=x/HbYqYIFRk9omUKa2
        koWvb/8HV118NaBesr9OZbd4zWUfX6eP5uCdll7Ip4XL1Tm750NFSttaIh0j8W/m
        OzTk6HuqooHv3nvpH/+4iKmaA3Ax6T6j5tOTu8cJAjp+8zNi1HEiIipfZU5OwTqO
        OUSvZSkhyXC6v3hv1KMqGKus6yezZnj++oY4kvgc3tB8raoBLVsSPXy+imKISlCS
        onvJKgkB4cZ08Tyd5YldcaKleL5pWd5tbxQ6yTogwn2rs0eP2XDvyP7vsLzbrbAC
        l8v6Uu1gGJ5teTnusfhrCsz4B5o22B+IC50vgX1cgUK7+HaWD56p113CItYoUXsC
        hSkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652280204; x=1652366604; bh=oEf8FfAdZoUiidhzeTrstrBgTDnXc/Y0GGX
        vEBeWstI=; b=yhT3itKo/02Obgp4Q0o4/ZPFXBmJWjXC+dTrSUFGAa0Nb2EdJUq
        tAa9h8qOHyZGuisUtnjmXkrjQDUIhLxxFLWt2PGMMV9jGFfmYl1F7Z6Hj8sq5AlW
        MJ+KzNtoQgs4nt85fPrNxZrxm6R0sRap2LMc0H8YWzbc4ynPHtuO/GYujsylN/9K
        SOpO03yRwYajnJdAIJplv1aP/1hD/UWIByqR+vrCu4OI1jIXUdoqkHjYwxXsB/jM
        vYy2OvaO5SbiAoCAjtnpdp+M8y2TX/vGX+MM7OR9pvph4vYGtbuAlc6IicJ5eZOp
        HO2G+GGHyBKsCLUhG115euHWDROJjb02Lug==
X-ME-Sender: <xms:jMt7YgHj_Jztce-QGL3ZjGduRrSiZDIH3knhGvrh2SEGpcOpaOstHw>
    <xme:jMt7YpWpgXb3-uc0VbvVvzM2obZOA2vNdeDjkToczvoRetxCsjQtTJfIZvLOOOVZM
    Ju5Mcyen6OEavUKO50>
X-ME-Received: <xmr:jMt7YqJqTXagNwjAAtok-99pQDsd_oGWg7lzFB7sjlaaUOxmyG_avHiSzBZKt4ZN312Hv6qXt1VJ0B1LGuYFpw0QunoDTZ3GMNrKW5c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepheelteefjeetiedvteevgedtteegffffvdekueehjeeuvdejfedvkefflefg
    feeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jMt7YiFf__oFnIKU5AmFq5rH0HrtDsOPnkZwCU_Tfu4GoNgLZMKkkQ>
    <xmx:jMt7YmXr4tr9jHmNJONItLnH8mkDmXiijkgxmrcd4n1g8cmrcI_mbQ>
    <xmx:jMt7YlOUHSo8enJGsJKs9SiS8Mrk344f-XMYu737rIbAzQyASr0p3Q>
    <xmx:jMt7YvMgn3MVsc2OQqZB-qb7g8mZlxQ8HWV_upArB5rbdgIVWBLFSw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:43:24 -0400 (EDT)
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
Subject: [PATCH v3 08/28] clk: tests: Add reference to the orphan mux bug report
Date:   Wed, 11 May 2022 16:42:29 +0200
Message-Id: <20220511144249.354775-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511144249.354775-1-maxime@cerno.tech>
References: <20220511144249.354775-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some more context might be useful for unit-tests covering a previously
reported bug, so let's add a link to the discussion for that bug.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 64ae7e210e78..be23c19813d0 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -314,6 +314,9 @@ static void clk_orphan_transparent_single_parent_mux_test_exit(struct kunit *tes
 /*
  * Test that a mux-only clock, with an initial rate within a range,
  * will still have the same rate after the range has been enforced.
+ *
+ * See:
+ * https://lore.kernel.org/linux-clk/7720158d-10a7-a17b-73a4-a8615c9c6d5c@collabora.com/
  */
 static void clk_test_orphan_transparent_parent_mux_set_range(struct kunit *test)
 {
-- 
2.36.1

