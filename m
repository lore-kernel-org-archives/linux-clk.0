Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C56C25B0E
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:53:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235132AbiHPLxH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233982AbiHPLws (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:52:48 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF5280E8F
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:27:23 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id A1E603200920;
        Tue, 16 Aug 2022 07:27:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 16 Aug 2022 07:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660649236; x=1660735636; bh=tn
        utEfzzEHsrvY2TuHZH16/tz8uuG5eLfajoY+RPLmM=; b=SpLvwDhaotvEy4t2FY
        7jsgvSU7FEWnPbyBxXRy+HSB1DS6hq/NOFgjuRtb3aD0Z0ZlbZ6r5Azawq/7XJYz
        JBqaQlpk4q88mwWb0P1K/Qxj5zujtj9zU5WdKm1mPgF0xqP7R71i15qZ7k+edjGv
        JWSAFXIbk87twtjRj4fv0hpBXLdhKesLzQB8s/nF8mNjQ1QioSMnWRr2Azce6R0k
        eEszkUs/UzrjRJPfHI7wlp1CgvItkJHL3Wt+AHPBIvvdbXoELirLx8ajQAs/NXJz
        aHlaFYtEoLAQK+td3Liro476EaLs3mbyV7ub4ERshFhTViSyO7zPpMzMQ8Cg2872
        HrHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649236; x=1660735636; bh=tnutEfzzEHsrv
        Y2TuHZH16/tz8uuG5eLfajoY+RPLmM=; b=pxe8o0C5dXVhbXB7JppugW4/AO/zG
        ZS0gHoD0bJT0WZrjtOCP79kgjYxiMzvtqJNP4dlJ1PoDmM3c37bTn6SzQFbVdSso
        Ys1u2mOG4w2Dm+Ab8eC170yc+h2T34Nscl889XIzdWZs2hP+ToP3fcIevgpLJVPS
        RK/4CLviXdWFQll2yBwQUaMoox+ts0ru8usIuMLX983xGIqRwhfyf7PkqpQGbrX1
        WhjmKjUvoqnxHbt8Wxz+QYfp1nEfs/B5cW+KD3TGqSI33n423xZixsff8aoE3iVV
        IfD2LLy4ZU7T0zHsDVJl4hUROO93+kW3eDy7PQstN9s08T3iQoPBf4TsA==
X-ME-Sender: <xms:E3_7YiaY91hdZad_rySGA66xc3cuMTpGKzrk1caDxmtMtGL_fJy1Vw>
    <xme:E3_7YlYIHNOtXB8TWTjoEzQp7RAjNMa8mgHckgbaoRs3rdIaZ7GKVxAP_vexwc1V6
    BO-XTZKfGaGXbidJew>
X-ME-Received: <xmr:E3_7Ys8oFU3OYdXhzDYekVma0C8-GQi0mhZGuYcvGL8yoWBdskInLcGEo54>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:FH_7YkrGYzpcKo-7V5rc74qk4ZoD9YAOZiUphfiBSf4Tvw0-jPU-kg>
    <xmx:FH_7YtqtHbVg8tbO5IpcC8QeWqrYHvGmPki0ccBGAA3k8oHRNgrVQQ>
    <xmx:FH_7YiR-s5nqe_ZFt1ansnflTmcQot2c8wCdjjgNxq5332wHWj6Q6g>
    <xmx:FH_7YqhqE08XIrsUqzw9Jt142yKMsmmE-NjbkuENhi3AxgQm2wgWmg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:27:15 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v9 22/25] clk: Zero the clk_rate_request structure
Date:   Tue, 16 Aug 2022 13:25:27 +0200
Message-Id: <20220816112530.1837489-23-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
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
index a99451628f13..fc145ea40f4e 100644
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

