Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A236C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 16:04:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351299AbiELQEn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 12:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356238AbiELQEd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 12:04:33 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66CAB266C88
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 09:04:32 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id CC5B45C0233;
        Thu, 12 May 2022 12:04:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 12 May 2022 12:04:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652371471; x=1652457871; bh=+C
        /8GQFuo8NKij8Lyze69bvaX5PuqgSGVWjUhaseyHk=; b=D7IRNGlcws+yy3WKx/
        PB1QUj4tOE2CS6RRFYCcuIKM9EPWESN1vzEh1oiIWS7FesE+A445pjHxmkQ4qBvI
        +I+fPSlqWkbZQsOgAxOZZmmBv7YtfYkFRTe/85Uj2yvJCtnFpQjxL4aSPPxOB/sq
        6/AJHvL0Yf8kHNlZSv3yLfZIVh+PeQri+MQ+n2tI9y8vgKdISNr5Ae8lAKKCy1MM
        qDZxRJoGEgzBJDIni+X65io6HwlpZr1C6c+Ct0b2/j2qkaJbT0lC2BLhxWvC7BWh
        Pot5as+biC5cDOf/L3HzU3OjB06UNetJKnm0ROHzXZnmMX3cnfsMnwiY1DxIc9Ae
        xWUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652371471; x=1652457871; bh=+C/8GQFuo8NKij8Lyze69bvaX5PuqgSGVWj
        UhaseyHk=; b=J9rKThcm0xr30oRqcE1mhwfmaLMOXlcApgzXtNafZ6puU0hbM55
        dpKOUV5SDJugrdz7uKNV4zrROypv9GYyYjzz4lHPIylNG2KiQk8lsUvXywx03U6C
        MEifQdzkzIArY7YwXDiW3WdLggoMAVRKouyuQSFtkhINExbDENgU6kBKvC/UsK50
        hXQd6X4SW7t+RA90gcpMKWFTmwRSmgGSxVCtOl6oK5elC5Z5btUnLWlLl8SjmCFJ
        n/kmkDL8k80ZO3qyLT5Hvhf/wdEp6jfJ0kklU2DcAgV/fBNQtvjDDyWw031mbL0J
        /ETSto4IQpTfqo6F2fXj9qvQ57Zdv3t5U/g==
X-ME-Sender: <xms:DjB9YnmfUjtzLDALTNiDC-np3VXGrUrr7mMMUE4IIBezB15j4K0YZA>
    <xme:DjB9Yq249rZRvvAG2xdMdlVL60sV1NtcXl8ixTW62O3TKbQ1RVuNwiumcuYm8cI0O
    HRDsaNr1qcq5eEjjmk>
X-ME-Received: <xmr:DjB9Ytpn1M3R18RiidnQh0JkRWO9y7uENq4STZvSQPCv6fuKioYJCxrLrjkIoDrmKzkV6MvK0vzy-Wi_2KB5MaFgNvj0E4KuuxFo2Qg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:DjB9Yvl_mYY2FeFR96OKmONrYtx40xSyXvb6chiI01vGu2SIfgq97w>
    <xmx:DjB9Yl33JFwruRC_qGkZOwXPTGeBjIru5beKLazaJCZu9trpfbfe8g>
    <xmx:DjB9Yut8naIe7aUWL-PSTXON1W9IfQjPYcPLNklieSwix-5zy8ea2w>
    <xmx:DzB9Yusa3DUwTmBSslaeU8pujoLuTu_nWxpDSLRIYrjDvABYMc2B3w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 12:04:30 -0400 (EDT)
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
Subject: [PATCH v4 06/28] clk: Clarify clk_get_rate() expectations
Date:   Thu, 12 May 2022 18:03:50 +0200
Message-Id: <20220512160412.1317123-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512160412.1317123-1-maxime@cerno.tech>
References: <20220512160412.1317123-1-maxime@cerno.tech>
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
index c9d7016550a2..95be72f9373e 100644
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

