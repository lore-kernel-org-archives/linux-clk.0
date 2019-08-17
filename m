Return-Path: <SRS0=iaTJ=WN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C687AC3A59B
	for <linux-clk@archiver.kernel.org>; Sat, 17 Aug 2019 18:37:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8158D21019
	for <linux-clk@archiver.kernel.org>; Sat, 17 Aug 2019 18:37:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dqguwweG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbfHQShF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 17 Aug 2019 14:37:05 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34243 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbfHQShE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 17 Aug 2019 14:37:04 -0400
Received: by mail-pg1-f193.google.com with SMTP id n9so4594324pgc.1
        for <linux-clk@vger.kernel.org>; Sat, 17 Aug 2019 11:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=K+pJPk2iXl0LixGuiysFHZxmO1vjBGFGOdrJivWtPCQ=;
        b=dqguwweGv8m3jWuayl4ZIpq5unEXOopx/JAA/LfCxYiy9ROeW2F9g9c+65zQR5QPwB
         9CIN004auoeyYJTCT7vFNVgWqtJCaKHi3t/sSswuwQlv2+IOVxbQltyLVHe962wvKUnl
         JS2iIPVwDoaIkZ55RK7mxUwoOOLZxHpjnwrryQIcrznqxk7Ye1SdNSzfCqrI2mTtCi1C
         EKm3qhWNnQVYpGM61n/jCF3PYQcBnnyAfPOoOFFZK5UcM6Fm8/swH/zKlrhrqMenB9NG
         J3KtLdHMGMfVvdZUq1ikT1b8Eaf3EfuVQaaGP5Hqhfu1M83iWm2uOMVn/N8i8p0pyaIC
         GaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=K+pJPk2iXl0LixGuiysFHZxmO1vjBGFGOdrJivWtPCQ=;
        b=VbRybsf8fwZVsQTyIRK8jM3rSV0uvUCRa3bzLVRiPN0BopAOI7VOMVB4uC333iosfI
         N2/nJDK7lG1MTCBj8t4B/07IEAFGV/vLcrBRYA458LXvttJdcmvhI4WrS5yGzqitPQzw
         8mRLK211noMb9OqnC2RqNbW1k2A9K7I/Ik0I4TMkEOwYTPxhBJWzkjYEOFMK+N6t+asn
         o1P93hN7JnVVPNp57cfYeiS5NzLVmx0l3J6aENAVEPxb00ZDdCK4rsLo2pwGzJbPjg//
         VFdy+CDAX9iTKC0g9sRSVJSxzysUNMpvIS/j79UPFMXVdHNcx/VUTbN3hNVR/ZCmeWUm
         rQiw==
X-Gm-Message-State: APjAAAUbQ5NKGLfPOwffSi7j5zrWd6M7dDpmwcKKjwzqHL8kpG693urg
        d0Qarb4pM/q1lH87kU1plskb
X-Google-Smtp-Source: APXvYqyNYDKZVgPbO6xvWKY8Qk0vt2+wG3ehY9XlYnpkjyxRyqxyasCLT5TPNa25fa8LpeGDa6KhLA==
X-Received: by 2002:a17:90a:2629:: with SMTP id l38mr13445995pje.71.1566067023939;
        Sat, 17 Aug 2019 11:37:03 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:909:4559:9185:a772:a21d:70ac])
        by smtp.gmail.com with ESMTPSA id 33sm8588640pgy.22.2019.08.17.11.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2019 11:37:03 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 5/7] MAINTAINERS: Add entry for BM1880 SoC clock driver
Date:   Sun, 18 Aug 2019 00:06:12 +0530
Message-Id: <20190817183614.8429-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190817183614.8429-1-manivannan.sadhasivam@linaro.org>
References: <20190817183614.8429-1-manivannan.sadhasivam@linaro.org>
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

