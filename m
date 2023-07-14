Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F405EB64DC
	for <linux-clk@archiver.kernel.org>; Fri, 14 Jul 2023 05:02:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234538AbjGNFCc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Jul 2023 01:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234425AbjGNFCb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Jul 2023 01:02:31 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C58E2D66
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 22:02:29 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbea14700bso13650115e9.3
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 22:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689310948; x=1691902948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rf5b8Tn7imiJAgp4f2GnrUX+ZsHyR0cjspo9UaU3mm0=;
        b=vn74eK0wTQrm0bnz5we6gJrxJYUWJC/mkcsdNfYD6rmqFLZUcT/0VlTUEaEIZoaFhy
         E+xWactO0Sw8wuU6tIEgnv1YZz7bP0glPtgo0SAQE7So2hKyahpBDPFgrNZZVh5iPL9X
         adIC+mAQmgFHN31lQFvE5z0QNSOc3vX3LHcb3DPxzx9LAFwImiDsBeqT/buK/0p4GqXH
         PJTH3TktTvDRRn2oq8mgRs2Yi9YjbXVNdF3cMwuNqu4BLXl1boeTghoftdAzYDKgJz/g
         JEf9u0S/p/Tw+5ljrrVRwfiuwvPAwc3cSLZZ/C7LGF2ZhOSn87Z/Ar1u56lQBanWhcxD
         OSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689310948; x=1691902948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rf5b8Tn7imiJAgp4f2GnrUX+ZsHyR0cjspo9UaU3mm0=;
        b=kUam5NWvTZmZNqJoa9nL94QE/u2NmqP4807F9ewKsEEVx7v4niJQOxWaSGl3HGJZk/
         jLa5sQL8xDifP4JDT2QlTImBnDlQ1OrF+pT8KSzxnhTlYQx8QG8+IiMKyEl2gdNGo0Hg
         KM6u/Y4uzU6g/P+ZwxzSPdgdOWQRO4vhevVmAQLfpnGM9Doj3CpT5XqzDshpAeJzJx/a
         hPYtKOLHEwFcbvIAY1DwUxjfCzakQXULIRX17MSJ/DzRqt/Eu3irKF05Pxb7z63ER5v6
         KUTRlQ9pQ6mBdqv8MSlqK7hlju+54uRYgASS88y1WMDRHUV4S4tjwwrTIEwulUJ036qB
         0kMw==
X-Gm-Message-State: ABy/qLYXfzdnoWle3GhuII/k9OMPkWIuLwznefYYdyQSt4Xsi0Y4vwTx
        s5wNXaLBHGMsXdDbm45jlaDrXw==
X-Google-Smtp-Source: APBJJlE7MWlijdk9HFLnOuXlNpCUrmW1MbQ7xwX+Wx1gDld9/egD9byTvG9qACKRUnAyZxRd0RN52g==
X-Received: by 2002:adf:f1ca:0:b0:314:5f6f:68ce with SMTP id z10-20020adff1ca000000b003145f6f68cemr3050264wro.66.1689310948133;
        Thu, 13 Jul 2023 22:02:28 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id o14-20020a5d684e000000b003145559a691sm9710883wrw.41.2023.07.13.22.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 22:02:27 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH] MAINTAINERS: samsung: Un-support cpuidle and clock drivers
Date:   Fri, 14 Jul 2023 07:02:23 +0200
Message-Id: <20230714050223.8327-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Since few years no one is really paid to support drivers for Samsung
Exynos SoC CPU idle and clock controllers.  Correct the status to keep
them as maintained.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0b8cd03f5e52..f646ba70a01b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5367,7 +5367,7 @@ M:	Kukjin Kim <kgene@kernel.org>
 R:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 L:	linux-pm@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
-S:	Supported
+S:	Maintained
 F:	arch/arm/mach-exynos/pm.c
 F:	drivers/cpuidle/cpuidle-exynos.c
 F:	include/linux/platform_data/cpuidle-exynos.h
@@ -18881,7 +18881,7 @@ M:	Tomasz Figa <tomasz.figa@gmail.com>
 M:	Chanwoo Choi <cw00.choi@samsung.com>
 R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-samsung-soc@vger.kernel.org
-S:	Supported
+S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git
 F:	Documentation/devicetree/bindings/clock/samsung,*.yaml
-- 
2.34.1

