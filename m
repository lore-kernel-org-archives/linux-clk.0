Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D37C001DC
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jul 2023 05:36:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbjG0FgB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 01:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231867AbjG0Ffo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 01:35:44 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 320DF2D47
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:35:00 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bba48b0bd2so3389165ad.3
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1690436079; x=1691040879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRCZH4GGM1E14D8FGmRam/hRPth71ctX83uTK0gxaqc=;
        b=AdlbqsjbBdcn/EdEJb2LCLEioo8YFANuQmf67SxKzZPYqENGC4s6ucFjuztzOJpoCc
         JM2FxjqtAvMkz9Szl++ADE8A9hw5jIZS3jl1XCByzdIPVfulumg8/lwE/xIHNZU+06Li
         r/k7QyUkbC0k2nVSbXbZJWJ7KXRPTA76hqcbmgoOM7c7yYMf6wBtRsNH8EO93Z8hiPkB
         AEQNGuqMxSL+CnWsw9SH5Y3CWij+9RRW5M3WSuT1ULKAVnYjpnLhJfeRQ8Foco/0SxdR
         VexKYCKFFwTcZj2Y2plyxp+M0SXbDvG4HCGrDNBcncCAAV3rsymp2jAr8Y3cigaAOcU/
         XEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690436079; x=1691040879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRCZH4GGM1E14D8FGmRam/hRPth71ctX83uTK0gxaqc=;
        b=E6zrhnK9+llBND5+R21OiSMh+UxM+AOjCGHIM/wlUN+0wKqZeEmFYAPE9JCZ92qNe6
         pJO7xNYDrW/QX/hOVU+KT5vwkvUSUmx0cvls+0d4MdvfCt+322iovnhIOUCT17Sg5jDv
         K8u0fyZlFA7EUPpDbP+pb5fcuhfbm+WPb8pqwEeR1zcBUmWrl5kKLbxoUK0PbOmbofnR
         xYRz0RSuEDxB+/mxnZeO1AKlRxhR9BSioKsqinkffIfsXl0TNFiOPwsK8PiXuN/kT3fl
         HDGbKEE1/rakMReJfqU4ZftTgnH+egtzqU5MnKRZBVXnT5NTwCu/VmgwzfVPqU/NJBDR
         JbUA==
X-Gm-Message-State: ABy/qLZRYYtGAs8KqYANiPtfSlM+fYtf4l5F+niDjUY52Pj/k+a0DJCA
        qovM+hBbrplKHBUdQIFedI1lOA==
X-Google-Smtp-Source: APBJJlExUH0L/WX/KUv9vnLUnpAxPAgjWkHqBlJL7WFDFDhavzVhK7nkGWSMpRtLiPS6S6yphRc6RQ==
X-Received: by 2002:a17:902:7047:b0:1b3:9d13:34b3 with SMTP id h7-20020a170902704700b001b39d1334b3mr3348176plt.37.1690436079762;
        Wed, 26 Jul 2023 22:34:39 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001bb889530adsm319059pli.217.2023.07.26.22.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:34:39 -0700 (PDT)
From:   Claudiu Beznea <claudiu.beznea@tuxon.dev>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        mripard@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 18/42] clk: at91: at91rm9200: fix checkpatch.pl check
Date:   Thu, 27 Jul 2023 08:31:32 +0300
Message-Id: <20230727053156.13587-19-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
References: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix the following checkpatch.pl check:
drivers/clk/at91/at91rm9200.c:216: CHECK: Please use a blank line after function/struct/union/enum declarations

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/clk/at91/at91rm9200.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/at91/at91rm9200.c b/drivers/clk/at91/at91rm9200.c
index a862a0a18972..e0418ab5d65c 100644
--- a/drivers/clk/at91/at91rm9200.c
+++ b/drivers/clk/at91/at91rm9200.c
@@ -222,6 +222,7 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
 err_free:
 	kfree(at91rm9200_pmc);
 }
+
 /*
  * While the TCB can be used as the clocksource, the system timer is most likely
  * to be used instead. However, the pinctrl driver doesn't support probe
-- 
2.39.2

