Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C5CC77B75
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:27:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjEEL1H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbjEEL1D (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:27:03 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B14CE1AEE9
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:26:36 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id EF0B732008FB;
        Fri,  5 May 2023 07:25:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 05 May 2023 07:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683285941; x=1683372341; bh=9ATm+S7/borfFuiLWZD4VxeCVHiXEN0Lx6p
        r2H7k/wM=; b=IqsoQNcFTRMyM7j+kPFN9SYHyAP3Nwd0G79gIcoA1wWva1U8nqn
        LhJ70ys3yBXa2D7vCCiiWOn183AWD+j+LdTJ6bS3yYCtOH3IXZh0q/AUYfTSOGms
        sQoEeCSfE2g1ntiEyEJPMYdY5s4uKx24I6FDHEcOt2TI1ufSxBznE8ewHAqBbCRt
        45OFzzIqKx7LcVavlWeVkBj2584p0D/N9vcDc4yqyEqXQHlXOxNApTEDt3hBdjgV
        yaW8ceJV9A/BWDgUyiY/m8tSP6BOgde/KXhtf4cJIsQDGqX6oEfyGPpAo8a+V/qL
        98Jn6389ecR+2e9kXgSOmEN+qMWMBMiclLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683285941; x=1683372341; bh=9ATm+S7/borfFuiLWZD4VxeCVHiXEN0Lx6p
        r2H7k/wM=; b=ZrvaqM3jpHfEiOr3mPuSXpgakU8Zon/NKw7+n8k45MrXZaiOzQg
        mvlDMlctqPZzoxltdhOUBXGALSiprBVVYYqEDNbOkgksYR0kpPWt8wgpOpRUT4Tg
        awmnCFrLDCUYZ6DkQ18kp/GfHYHlYfQeARhpYA9q9wPUmk50kxQv8CW1z6Jp8IFy
        /24Nb2viT6VQEM/I1eue+wOQ+kaVEln5BwcdoNbVGPYtGSlXCfgVZTjl8xw3kWKn
        Q0sLb7sLQOKKKERP4WopwsKIOku0IzchhdsURbmUBx5ukG6ezd+GdB3Er/BGRY5i
        442dKo1kxsOKrNZY/CToYp5affHugoEThSw==
X-ME-Sender: <xms:tedUZAwgHxoK80DtpoLXBSakYpjQHX51dw8JQYZRURtr-OFXIXMExw>
    <xme:tedUZESJEVFO9qQIXOJbfqWMhtPCB8QiWuki8kZerqg2GVuMqjfKjVAoCSiDTb_gA
    qD56CPejXBLKtkN-VU>
X-ME-Received: <xmr:tedUZCXi2r-n8pgbZV6RFuwfCaEyh9ncMKEq0SReNL-vjzsLIsPS4mYXPM4l6vpTAPzb441bVENQ8dPZe9BwG8p8ChwEeig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:tedUZOjzXix_Ee089De1pS8y0jJ2XeVIVe267jSRoo6ZDD-8wbfNMw>
    <xmx:tedUZCAOtHkXtPiu8AAJhpyu4JYgjOLX9Yi_gr2n0k8H-cbmnyTCZA>
    <xmx:tedUZPJfwdyEsrcGYCG5RZG2HnRWm_ISzbV6Jtb2tA7ne6hNSoE5NA>
    <xmx:tedUZFO_Zizz3k5dK4Vd18Q5xKJfynLiz5j5Y9pYiNj_IkmMVPd6rg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:25:41 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:04 +0200
Subject: [PATCH v4 02/68] clk: test: Fix type sign of rounded rate
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-2-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2144; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=gIoYnLAUZ6zdey/9Hw3lAQE8iGG4goiV7JckSXzeF5E=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxf57F2/49ikh1s2Sx7fNW3pT0tPb0+bENFnHKvP3u5P
 /rX/UkcpC4MYF4OsmCJLjLD5krhTs153svHNg5nDygQyhIGLUwAm0v6fkaH50JzvcVf5PgdG9DMssb
 D/8HtJyyWZY7ZXrq5JiKr3/r6dkWFj0Itvn5UFaze3TiiaOyFPaMKb66t9dqZzLv/IE/18fQwDAA==
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk_round_rate() may return a negative error code, but most of the
variables we defined to store its returned value are unsigned.

This obviously leads to issues on error.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index f9a5c2964c65..2cb51153750d 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -266,7 +266,8 @@ static void clk_test_round_set_get_rate(struct kunit *test)
 	struct clk_dummy_context *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
 	struct clk *clk = clk_hw_get_clk(hw, NULL);
-	unsigned long rounded_rate, set_rate;
+	unsigned long set_rate;
+	long rounded_rate;
 
 	rounded_rate = clk_round_rate(clk, DUMMY_CLOCK_RATE_1);
 	KUNIT_ASSERT_GT(test, rounded_rate, 0);
@@ -851,7 +852,7 @@ clk_test_orphan_transparent_multiple_parent_mux_set_range_round_rate(struct kuni
 	struct clk_multiple_parent_ctx *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
 	struct clk *clk = clk_hw_get_clk(hw, NULL);
-	unsigned long rate;
+	long rate;
 	int ret;
 
 	ret = clk_set_rate_range(clk, DUMMY_CLOCK_RATE_1, DUMMY_CLOCK_RATE_2);
@@ -1090,7 +1091,7 @@ clk_test_single_parent_mux_set_range_round_rate_parent_only(struct kunit *test)
 	struct clk_hw *hw = &ctx->hw;
 	struct clk *clk = clk_hw_get_clk(hw, NULL);
 	struct clk *parent;
-	unsigned long rate;
+	long rate;
 	int ret;
 
 	parent = clk_get_parent(clk);
@@ -1120,7 +1121,7 @@ clk_test_single_parent_mux_set_range_round_rate_child_smaller(struct kunit *test
 	struct clk_hw *hw = &ctx->hw;
 	struct clk *clk = clk_hw_get_clk(hw, NULL);
 	struct clk *parent;
-	unsigned long rate;
+	long rate;
 	int ret;
 
 	parent = clk_get_parent(clk);
@@ -1158,7 +1159,7 @@ clk_test_single_parent_mux_set_range_round_rate_parent_smaller(struct kunit *tes
 	struct clk_hw *hw = &ctx->hw;
 	struct clk *clk = clk_hw_get_clk(hw, NULL);
 	struct clk *parent;
-	unsigned long rate;
+	long rate;
 	int ret;
 
 	parent = clk_get_parent(clk);

-- 
2.40.0

