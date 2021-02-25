Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E789FC43381
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 16:00:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9462C64E7A
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 16:00:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbhBYQAN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Feb 2021 11:00:13 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:34943 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232770AbhBYQAJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Feb 2021 11:00:09 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id E02CBB6B;
        Thu, 25 Feb 2021 10:59:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 25 Feb 2021 10:59:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=jv5ckA19ZkKU4
        Rjc7QxtOHEW45lL4ipQ44Uc7QnCaYE=; b=NLUdu0BBOw9ouMeK61kgTc2GnCSim
        v3dcIz86kkkDSRCIxhz6+PX2fZj4QoQy6NsxGABAh5IPXw5teXbc5JK0OGnJXgAV
        4eEYmT8YBZJdcg3g4ut8qZHYNgMTKk2YPsNQYhiyuViB17aBWK0uxFpMkKaizBc1
        AXlNv4Z42OEYpt2F3XWpWr6Lplx+YWH/4BYuLYdpf4RoJcBr9WG3mGuw8BV+Jg2g
        z0cvwB/MvbAoCL9NtyBt2VcnHf29EGUTu1polaxN0xxM/Q3Z3xrOV0ziouE/RD4W
        JRs90hsAburjJOgmhRvcfla1yDtiqnbVST4N2z2IUL9GcqkgCdRlYLggA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=jv5ckA19ZkKU4Rjc7QxtOHEW45lL4ipQ44Uc7QnCaYE=; b=QhvimSQW
        6JcBFIlooxhH4XZp/8ELqhHLeZMIFn6UI5Wn6eVU4Y+w37G75I/ts7G7CEfPg/NR
        XODQNmBAqEVGwVTlzkncVEUWfd0Q3tqRxvA0ob+kvP+T2ZJaUD8LdrxKqE41M/zM
        3wJcJSpuOo4T/teyrz7yrJ7WxAhzhyn1k0gUZrfdo4eBUoV6yYbKqF2IZm+ZFol4
        AHKZsuiqi9isfCo8HnvJHOUoqMSr1UQOnQHdmmXn/VlRVLJoJt2LUxQqOLTb/d9i
        18/Wau6LvdbskjhtnU9vvZdhecRoD+rlSAsILW7iAbH+ogR8yU3EpWOjSwY5acni
        XEM+Fi8+EphXUQ==
X-ME-Sender: <xms:U8k3YGC351wWWLtcLu1zjB6SXMWFjqzO8WoV3LiUH3xJ2H6NUsyzjA>
    <xme:U8k3YAhw31HxIuV1TaRt9hnZYVEZwOqaIXjyaQf1uBOPpbYyrwolcJD4CUXe76ZIo
    Y1Kl_ZDoAnISWD-iKs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeelgdekgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:U8k3YJk7iskw7Tq3rZxC-s8-CS1CKyKlQVZaPX-xgCTQBtZiXq54Vw>
    <xmx:U8k3YExCVuWJrMke7nlHbSZjhIjPN7vI1jm_9OSG1niZOOY6FcLsyA>
    <xmx:U8k3YLRGnmdwpR2obqCNcRwr6R9QyWzcVAKj-yP8GnC9YVsNs-6Ibg>
    <xmx:U8k3YKJtn6E3oPC7fS3hVAcww_h4mkjZo5ph3wFXG3CdK_VZAIBHSJtfqq4>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 06A991080059;
        Thu, 25 Feb 2021 10:59:14 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     Phil Elwell <phil@raspberrypi.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Tim Gover <tim.gover@raspberrypi.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Subject: [PATCH 1/8] clk: Add range accessors
Date:   Thu, 25 Feb 2021 16:59:02 +0100
Message-Id: <20210225155909.1853812-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210225155909.1853812-1-maxime@cerno.tech>
References: <20210225155909.1853812-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some devices might need to access the current available range of a clock
to discover their capabilities. Let's add those accessors.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c   | 30 ++++++++++++++++++++++++++++++
 include/linux/clk.h | 16 ++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8c1d04db990d..b7307d4f090d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2407,6 +2407,36 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
 }
 EXPORT_SYMBOL_GPL(clk_set_max_rate);
 
+long clk_get_min_rate(struct clk *clk)
+{
+	unsigned long min_rate, max_rate;
+
+	if (!clk)
+		return 0;
+
+	clk_prepare_lock();
+	clk_core_get_boundaries(clk->core, &min_rate, &max_rate);
+	clk_prepare_unlock();
+
+	return min_rate;
+}
+EXPORT_SYMBOL_GPL(clk_get_min_rate);
+
+long clk_get_max_rate(struct clk *clk)
+{
+	unsigned long min_rate, max_rate;
+
+	if (!clk)
+		return 0;
+
+	clk_prepare_lock();
+	clk_core_get_boundaries(clk->core, &min_rate, &max_rate);
+	clk_prepare_unlock();
+
+	return max_rate;
+}
+EXPORT_SYMBOL_GPL(clk_get_max_rate);
+
 /**
  * clk_get_parent - return the parent of a clk
  * @clk: the clk whose parent gets returned
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 31ff1bf1b79f..6f0c00ddf3ac 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -709,6 +709,22 @@ int clk_set_min_rate(struct clk *clk, unsigned long rate);
  */
 int clk_set_max_rate(struct clk *clk, unsigned long rate);
 
+/**
+ * clk_get_min_rate - get the minimum clock rate for a clock source
+ * @clk: clock source
+  *
+ * Returns the minimum rate or negative errno.
+ */
+long clk_get_min_rate(struct clk *clk);
+
+/**
+ * clk_get_max_rate - get the maximum clock rate for a clock source
+ * @clk: clock source
+  *
+ * Returns the maximum rate or negative errno.
+ */
+long clk_get_max_rate(struct clk *clk);
+
 /**
  * clk_set_parent - set the parent clock source for this clock
  * @clk: clock source
-- 
2.29.2

