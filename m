Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7160C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:44:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234912AbiEKOof (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244992AbiEKOoa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:44:30 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AE86E7333
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:44:29 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id B90C1320076F;
        Wed, 11 May 2022 10:44:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 11 May 2022 10:44:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652280267; x=1652366667; bh=rf
        ukhoZHun31wJEpbj9gDRQqBhpB+SJZntdy9heQ0MM=; b=LkcvBVaGBFODwTseKQ
        ImGorx2afSpHhwdxoovn9WfdcCzWD9OeX1wWBTFG8+jT0YNCQafugkwy0ZGG3C8H
        7LsxV/q02zjL9iTHfSJ3oNdPW0JCWR/7vO7xU+3YKvyaTot6DS7lIXzo/KIUvBWt
        +/G0CHIG8idKphMU2ngxvcAdx4svUBc3qolw/TVRlU7xKboNgL7BfLz/UHdiE0o3
        ByTmdd4MzMy6QKS5Q7RSPcNCUrAnuH0cuUGIq+qTGAWJ43TKpux1xwHKLBj4VJ0S
        68dasTxx9uU3CNfIo5BpdgLe5vOhwASfoM8+rGtkS7tLw7cjCeHPzdA15bIUdk/v
        0maA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652280267; x=1652366667; bh=rfukhoZHun31wJEpbj9gDRQqBhpB+SJZntd
        y9heQ0MM=; b=PY5Z/H31ErxSzJMg1WMaNTa5MH4Up/14Qace+xx6L9nBh3T8LZ6
        U/sgIx4pDo9GuNLl3NmSt0hnahktJVzjoDAngplnuQELH4yJ388gvHw593MBBPfo
        aO7oB0K239+/GYKrhMxM57emCX0Tyi0aa6LjG7YuYdboqmGii58bU6Ms8DZCkAMs
        M8Nlc+9QJWBM9zmNFzN1jIcvLxWzhEVfj8WEFNHuvHLDuKlhdmCmlGbv4jbm0/OL
        Wak3+2Fh/PtX42bhqCuDjtbjkTqNt0WZxEZkUyPew1dYKfjLCo5b4P58MH/DbaAx
        2QLGZQ7URMQ793AmdUsO5VICIh1kumzGjGA==
X-ME-Sender: <xms:y8t7YgTn1DrxNDT-HT7A6RRe7NTnZHIM2JAVKFJzIFG7O0s-tca5Fw>
    <xme:y8t7YtwQ2gvJx26Dm0SJQAMZbHISfZ1s_08yc6xbbPwRiX1z34UtmynNo2y-nonGL
    n2eXG3tzb6LH4o3vxQ>
X-ME-Received: <xmr:y8t7Yt0tL0HOnFwoJCMnyRsegaqc8fzXSO_xuNrfvFSnLXCg682vrJQSGCxLHW__mRuLGNwD8ckWKyLL763f-wvcjcCsm1zgIg6KXqo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:y8t7YkCB6lZMz4Zs0KTgVxBTCZsO076cWwSpFLolYgqXF1MlNSYvhQ>
    <xmx:y8t7YphMPJUjuojRH8_ayzMH7Z9ci75J9ALpHXNR302CJ93FeR_kAQ>
    <xmx:y8t7YgrJg6Tohbkqfg95Bp6S1LagQS6VYR6TvJbhHiBvZo8IOeI6VQ>
    <xmx:y8t7YuY0L6KPQ2qj_2KG1UbKXl20Sw_PTxPbxWUC_b-02zs1VZgwhg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:44:26 -0400 (EDT)
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
Subject: [PATCH v3 24/28] clk: Test the clock pointer in clk_hw_get_name()
Date:   Wed, 11 May 2022 16:42:45 +0200
Message-Id: <20220511144249.354775-25-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511144249.354775-1-maxime@cerno.tech>
References: <20220511144249.354775-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Unlike __clk_get_name(), clk_hw_get_name() doesn't test wether passed
clk_hw pointer is NULL or not and dereferences it directly. This can
then lead to NULL pointer dereference.

Let's make sure the pointer isn't NULL before dereferencing it.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d8441e7221be..597977c883ef 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -262,7 +262,7 @@ EXPORT_SYMBOL_GPL(__clk_get_name);
 
 const char *clk_hw_get_name(const struct clk_hw *hw)
 {
-	return hw->core->name;
+	return !hw ? NULL : hw->core->name;
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_name);
 
-- 
2.36.1

