Return-Path: <SRS0=cbsA=RV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 196F3C10F0D
	for <linux-clk@archiver.kernel.org>; Mon, 18 Mar 2019 19:41:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB8A82133F
	for <linux-clk@archiver.kernel.org>; Mon, 18 Mar 2019 19:41:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dsiYe/yZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727653AbfCRTl2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Mar 2019 15:41:28 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39137 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbfCRTk6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Mar 2019 15:40:58 -0400
Received: by mail-wm1-f67.google.com with SMTP id t124so14081365wma.4
        for <linux-clk@vger.kernel.org>; Mon, 18 Mar 2019 12:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WEK+MgheKchhg0QX3P2gNwOnQXfun2RSNYUOC8zRsk4=;
        b=dsiYe/yZUBe6lSW+iEdRvlktkI7Q0wuP9+i4Z28M8UccRbAv375XO4fZA3IYCwPLJN
         xwiSuVAzT/fahbzoBmW7k4AB1AT23dm0+U/gkLFdiqtuj5nqbxzAmC7U+obVy29+yYkS
         cLM1Ev696VSbFSeDvc3SAJAs9pCXzunpjN0ruWPtH4TPr4FISyjtqd5LxG2JaP4n/avj
         ohRSUCEzPnABA6yqCOFnkw3+301dfhNBhR4wtX4io9eMdv5gbYwJ/QVeIX2deziFdP+R
         1QAsdokHa7+G/xjbeOBNVbIO20V0GuzUrDGIgS1iykxPr8vWE8e4unsMs+Y+KlG/Vv4/
         Z1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WEK+MgheKchhg0QX3P2gNwOnQXfun2RSNYUOC8zRsk4=;
        b=RVfAr2k3pAoolCXR99TWwsWAc3UMqX2JuX5Dule32KZLh3SiQxftD+ZbqpezMc7bWX
         cPo+ruDXztBm+iP/hqfMWLEzHBwRGIoJbonpJ39M2ccn+OpGSrRiXtyDGvn6vgj2mUFA
         nxldFTEtFNvTdXjFLOtdwaVdVcFPAL8jCOOei7QT0p17a3QpxEM4YTty/DsQNyBf12zI
         yjxnR0Gq4U4QRADQcIfM4DCPzh4fLitmHvukq2OsPgHjBx2w0EmwqyRftrgrsjNR79jx
         dKn3lcNXRlu5V3PPjBc8L/9bjKepmS1vqX9S5KauEyjgO8WDsIffdbPI3Gyls7LCa0hq
         1wlA==
X-Gm-Message-State: APjAAAXakLorE3ercz8gtgiWfBBnZdzNl4MzzFwAoQfEtr3Z8WelyzXt
        ofNua22Qt4ic1uj+wStfyZsS4g==
X-Google-Smtp-Source: APXvYqwJZbk+OcjkXCuV+3ZFHBV8lbxBg9HSXosLaS4d3bZyL3B4C/f1ZmmVqWQLq+L/YAYYsDPdFA==
X-Received: by 2002:a1c:f914:: with SMTP id x20mr393705wmh.62.1552938056210;
        Mon, 18 Mar 2019 12:40:56 -0700 (PDT)
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust4998.18-1.cable.virginm.net. [86.31.179.135])
        by smtp.gmail.com with ESMTPSA id s10sm4583941wrv.56.2019.03.18.12.40.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 18 Mar 2019 12:40:55 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        mark.rutland@arm.com, p.zabel@pengutronix.de, xuwei5@hisilicon.com,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     john.stultz@linaro.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        yuq825@gmail.com
Subject: [PATCH v1 2/6] dt-bindings: reset: hisilicon: Update compatible documentation
Date:   Mon, 18 Mar 2019 19:38:47 +0000
Message-Id: <1552937931-23050-3-git-send-email-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552937931-23050-1-git-send-email-peter.griffin@linaro.org>
References: <1552937931-23050-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The reset driver now supports the ao reset controller, so update the
documentation to match.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/reset/hisilicon,hi6220-reset.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/reset/hisilicon,hi6220-reset.txt b/Documentation/devicetree/bindings/reset/hisilicon,hi6220-reset.txt
index c25da39..ea0a6a9 100644
--- a/Documentation/devicetree/bindings/reset/hisilicon,hi6220-reset.txt
+++ b/Documentation/devicetree/bindings/reset/hisilicon,hi6220-reset.txt
@@ -11,6 +11,7 @@ Required properties:
 - compatible: should be one of the following:
   - "hisilicon,hi6220-sysctrl", "syscon" : For peripheral reset controller.
   - "hisilicon,hi6220-mediactrl", "syscon" : For media reset controller.
+  - "hisilicon,hi6220-aoctrl", "syscon" : For ao reset controller.
 - reg: should be register base and length as documented in the
   datasheet
 - #reset-cells: 1, see below
-- 
2.7.4

