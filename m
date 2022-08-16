Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56AD4C25B0E
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:53:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235111AbiHPLxE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235121AbiHPLwp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:52:45 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B195792E2
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:27:15 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id B9EAF3200910;
        Tue, 16 Aug 2022 07:27:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 16 Aug 2022 07:27:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660649227; x=1660735627; bh=Hh
        sa/wTkQZ6QI5X8ygZ1jg7VDor9/OlH8amwpt2RzeE=; b=GdgY5FQgC8FprVzAaQ
        bhqK2AcJTiZnWQPyP0lMRGO5sUq6vA7M6canCkWVI+d7n+h/40CliOqv5ToH9Bzu
        7p16ZapxUvwm5c2kzdwzssGxA0Re+SJ7oobZ6daVC3xUNyF1iHA2wrrfmX2nVYaS
        AMSex4OyQ6WsIMA7Cu2V6QdgbUVdG2bG7sGImB9PJocWm8GDSvZqOQMzkzlnfunP
        +2bjgjn4rcVUmrhpgQFRz6IOdC8zbSvHMj4mUUXmjFOz25HR44RiSwOQdlR2O6n4
        JrH7c9t49P71RazqfaLqV+aI/DDME1KCQPuXtFzAiTeS3BFxcduFyhYZrWtaGmeD
        gRSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649227; x=1660735627; bh=Hhsa/wTkQZ6QI
        5X8ygZ1jg7VDor9/OlH8amwpt2RzeE=; b=2yxSgJoQe3dIr2DFHZc8irUqpiavE
        q94Epor6Pl3kYglLxt6HSUFV+0jsG4Y3QOMMnB6moXKH8WxBXGLsRCFA/yRGCVV6
        85BVwEW3DVB35yP/gWfhD2Nus9hib3oIqzuLQBa5bFYxy3xy0744nouEcKgtAskk
        1yz9eF1J6w6N0Mp26DMdlnN+EnBXFI7mnmOh1t6G8RPaop6k8lfUAy3u5lqEjRsa
        JdydPdPkSzo/cxhw8Wv5mdpbyq8RCI7IXIxvceVs3RypEqhRyQ+cED41mzkQrfjD
        epGnDClUFKlcQVCrjVAIxdKErYPySC7AqV0MoA/zsOKc22txTf0g5Q2qw==
X-ME-Sender: <xms:C3_7Yg8Eh-gmO6Skp9n_bt_3EJpqwW080Czqm4hA_jjKt-GdKJ4VVg>
    <xme:C3_7YotQ7FYgw_Iy208FsZru8mUsj0NPbesoWptBnTJyszVjXCNxajp0GupbCuwe5
    7CbiIfc7cJ-AMABWds>
X-ME-Received: <xmr:C3_7YmCFfxQp3cNy9TSWzU9pQoWyZaHi3krol-Z2878ylcoB7hPaJxhdHIY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:C3_7Ygd2g8VIJd0qFCLHOzhqlztvzQ80r8R51QlnsVjrvJHl8oYdTg>
    <xmx:C3_7YlNPu1G4FcbbgzAlGfKbXXExHbcNlhv2rGJyYuWgLMTgbaBolA>
    <xmx:C3_7Yqn0b7HU2fiGCWCk-4LX4HxsyMYrYydGrVU80WTCKmkCN67ylQ>
    <xmx:C3_7YmFcMNm4eGka1THR_bfjDAhXk-7vWOuF8EOW7GyGCVXIyJA9yQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:27:06 -0400 (EDT)
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
Subject: [PATCH v9 20/25] clk: Constify clk_has_parent()
Date:   Tue, 16 Aug 2022 13:25:25 +0200
Message-Id: <20220816112530.1837489-21-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
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
index c1bb64827060..8b9ff78e7b53 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2592,7 +2592,7 @@ void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent)
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

