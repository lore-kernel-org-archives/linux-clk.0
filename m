Return-Path: <SRS0=cbsA=RV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2980C43381
	for <linux-clk@archiver.kernel.org>; Mon, 18 Mar 2019 19:41:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 81A4C213F2
	for <linux-clk@archiver.kernel.org>; Mon, 18 Mar 2019 19:41:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uhf9yDYx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbfCRTlH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Mar 2019 15:41:07 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37214 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727760AbfCRTlB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Mar 2019 15:41:01 -0400
Received: by mail-wr1-f65.google.com with SMTP id y15so18448151wro.4
        for <linux-clk@vger.kernel.org>; Mon, 18 Mar 2019 12:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2T8O0Mm4ruygwgr6c+1/UMNXLrosJEb50l9fzQq3+LI=;
        b=Uhf9yDYxmFCusnccxywzNceiIL+v/S2FVJrRXHMcKpbtFSzGE2KlxkfICt3hFRgRj9
         SfGAAT7pvHqE20/PNiRTaQUqvMdkCt7X1BE6zng67/Jsrfr6soPXzMs0SBP9XhaUYTGm
         0KtDzFKgCARAFb5D2wRdtxsd16NKlPIOBIl4qZ+lIvRkyxvzbV4niZ3tt2ULgvohMy4o
         jHKl+dbcAUTpTA/CGJrz5A42dLNe/sUn0To+anS/GWhqcFSQZTW3jVcZ7JoxMhIFYhxd
         dmR45nrOgYUK7wkzzpr1vKlhMAZRIlNWQfMttBozfa2K+54ccQuXbtuv9xLsNYbptOyu
         egsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2T8O0Mm4ruygwgr6c+1/UMNXLrosJEb50l9fzQq3+LI=;
        b=FOkuL9iLJ/BFV/S66CzlLn3It9QTuAwGBqCuzkepteFjD6Nn4Wku/wonenqlO7/QHa
         rD/ayu7ECKZ+F6LpYT5QEBC/mQ5QIXIs83SD7d1M4daTka4J6msFgm6v/ipeLaYI6ku5
         vidOroLakQJ8wQXUxvmtD5Ix34T/ASBF598gJ0Y59FfGGCHY8GThArnI0U7h03XJ4SFn
         XjTV9NQiTLh7CzT+zY060cWY4eA27QhajE72OAsnsXfQqjkEsCj7OUY8pVEz9vG7AV2Y
         fMJWAYwc2XpnxlufZejGfl8hBRhy/p9OZfK/ux0yxdkA5wJqLbVYatXqc8vJW+XRgNAL
         9FVQ==
X-Gm-Message-State: APjAAAUr8CSLs7anlRodwQ6L4KU/IkwVOzhft4U1qyxUHfmXZ8Q7JG+g
        R3lsLPykYD4YwyXzqpfcKZRVNw==
X-Google-Smtp-Source: APXvYqwSlmj56Jf2NE2Gd3GBSYXic9INk2IDtEWlgFgQAvHuYAAMzoPBZjojS2u4BMrrmZiOOKIK5A==
X-Received: by 2002:a5d:6543:: with SMTP id z3mr13195408wrv.200.1552938059981;
        Mon, 18 Mar 2019 12:40:59 -0700 (PDT)
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust4998.18-1.cable.virginm.net. [86.31.179.135])
        by smtp.gmail.com with ESMTPSA id s10sm4583941wrv.56.2019.03.18.12.40.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 18 Mar 2019 12:40:59 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        mark.rutland@arm.com, p.zabel@pengutronix.de, xuwei5@hisilicon.com,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     john.stultz@linaro.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        yuq825@gmail.com
Subject: [PATCH v1 5/6] dt-bindings: reset: hisilicon: Add ao reset controller
Date:   Mon, 18 Mar 2019 19:38:50 +0000
Message-Id: <1552937931-23050-6-git-send-email-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552937931-23050-1-git-send-email-peter.griffin@linaro.org>
References: <1552937931-23050-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This is required to bring Mali450 gpu out of reset.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 include/dt-bindings/reset/hisi,hi6220-resets.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/dt-bindings/reset/hisi,hi6220-resets.h b/include/dt-bindings/reset/hisi,hi6220-resets.h
index e7c362a8..63aff7d 100644
--- a/include/dt-bindings/reset/hisi,hi6220-resets.h
+++ b/include/dt-bindings/reset/hisi,hi6220-resets.h
@@ -73,4 +73,11 @@
 #define MEDIA_MMU                       6
 #define MEDIA_XG2RAM1                   7
 
+#define AO_G3D                          1
+#define AO_CODECISP                     2
+#define AO_MCPU                         4
+#define AO_BBPHARQMEM                   5
+#define AO_HIFI                         8
+#define AO_ACPUSCUL2C                   12
+
 #endif /*_DT_BINDINGS_RESET_CONTROLLER_HI6220*/
-- 
2.7.4

