Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF0CC433FE
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 09:14:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233080AbiDHJQJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232689AbiDHJOg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 05:14:36 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F162133DA5
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 02:11:10 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 821345C0161;
        Fri,  8 Apr 2022 05:11:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 08 Apr 2022 05:11:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=zf4Ks37n7tfDurHxnmaJucc88hhDu/
        gMEhLVvoVFCIY=; b=Gvd3juHAKzFpq95wAiOIr0ZVN2ubiNfeCTVqH6I0K1khdb
        DgxeRHRT0ojNwPYvAPURkHhyYTH9CkK2doMjxBgBdTlv3DH98hZPYJxmJcsTua6R
        d3dkGrHRIs7vIUeJBrqo6k7t1HoacbcghbuBWc3baTu/4jEVDz20viN/tTIhvVH8
        Dzx/sJ29oCsTkUNToBz95ijItvsMpqJIFGk00xlsAJmxl9qciIzx6uXy0uiGct6R
        69tWYcFGkrV1heHkIoK/zP2lbV4kHq9NuaRg8o+RzgL/lL5bGZjIWfoVs1yzvd5o
        W5ENpy/r+f+wOdXcWQdLU4/vZ9acvbAkZI15Ijzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zf4Ks3
        7n7tfDurHxnmaJucc88hhDu/gMEhLVvoVFCIY=; b=Q16TsEfaBcy5Tf5Uo3l7sk
        XaCHw5gwHFx6lshMwoDYOZPfA53OpiGo2HRLaLegL9GPL8+WWOugp1EaMDYFCloU
        nULadH82SpcKcYHsMDYd0+FnI4SefYfQBVwkJnpp8PfhLjlZAUWe8/7EP9ekFIpN
        cHwjP8+i3HbE8gMSqiPwoIMe4KOSqmbjKqiwNZiB/rAmw4BuC24cLhsBGknpkjCl
        6NmflKdWJqJNv8k17SsUpj2TKhfRmG3vhby248tHSJYyY9kj8K5fxiui+eEzufHd
        GJq7Wsst7Lyld7PlkaH+w1PsGqF7TtEfj6vqEFKvh8sTlEdD5GNmo37YC9pa2QtQ
        ==
X-ME-Sender: <xms:LfxPYnDJQDak6OUKLwOPsX0Z_IlT415HAMdS8G05qd6ftzYnDZW0vg>
    <xme:LfxPYtiAxmkd6g_ZdxSws8sPO_RQBJ-hjLSracds8Wpx9IxzlhDcDsIwxLOakGXoI
    o1Juim6Zc1EwmfrINM>
X-ME-Received: <xmr:LfxPYilEx2_V6_9N0VXHWw0P2REj-tKlPgh0Ink4VP9dJRVLQAkTkKB5DIj7RlqX7SIkTbx5incGizhcZEpKxXJ8kbuhwBT1Fk14Y5I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:LfxPYpxHxEdrNmmTIngRGIIJ_6nnQEvC1uw4Tt5ZnHcQuLWsYNUFyQ>
    <xmx:LfxPYsRp_G6ykC3bSOqxPx-hKwBNFozTtoFceHzZF4q17lDdKJ-BOw>
    <xmx:LfxPYsa8FQIUE8_DL0YKkY6P-3aIG21tDJYX-dy8Wh8kU3u6GwLhLQ>
    <xmx:LfxPYl-HKtFixgciiZYnoWGYJjrh2MXZRaFO_grdwS2KEKT21p1F8g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 05:11:09 -0400 (EDT)
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
Subject: [PATCH 14/22] clk: Introduce clk_hw_init_rate_request()
Date:   Fri,  8 Apr 2022 11:10:29 +0200
Message-Id: <20220408091037.2041955-15-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408091037.2041955-1-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some drivers (at91, imx, qcom) use __clk_determine_rate directly, and
thus will need to initialise a clk_rate_request structure.

However, drivers don't have access to the function that the core uses to
initialize that structure which could prove to be useful.

Let's create a function for clock providers that will initialize a
clk_rate_request for a given clk_hw pointer and a rate.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c            | 20 ++++++++++++++++++++
 include/linux/clk-provider.h |  6 ++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 399080456e45..83dd5f1df0b9 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1396,6 +1396,26 @@ static void clk_core_init_rate_req(struct clk_core * const core,
 	}
 }
 
+/**
+ * clk_hw_init_rate_request - Initializes a clk_rate_request
+ * @hw: the clk for which we want to submit a rate request
+ * @req: the clk_rate_request structure we want to initialise
+ * @rate: the rate which is to be requested
+ *
+ * Initializes and fills a clk_rate_request structure to submit to
+ * __clk_determine_rate or similar functions.
+ */
+void clk_hw_init_rate_request(struct clk_hw * const hw,
+			      struct clk_rate_request *req,
+			      unsigned long rate)
+{
+	if (WARN_ON(!hw || !req))
+		return;
+
+	clk_core_init_rate_req(hw->core, req, rate);
+}
+EXPORT_SYMBOL_GPL(clk_hw_init_rate_request);
+
 static bool clk_core_can_round(struct clk_core * const core)
 {
 	return core->ops->determine_rate || core->ops->round_rate;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index c10dc4c659e2..39e4ed301ec5 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -42,6 +42,8 @@ struct dentry;
  * struct clk_rate_request - Structure encoding the clk constraints that
  * a clock user might require.
  *
+ * Should be initialized by calling clk_hw_init_rate_request().
+ *
  * @rate:		Requested clock rate. This field will be adjusted by
  *			clock drivers according to hardware capabilities.
  * @min_rate:		Minimum rate imposed by clk users.
@@ -60,6 +62,10 @@ struct clk_rate_request {
 	struct clk_hw *best_parent_hw;
 };
 
+void clk_hw_init_rate_request(struct clk_hw * const hw,
+			      struct clk_rate_request *req,
+			      unsigned long rate);
+
 /**
  * struct clk_duty - Struture encoding the duty cycle ratio of a clock
  *
-- 
2.35.1

