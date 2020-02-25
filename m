Return-Path: <SRS0=Mizi=4N=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B2CC35DE1
	for <linux-clk@archiver.kernel.org>; Tue, 25 Feb 2020 13:42:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA3272064A
	for <linux-clk@archiver.kernel.org>; Tue, 25 Feb 2020 13:42:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="RL8mmcLV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G5JoxY8H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729810AbgBYNmx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Feb 2020 08:42:53 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:36683 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728981AbgBYNmx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Feb 2020 08:42:53 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 9A55E21583;
        Tue, 25 Feb 2020 08:42:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 25 Feb 2020 08:42:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=ZDhCy/y8yyPtBzPxZ7Aj2t/INM
        hyzo12HfiiZ7ioDu4=; b=RL8mmcLVg5+DphyQCelzR0ZlT7kacbt9kFeG1ddqfJ
        u/kJBPBeF9qWqyWC57FYbjVJlZKTbJx26MObjSQBcATy5rKpPOcz1BXjZJEBdvzw
        IOJvmZr96uNmdDmpVlyaPAf88Vgf7Lsowu548TiZ8Q5gGFEKJO9bljbXVPwmEBRj
        MYsf6G84UjyqT594l3gE9c7x8EEV5/zLQSvB/xjetUqH5QXyTy6R2qb2VYeBiKkW
        grlYUclufUdRtlT3Aap6mE96RRqDfdyr8UK8qonQ4dF5DXVKkHKw4BfNFcex4Aj6
        Jw5XbmCLEViR4AnH3Hg3ODhm9WRYlydFEUzJ26WVgbXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ZDhCy/y8yyPtBzPxZ
        7Aj2t/INMhyzo12HfiiZ7ioDu4=; b=G5JoxY8HqspBY55gQbCeR88ubQqO5Gl09
        g1j9oWN2IiCm2uLP5jHqE5lauSAke4/0iKlkK3qYs6cz/y9WRFB5w9acAbR1Y1zk
        XI6jlNC3Y5A+alLbcbhzLd4kTX+3prE20V9gPFws/WeIunrDGiivAWWpqqWEJsZH
        mPZm54ocQd7ZLINrr+3F7FpYF62ag7GwHk6o2LcrIzWzlpkexnKaE+N8ezWJuaSg
        vByoRaZn9K/GfjvB+chVbQp+2fWK9He4/7qEfPwytQSvbBUI22rChkNl6Np7yS6S
        RArc8+R3fu1GK9o8qA8Fkh8NZ8LKsarVW1Jyh60J5wRInB9eb4mPA==
X-ME-Sender: <xms:WyRVXip8D03nUG0yCpfjhvFVI_sVoAvFaoqHINXGN4VgI274dIIRBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledvgdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
    ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrdekle
    drieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:WyRVXmesNuHmTnNP59hnjcrPE2cS5s0p6rrDsxQO-bmSWd9fLcmhMg>
    <xmx:WyRVXsgroIsobdcPS3hCyBdK1HzSUMJd3Lo2VezYCbLEk2FjudWyqw>
    <xmx:WyRVXsOZw-nqEKKOpJmpfAXgIkhcsQv-kYlVER77zW4JgATY_wkOlw>
    <xmx:XCRVXiEnsincG-x-p9BvRqePhITkxnwqOJC-y9IGly2ziqapArKmSA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4FE7C3060FE0;
        Tue, 25 Feb 2020 08:42:51 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] clk: Fix phase init check
Date:   Tue, 25 Feb 2020 14:42:48 +0100
Message-Id: <20200225134248.919889-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Commit 2760878662a2 ("clk: Bail out when calculating phase fails during clk
registration") introduced a check on error values at the time the clock is
registered to bail out when such an error occurs.

However, it doesn't check whether the returned value is positive which will
happen if the driver returns a non-zero phase, and ends up returning that
to the caller on success, breaking the API that implies that the driver
should return 0 on success.

Fixes: 2760878662a2 ("clk: Bail out when calculating phase fails during clk registration")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ebfc1e2103cb..f122e9911b57 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3344,6 +3344,7 @@ static int __clk_core_init(struct clk_core *core)
 	int ret;
 	struct clk_core *parent;
 	unsigned long rate;
+	int phase;
 
 	if (!core)
 		return -EINVAL;
@@ -3457,8 +3458,9 @@ static int __clk_core_init(struct clk_core *core)
 	 * Since a phase is by definition relative to its parent, just
 	 * query the current clock phase, or just assume it's in phase.
 	 */
-	ret = clk_core_get_phase(core);
-	if (ret < 0) {
+	phase = clk_core_get_phase(core);
+	if (phase < 0) {
+		ret = phase;
 		pr_warn("%s: Failed to get phase for clk '%s'\n", __func__,
 			core->name);
 		goto out;
-- 
2.24.1

