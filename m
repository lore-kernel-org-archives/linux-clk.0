Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEFBC3F6B0
	for <linux-clk@archiver.kernel.org>; Mon, 15 Aug 2022 15:44:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232347AbiHOPnl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbiHOPnW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 11:43:22 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A7856563
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 08:43:22 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id BD13A3200977;
        Mon, 15 Aug 2022 11:43:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 15 Aug 2022 11:43:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660578200; x=1660664600; bh=yh
        A8vGjZQoyrMGP1d9gV/7SGhFCQzVz0jDc+vLgB60c=; b=oeQm2JxmT5L2eWkWQO
        V0iC0kvC4mZ1WLPUPnij+zNv/gE89Gtt5EDRQ4GSQSkTjC5/NZsU98B/TV3fVhAg
        L3CMM+de9MWtxzhoc9olSErD+NaLwMzM3RNOzmvkPRtLqvhyr7vPQ8mQIAQ7+lRl
        z6wE3YDTF8Pam6DlSriS4ZuQizG5rpZCW1AX4HW+w/DVJ9sZjOUr3uUeI02sgXjT
        a+jPCdMkZ+0XX0cdCT44GmajzL7uWPuYT7FAv8b3PSNroZNQn2AjzmeA6x1+j6Ex
        DhYwf3PtE334JJuxwHiUtkmxCGwfws1bGnXTL+kIJhTuhKZHjrovf3x+zwADg7ZX
        xMDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660578200; x=1660664600; bh=yhA8vGjZQoyrM
        GP1d9gV/7SGhFCQzVz0jDc+vLgB60c=; b=zcnTJF3/ewvpwjT903pWfhHwV7o8T
        /LspA++hIzSeSfbPZhgcMVQJOLbp5CT1tJNsBPFXNsQsmBreWegE/4ZYf1cNXMn4
        bOhjwGMBpFdnYr6wwY7yqST7+3eHhZee7v4loWjtALXtrLS47cEwsUlhDxVbbgQa
        +sfMh1DU8x4IB5jcGx31unN1uWkGC0EKR0+wo+ThPV6IENTw4bT6xJ/tSoEKNRDx
        eZdmQGcNp+D+ZVwED5Mp9H6EvCt5iXm9F9Vju1CtiK6Eg+T8gAWsQQibe4YQoKEJ
        wijs8p1feLihTj9e6LftIPAoOPM5AZUygJ68MJ9r/C35ad6c8lIJfC3Tw==
X-ME-Sender: <xms:l2n6Yg0pCg48XAOqB4DbotK1GAnsecyVae_B36PdzM79imDk9K8-Hw>
    <xme:l2n6YrFEJ4Hq7wSDRg7lp91S6LusBRl_Vy5nEt_5SChgIIoytqnrSQ1-0JBeCh6TH
    wv3ZeTxZgCehBoPehU>
X-ME-Received: <xmr:l2n6Yo6d-w1VxHqFjslJ2NnXo_JPQlPSRVAGgDfmAkJjiK83B4f4s7w54ZQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:l2n6Yp0Ve6uF-nO91H2_gSQGZuuRx4Zn5J-uXWo2O3GljitdIfJTUQ>
    <xmx:l2n6YjEG0-dP4_VeVDQNwQ4z7QHr0nbqcAUS8Weu26yAY9UduvdhYA>
    <xmx:l2n6Yi9FfAB-uF8WJrRCERUqnga2_1cbc_gN7XwVm0hcxOepMt32KA>
    <xmx:mGn6Yr-GO0E4xjNQn8F9zVZOTZznfQbls9xD-YZv7ZZf19XjSESJDQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:43:19 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v8 20/25] clk: Constify clk_has_parent()
Date:   Mon, 15 Aug 2022 17:41:42 +0200
Message-Id: <20220815154147.1631441-21-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815154147.1631441-1-maxime@cerno.tech>
References: <20220815154147.1631441-1-maxime@cerno.tech>
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
2.37.1

