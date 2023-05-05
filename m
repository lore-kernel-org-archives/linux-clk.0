Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC6DC77B75
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:27:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbjEEL1o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:27:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbjEEL1n (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:27:43 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22DE016343
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:24 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 6AF2A3200A4A;
        Fri,  5 May 2023 07:26:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 05 May 2023 07:26:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683285966; x=1683372366; bh=ZZXF64R9h/86TRhOCRZaaaC3irkxeaZh77o
        wBC9vNBE=; b=vJwe0OrQw2g1tH6hJ6kJ9/EG1BsR+T+rjvaVdSLt2/9cH/buC5T
        kEtBbCC4Jt1y6KAfOUxZ5yHYpQudH9cW4os5lLFEp+5vlRrIUtyuiPBj8TDqwiZU
        1u9JsxaVfOnIZ+B0G1qYPq7/uX2NmWvhqYoyo0wyv6VSwLza610qySKQDUVGiIkE
        qsLKmUfO2eBlyup4rE5mK3dS0x3Jaelbfj6L51HHmQPTDjhF5wjGskE6oitUgEg5
        7rL99mt/bkw7JVHvAlC8l35G5WIoC5CZbgNgVSFco16p/aPvnSS/PdGnE95f2oDd
        euenR9ZkaHqYNpNmmx4wmZNt0KRfvhFnbAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683285966; x=1683372366; bh=ZZXF64R9h/86TRhOCRZaaaC3irkxeaZh77o
        wBC9vNBE=; b=NAfnpuokVvp3A3OWzgTiy95ljbmS9t/ILLTKfRuvVTSJ5G0+CQF
        UzdMmGEJX9j+5s/4HZStqvwmsnYkgn9IzCtNXYyWm+O7/gTev6g1oF16aQ7+O7tY
        z6hYVM40UG+o7LwlX98krzBpp6IcLS6yWCgQ+3+7REN3XWm6jM6L9dFq1BknFfCM
        havnGJiXiKQ/nzfM/kXbKXtGafC0bCwcTFEc/xdOpNG3ZTuPIcMq2aXSbPjW5kH0
        JwJBhxBj72h60jnnoL8Ea0gIOV2KaqC9dNX6gxVEtsQ0IYfpsCGfj9Gsa1QiX/L3
        OQU4jgaVOBPeLEDY4XF87M9sObNye3TnMlw==
X-ME-Sender: <xms:zedUZF7HQ-VfSNdL83MaI0Cyvh3TECeMVr0cEjUh57dIR7hGC31DIg>
    <xme:zedUZC5zmBmNfs7QiX4sjMOkH2bTRqqA0uxpl2I2OJhA8Ah3-GMKFVO9BWBZHSstR
    xyIl0tUaAGvu-C_T-Y>
X-ME-Received: <xmr:zedUZMe2LOfKmRcMej1Khy3UvFXP7aiJZVqtUZssvtEHcerzKI3wzTevrEFYiApJInNrYC5uyM8IIOXXmBupBj4c2jteOUM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zedUZOIImPBtHInO-qAgQU54qsxpOkgy8ttHFQxVXIa-os9StzncVg>
    <xmx:zedUZJKYUnEqt2GkImZAYiLz5iO8rqcJxOJUYAr1gz6S0znX-xencw>
    <xmx:zedUZHy-vDiPyYLk-2HSK_GR_vIABjzapNXSzVENRu4ZG3lxAJbPCw>
    <xmx:zudUZAVmTWA905ml60TJdmBXpe1uNxX6GA6RJSvzsSfBaeN-SMidsQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:26:05 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:09 +0200
Subject: [PATCH v4 07/68] clk: test: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-7-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1999; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=JfDjyedFCo6DdHz17aemSi2AiiDz2HvUFiAwMQ7IlAM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxfd4SiXTZuwKvJwTW5qu2P7Hfa/hafYj0h35Fzy4tma
 qHaxo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABNR387I8M8tIV4sKic93WeVn2rOnN
 jbOsF+RS4HmN4dDFuoJGLGy8iw5yfT78P5zNoWN8NOaMu1zT/PJxpwWEYsQnJjgPeMG/qMAA==
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The single parent clock in our kunit tests implements a mux with a
set_parent hook, but doesn't provide a determine_rate implementation.

This is not entirely unexpected, since its whole purpose it to have a
single parent. When determine_rate is missing, and since
CLK_SET_RATE_PARENT is set for all its instances, the default behaviour
of the framework will be to forward it to the current parent.

This is totally fine as far as the tests are concerned, but we'll start
to mandate a determine_rate implementation when set_parent is set, so
let's fill it with __clk_mux_determine_rate() which will have the same
behavior.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index b3ed3b0e4c31..a154ec9d0111 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -104,6 +104,23 @@ static const struct clk_ops clk_dummy_minimize_rate_ops = {
 };
 
 static const struct clk_ops clk_dummy_single_parent_ops = {
+	/*
+	 * FIXME: Even though we should probably be able to use
+	 * __clk_mux_determine_rate() here, if we use it and call
+	 * clk_round_rate() or clk_set_rate() with a rate lower than
+	 * what all the parents can provide, it will return -EINVAL.
+	 *
+	 * This is due to the fact that it has the undocumented
+	 * behaviour to always pick up the closest rate higher than the
+	 * requested rate. If we get something lower, it thus considers
+	 * that it's not acceptable and will return an error.
+	 *
+	 * It's somewhat inconsistent and creates a weird threshold
+	 * between rates above the parent rate which would be rounded to
+	 * what the parent can provide, but rates below will simply
+	 * return an error.
+	 */
+	.determine_rate = __clk_mux_determine_rate_closest,
 	.set_parent = clk_dummy_single_set_parent,
 	.get_parent = clk_dummy_single_get_parent,
 };

-- 
2.40.0

