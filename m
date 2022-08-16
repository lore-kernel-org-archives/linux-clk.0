Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9986C25B0E
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:53:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233847AbiHPLxL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:53:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234246AbiHPLwv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:52:51 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B2068E986
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:27:25 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 14B33320091F;
        Tue, 16 Aug 2022 07:27:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 16 Aug 2022 07:27:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660649240; x=1660735640; bh=o5
        iFdopFa2HGCGEMFjs0ZUO1WJ5WU6C3Pgva9peIOew=; b=CjGUWJ3o0vjrh8X9BY
        +Oz6qrkSOR3hjmqPTxVpdBZyz6YM56Tsl2ndh/t20YM/65hc9C/xmlWvRERstdQq
        1fAsddlFmDM5Rn0Ubt+/DpAbtIbFfq4arzPOYocWvcyfdwTy1QKPLwt4OGJWWkpC
        fimX/YU5Hm0Rke2HLm5ioc+D66psK24u2Rf39cef6VUSyW3hXx+kDxmub+KaCGiP
        fwwEH8imawyyOBAWlST1DObIVqelVyIFDl5gfioOGM7A7e7by1renMgp5VPj6xmn
        Csrr0HgcxiIiLNkJUzp90f7pHl+Sulyd6mk26NGY1KGIpLihlEIn7aDEPwPv9ziR
        gZXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649240; x=1660735640; bh=o5iFdopFa2HGC
        GEMFjs0ZUO1WJ5WU6C3Pgva9peIOew=; b=rZB7T/PyQ9M8semSanPe7Xm/fvTTQ
        49g2FJMkbrRv1GUEV2JyHbC7XThWt1wGZuwKHdRVaf+EAICYbpXpdEHgj7S4b1jc
        qdjaDxSY/ydgj2HZypVmlv1EmosuZA2aIfKsLVEby0cIMdhSpn5lgCRivBolzUIz
        7SoAnWiJmLIbkYU1uQgyqh7AEY4QFglpYsvqZ05llXHEjXnIPAinb0fdnO7eZAqh
        ufNf7Yd3dWdXvO2dvYQeBLv2An4hFZ0RBnNC8bju+Tdsklo24TR0QynzelrAtPf2
        haXPHLjZ1J5cvHyanCGU/FEGqNj/bDm1ySUvR8AOy21iZD+Q1G3GYVARA==
X-ME-Sender: <xms:GH_7YoTJQmE88VMC6ImP1apAK2mTOWYYEGZAd99ReR2P1J568Ej3Iw>
    <xme:GH_7YlyBIvAobvbHvEfJ3ws2PgyogKnTW2zx-pUEcFrs8lNA1ihu_CpC_SUbC_fE6
    76frx6wfUeOezrh1-Y>
X-ME-Received: <xmr:GH_7Yl0UGj-4yVCCA6LMpBqQLIWsDVSwUshPbC6LwX0Wg7dxmJHtp8vdFEs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:GH_7YsClBf1mMnkQezaEZkvRfVb6cB4g6dB1Ip4hgkfk7I5KV-Kasw>
    <xmx:GH_7YhjXlVdDhobkVyRUdBG2OcOgBHd7wNAGnlLC8o0njwE5ocy5Dw>
    <xmx:GH_7YorBEoWfhF5TcZxdkiQm8gG0SzqSjjx57-i5BmIR4slhQ1M7Ww>
    <xmx:GH_7YmZfAHCgxo_fpXqWA6GpUZO6LmjujPHoR24D-xp78x5J3uK21A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:27:19 -0400 (EDT)
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
Subject: [PATCH v9 23/25] clk: Introduce the clk_hw_get_rate_range function
Date:   Tue, 16 Aug 2022 13:25:28 +0200
Message-Id: <20220816112530.1837489-24-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some clock providers are hand-crafting their clk_rate_request, and need
to figure out the current boundaries of their clk_hw to fill it
properly.

Let's create such a function for clock providers.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c            | 16 ++++++++++++++++
 include/linux/clk-provider.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index fc145ea40f4e..453e2ff10961 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -683,6 +683,22 @@ static void clk_core_get_boundaries(struct clk_core *core,
 		*max_rate = min(*max_rate, clk_user->max_rate);
 }
 
+/*
+ * clk_hw_get_rate_range() - returns the clock rate range for a hw clk
+ * @hw: the hw clk we want to get the range from
+ * @min_rate: pointer to the variable that will hold the minimum
+ * @max_rate: pointer to the variable that will hold the maximum
+ *
+ * Fills the @min_rate and @max_rate variables with the minimum and
+ * maximum that clock can reach.
+ */
+void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
+			   unsigned long *max_rate)
+{
+	clk_core_get_boundaries(hw->core, min_rate, max_rate);
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_rate_range);
+
 static bool clk_core_check_boundaries(struct clk_core *core,
 				      unsigned long min_rate,
 				      unsigned long max_rate)
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 8bce6c524f29..8724a3547a79 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1267,6 +1267,8 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 				 struct clk_rate_request *req,
 				 unsigned long flags);
 void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent);
+void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
+			   unsigned long *max_rate);
 void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 			   unsigned long max_rate);
 
-- 
2.37.1

