Return-Path: <SRS0=E8mG=X2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CF1C388F3
	for <linux-clk@archiver.kernel.org>; Tue,  1 Oct 2019 11:55:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9CFF821920
	for <linux-clk@archiver.kernel.org>; Tue,  1 Oct 2019 11:55:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="grap3Gg+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732719AbfJALzT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Oct 2019 07:55:19 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35812 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732621AbfJALzT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Oct 2019 07:55:19 -0400
Received: by mail-wr1-f68.google.com with SMTP id v8so15169071wrt.2
        for <linux-clk@vger.kernel.org>; Tue, 01 Oct 2019 04:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vWHRyjfWyVAvZ0d9limuIhAOHFkppMKjucGsUpwzYtI=;
        b=grap3Gg+njPsUDZJvi+5N988zkuIY9UxxiAnU0VRPLMx9Jncik4nhsgWikB914Y81p
         YMzi2iGLOSGmwKQVRjeJ6zBWv3/Aswn+qpQu4m4WJrjY8rFmHY2VHjH/RXe+QsS2zVLo
         sUKDy2c/Zixv4brzqxdE9UJgQ8HRJ3PIvUknjLcCh06funyQ8MykRmuAvH2n8fVPN7/i
         iSmQ95R6Hq0PxY965QoDJoytnlOv6jF2jxJuPCPEpHC9f2bpaSAtUW2YTKOn8OLlGIoh
         HDCZo7+1c3De/vwmxCRZB/3mQS4OoFugLFf3CMevQ/aX7ZZJDza4ZEZb4Q13lNEoQZpB
         nAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vWHRyjfWyVAvZ0d9limuIhAOHFkppMKjucGsUpwzYtI=;
        b=Yhm250dpz6NeXx8nYLWWAnejUr+4OPxRdkEo7Wht1PX4BXqZh2qt26sjbwEIWYCeUy
         nAzN7XsBD82NaU+wQrxhjsijxR+503XAUUvh1GBRvSblufd/E5iJXqp65myZZS7J6usE
         G0KJ2rDYqJP7rmhnqESI/uxFK5+fUlDBCHFb0T8fCKs6iixUpbxx1slYM3Lt4i6qDQWW
         uxYJEGjQk7Van0+NQC6y5douitW53wCDmhhqULjgYw16222z6lSCts8nm262fEwEfDjg
         tu12auEJO0ClhWlBomI1FOhHT4nOrBu70n82fEENboc7O31jCllQ6IhvNR0gHVpG1i5l
         fHyg==
X-Gm-Message-State: APjAAAXvz2tOc61She5lvt5Sgk3JQnKQCfDYqapseVi5efnwg8167iJG
        ZKI/bhiPfmPyd8nasGxOIQ6tXg==
X-Google-Smtp-Source: APXvYqxSEjde5T7oaO8yL+dpzl0wq5+pUK/A/ouT8K50PSZW7sinF8PXGrTpu5PeDSyXTSIs4dN+9Q==
X-Received: by 2002:adf:f44e:: with SMTP id f14mr16561465wrp.290.1569930917901;
        Tue, 01 Oct 2019 04:55:17 -0700 (PDT)
Received: from starbuck.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id p85sm4052171wme.23.2019.10.01.04.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 04:55:17 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] clk: meson: axg-audio: remove useless defines
Date:   Tue,  1 Oct 2019 13:55:06 +0200
Message-Id: <20191001115511.17357-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191001115511.17357-1-jbrunet@baylibre.com>
References: <20191001115511.17357-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Defining the number of each input type is no longer necessary since
we are not using the clk-input hack anymore

Fixes: 282420eed23f ("clk: meson: axg-audio: migrate to the new parent description method")
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-audio.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 18b23cdf679c..60ac71856e5e 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -20,10 +20,6 @@
 #include "clk-phase.h"
 #include "sclk-div.h"
 
-#define AUD_MST_IN_COUNT	8
-#define AUD_SLV_SCLK_COUNT	10
-#define AUD_SLV_LRCLK_COUNT	10
-
 #define AUD_GATE(_name, _reg, _bit, _phws, _iflags)			\
 struct clk_regmap aud_##_name = {					\
 	.data = &(struct clk_regmap_gate_data){				\
-- 
2.21.0

