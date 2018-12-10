Return-Path: <SRS0=Ck/k=OT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19241C5CFFE
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 16:18:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2EE920672
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 16:18:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="oMpl0ALA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2EE920672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728671AbeLJQSO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 11:18:14 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34033 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728648AbeLJQSM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Dec 2018 11:18:12 -0500
Received: by mail-wm1-f65.google.com with SMTP id y185so6989846wmd.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Dec 2018 08:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SS22PqBK8tWsdyn/FHAwZUavV4dNBBIV2/QUJd77h4k=;
        b=oMpl0ALA9vxGolpUGRPXPTFTlEuGqt8XU2UW+J1+kRVNZR+UkFW6NZi54Y1+q4yANF
         A5ShHj6CNV/Moj5lVh3DVAF17KqVl1oKB01MPypxImmzV+qjVOFe5y4+34Tn/DBLWaIC
         OYOnhYgZcZaax7fueoKLt1tiXL60i45TtsUgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SS22PqBK8tWsdyn/FHAwZUavV4dNBBIV2/QUJd77h4k=;
        b=k79YTp8YFVy5TuW7g7cNWMzv8ICI2bLwFjhycisOsIOrzqNJ24qm/iFWXCSeiIg0h8
         Vk5LUD/OcProIWBqqb0E/NYK0u9RZBsnlEB0XxRtOIUszGcfSc8AxUd1sXHbyXUBe4mF
         bVKLoqL3v9FdH97re1OQsY0OW1NXJ7EbFzCAF95KwIyxB40TqBAi5Ag56Kf+gWIhaXzO
         JRxaTKt8meYpshyMXE39D8V+DTOQ0MUTYSfIhANUajF0TcRxsVEXmEIJirp4kXhVxpCC
         IFewCib5o0DK5gb+CuG8d8Gz6ZGZ1Fz8JinX6yUMBQ7b3m7+MMG/UYpjbxr8tk/zmWh4
         x87w==
X-Gm-Message-State: AA+aEWbXA3BQ3g8FMLmYCF6kH+g0byLvMJW9I8H1QIQduAT59XNAaHTO
        ZAGzao4s8lQo/bale7OtX3OEGg==
X-Google-Smtp-Source: AFSGD/UkunrLdyF1uFFqybjHZqBmchG32sEgRXZF3wFvzKBtIfF3Z3WDnTjOxaEb/dtfoyprq4epaA==
X-Received: by 2002:a1c:990c:: with SMTP id b12mr11710901wme.106.1544458690275;
        Mon, 10 Dec 2018 08:18:10 -0800 (PST)
Received: from localhost.localdomain (ip-162-59.sn-213-198.clouditalia.com. [213.198.162.59])
        by smtp.gmail.com with ESMTPSA id b13sm8397503wrn.28.2018.12.10.08.18.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Dec 2018 08:18:09 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        linux-amarula@amarulasolutions.com,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v5 15/17] clk: sunxi-ng: a64: Add minimum rate for PLL_MIPI
Date:   Mon, 10 Dec 2018 21:47:27 +0530
Message-Id: <20181210161729.29720-16-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181210161729.29720-1-jagan@amarulasolutions.com>
References: <20181210161729.29720-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Minimum PLL used for MIPI is 500MHz, as per manual, but
lowering the min rate by 300MHz can result proper working
nkms divider with the help of desired dclock rate from
panel driver.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index 181b599dc163..b623c8150b4f 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -183,6 +183,7 @@ static struct ccu_nkm pll_mipi_clk = {
 	.n		= _SUNXI_CCU_MULT(8, 4),
 	.k		= _SUNXI_CCU_MULT_MIN(4, 2, 2),
 	.m		= _SUNXI_CCU_DIV(0, 4),
+	.min_rate	= 300000000,		/* Actual rate is 500MHz */
 	.common		= {
 		.reg		= 0x040,
 		.hw.init	= CLK_HW_INIT("pll-mipi", "pll-video0",
-- 
2.18.0.321.gffc6fa0e3

