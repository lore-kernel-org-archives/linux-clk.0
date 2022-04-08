Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F37C433FE
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 09:14:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233521AbiDHJQn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233191AbiDHJOj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 05:14:39 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B86A3105AB2
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 02:11:22 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 20EE35C0161;
        Fri,  8 Apr 2022 05:11:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 08 Apr 2022 05:11:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=l/9xBI8PTLrvbfoah1uiRb+dAeeIH7
        PHFGBVTlVazYY=; b=xZua0WOY6Ft2GXRTIqWsvTqIptWjK6tYPW386BjUR9Xmme
        11IeqDp4oRd+c8XfqmoaxNqR0wb0h711ITR9F5aq9Qmw7sjvZqI/ZvCv75fSbE+5
        0+uaB0HE3aRjQZkvh0cH54MTa2dvYhCYPJSd7IgaFyYVF5b3Ya04gaXd21uJciDf
        NYz80fFEYXEJr9dthjd6dK4B0fJsvki6RuDAiSLpFRilqLg1FSjZYtrKURuxUMKI
        BpQSlolneqo6aFMaEK5xUBrLWKhKl4fS99bEJjgQjjLNttw777aQQuhPhnC8R2xg
        MKwtoodks8eofWpX1+X76j9MEfGFvkKIRs6N/Sbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=l/9xBI
        8PTLrvbfoah1uiRb+dAeeIH7PHFGBVTlVazYY=; b=Y6CLi2Auhlj40soXCmPQI5
        plBjElMkA+n/yYbTaWRBGuK+4dWDLNp/agjGRYK/TSqkNrDI/JWN23DV9D+vzleH
        TTnmkKrd5aJsF4cT9atfcX8QkkCcLnTG0FVJuQFlBWlmjdOnpci5hKpn/8huxlMr
        WXX9psqWbO4qVLQU70+aRBxq/M194Mg5+ecVdrkaiU+ktdvWcdmOatAIAJIS85OF
        Yee1+NC+IlrC9fsfNMvQS1po0ZD0dORrFgBCYsN4yv9QHb7yv4F6jRMyWeyBYfEa
        drGEsYWUSS7zIH6lqcbN4ovXRL5I7APPd6s+DWi6dejA8lPk7Lm017cmklLQX7gA
        ==
X-ME-Sender: <xms:OfxPYjMNGL-5k_L-3CR_WO1CbPW9pMkbXXGNQsvyPBZeDefXgFMLzg>
    <xme:OfxPYt-ME6as0-CgideWI19QmfChCwOtetsJbJNEkfmsz-2Z0qVFKlO-jZicWX6TA
    HhB6WAgUDuzpRE0KfU>
X-ME-Received: <xmr:OfxPYiSt133klP8ZeF-P-Ug_9g0EHtCI-F4C66bEt7m_o02H9Cm155EPwxgxrZ_g2kOGlCQfaTpPE5QxgmlGWPiVUlq1gEFaYcQQ8qk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:OvxPYnt8dnQt4akyyHTZyB9htIBf1WULNKVEwq9mSsWl2Kd39liiLg>
    <xmx:OvxPYrdG8bHOsM3_bJuqGCR0urpavnbI_vtMJDpO4fiPRwodlJ8Cmw>
    <xmx:OvxPYj0i3uwmeAgk_iAIkxhDPfSvCqIDdv1Rlj_d4Q1BdzpYIpFuww>
    <xmx:OvxPYv6x3yN30bl4KwQQKD9E5bedQQOLq906Dzqbf_r0z0BYuWEk9A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 05:11:21 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 21/22] clk: Test the clock pointer in clk_hw_get_name()
Date:   Fri,  8 Apr 2022 11:10:36 +0200
Message-Id: <20220408091037.2041955-22-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408091037.2041955-1-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Unlike __clk_get_name(), clk_hw_get_name() doesn't test wether passed
clk_hw pointer is NULL or not and dereferences it directly. This can
then lead to NULL pointer dereference.

Let's make sure the pointer isn't NULL before dereferencing it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 3fbd55119215..8bbb6adeeead 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -269,7 +269,7 @@ EXPORT_SYMBOL_GPL(__clk_get_name);
 
 const char *clk_hw_get_name(const struct clk_hw *hw)
 {
-	return hw->core->name;
+	return !hw ? NULL : hw->core->name;
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_name);
 
-- 
2.35.1

