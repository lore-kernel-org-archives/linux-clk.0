Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21403C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 28 Sep 2021 08:50:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A38661058
	for <linux-clk@archiver.kernel.org>; Tue, 28 Sep 2021 08:50:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239933AbhI1Iwe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Sep 2021 04:52:34 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:48592
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239883AbhI1IwI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Sep 2021 04:52:08 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3135F40862
        for <linux-clk@vger.kernel.org>; Tue, 28 Sep 2021 08:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632819013;
        bh=9+M3zOsXaCPGsy+Y7A3HK2jtwWbSZ2cmPLzUVQxLrjg=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=rHCUhS49Cya8Zbyjlqf4NmHcrp5rk0zKoaaJEe3RQfXEIcS+gBCxfMYsfrHhZgc1F
         Zmzpktvc2E/U9nXcJ6+lU3RlHeT7PTlPrWeBTah2S3ZouSruc0p9HRs2mMnBUOGEkB
         5HYvHWCVgQeaIoMBOKgBPsUnqWUH8uOwWBme2FpmlPQlZFi3susI0Wyjd4vkLUtZal
         xtvea1/v5OyjJHaEmjeOx25HkIYDeAiIj/DNO+0lfdLhZFE6Dlom980tTSIbjj18gC
         IX/SAovj2c/a3ivUyjmrI+nRNQcP3ZZi64vcAQ2VMAEoJleT2vhpi4CpNUPwdKR1qx
         Ge5QZAA3ew/1g==
Received: by mail-lf1-f72.google.com with SMTP id o4-20020a056512230400b003fc39bb96c7so18670328lfu.8
        for <linux-clk@vger.kernel.org>; Tue, 28 Sep 2021 01:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9+M3zOsXaCPGsy+Y7A3HK2jtwWbSZ2cmPLzUVQxLrjg=;
        b=0pm6oGp2ksWVIZ/t/102QdZhH2yIm+0ki1lT2VIOKgGTDIclZWM/SQ2v3uOCZ+ILmM
         dcj4PBbeAjvI5vYZmNCuky6nOLwFdu07SGwQ/6DcUo6Yul8FaQyZEA6R6i7j/Vcnask5
         XA4pOlEM0jmPsYlX75oBuu0ylM5gvXhRG78XPgG/umP9TbuH695m6rBeuYAS774EeMvJ
         vUYdz1ck7neKl93R3DRPOBHEIrGwSpdohNOvFdwXuAA1hrN42ZjSZGpaJhi4/gH3W1uj
         8Lv3UbiRhP6bfGyf6GGijw9o3FcjIzXtK3+ANWWRPCE9XKbH9CVWK4zQrBKAqE30dbny
         s04Q==
X-Gm-Message-State: AOAM53119BMuGheueUobTq0r94GBT14+ynox36r/UDPyLXl62oMQlrfG
        O21gV7ofEQ2vpVKKxi/PQ1Mqu/6TmQZ+3yd+qeyAKyXrHJqe1svBltmXYZQaubTQfYfQnFtdlPQ
        3Hw26D0Pk5bygXGzXN7xWTNz57qruOcseIbcwiA==
X-Received: by 2002:a05:6512:13a0:: with SMTP id p32mr4522397lfa.492.1632819012271;
        Tue, 28 Sep 2021 01:50:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd1p1KF27X5q/HMw+Wy8K3uWfL4WhxDC2Ry8lcW1WZpEG8XLZ+MIvFRBAUiAMpcYmQVFUpMw==
X-Received: by 2002:a05:6512:13a0:: with SMTP id p32mr4522379lfa.492.1632819012109;
        Tue, 28 Sep 2021 01:50:12 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h13sm1848419lfl.205.2021.09.28.01.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 01:50:11 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 11/12] ARM: dts: exynos: remove unneeded DVS voltages from PMIC on Arndale
Date:   Tue, 28 Sep 2021 10:49:48 +0200
Message-Id: <20210928084949.27939-12-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
References: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The S5M8767 PMIC does not require anymore a safe DVS voltage, if the DVS
GPIO is not enabled.  Although previously bindings required providing
this safe DVS voltage, but since commit 04f9f068a619 ("regulator:
s5m8767: Modify parsing method of the voltage table of buck2/3/4") this
was ignored.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index a771542e28b8..3583095fbb2a 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -240,9 +240,6 @@ pmic@66 {
 		vinl8-supply = <&buck8_reg>;
 		vinl9-supply = <&buck8_reg>;
 
-		s5m8767,pmic-buck2-dvs-voltage = <1300000>;
-		s5m8767,pmic-buck3-dvs-voltage = <1100000>;
-		s5m8767,pmic-buck4-dvs-voltage = <1200000>;
 		s5m8767,pmic-buck-dvs-gpios = <&gpd1 0 GPIO_ACTIVE_HIGH>,
 					      <&gpd1 1 GPIO_ACTIVE_HIGH>,
 					      <&gpd1 2 GPIO_ACTIVE_HIGH>;
-- 
2.30.2

