Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795FEC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:43:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244912AbiEKOnG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:43:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244919AbiEKOnF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:43:05 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4827966AD8
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:43:04 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 7729A32003D3;
        Wed, 11 May 2022 10:43:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 11 May 2022 10:43:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652280181; x=1652366581; bh=g4
        P5DobGsF8A4M+d4ZrXtJWtd8orIRbjRbWtjuqAtRo=; b=u1royvM50U7bQYgItz
        H2dq4tceKrsj6X2FuAWRLJQiwTdLgE1ultP6QXwgCs9toxR5ZlZby49JRRyknyoP
        qjWoMIYngnJsJcucnfGcSTCsnxf8GNdFBLKhXQQnIswvIw4hAbK6rJ5JzHlpWDdU
        soo04Zvm2J+AVvw9TT5HeLDjo8TU+w5SymzKNPL6J4z6KrGlfA2SV7QNG2qc3J88
        /fr0rXntMoY4uHgvh0Eo7HSJbR+Nxgx7y/p9nsHw6zdC6tCt756L4c/0jNmIeljY
        E8qUwk0OOauoOugvzRZGLpk1tDYVwomJuDjeI8nGtr1BjtMt3+F5ISYCR8mhWf+X
        LJdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652280181; x=1652366581; bh=g4P5DobGsF8A4M+d4ZrXtJWtd8orIRbjRbW
        tjuqAtRo=; b=yg+dt550hlRiIzgtOPP6VziUzcF/OFvt6caaXFEJEE1iyaKKAwq
        quah9Y8Gz5TdwRNDSPyCM1g1GsQW3M3ad5+g+zCvFekT4OY2tEivqhbjD1E6omDW
        DGPop3BAqcX0GrZJOjKxEmNuQ9xi8tth5xEf4/IEQ7ANEGVcIrFAh+PbpNHoXMWA
        5Pm/pHQRShLna3CSBnyuVJiniy38eEtlA5mQHgqOSfXHCRZxlnWb66ZKnCja+0A4
        MCJ5k4w+eMTB4ml+/SFwQiigdZkJYgMCgErl/2npA+UTL1XS4tIeOU8QI09tTO0g
        /y1n2WMZOpRaP3yAQ+0gd8FfUMJ+TMGtkUA==
X-ME-Sender: <xms:dct7YkQFhDM1PMpSL3f-ITJWS2npYphlp246ydFpwT28BdyaHED0Pg>
    <xme:dct7Yhxyl6bhRuQv3rNEWKd4nEGYw7GoFlwPEAY_I-yzou0t3Xb8dqG5HWZx1hEGa
    8MrTz5WN2hb5HvDDOg>
X-ME-Received: <xmr:dct7Yh0WMXCRWo7sBo4UorQ2KeCgChPcy-WU_4qVsGbhojBN5U7TG36TQZXi2JjjgvHppZha36yxQNsOMfTQ56bvE7701JCatF3S_eQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:dct7YoDkY6w7mUYz15sUXJRiLNN4irOtwKnevo8ZxQ8QmDi1hqr8dw>
    <xmx:dct7YtgOFwi5eq3N_k9DxZYkHyXCMgk8Xi3qohZpsuSoA3my52GCMA>
    <xmx:dct7Ykr-LalRPIYz8t2NwWpfBV4egGrO8a-23yhKpqhaUkvsfoW1XA>
    <xmx:dct7YiYHP4bSc3F-Qc4NSXJOoO_vl0cHzWdPQ_Rp9fZIMsNU30hHsA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:43:01 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 02/28] clk: Skip clamping when rounding if there's no boundaries
Date:   Wed, 11 May 2022 16:42:23 +0200
Message-Id: <20220511144249.354775-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511144249.354775-1-maxime@cerno.tech>
References: <20220511144249.354775-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Commit 948fb0969eae ("clk: Always clamp the rounded rate") recently
started to clamp the request rate in the clk_rate_request passed as an
argument of clk_core_determine_round_nolock() with the min_rate and
max_rate fields of that same request.

While the clk_rate_requests created by the framework itself always have
those fields set, some drivers will create it themselves and don't
always fill min_rate and max_rate.

In such a case, we end up clamping the rate with a minimum and maximum
of 0, thus always rounding the rate to 0.

Let's skip the clamping if both min_rate and max_rate are set to 0 and
complain so that it gets fixed.

Fixes: 948fb0969eae ("clk: Always clamp the rounded rate")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 2a32fa9f7618..d46c00bbedea 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1341,7 +1341,19 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
 	if (!core)
 		return 0;
 
-	req->rate = clamp(req->rate, req->min_rate, req->max_rate);
+	/*
+	 * Some clock providers hand-craft their clk_rate_requests and
+	 * might not fill min_rate and max_rate.
+	 *
+	 * If it's the case, clamping the rate is equivalent to setting
+	 * the rate to 0 which is bad. Skip the clamping but complain so
+	 * that it gets fixed, hopefully.
+	 */
+	if (!req->min_rate && !req->max_rate)
+		pr_warn("%s: %s: clk_rate_request has initialized min or max rate.\n",
+			__func__, core->name);
+	else
+		req->rate = clamp(req->rate, req->min_rate, req->max_rate);
 
 	/*
 	 * At this point, core protection will be disabled
-- 
2.36.1

