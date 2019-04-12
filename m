Return-Path: <SRS0=khTx=SO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E4AC10F14
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 08:37:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7689E2084D
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 08:37:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Fy3RoTXH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727609AbfDLIhq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Apr 2019 04:37:46 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41037 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727350AbfDLIhc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Apr 2019 04:37:32 -0400
Received: by mail-wr1-f66.google.com with SMTP id r4so10789908wrq.8
        for <linux-clk@vger.kernel.org>; Fri, 12 Apr 2019 01:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=72YojJ2ZI4Hnj5UZWtMVH1bJJscttQzZHVGA77jha6k=;
        b=Fy3RoTXHOfIphsoVRbycuck6xBsYY9s/XsMC5pWDgNoHTHTIz/4JQhQHoXcNYUkVT3
         0Er6Qc99i7/MH6OQYMhu2ECBUmIBF8QkVgzyYATCjW1eaK7TRfrBkTTZJjtnLTTUvYtQ
         gaajc/dpUp+k9FZCq4fPCV3LIdgpZcLIA7a5W1lLsqmO+9sSlxufZ7jMkTvIMiaL6+gQ
         BDl5Asz22ssLvQGZtEXSGi65ExfkRbqfGByLrZ8XgM2PY6/WWT2oqqd+XBTXr8cbhGUr
         Cb6m9xHV3y9l6TTH88EE+iy5hymR7a4J6dVjNkF7MJ+zHkOixF4+L/aYxiBXhJ9jxtSk
         02ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=72YojJ2ZI4Hnj5UZWtMVH1bJJscttQzZHVGA77jha6k=;
        b=f2KTbUxSKxXhq+lsbnusuFZ7VhpsR2O8s3INmTdiYWxZ4L3OoLQQ8g/MSSXHlFOX7c
         mi1gUXVRHvmpbQ3WGhQ2t4HGocM1UeV+UjMOxJmeIQ2nHYTi7LJln28aM/mfaXH2vLWh
         0baABJoSEF3d/nPaZRYWCjpkBuVDbbJDlWAmi11SeGCHk0KDAf3t9Ee77YFwAUu/KkZH
         7Bm9Jlw47GiQH4tvInXlZiYHmsiTv1BasTuefKpNGStLSXgiSiE7htua/YeFC+E7fSD6
         KlAr8mOaWxGzIUnj4PVsm0idJnthu1cF17i6RoUC8c1pAxa++sz+bfNlIYixcgVOTcRH
         fQSg==
X-Gm-Message-State: APjAAAW6WEolG+y9ybE8NN4rCIjDcRwsJMw2Vi5MFEmdzJvSluvzPm6U
        Atl3TN7PHjbm1ya2rvs2wbEpWQ==
X-Google-Smtp-Source: APXvYqwxR90llho6BB+ndulftlM5xpQnYNt7iul0lf1qAW5CgrelTW1M0uT+nsjxR/qEezD1H6cRPg==
X-Received: by 2002:a05:6000:12c7:: with SMTP id l7mr35007970wrx.4.1555058250988;
        Fri, 12 Apr 2019 01:37:30 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id y125sm12124318wmc.39.2019.04.12.01.37.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Apr 2019 01:37:30 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     jbrunet@baylibre.com, narmstrong@baylibre.com,
        khilman@baylibre.com, linux-amlogic@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: clk: g12a-clkc: add Temperature Sensor clock ID
Date:   Fri, 12 Apr 2019 10:37:27 +0200
Message-Id: <20190412083728.21029-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190412083728.21029-1-glaroque@baylibre.com>
References: <20190412083728.21029-1-glaroque@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clock id used by temperature sensor for G12A Socs

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 include/dt-bindings/clock/g12a-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 30303728fe09..85cfcab10507 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -133,5 +133,6 @@
 #define CLKID_MPLL_5OM				177
 #define CLKID_CPU_CLK				187
 #define CLKID_PCIE_PLL				201
+#define CLKID_TS				203
 
 #endif /* __G12A_CLKC_H */
-- 
2.17.1

