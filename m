Return-Path: <SRS0=c6wZ=R6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D76C4360F
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 10:33:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 54CF42075E
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 10:33:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Eb2kIHd8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733202AbfC0KdQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Mar 2019 06:33:16 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37028 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733188AbfC0KdP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Mar 2019 06:33:15 -0400
Received: by mail-wr1-f65.google.com with SMTP id w10so17895753wrm.4
        for <linux-clk@vger.kernel.org>; Wed, 27 Mar 2019 03:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ubZfmk1sd8SeT3S5sGdHmZqtBcThNhk+SkoC0cfDlwQ=;
        b=Eb2kIHd8bQAiebcsjvjIvPSAPqyFD/VmxeE6gFP/3pDGxjvUmbiTXlLOOoVHzKcE3p
         lulVBkSJznJHdRU6Brt5bTZ4kvAMOJv3WbNp9PPTEeRdB1nYzhuDRn3Pjm7KXYujQCMr
         WXOCjVuExnglIeC309C3DcygPJ2DTIbTveLyhwV4wkXa6beqgZJupFBh1Jmx6/m2v6hT
         z730pZPougYjqYh5sc5inJ92roXH/pwOGvEiL9zHJMqdhA/xF7zYhz78tD6+OPiUsJSr
         ioQEpidqez4qs/nX+US3bg1dAMqGVdyWSEDEwTg9e1FIjA7e/A/Auef8WVUuRXgrNr+K
         HBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ubZfmk1sd8SeT3S5sGdHmZqtBcThNhk+SkoC0cfDlwQ=;
        b=si1hHlyKxudU0IDl29nzJLe/8GulYjQQU+kccy3/EnYr0oqRkpSnER+VIImii4BcI9
         fxJfAlMfPkIbt9dtsxCcXpCnius5rMJLI622wsWKxjbvf1wnNJil8K8xX0CZf2YtN3vx
         WOfndpWZJAZSAMktVDURg6fyR86nRax8uDDiwxY1bw+KggA3R1OxkCYiFDggGMgaObqt
         PAFHWz9lJan3viEwQsiwf8l3mxokFoCVNIkG8ehb2WTzZldwy983fyGtiVUGNNMFcl60
         XLI9J8UONwI46Ip60vdrsKJYCe8zF7rx7ZGkpLuwd/pl7wjW3r1AghJNfKd6TybflDX0
         FkVA==
X-Gm-Message-State: APjAAAVH0ZF4Cy6Z8mVBJw3rbkfZb4HOw8i06JoAiQbb7motML400lke
        8mj8wOv234CDvLzy8345nC0rGQ==
X-Google-Smtp-Source: APXvYqzsTSVA+XfDwV+e0odc9zE7X5ZrWgkR9jUQL4dULw4D9ARqPTu6xzAgi909+AkOGHIONqaHKw==
X-Received: by 2002:a5d:5192:: with SMTP id k18mr23223973wrv.171.1553682793977;
        Wed, 27 Mar 2019 03:33:13 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id a20sm27017513wmb.17.2019.03.27.03.33.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 27 Mar 2019 03:33:12 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     khilman@baylibre.com, jbrunet@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH RFC 3/6] clk: meson: g12a: mark fclk_div3 as critical
Date:   Wed, 27 Mar 2019 11:33:05 +0100
Message-Id: <20190327103308.25058-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190327103308.25058-1-narmstrong@baylibre.com>
References: <20190327103308.25058-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Amlogic Meson G12b platform, the fclk_div3 seems to be necessary for
the system to operate correctly.

Disabling it cause the entire system to freeze, including peripherals.

This patch patch marks this clock as critical, fixing boot on G12b platforms.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 03b4c78f558f..d62ebcd2162d 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -1062,6 +1062,16 @@ static struct clk_fixed_factor g12a_fclk_div3_div = {
 		.ops = &clk_fixed_factor_ops,
 		.parent_names = (const char *[]){ "fixed_pll" },
 		.num_parents = 1,
+		/*
+		 * This clock is used by the resident firmware and is required
+		 * by the platform to operate correctly.
+		 * Until the following condition are met, we need this clock to
+		 * be marked as critical:
+		 * a) Mark the clock used by a firmware resource, if possible
+		 * b) CCF has a clock hand-off mechanism to make the sure the
+		 *    clock stays on until the proper driver comes along
+		 */
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
-- 
2.21.0

