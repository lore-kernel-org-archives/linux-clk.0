Return-Path: <SRS0=VLoV=QA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03540C282C5
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 20:00:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CB77721726
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 20:00:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="jl0+3mCU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731759AbfAXUAP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jan 2019 15:00:15 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38867 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731905AbfAXUAN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Jan 2019 15:00:13 -0500
Received: by mail-pf1-f196.google.com with SMTP id q1so3529378pfi.5
        for <linux-clk@vger.kernel.org>; Thu, 24 Jan 2019 12:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EEGBFedCv0eGIwFBpPqp7aDi2x6OUg3hp3DvnJn01c8=;
        b=jl0+3mCU+nCI7YGq+itsqShkC/SfgVti3hEQ1ulSvukcgTB3ChDjHL1au/xyTtFmei
         gQYNExKO3Imrr0vQPZTTFzsBWG6MQKp50I0UaMarYeGQsx7pcN3ZG13p/jAWqjEKAxqo
         po5DR55psBPduQb+2DpXUqolNrzeewmlxyKzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EEGBFedCv0eGIwFBpPqp7aDi2x6OUg3hp3DvnJn01c8=;
        b=dcIPbw2LtiWVIioM7x3UEgdMPz2uBXHYLrkm9BLHkLTHpXSCyIDv5/X2vAcHNqOR7L
         FIkEZgug0V+PscED+cjwTCkcmmFVeO4O0bEeb4pdBPwSGeNWZV7L42mBu1SA67itmEK9
         jXQvOnc+qHHxDJgPhHWEp4m+tcDEOYdjbgef4bVeWE8I98i5fDB3y2e5pU4WMJC6r4ON
         i1rW7In+s61N+VHVuzY0Xufz3m9NVVrKQ953jt4q7TW5oQh1qPaYeA8DWNvM+BlCeGNQ
         AIjzZrDQRAI5RTd/l/DnLBzdmc4cymaw7uLN8vOeSaFNlVS334CaCbZ6/xMLRddUTfmQ
         FkxQ==
X-Gm-Message-State: AJcUukev25jknQU4dVIJQS5fLhyrpKQfnoIeA4nUVaN2Q6pYp0CB1dHe
        r4XlS3NkaF97vJWp3ZChPx8pyw==
X-Google-Smtp-Source: ALg8bN4X3/hdgvk+W8P6tImZrbs+xvmgwlVFgfOK7unjfkPgCq8ckI457VZI6BJ2wPT55mSjYoPRvw==
X-Received: by 2002:a62:3943:: with SMTP id g64mr7995857pfa.114.1548360012725;
        Thu, 24 Jan 2019 12:00:12 -0800 (PST)
Received: from localhost.localdomain ([115.97.179.75])
        by smtp.gmail.com with ESMTPSA id x11sm61637003pfe.72.2019.01.24.12.00.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Jan 2019 12:00:12 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-amarula@amarulasolutions.com, linux-sunxi@googlegroups.com,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v6 10/22] clk: sunxi-ng: Add check for minimal rate to NKM PLLs
Date:   Fri, 25 Jan 2019 01:28:48 +0530
Message-Id: <20190124195900.22620-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190124195900.22620-1-jagan@amarulasolutions.com>
References: <20190124195900.22620-1-jagan@amarulasolutions.com>
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
 drivers/clk/sunxi-ng/ccu_nkm.c | 5 +++++
 drivers/clk/sunxi-ng/ccu_nkm.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
index 841840e35e61..096ff4f4839a 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.c
+++ b/drivers/clk/sunxi-ng/ccu_nkm.c
@@ -125,6 +125,11 @@ static unsigned long ccu_nkm_round_rate(struct ccu_mux_internal *mux,
 	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
 		rate *= nkm->fixed_post_div;
 
+	if (rate < nkm->min_rate) {
+		rate = nkm->min_rate;
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

