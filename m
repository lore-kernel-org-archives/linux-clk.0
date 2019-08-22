Return-Path: <SRS0=TujE=WS=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7AE8C3A5A3
	for <linux-clk@archiver.kernel.org>; Thu, 22 Aug 2019 17:33:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7DFD4233FD
	for <linux-clk@archiver.kernel.org>; Thu, 22 Aug 2019 17:33:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mW7Tgp1F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392294AbfHVRcc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Aug 2019 13:32:32 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44567 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404469AbfHVRZj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Aug 2019 13:25:39 -0400
Received: by mail-pg1-f195.google.com with SMTP id i18so4036643pgl.11
        for <linux-clk@vger.kernel.org>; Thu, 22 Aug 2019 10:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=K+pJPk2iXl0LixGuiysFHZxmO1vjBGFGOdrJivWtPCQ=;
        b=mW7Tgp1FmSapx19uGrdxDMd8OE3OgYVCxKv0qpVYm8Q5+jUgIaziiHoQzAuP0TaXs9
         b1ZDesqxvAoluWM9GSEgQ9G4QpMDXvfp1IJTvfkJGpAMme7osiW/rkqTy1V39252Dhbr
         WXc7XNRjcldsS3KQ5hKTF2F6stNSdyRfJu0zieUGc7nCMyhwFwel8ZedzEhJPaoTUDGH
         0Zl8idC+H4dtYMabKHQRwEow0I1NKJ4pbHlgdXYq69qyghfuNCeaweyDyYm2QCZ8YsEq
         NXYnSNYIG9YQ4K0Pcnaedhk/gu/Ja5KzsJqjnc094RYmDcUJAWGybU/FRQnwhBehyHjS
         Zpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=K+pJPk2iXl0LixGuiysFHZxmO1vjBGFGOdrJivWtPCQ=;
        b=pFz6PCihKTif4nhDREVz6QVvpNO1M7oxk0b77gf4MJ5jQUFUUCUva6RGcDt8FYCg/X
         J2liEv+r8zilfG+vwC5UgyyBcROH7J5j1+S86F1uEOCXazkiHTufU3EoKulSsiKIjB5s
         G8NQpwOIYF48eW4rt+/XCeoHjMeWOFehwJTRGy6pWrJxf7xNPgnWunETQpvI1nmtDA7M
         maInb/nRNFSCba90YWgUAhOWTLhZ46/U5u1cRZQ25UYDg/eYO+spfdjGAMEZY/S+v4Bu
         wmwFle9ZKK1Sw4wzlmaDbqkUfXAR8j55sfM7y54djjQfjBcGSBxd5nVB6wx1G2ikxbqS
         /+Xw==
X-Gm-Message-State: APjAAAVFDuki2R5+nFIjlXCnhnYwqFyejV85k6z2SLGxxq665S9hcOcB
        +Jz7AdpBx70ivhtFbXKVmJ66
X-Google-Smtp-Source: APXvYqxCqc9UeYvtLws5SuOrAkw6QLX8rq7VicLc5z3Sq8OIW0mJfyReSJarPa+CAfZqwE6RSG9whQ==
X-Received: by 2002:a17:90a:b303:: with SMTP id d3mr863897pjr.28.1566494738302;
        Thu, 22 Aug 2019 10:25:38 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:71cc:5738:24ad:193e:4b59:8a76])
        by smtp.gmail.com with ESMTPSA id r12sm31705798pgb.73.2019.08.22.10.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 10:25:37 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 8/8] MAINTAINERS: Add entry for BM1880 SoC clock driver
Date:   Thu, 22 Aug 2019 22:54:26 +0530
Message-Id: <20190822172426.25879-9-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822172426.25879-1-manivannan.sadhasivam@linaro.org>
References: <20190822172426.25879-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add MAINTAINERS entry for Bitmain BM1880 SoC clock driver.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 997a4f8fe88e..280defec35b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1503,8 +1503,10 @@ M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	arch/arm64/boot/dts/bitmain/
+F:	drivers/clk/clk-bm1880.c
 F:	drivers/pinctrl/pinctrl-bm1880.c
 F:	Documentation/devicetree/bindings/arm/bitmain.yaml
+F:	Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.yaml
 F:	Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt
 
 ARM/CALXEDA HIGHBANK ARCHITECTURE
-- 
2.17.1

