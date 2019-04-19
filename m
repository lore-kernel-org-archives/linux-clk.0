Return-Path: <SRS0=/mgL=SV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA2CC282DF
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 19:12:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8618A2064A
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 19:12:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LPrqSJds"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbfDSTMr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Apr 2019 15:12:47 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34979 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728803AbfDSTMq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Apr 2019 15:12:46 -0400
Received: by mail-wm1-f67.google.com with SMTP id y197so7303755wmd.0
        for <linux-clk@vger.kernel.org>; Fri, 19 Apr 2019 12:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WzKNBO96cllaDZYht9HJ/bZN1iAt8AGESvlKduBe/SY=;
        b=LPrqSJdsTkO4xoeE7tsRT9wJQ8vByFXhhcpzha3M5PSlCR8/lBvMlCASU/cxecMkOh
         UmFaTRf/tnUhmnaIihVY9vMB9PcnuDpeX2Y+FPOqYNPArv4bp6D7EVdqQPRFBBa8r94+
         SQIihJIa0qIUl64U38mxzRgWgStXMVg6pefv0iSnuP3UtiW7TfYeyZvMeBwwSgx39IjW
         EYBobw9GPsizSMd0kLOGcvl86MV4M06iYNLRnjKZ18xxGyNl2tc0RYu+q9Go6/LNKgBr
         MhC03aUgHHuJlBVTa83tKyZxK5cHaDI8JEISC2qUyKvF/c2OLTJa9hVM/MpNMFT8KENE
         Dc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WzKNBO96cllaDZYht9HJ/bZN1iAt8AGESvlKduBe/SY=;
        b=ev5mhcx/klfSBj7jkaBahq9JeI29hFPDqiAiDNfyhgusl16jU5xp9ANx9ujxhOUF3O
         30IQIiAOHlyi9wJu7xdb3Yo9EieCjt0wiQSKJD4uEjggdYb+1xAJJ8+9LkuRB9II9O0t
         rKUjA71vjUsrcCYNX24ZR+uG+Oa9TegS+L7BY1/K1/0VT6DgNxvtmWlF2XhsquDM8jRF
         MuWgdPVArIjFubDMml9MD5th3os4JF2yko0HBJ2PH4WgrxDa5wt4IY3xrSHqLlNKhwzp
         hHvI0K1fkK7wgnxRfdABzpp1JVZILj0tyoLoK4BgrpMsasr0neCwsTXf9CK/Yq27mm1R
         tKLw==
X-Gm-Message-State: APjAAAUcKzj4rnWTF+lvwO5Y/SqMHBCKRbtaSQ8kpOn5GFoaoP3bSXXU
        mhD/qOS84hOquz5Kk6HDYsir7g==
X-Google-Smtp-Source: APXvYqywtRrgku0AqUVMt1yhhNoxlXj19ieN/Bb41Np801RohrxLkAt2YF/xqgf+ErRr+uw5SHwVQQ==
X-Received: by 2002:a1c:4187:: with SMTP id o129mr1735083wma.57.1555662909576;
        Fri, 19 Apr 2019 01:35:09 -0700 (PDT)
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust4998.18-1.cable.virginm.net. [86.31.179.135])
        by smtp.gmail.com with ESMTPSA id t76sm5700147wmt.8.2019.04.19.01.35.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 19 Apr 2019 01:35:08 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        john.stultz@linaro.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de,
        xuwei5@hisilicon.com, mturquette@baylibre.com, sboyd@kernel.org,
        yuq825@gmail.com
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, lima@lists.freedesktop.org
Subject: [PATCH v2 5/6] dt-bindings: reset: hisilicon: Add ao reset controller
Date:   Fri, 19 Apr 2019 09:33:00 +0100
Message-Id: <1555662781-22570-6-git-send-email-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555662781-22570-1-git-send-email-peter.griffin@linaro.org>
References: <1555662781-22570-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This is required to bring Mali450 gpu out of reset.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
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

