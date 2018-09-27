Return-Path: <SRS0=b9GY=MJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D02C43382
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 11:49:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F05821531
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 11:49:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="TdBx1pDQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F05821531
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbeI0SHR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Sep 2018 14:07:17 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37626 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727294AbeI0SHR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Sep 2018 14:07:17 -0400
Received: by mail-pf1-f196.google.com with SMTP id x26-v6so1744737pfn.4
        for <linux-clk@vger.kernel.org>; Thu, 27 Sep 2018 04:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rLT1GifvrqLqDc26F7zMlTRS3INNzOgCgNw2mNmNj04=;
        b=TdBx1pDQyyeHVrK31tunjMcjPQT/5inOT28qYX7tBrDNOvhX73XmqM+1hI3WBRWReo
         vjBu+YlQ744mFL7gQa6Ls1FFsC8qhjyXIqdUizMoJJEgQN2Q+sSFtiJQsCpQPPRLywpg
         2usYZzKtxRZrTtjbtklXjZbZ4yco2kfDFg7Ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rLT1GifvrqLqDc26F7zMlTRS3INNzOgCgNw2mNmNj04=;
        b=KidYto/HqMTwX47ds51aPun6FqMxk6DMCBv5mqB7D9A1Edr+n2Qffj0dWAciF6PBY6
         8UGXWfBuiAkju9LhWpMCZDLiOfrrHb1hvlGg/WiJWCZpOyz3DhVDtrUl5ufXQ9Ldoi2i
         E9EAkz2KanxyMOx8zYN0vh9DqErXA6MWxdd2Cu7WLrY5vitjRMbIdaqcQizpQIpuL2Kn
         /wFdTTWah4U6AOH2DUSsbg8gZAcNR4waTi9KdncmE/MoJZfWBDsoP0tWO32/oAdVpwS/
         tdqMMIJkhZJ16doSpYbkW+rgZh87R09Uvn1iNect3SQGWIceDbVi7fv/AmHAyuABvgga
         9fFA==
X-Gm-Message-State: ABuFfojwky3kr/Uj9KE42Cb8bRi4kuE+wF1I2CjV1yuUf2W2Am0DIZ1a
        zTKajIw6KWgSJwCmBqxt5U54tw==
X-Google-Smtp-Source: ACcGV615Klfjg0ZeS+7PTDM26zxgDigtBYfLaaLQeqlGQzeGVRDg30jhXyUaG3IBTXXDx1dHAdKpVQ==
X-Received: by 2002:a17:902:6848:: with SMTP id f8-v6mr574090pln.27.1538048961935;
        Thu, 27 Sep 2018 04:49:21 -0700 (PDT)
Received: from localhost.localdomain ([183.82.230.83])
        by smtp.gmail.com with ESMTPSA id v36-v6sm3744872pgn.85.2018.09.27.04.49.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Sep 2018 04:49:21 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Cc:     Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 01/12] clk: sunxi-ng: a64: Fix gate bit of DSI DPHY
Date:   Thu, 27 Sep 2018 17:18:39 +0530
Message-Id: <20180927114850.24565-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20180927114850.24565-1-jagan@amarulasolutions.com>
References: <20180927114850.24565-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180927114839.JaCBXrx6XYkvt-8GrhNutEFQ6Q5h11jr5aaN7QI6THs@z>

DSI DPHY gate bit on MIPI DSI clock register is bit 15
not bit 30.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index 5f80eb018014..b639e79641df 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -581,7 +581,7 @@ static const char * const dsi_dphy_parents[] = { "pll-video0", "pll-periph0" };
 static const u8 dsi_dphy_table[] = { 0, 2, };
 static SUNXI_CCU_M_WITH_MUX_TABLE_GATE(dsi_dphy_clk, "dsi-dphy",
 				       dsi_dphy_parents, dsi_dphy_table,
-				       0x168, 0, 4, 8, 2, BIT(31), CLK_SET_RATE_PARENT);
+				       0x168, 0, 4, 8, 2, BIT(15), CLK_SET_RATE_PARENT);
 
 static SUNXI_CCU_M_WITH_GATE(gpu_clk, "gpu", "pll-gpu",
 			     0x1a0, 0, 3, BIT(31), CLK_SET_RATE_PARENT);
-- 
2.18.0.321.gffc6fa0e3

