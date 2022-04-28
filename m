Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC519C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 16:44:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350301AbiD1Qrt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350307AbiD1Qrr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 12:47:47 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF9EAB246E
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 09:44:31 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 406C75C015B;
        Thu, 28 Apr 2022 12:44:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 28 Apr 2022 12:44:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1651164271; x=1651250671; bh=Sw
        l3hf9nneHqV+ELItwRclYiKQX0Wpv5trqPGrhqa5U=; b=jzG8p4vTr9D2NJicjU
        5uNJfPTAu1JgcOEgDfQR1+g4hS/auTEKMYBrceti6tWNqnJbUWy5UfTJW80+Ibgs
        9JCpBorgDRV9RoXlHUIbFWQtQ9ob/1S3WATYDA0Tqsh8jx+pYLESLAJpC9SIKNeI
        g2ML6EBHUX1cOX+ykbHLRKTF8K4CGpATPOEVbk5d9O9I0UnxTCY2TTqIGGbdF05E
        ddIxjNet6kqqIhOSpR0jPVYncqXeSz63Diy43g5qfl87nRaRBpc9IgI4Ek32phFO
        2S+DgBMj5PNKYVtF2m9lyohcWNB42filDcVOa71z59X6lrI2jjw7DgbP3td57TuG
        M3/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1651164271; x=1651250671; bh=Swl3hf9nneHqV+ELItwRclYiKQX0Wpv5trq
        PGrhqa5U=; b=WhmPwsBFaJo9pOXJx9YcWGUsEmp3sFOWukD66DmuAV2X66RNQa0
        HckJ3K6T728Ngter2y8HvFH5iLN5sMV/+Gda2QKJwnNbDzbevMCr9LPcTAAiTfNf
        zcUcWQJYp4QblCP+IDzZIgpoGjvgnrc8o+IE2XD/3EDlTCby8I4UPm5PXqkX56l7
        REqt/IBt7gJcWhg6oXqPQGwJaNasmu/rmzZixkJqPXH/OZgh8GP4DrYGw6DN0ENL
        lRhgjAiUQtVnImW2XGVnyA95rSZ7LypQtWPKNaepRLCnHsdCqQXbh4mpEYepf6o4
        d0J4GoDCO2zqHpC9gPp9D+N4OBin7MD60Hg==
X-ME-Sender: <xms:b8RqYstJA_Wbghs06YqoBlPzjR4rZpZySy-hpurPSZH0Kk-ZYwuiow>
    <xme:b8RqYpfpzJ8oQ4Etdp8LDSoNveHHPFzlfv9aUuIAR87wbJE-yzy-efPTViQsQE-3_
    lDj97WbqEwOFW8QUnk>
X-ME-Received: <xmr:b8RqYnx3sWQGM1EDFGNniLnl1pK7ejIIeyN6G3pwPqwdZntH2LXcS0K1v8W85qsYC_POD9MLQ3abXCH0HPp2H-P8G5CanMvOvw_e24M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddutdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:b8RqYvOzHET9tNJq0f7XDhAEkJ3Gc3VyMWoWBQTscUwBwVey8Cf_Fg>
    <xmx:b8RqYs-0LKRCqmYzzW-oPYkBxlz49HUczZ1pfEmRohTP0Sc9YX7P9w>
    <xmx:b8RqYnWSNcP7R-u7EJt77sa7i0CkkndgiDKx7ssddHIMzukuU0VPzA>
    <xmx:b8RqYt0Y9ib2c7EjBHzP47QHkk_QXOp7ydTmiKyiZWHUGKYpU3F9fg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 12:44:30 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 23/28] clk: Zero the clk_rate_request structure
Date:   Thu, 28 Apr 2022 18:43:33 +0200
Message-Id: <20220428164338.717443-24-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428164338.717443-1-maxime@cerno.tech>
References: <20220428164338.717443-1-maxime@cerno.tech>
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
index d5f90896e088..306108cbcdbc 100644
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
2.35.1

