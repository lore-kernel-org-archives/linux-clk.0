Return-Path: <SRS0=HxJ1=NG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADD8ECDE44
	for <linux-clk@archiver.kernel.org>; Fri, 26 Oct 2018 14:44:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E822F20651
	for <linux-clk@archiver.kernel.org>; Fri, 26 Oct 2018 14:44:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="IwQkeVkX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E822F20651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbeJZXVp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Oct 2018 19:21:45 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35491 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbeJZXVo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Oct 2018 19:21:44 -0400
Received: by mail-pg1-f195.google.com with SMTP id 32-v6so654052pgu.2
        for <linux-clk@vger.kernel.org>; Fri, 26 Oct 2018 07:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZqT7S7ccSlN0Z4oiBOZYnQBnDGQDeTm2f/tIRaoUEO4=;
        b=IwQkeVkXMNjUbqG8HwSVKIlFeG2UDJLGlpb32wDzc5jnDs0TKyi8UfQ8Otm3LgsIyn
         YhgeEihQGExInby1uQLx0bNRQbdAc18wdR1WUphI5NzDUErZJL62BKY36F1lQ9OobsBJ
         c539CFIjvY1RMhiGduAsTT6tjYoNdJJB4F29I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZqT7S7ccSlN0Z4oiBOZYnQBnDGQDeTm2f/tIRaoUEO4=;
        b=WkimoeFgWMfLlEp1VSqRwO1+cP0bYjvJA2XU7r92a9B/U3ZIRlD9KedWXnsmwOzR66
         R7TbFKR2snQ6NuUl1zWniWYZHAy12WTtvSX6Ufhsx4pz3oKwZ1UjnwpgRuhZM+WLneLU
         AoJGS1bIlFZpSjwPTchfupgi46xdBt6bbBfmEw/Z/SaCeDYLliJjTVw0zxLRm+bwdI5I
         oq12NcUFwEtxezURRc/YCGOhmR8TjBN4UfHaxX/rK/yGKjpseowUJZ43brWI4QoM7itX
         rnSvEOFJeG5CQSz9PajWG95iSFGahHUeu41fg+9QyA27UboqSyiZ7VEpLCZ0ymIZSZvU
         tf1g==
X-Gm-Message-State: AGRZ1gJgLd8Cjn4VdccuUPh2VzobnxvH5485hauUdFmyQFtXRaX2Khp8
        ly/ZJv4n2y3YHpaaqLPmGlwjdw==
X-Google-Smtp-Source: AJdET5dwXUrFOyiMpZ7HyN1IfRqpZo8uWMppQAsUlS9mUf0ioXHLoBiT2n/c/xkE2UhLRT+xsEUqxg==
X-Received: by 2002:a63:b218:: with SMTP id x24mr3606180pge.223.1540565063890;
        Fri, 26 Oct 2018 07:44:23 -0700 (PDT)
Received: from localhost.localdomain ([27.7.51.1])
        by smtp.gmail.com with ESMTPSA id z22-v6sm12044467pgv.24.2018.10.26.07.44.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 07:44:23 -0700 (PDT)
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
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Cc:     Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v3 02/25] clk: sunxi-ng: Add check for minimal rate to NKM PLLs
Date:   Fri, 26 Oct 2018 20:13:21 +0530
Message-Id: <20181026144344.27778-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181026144344.27778-1-jagan@amarulasolutions.com>
References: <20181026144344.27778-1-jagan@amarulasolutions.com>
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
Tested-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- collect Stephen Ack
- add tested credit
Changes for v2:
- none

 drivers/clk/sunxi-ng/ccu_nkm.c | 7 +++++++
 drivers/clk/sunxi-ng/ccu_nkm.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
index 841840e35e61..d17539dc88dd 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.c
+++ b/drivers/clk/sunxi-ng/ccu_nkm.c
@@ -125,6 +125,13 @@ static unsigned long ccu_nkm_round_rate(struct ccu_mux_internal *mux,
 	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
 		rate *= nkm->fixed_post_div;
 
+	if (rate < nkm->min_rate) {
+		rate = nkm->min_rate;
+		if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
+			rate /= nkm->fixed_post_div;
+		return rate;
+	}
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

