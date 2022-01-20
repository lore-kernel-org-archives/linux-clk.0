Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4966C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jan 2022 14:34:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350606AbiATOed (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jan 2022 09:34:33 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:39221 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242716AbiATOed (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jan 2022 09:34:33 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 2D18B3201E15;
        Thu, 20 Jan 2022 09:34:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 20 Jan 2022 09:34:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; bh=14u3x6rDB7hRy6nMQzlAJuztS+b0Xn
        uFuIFqX2ftyq8=; b=g2CDotiXOwltsZT+mGgjw+GBamfE4t13xaXSBXmZc0jSWs
        21ZGybd2ic77YyZEb2/eBXA5zXyTaPVaqJgyLx97vAOuaAAuuIAu995SyvZvuxIc
        p8veWVdni+0TrEK79ewrNJJEBTtmFwN1EwoIV/0UaErNaB0eQ7BmuqYBsYlkmDeA
        gyF6lVj9VaQPiCL/ZlZtqCGZ1FigkhWqMyWN3AlBjo2k9y9kZuRXtn7LHwKQM4Tu
        PoJaf3g96Z94zkzV9k2iBrXuPXyJI6++1hIbvtYrX6L9WVBAly6YAhaFAoCZtigL
        Fzspm/ilxfdyeFJvsTMChGW4+DGDIfSDGdgoR+FQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=14u3x6
        rDB7hRy6nMQzlAJuztS+b0XnuFuIFqX2ftyq8=; b=aWoXcQ5w/eL4MBP0mF8niq
        cB4cV8MPWGjGAfgG4Ui5oJsi0SwMmM6FrWQg2iULS90b2fLAIuz+dEZVOoA8Kdlf
        vyNvkH0n3eBnDjPuJ902u7Y359+GqACQrfuq8ma0HAwOlxHjhRR93HO+GFRgb4Eq
        R72sX6lFP1JHcgEgo4/NgPo5GY2bU90Fs1ThPnJa0pUzCfPoI2CfWEx1ltgisKzx
        dI1eXhZ5feulamq/uGuBJnHzTLiHBXbsvuQUFNGS88X/SQMxo5raqFKchjhd7VrZ
        tzS54jvSOBU2wCwfthHS0Ykh3gWY+O/OgwXMmpEumeuvwaCVUlkzkJgtfQcp+KHw
        ==
X-ME-Sender: <xms:93LpYfnTGHsqKUzBucoiUQopfIv04WHCwr5koDkNF9i-4zMXaF8tlQ>
    <xme:93LpYS0ThlduMX7JnRzfeKlyfbwvbSigwTs9bHZ-Vwb6VhNyJOAOAx3Y2wT-sysLI
    69qnY1uuCNUj2NPCCA>
X-ME-Received: <xmr:93LpYVrwLGRhppMuplfhJKMMwBi2oifSlKecJhQ6qaLGCRHNBdHtKRzM_GbdRcuqTH02exh5fI481ThZ-ukU-Piu6zAlqXTQvtnxXgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:93LpYXme7uqpnC4kiSX7kp5tDvzblkU0k25caPfw7zWYo_jC5fizIw>
    <xmx:93LpYd3zyavCS30ynfU_Nupx4uD-byNi4ma_Hj0cNIfubsqmZwoBDA>
    <xmx:93LpYWv_t4yPQhQjU94wd-A5aP6C0Nm-fPP9in6pOaXgNU6syA-NJg>
    <xmx:93LpYanC_sdrC3jN7npORHYnAxryzh5ER-1MVT2hgBXfKNAD4G6jxQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 09:34:30 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 03/10] clk: Use clamp instead of open-coding our own
Date:   Thu, 20 Jan 2022 15:34:10 +0100
Message-Id: <20220120143417.543744-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120143417.543744-1-maxime@cerno.tech>
References: <20220120143417.543744-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The code in clk_set_rate_range() will, if the current rate is outside of
the new range, will force it to the minimum or maximum. This is
equivalent to using clamp, while being less readable. Let's switch to
using clamp instead.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7bb5ae0fb688..150d1bc0985b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2365,11 +2365,7 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 		 *   this corner case when determining the rate
 		 */
 
-		if (rate < min)
-			rate = min;
-		else
-			rate = max;
-
+		rate = clamp(clk->core->req_rate, min, max);
 		ret = clk_core_set_rate_nolock(clk->core, rate);
 		if (ret) {
 			/* rollback the changes */
-- 
2.34.1

