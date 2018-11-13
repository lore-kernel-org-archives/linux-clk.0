Return-Path: <SRS0=nRqW=NY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C53C43441
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 11:17:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50B33223D0
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 11:17:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="CT5tzK3F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50B33223D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732389AbeKMVOl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Nov 2018 16:14:41 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37184 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732474AbeKMVOl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Nov 2018 16:14:41 -0500
Received: by mail-pf1-f194.google.com with SMTP id u3-v6so3202954pfm.4
        for <linux-clk@vger.kernel.org>; Tue, 13 Nov 2018 03:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yqEP2BzZ2jXeAZHhd1kTnxj7Hp6aFHA67iUShP1YZAg=;
        b=CT5tzK3FIIhy1SV/dTYRZshieXYn7lZws4/N07d+OFM1y06E6ppEDYyoNj4z+DiXHJ
         PKZOi3485lOdSDvdmpJfx1lIHydjsICF2QEc3hqlBgn9iLvI0p8LwUgC39dsfYEJVgI1
         QjDVkRit1N407Ya9Vob3dqzxremR9OfsQ4uRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yqEP2BzZ2jXeAZHhd1kTnxj7Hp6aFHA67iUShP1YZAg=;
        b=lJX6AKSzbWtP3vIVWcdkAhFSpOyrAoztjdfjY/Kxof63k0r9k39sPQdSoHCHBhYFEa
         KJQnAWYmpKdsxa7Kqkue7Hh29KcHkhKirwHwgykkLpSwTVPIsJHpkQpfID1g4FaObksg
         LLQqFEsWuPuJpErzB7M7f+kXK1KAMHSe0rG3aNL7rBKFkJtrMvCU2aX0z9skyD9LAnvE
         Q1pQw7w7qEiWxjby+Uh3GdDb0nuzR+IPGB/l/7P2Xf/Hsg4/PKtPlDAWE1ARmKMrIdqt
         T7D0bLjNs2uP2v2CQK8B9bP9uoiIyzuebbJ5dg3Hlfbys5C2QegFO2B6Y4wDWDtLEstt
         XIOw==
X-Gm-Message-State: AGRZ1gLNLZGPGidPo8OgDeGJyk8wFnZ/K7pg+cNg7LHGp/lVa1uCOHt8
        l+EXAR1IxEFz7GbYl1lk35eOPg==
X-Google-Smtp-Source: AJdET5cmMrWyjSS6C6l9voHS7ZTX4u3lJ5zBE7LPx1Im9I1AC8wCAE6QwyFo514E2Hznjq6ngUFrDA==
X-Received: by 2002:a62:1709:: with SMTP id 9mr3422529pfx.249.1542107822825;
        Tue, 13 Nov 2018 03:17:02 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:3670:3f11:bc71:2ef7:4a39:e260])
        by smtp.gmail.com with ESMTPSA id 27-v6sm28531377pfm.36.2018.11.13.03.16.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Nov 2018 03:17:02 -0800 (PST)
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
Subject: [PATCH v4 02/26] clk: sunxi-ng: Add check for minimal rate to NKM PLLs
Date:   Tue, 13 Nov 2018 16:46:09 +0530
Message-Id: <20181113111633.20189-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181113111633.20189-1-jagan@amarulasolutions.com>
References: <20181113111633.20189-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some NKM PLLs doesn't work well when their output clock rate is set below
certain rate.

So, add support for minimal rate for relevant PLLs.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/sunxi-ng/ccu_nkm.c | 3 +++
 drivers/clk/sunxi-ng/ccu_nkm.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
index 841840e35e61..6b5ad990f802 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.c
+++ b/drivers/clk/sunxi-ng/ccu_nkm.c
@@ -125,6 +125,9 @@ static unsigned long ccu_nkm_round_rate(struct ccu_mux_internal *mux,
 	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
 		rate *= nkm->fixed_post_div;
 
+	if (rate < nkm->min_rate)
+		return nkm->min_rate;
+
 	ccu_nkm_find_best(*parent_rate, rate, &_nkm);
 
 	rate = *parent_rate * _nkm.n * _nkm.k / _nkm.m;
diff --git a/drivers/clk/sunxi-ng/ccu_nkm.h b/drivers/clk/sunxi-ng/ccu_nkm.h
index cc6efb70a102..ff5bd00f429f 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.h
+++ b/drivers/clk/sunxi-ng/ccu_nkm.h
@@ -35,6 +35,7 @@ struct ccu_nkm {
 	struct ccu_mux_internal	mux;
 
 	unsigned int		fixed_post_div;
+	unsigned int		min_rate;
 
 	struct ccu_common	common;
 };
-- 
2.18.0.321.gffc6fa0e3

