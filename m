Return-Path: <SRS0=nRqW=NY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130B5C43441
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 11:17:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D00A7223D0
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 11:17:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ToJirpXf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D00A7223D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732471AbeKMVOs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Nov 2018 16:14:48 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35729 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732526AbeKMVOr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Nov 2018 16:14:47 -0500
Received: by mail-pl1-f196.google.com with SMTP id n4-v6so5857390plp.2
        for <linux-clk@vger.kernel.org>; Tue, 13 Nov 2018 03:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qbm/NIYuuBGisaoOf8xEjZz2GqJiY+po/xAr8VTc9Ho=;
        b=ToJirpXfC1n3gWkryiJS7jnKRWpzntkBX5uluzEnPwvJIU74yr+59gNpfe4mkRJsr6
         ZQy5ESBGNxw5piaq9yvaXKHONhOWo5FwD/GIy/35Wcz5fsEQXlRk5Y84iuWdjHRgs6Gi
         s0utKmQauGwjiO5oGX1Dkw79QTh+P4obBluIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qbm/NIYuuBGisaoOf8xEjZz2GqJiY+po/xAr8VTc9Ho=;
        b=BmfUZPQ1EWJhzLIxs0LEwm+nXDtCUQ6Rhmsl9cEZIK5jrID16UKYwvcaIWvHLBPaZh
         hPLcgCMOHLVZ2s4NACCY49a5D3379ihl5fCwoSgAZvtx29zTBReUx7uH5o7vvzkbs76f
         XeMi3tWdO7XfpNSLQdCNsLO6EpALYyHtUE/NWsPQnJPYKRUOeT7RyMF6G7zb2v/3eZ6q
         AdfB5JlPc0ZvmTmL3e8NM0LSvgtUXk1zGuXVAgRfnswzq4YICtGH19+iuVY8tzGGlnK6
         vDOqd8AXTMkbYI0K5PuYAIj3PV6DNjjfSoflcpyhkaQ3HFdpHFvsa1xQ++hpjR+qT4xo
         JLUQ==
X-Gm-Message-State: AGRZ1gKCA5X/CI2APZPSLaXM7ag5YQ2gtbbRrVtD5Ik0G93/n+o1hqyV
        y3lHGSIv9qXM95yz8pwl8xfTWA==
X-Google-Smtp-Source: AJdET5f30k2tAIaqToyDxrKODYMga/iJ046M4/2dIT577ikT4Iv4sylXZhUrbjRpWQ1GftQPeTw08Q==
X-Received: by 2002:a17:902:3103:: with SMTP id w3-v6mr4770500plb.18.1542107828971;
        Tue, 13 Nov 2018 03:17:08 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:3670:3f11:bc71:2ef7:4a39:e260])
        by smtp.gmail.com with ESMTPSA id 27-v6sm28531377pfm.36.2018.11.13.03.17.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Nov 2018 03:17:08 -0800 (PST)
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
Subject: [PATCH v4 03/26] clk: sunxi-ng: Add check for maximum rate to NKM PLLs
Date:   Tue, 13 Nov 2018 16:46:10 +0530
Message-Id: <20181113111633.20189-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181113111633.20189-1-jagan@amarulasolutions.com>
References: <20181113111633.20189-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some NKM PLLs, frequency can be set above PLL working range.

Add a constraint for maximum supported rate. This way, drivers can
specify which is maximum allowed rate for PLL.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/sunxi-ng/ccu_nkm.c | 3 +++
 drivers/clk/sunxi-ng/ccu_nkm.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
index 6b5ad990f802..b8b66cdd30bf 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.c
+++ b/drivers/clk/sunxi-ng/ccu_nkm.c
@@ -128,6 +128,9 @@ static unsigned long ccu_nkm_round_rate(struct ccu_mux_internal *mux,
 	if (rate < nkm->min_rate)
 		return nkm->min_rate;
 
+	if (nkm->max_rate && rate > nkm->max_rate)
+		return nkm->max_rate;
+
 	ccu_nkm_find_best(*parent_rate, rate, &_nkm);
 
 	rate = *parent_rate * _nkm.n * _nkm.k / _nkm.m;
diff --git a/drivers/clk/sunxi-ng/ccu_nkm.h b/drivers/clk/sunxi-ng/ccu_nkm.h
index ff5bd00f429f..c82590481188 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.h
+++ b/drivers/clk/sunxi-ng/ccu_nkm.h
@@ -36,6 +36,7 @@ struct ccu_nkm {
 
 	unsigned int		fixed_post_div;
 	unsigned int		min_rate;
+	unsigned int		max_rate;
 
 	struct ccu_common	common;
 };
-- 
2.18.0.321.gffc6fa0e3

