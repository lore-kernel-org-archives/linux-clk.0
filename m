Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2227FC4332B
	for <linux-clk@archiver.kernel.org>; Sun, 27 Dec 2020 13:05:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6173208A9
	for <linux-clk@archiver.kernel.org>; Sun, 27 Dec 2020 13:05:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgL0NFB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Dec 2020 08:05:01 -0500
Received: from www.zeus03.de ([194.117.254.33]:37852 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726174AbgL0NFB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Dec 2020 08:05:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=F5neoJnR6nAFlx
        g0tu9sGPEvhR6L32hOiPTceJjgTjs=; b=tFqyeYowV6u+jZjBDsgUfKukJQHi3v
        EE8qhIuRYe0ufyruA1VMRbm6KpPEBB7GBcSWs4ZBZWCqDvvfgJkwMNYhv6Jyefc6
        kN6G/i5y8d3wh6PPaZDHbf0vv9w6zss3HUFZMivOjnxEbg+WW15B4CAM8Ta9pswm
        ZVirTXLsyT83g=
Received: (qmail 1501149 invoked from network); 27 Dec 2020 14:04:19 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Dec 2020 14:04:19 +0100
X-UD-Smtp-Session: l3s3148p1@PGufy3G3ZMEgAwDPXwIpAOUwDQytQs2L
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] clk: renesas: r8a779a0: add clocks for RAVB
Date:   Sun, 27 Dec 2020 14:04:03 +0100
Message-Id: <20201227130407.10991-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201227130407.10991-1-wsa+renesas@sang-engineering.com>
References: <20201227130407.10991-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 04514140e615..5be70a6a7904 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -148,6 +148,12 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
+	DEF_MOD("avb0",		211,	R8A779A0_CLK_S3D1),
+	DEF_MOD("avb1",		212,	R8A779A0_CLK_S3D1),
+	DEF_MOD("avb2",		213,	R8A779A0_CLK_S3D1),
+	DEF_MOD("avb3",		214,	R8A779A0_CLK_S3D1),
+	DEF_MOD("avb4",		215,	R8A779A0_CLK_S3D1),
+	DEF_MOD("avb5",		216,	R8A779A0_CLK_S3D1),
 	DEF_MOD("csi40",	331,	R8A779A0_CLK_CSI0),
 	DEF_MOD("csi41",	400,	R8A779A0_CLK_CSI0),
 	DEF_MOD("csi42",	401,	R8A779A0_CLK_CSI0),
-- 
2.29.2

