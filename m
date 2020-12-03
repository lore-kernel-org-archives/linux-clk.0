Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D1EC63777
	for <linux-clk@archiver.kernel.org>; Thu,  3 Dec 2020 08:00:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27EDD20C56
	for <linux-clk@archiver.kernel.org>; Thu,  3 Dec 2020 08:00:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbgLCIAF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Dec 2020 03:00:05 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:51713 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728658AbgLCIAD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Dec 2020 03:00:03 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 17E7FE26;
        Thu,  3 Dec 2020 02:59:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 03 Dec 2020 02:59:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=IWFmKP/Mo0VDGFNgTJDZyQHV+k
        tb+RO0adDkB3rVIps=; b=qu65OIIBzs1jOephqhxHBqRryeLwJy+Dsj1Izv+7Zi
        B6aVRlgP0aaEBx57ygdRqR+1xrH3iHBKq1MiK+24gZzkMeET7nJgpB3EMMgzMYx5
        40/v6JjSjsdiGeRFiWtzUGme22k4eTKFxLq5CBjCDnA/ANyi6Psnab3fi7lqsvYF
        NcqhsYQWCbxMTZs1kMLmZsu7d3o67hGWJlN00cgLOybHmqLJ3YS13V7zj5Bk6YM7
        KVG14ATXTu3e0Je0cfpY6lzeLN4WVC53RwrUA4h+qxZeSicdRit7M2h3yhVuwb6/
        KT8UpYbZwlaXpEysgPaeH2OXFqxK2m78sm6IQyeOjHbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=IWFmKP/Mo0VDGFNgT
        JDZyQHV+ktb+RO0adDkB3rVIps=; b=SZxQau4yLK97RIoLPyjkwF1yc1OIC7GgU
        px1t+9499ss93O0UVudqtiYikJaDS58HR1sK/Rfaw62v4eR9If354aH2UrVOik9o
        67aPVk9rI8LG1SshI4vkuAoIqXa4EuR42ECcQFOvIXFyedk+1zIri1gC4DUCIIHD
        +SLqQC2v1XGiIPUGwFjoa4ZcI3hiEPbEP+s6aE85EqHPOmC7Ci6jb0n/3vRg3rcE
        ZITa8M2Enfircp0fX4emelLhODCvR2xbhFr7tL4iezZqc900bV/Jxt9KVxETSgEh
        qj/kKuX6k/37vQiEcG2kjF6aKK0DweYSHl0oCyMAVwZWaNL+Po1aw==
X-ME-Sender: <xms:05rIX1dJEG-XpoUFnWRek0qIRgdZbxE8e2Tju3ie3uXAcL7vN5pnGw>
    <xme:05rIXzOA_UGK7eoXQoF_A9MZZZE9SfNFAac6zsPJq03Ql0UApB8B9d7jGaKgnZDjA
    Gl_XLMWE6bz0FDgfy0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeihedguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeej
    geenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:05rIX-i_gTr_C39M8Ci7Dcv1fI6hfCwgBO-QsCLQvBMBjAXxmfPPyA>
    <xmx:05rIX--RbNqnZAp7JtiN7HlZUMiJ7VlRroYswpMdPvt5CXlppPJFAQ>
    <xmx:05rIXxuh7pFTe6qq0EQrMFVHIG6ljSK9f7zZ1asN4iGC5140sqinDg>
    <xmx:1JrIXyVMhDqagvJfHbYVMmZpEvPpCz0lp-kixDsnibxTNMtYqd0Lrw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 509D2108005F;
        Thu,  3 Dec 2020 02:59:15 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] clk: trace: Trace range functions
Date:   Thu,  3 Dec 2020 08:59:13 +0100
Message-Id: <20201203075913.723046-1-maxime@cerno.tech>
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
 drivers/clk/clk.c          |  6 ++++++
 include/trace/events/clk.h | 44 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f83dac54ed85..34c2fa18b732 100644
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
@@ -2378,6 +2380,8 @@ EXPORT_SYMBOL_GPL(clk_set_rate_range);
  */
 int clk_set_min_rate(struct clk *clk, unsigned long rate)
 {
+	trace_clk_set_min_rate(clk->core, rate);
+
 	if (!clk)
 		return 0;
 
@@ -2394,6 +2398,8 @@ EXPORT_SYMBOL_GPL(clk_set_min_rate);
  */
 int clk_set_max_rate(struct clk *clk, unsigned long rate)
 {
+	trace_clk_set_max_rate(clk->core, rate);
+
 	if (!clk)
 		return 0;
 
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

