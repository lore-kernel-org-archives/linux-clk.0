Return-Path: <SRS0=nRqW=NY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C852C43441
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 11:19:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6347F20685
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 11:19:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="bxuNqRYp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6347F20685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732554AbeKMVQs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Nov 2018 16:16:48 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40483 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732570AbeKMVQr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Nov 2018 16:16:47 -0500
Received: by mail-pf1-f193.google.com with SMTP id x2-v6so5877951pfm.7
        for <linux-clk@vger.kernel.org>; Tue, 13 Nov 2018 03:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6bCnCXGvGb+WTYYXJyM90jNCA/shvWQ1MA/BQWovloI=;
        b=bxuNqRYpBAu9VCBSV2xKdby2vjCbZApxF6VWE7g3P467rZugpyPtHfEDsxU0jUeASu
         rs4BsJMNOfE/oqoBhzcE9jJwSUfu6iIJhC6PvIznSYG6+RFzecUfAGh2KpajM6waxJji
         XPAt7fUtRnuS5ZDB/EaLB7A8l2FAUaEgv9H7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6bCnCXGvGb+WTYYXJyM90jNCA/shvWQ1MA/BQWovloI=;
        b=Sz+1WcfHdp4hpsZXFc0JiZOMbgX5f7rKfBT2pAUk3VvmDKR2sDjmsi/ZMPCLZ7VCe2
         Qenzf8jWJpbOomwiu9S0uRYpsX2/8cqiIII4T99qWLmu3h0JLA2+mk6/gGMKFV3yfnww
         tGCaVpLHKIC9BkXSzPkQxN80zlIQKmQCjjddoo7/8J7j8CfB2Y3btiGkG+YxRRVaEaYl
         uFhykb6rXD8elsGi+gC0720ufmv5DVzA2WEbDLzy4GVDrRvj6YEDCltVWBh9VntHzUNo
         VHm1geexRzNQaZoKub1kCaxqUk4enf59WTOCpRLCSvwNPNmnmi8BumovygyKZDNwUZr2
         t3Dw==
X-Gm-Message-State: AGRZ1gKm9jufAfeJkdvAou3uELFF4KYWkwhJklqaFDBruYBEiEdYaKLM
        Zy3i90p01l8s6ZEP9QK6VUFo6A==
X-Google-Smtp-Source: AJdET5eaF1s0sTZp6ao9W52tLpPWrw8U7gFiJUfLK07iH+OQgequAz4aORnm+trYbFgKmqBjhOmZFA==
X-Received: by 2002:a62:7687:: with SMTP id r129mr2444437pfc.17.1542107948545;
        Tue, 13 Nov 2018 03:19:08 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:3670:3f11:bc71:2ef7:4a39:e260])
        by smtp.gmail.com with ESMTPSA id 27-v6sm28531377pfm.36.2018.11.13.03.19.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Nov 2018 03:19:08 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
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
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        linux-amarula@amarulasolutions.com
Cc:     Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v4 22/26] clk: sunxi-ng: a64: Add min and max rate for PLL_MIPI
Date:   Tue, 13 Nov 2018 16:46:29 +0530
Message-Id: <20181113111633.20189-23-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181113111633.20189-1-jagan@amarulasolutions.com>
References: <20181113111633.20189-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Manual noted to use PLL_MIPI rate 500MHz to 1.4GHz,
but lowering the min rate by 300MHz can result proper
working nkms divider with the help of desired dclock
rate from panel driver.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index 019d67bf97c4..5a3a5b821f8b 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -167,6 +167,8 @@ static struct ccu_nkm pll_mipi_clk = {
 	.n		= _SUNXI_CCU_MULT(8, 4),
 	.k		= _SUNXI_CCU_MULT_MIN(4, 2, 2),
 	.m		= _SUNXI_CCU_DIV(0, 4),
+	.min_rate	= 300000000,		/* Actual rate is 500MHz */
+	.max_rate	= 1400000000UL,
 	.common		= {
 		.reg		= 0x040,
 		.hw.init	= CLK_HW_INIT("pll-mipi", "pll-video0",
-- 
2.18.0.321.gffc6fa0e3

