Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C10C43334
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:25:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbiGKPZN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232082AbiGKPZM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:25:12 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E699F275C0
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:25:10 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 561825C01A9;
        Mon, 11 Jul 2022 11:25:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 11 Jul 2022 11:25:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657553110; x=1657639510; bh=H8
        Liasj8Sw+ANlUc4G+27zeudmk1MScZR+BNYN34Hps=; b=Wene+qZFj2bmsCKq0N
        BRz25X+5SJgI/adVg+IU+yFOhsRsY67kuZxcdAZBnbhG1QXvdkJ+Zw+JWIoXdFll
        D7o9mMJC2BdjMY4p/TFg9d6y0xDmPao/WY7jivzZPO2l9UaOFEUlmSgZSTbyCd6g
        kbjID81pWB/94KLqt26R7/55d7H/VaH7/HSv89ViWG8wjLUPj3yLJ9k9kx6BTgNq
        x5oUtpjus+FuH78D+7wx0qR1A4oQyJg3VyzOXGi6nIpF05CCyq/4MFKE2dAbGc97
        /mjl2KGOfWMop2qulr4vAsjC3OZVysgTJF54vmmFfO8iF1gPod0fg90jdlibu6yH
        3BbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553110; x=1657639510; bh=H8Liasj8Sw+AN
        lUc4G+27zeudmk1MScZR+BNYN34Hps=; b=x04LrfJ9IruBq/+oSIWVqeSEORwmY
        r0azolamGzxcFb/w7od3O4tB/NhwyjJ9txOvab0ROz4Q9l4gu6qV1EKmdDuarw13
        Cz54+xW3lrFMznoXcrqIHNcANGqGae3E3zt5T2f42Y/KlUQcc6h7HbHDvZy0Dw6F
        QnaPz3Kqz/+9CkF/1TePMJD6lUcJbc88NtUFcmfxiWWGEpfY7UXELxAaHgQysUtN
        UZLN/JOOq2+FDHk+7d2rsUDkwn3LTUPjEI7Tt8n+wSSq2Zv9wFYti2bmL/g1yT0f
        Q5YX+t2A1pFv0WwYBqEl07HXH4WjDEYGupHh+uQVRnJV6NzFieSmWiCwg==
X-ME-Sender: <xms:1kDMYhgUPTafuoHZ1TrCDb38pxOkBL-6u6KbEWCVtkM0vp-XGDUa_A>
    <xme:1kDMYmA6JZYRHxnfNz5ndnk946Agw4cshZmZ7m_JIJSC4Jieb8z2kpB4pE4Yv-IOH
    qqPLXZFqADPaygBvYA>
X-ME-Received: <xmr:1kDMYhFzLGjK_-YWwsazmwpW52rUQvTTriYc9qy92sBhaSX1N2GNoNjk_aglnMFyBnjvyEXKjJrp2NWhoa9y_FbCZv1-r-N0wH09Q44>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1kDMYmSw3WBxKFYiakoCHNSXCHRsDFyQ6uQd0kXSo8W0wGwaMMbsfw>
    <xmx:1kDMYuy2UfsXGuhutoJl3aFyei_hiknUOekay8NZJ4bYUcAjYxOtgQ>
    <xmx:1kDMYs6GmTaTQgFMoVh9Ka1jHXNMREhdJrHvkNUfiZe-8VhkLGaNmg>
    <xmx:1kDMYjrcg2Yke0rdaf3jcXKnrfDDYbRHvx26IPX9mGVxzFDZOI3EQg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:25:09 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 23/28] clk: Constify clk_has_parent()
Date:   Mon, 11 Jul 2022 17:24:19 +0200
Message-Id: <20220711152424.701311-24-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152424.701311-1-maxime@cerno.tech>
References: <20220711152424.701311-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk_has_parent() doesn't modify the clocks being passed, so let's make
it const.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c   | 2 +-
 include/linux/clk.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7fc6347e66c6..6c0fdf04a229 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2588,7 +2588,7 @@ void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent)
  *
  * Returns true if @parent is a possible parent for @clk, false otherwise.
  */
-bool clk_has_parent(struct clk *clk, struct clk *parent)
+bool clk_has_parent(const struct clk *clk, const struct clk *parent)
 {
 	/* NULL clocks should be nops, so return success if either is NULL. */
 	if (!clk || !parent)
diff --git a/include/linux/clk.h b/include/linux/clk.h
index c13061cabdfc..1ef013324237 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -799,7 +799,7 @@ int clk_set_rate_exclusive(struct clk *clk, unsigned long rate);
  *
  * Returns true if @parent is a possible parent for @clk, false otherwise.
  */
-bool clk_has_parent(struct clk *clk, struct clk *parent);
+bool clk_has_parent(const struct clk *clk, const struct clk *parent);
 
 /**
  * clk_set_rate_range - set a rate range for a clock source
-- 
2.36.1

