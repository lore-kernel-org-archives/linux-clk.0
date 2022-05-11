Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CCB7C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:44:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243335AbiEKOoj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243123AbiEKOoh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:44:37 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C910C9EED
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:44:37 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 3B27132009D9;
        Wed, 11 May 2022 10:44:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 11 May 2022 10:44:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652280274; x=1652366674; bh=Ed
        i9afV7xDVrYtJ2z1yf1EPj+UrrlUjmoXO0tDLI51Q=; b=KNR9HZF9qtG4BTaDLI
        IO9VHI4ZRlbuDjLQZHA+zSpjYe3UehVPlqmAdL1BZM2Lht936fp2cXSCrSOcJBZW
        VlNhjZUneijJg/tVtxnZvc6edG48IjrvnfrnXt353HAnUHQ3YSzpJSm4FsMBH9e2
        Pr4BuK7UMPOzCM3nY3uJUyM/JUOSM+B2UNZKhOH4rlOMP3oCdGH1j0V6dGFifeLb
        xri+oi9yyxoH2MVPCHLdEMXKv5oi+PL8VJp9rBu8BLQbsRM8YEoD6N1YG7ddJIH/
        q4GuyRxq8MhvygSm+NPyNKpmgpGki62VmY4YurxsqsURFmxqsEVXKNjBxZo14UZz
        xHpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652280274; x=1652366674; bh=Edi9afV7xDVrYtJ2z1yf1EPj+UrrlUjmoXO
        0tDLI51Q=; b=V67SoJE3/zxzqMoJdHq/aohkKzD0+Nk5m4rlZnY2MsWAuCPBZ8u
        GG+DP+UShfIv8LzfsfyLssb0WAAFApTgL0tRyx3/Yvs6QKUo/vIwCy4vsb6oXHRZ
        Ls9tFZNwEmvzyChuxar9ivzGZEMbV6Xh/JRr8horKvEegXMGlSAHU1zgskvZ9K7I
        JybHLMHgRGnn0ssUvcIIrwKiz9RQCRzC0VkXBAe83eX8WYyJ7zt6938S7Q4ENpT3
        dd+bqwtLrsmQVKGPitJN/9nZHKI/w9A3MqcwKgX1uyoVEd4lBoxAg2uPJvcvRoKm
        CXzCFz5M6bZmXy8iSiUzXyXh2DmgcX/q/dw==
X-ME-Sender: <xms:0st7YnpYQOqUIrdgRz04_iRowjnBOYQnbagkGyFWzbHResm_-JLdDQ>
    <xme:0st7YhpkUTGcCcj7oVtZ1rLtpdfoozSFGyvLAKYHrM5uek-grSIxvWO3q1Gf1p5b6
    ffUxqsaQMi4BUHEfvg>
X-ME-Received: <xmr:0st7YkNT7-qZkAQMbPJ7kyG7wNajX9rGyyhFyW6rf_rtIFxnKNgmfVU_hRR4iNM7QgVbTFt4EbVzTL7gd6n9X1GWuxuJZrDctpallcc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0st7Yq4RXC1Yst3YotLWtVgWBy7gu4iwRINgq-EfXwDBUfJi3NMUog>
    <xmx:0st7Ym6fwXQae5OQikjaOLyx8_xPk16YirN3KmtbkpFozkYx8rX10Q>
    <xmx:0st7YihS_IlJ0bjBJ3Ey3dAwB2Dd1SCtcxoisfWSxBrxWJV-J-dEYg>
    <xmx:0st7YjzppjY66OvmXGfTFucyhNo0TKKSRoueF8NDn9ccaP4TTizLPA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:44:34 -0400 (EDT)
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
Subject: [PATCH v3 26/28] clk: qcom: clk-rcg2: Take clock boundaries into consideration for gfx3d
Date:   Wed, 11 May 2022 16:42:47 +0200
Message-Id: <20220511144249.354775-27-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511144249.354775-1-maxime@cerno.tech>
References: <20220511144249.354775-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The gfx3d clock is hand-crafting its own clk_rate_request in
clk_gfx3d_determine_rate to pass to the parent of that clock.

However, since the clk_rate_request is zero'd at creation, it will have
a max_rate of 0 which will break any code depending on the clock
boundaries.

That includes the recent commit 948fb0969eae ("clk: Always clamp the
rounded rate") which will clamp the rate given to clk_round_rate() to
the current clock boundaries.

For the gfx3d clock, it means that since both the min_rate and max_rate
fields are set at zero, clk_round_rate() now always return 0.

Let's initialize the min_rate and max_rate fields properly for that
clock.

Fixes: 948fb0969eae ("clk: Always clamp the rounded rate")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/qcom/clk-rcg2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index e9c357309fd9..523f9830321e 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -868,6 +868,15 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
 		req->best_parent_hw = p2;
 	}
 
+	clk_hw_get_rate_range(req->best_parent_hw,
+			      &parent_req.min_rate, &parent_req.max_rate);
+
+	if (req->min_rate > parent_req.min_rate)
+		parent_req.min_rate = req->min_rate;
+
+	if (req->max_rate < parent_req.max_rate)
+		parent_req.max_rate = req->max_rate;
+
 	ret = __clk_determine_rate(req->best_parent_hw, &parent_req);
 	if (ret)
 		return ret;
-- 
2.36.1

