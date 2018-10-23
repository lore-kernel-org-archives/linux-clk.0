Return-Path: <SRS0=m775=ND=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADAC4C46475
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 15:51:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 746C120652
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 15:51:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Imiflp8p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 746C120652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728275AbeJXAPM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Oct 2018 20:15:12 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43933 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728366AbeJXAPL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Oct 2018 20:15:11 -0400
Received: by mail-pg1-f196.google.com with SMTP id n10-v6so124768pgv.10
        for <linux-clk@vger.kernel.org>; Tue, 23 Oct 2018 08:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o90/LNGE9upjKhzjm4op/FMEilKM/vCgfq8hDXmKf64=;
        b=Imiflp8pAB0VUbU3b//nP/qfOOs9pPcI2UxiPmJMGI1ZPfR+nxptAquSUYIsT5doA5
         4S2HXsqpScsl1Nq3AbDgfUvQz63mZoRIVxzfYb6qUzBINDm3vF8tETPxifYLyoGPGgqT
         abK0Zl2QvfHgYu7TeNXCXPBliH4IGtcEV+7t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o90/LNGE9upjKhzjm4op/FMEilKM/vCgfq8hDXmKf64=;
        b=May8c52NVF0u7YIL224Ok+K3C2EGy2jEwuDxlZtOU9y5129YsPWiq49TGML/exPolU
         nsu+tTZuXhQSrxogA+fyN3h+QWfFWsB7HW9wbueqJgG00mjzSRrmCR5v1EyJOh76WOmJ
         fN3Kw3F17BdD1CA3pmq8qBmr2ARS8mscDQ8SQQ6zKzUexnjw+SJk1jlIJNur9V+SpM+g
         CLk0bbq5aSOKCO2pjn2ymcETdK6olfpuFJd0oSnuTlpfOkTUB19nONjZ+mTM8etEwWaZ
         AXyCRzrmVZpQoN1t/MrfJG9F99AutozEdrpMwtJ8lWk2eZQNRyhDCS7vxv8OkyqT6tF4
         uH6A==
X-Gm-Message-State: ABuFfohN3+rtjC+kCVGg/QKfyPLN5deLF2Gd0YO4T0d+AOEGzEX1r44I
        rQk78/F/MgkD9rPOP9Lg6Dtb7Q==
X-Google-Smtp-Source: ACcGV618MFfAxH9ZOLOgjXtx3sU4kllTNV131HDzCFD6/jCITjF+8GvPpW//NyAt/wn5FCe4GTtMBw==
X-Received: by 2002:a62:d085:: with SMTP id p127-v6mr24323446pfg.202.1540309874761;
        Tue, 23 Oct 2018 08:51:14 -0700 (PDT)
Received: from localhost.localdomain ([27.7.51.1])
        by smtp.gmail.com with ESMTPSA id o75-v6sm7442829pfg.0.2018.10.23.08.51.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Oct 2018 08:51:14 -0700 (PDT)
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
Subject: [PATCH v2 03/15] clk: sunxi-ng: Add check for maximum rate to NKM PLLs
Date:   Tue, 23 Oct 2018 21:20:23 +0530
Message-Id: <20181023155035.9101-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181023155035.9101-1-jagan@amarulasolutions.com>
References: <20181023155035.9101-1-jagan@amarulasolutions.com>
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
---
Changes for v2:
- new patch

 drivers/clk/sunxi-ng/ccu_nkm.c | 7 +++++++
 drivers/clk/sunxi-ng/ccu_nkm.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
index d17539dc88dd..574fd2cd2a79 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.c
+++ b/drivers/clk/sunxi-ng/ccu_nkm.c
@@ -132,6 +132,13 @@ static unsigned long ccu_nkm_round_rate(struct ccu_mux_internal *mux,
 		return rate;
 	}
 
+	if (nkm->max_rate && rate > nkm->max_rate) {
+		rate = nkm->max_rate;
+		if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
+			rate /= nkm->fixed_post_div;
+		return rate;
+	}
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

