Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC65C4361B
	for <linux-clk@archiver.kernel.org>; Mon,  7 Dec 2020 10:51:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5BBC23341
	for <linux-clk@archiver.kernel.org>; Mon,  7 Dec 2020 10:51:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgLGKvk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Dec 2020 05:51:40 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:52253 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726195AbgLGKvk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Dec 2020 05:51:40 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 35E0AB5F;
        Mon,  7 Dec 2020 05:50:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 07 Dec 2020 05:50:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=3GLxbAjbrFy9QR+pzn98fUFZ+T
        8qzlsqqzpEHr1FT9g=; b=YlBZmBE06Z1a9YrLCN+sh2Yvmshusq7m0aienRsrte
        J4H/hzGSWlbaPIZcoLKiIR/umU6pbGurX+DthtwADCC8xauvAGhkH4UPsD4aWWYG
        fGBJLhznS9gQ57bN70AzxkYHn4/jdO1kc4HY0ORkDKOd3ZOvNzTPQHqwSz+3WaCz
        esxv1Xe3eBAOnfL9Wn30DrJ41Kd6co9o3TrJnTedZ/w9vMMj5gcGRIF09ejhIaSn
        dRK2fi8gSIzdXXmLauMoxqJgDN9nmsMj7Y32uoXXymCjxX9r3D0XdPWUq7jO50gM
        Ygq5lKH1G+71pe5GCKX+UZl5PYvrF8CwbO42b4f0Gv1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3GLxbAjbrFy9QR+pz
        n98fUFZ+T8qzlsqqzpEHr1FT9g=; b=r/BjNpzOEF3X9nVQlzAGg+tIz35iZ8wDR
        DzGAZPEBAFuQWyMEXElO2epzYQF8LnA2Tstt5bTwmNFgXh9+REO3pk9q6lRu8/LA
        qzZrAlfLgt7vTlmlZQo2rHBlQ7a0S4FF943ZQN1k+A2WCoIAqJLLtvSak1ul7abx
        uREM4+M6MmF84f7KwpOVEmnMKxMC6ARya74UGsyRWkOXOPQbkEES/KyrlyQQCTWd
        AsrmQHgEyRR3dJLNDN99Cu/KWvmTj7ds7nTnZiqiyaA4LIL/+Grw5Q98Z8ZT3ASl
        CbjrL5Cl/no3svZUitOgKsN8rjErnTXAjdHsPmOob4DWLzeu5jNQQ==
X-ME-Sender: <xms:DAnOX--FLS7kGDpTqk3goyTd-_Gakurp8oT_1LeLFX20BN7OeX3U4A>
    <xme:DAnOX-vcAJLuugiwRxUQhmL573bSIlKYPhFuzb2ubRLdnTzWYL7iIpvljJzN3YYoE
    O1_63aJz3WDQU39Kug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
    tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
    hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
    necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:DAnOX0CK3Vo6akxndSIao0TqoO4E5b7fVO9zSEah1n69b3KYC0HzQg>
    <xmx:DAnOX2fJbPIyw02psAG6s0Y2FcVDgjyGMHYpQY65KEHrT2bk92DwKQ>
    <xmx:DAnOXzMPfC7ebu61pibS0S-GRRS6DzQlca4FDw8Aq6HdwXIu7O38tA>
    <xmx:DQnOX536VgHr4BbJHbUTuM_LUpDfoze6UNUI_RAhfRGdVy3DfMMbYQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 93FD324005E;
        Mon,  7 Dec 2020 05:50:52 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2] clk: trace: Trace range functions
Date:   Mon,  7 Dec 2020 11:50:50 +0100
Message-Id: <20201207105050.2096917-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clk_set_range functions don't have any tracepoints even though it
might be useful. Fix this.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - Call the trace functions after the check for the clk pointer
---
 drivers/clk/clk.c          |  6 ++++++
 include/trace/events/clk.h | 44 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f83dac54ed85..b98415d280c8 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2314,6 +2314,8 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 	if (!clk)
 		return 0;
 
+	trace_clk_set_rate_range(clk->core, min, max);
+
 	if (min > max) {
 		pr_err("%s: clk %s dev %s con %s: invalid range [%lu, %lu]\n",
 		       __func__, clk->core->name, clk->dev_id, clk->con_id,
@@ -2381,6 +2383,8 @@ int clk_set_min_rate(struct clk *clk, unsigned long rate)
 	if (!clk)
 		return 0;
 
+	trace_clk_set_min_rate(clk->core, rate);
+
 	return clk_set_rate_range(clk, rate, clk->max_rate);
 }
 EXPORT_SYMBOL_GPL(clk_set_min_rate);
@@ -2397,6 +2401,8 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
 	if (!clk)
 		return 0;
 
+	trace_clk_set_max_rate(clk->core, rate);
+
 	return clk_set_rate_range(clk, clk->min_rate, rate);
 }
 EXPORT_SYMBOL_GPL(clk_set_max_rate);
diff --git a/include/trace/events/clk.h b/include/trace/events/clk.h
index cb1aea25c199..e19edc63ee95 100644
--- a/include/trace/events/clk.h
+++ b/include/trace/events/clk.h
@@ -118,6 +118,50 @@ DEFINE_EVENT(clk_rate, clk_set_rate_complete,
 	TP_ARGS(core, rate)
 );
 
+DEFINE_EVENT(clk_rate, clk_set_min_rate,
+
+	TP_PROTO(struct clk_core *core, unsigned long rate),
+
+	TP_ARGS(core, rate)
+);
+
+DEFINE_EVENT(clk_rate, clk_set_max_rate,
+
+	TP_PROTO(struct clk_core *core, unsigned long rate),
+
+	TP_ARGS(core, rate)
+);
+
+DECLARE_EVENT_CLASS(clk_rate_range,
+
+	TP_PROTO(struct clk_core *core, unsigned long min, unsigned long max),
+
+	TP_ARGS(core, min, max),
+
+	TP_STRUCT__entry(
+		__string(        name,           core->name                )
+		__field(unsigned long,           min                       )
+		__field(unsigned long,           max                       )
+	),
+
+	TP_fast_assign(
+		__assign_str(name, core->name);
+		__entry->min = min;
+		__entry->max = max;
+	),
+
+	TP_printk("%s min %lu max %lu", __get_str(name),
+		  (unsigned long)__entry->min,
+		  (unsigned long)__entry->max)
+);
+
+DEFINE_EVENT(clk_rate_range, clk_set_rate_range,
+
+	TP_PROTO(struct clk_core *core, unsigned long min, unsigned long max),
+
+	TP_ARGS(core, min, max)
+);
+
 DECLARE_EVENT_CLASS(clk_parent,
 
 	TP_PROTO(struct clk_core *core, struct clk_core *parent),
-- 
2.28.0

