Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B5CC64EC7
	for <linux-clk@archiver.kernel.org>; Sat, 11 Feb 2023 06:40:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbjBKGkE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 11 Feb 2023 01:40:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjBKGj5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 11 Feb 2023 01:39:57 -0500
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F8635B1
        for <linux-clk@vger.kernel.org>; Fri, 10 Feb 2023 22:39:56 -0800 (PST)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-16dcb07b805so2865236fac.0
        for <linux-clk@vger.kernel.org>; Fri, 10 Feb 2023 22:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTv8boWiXl3Q8qm/+aQVqDvix+KsA9tTjnV3RAm1YEo=;
        b=P+Oe5a1pah+Zr4CuFWfmfhGPerI7RTROI4usQQ2as0MnIS9p+f6YgVRk3NgRFqS9Xh
         eWf8bjcqxRlb2VDSvKosj6dA3lU6PrnwDQQJLvWOFv7Xg5S//x42J65AWr8Hu5iEFj0c
         L4JKGZrSXTKj5Llrg56gIgyr++/EEdJ0awwxN1IbcMglmp303lVfpjUhRb9s3GIBqOCQ
         hk6wOO0mPvIx+e2tZuAdLkvGOhPS3CTdyluXRAhS/0Gv8LkG4BDl8C5/0vXWMUsTqETg
         l1mb1a/etj+ePFvFMkIKnuesZWjDSZr/cVBT10IO90OGuv7MkxIE8KksHv8H3lPBPRVI
         OWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTv8boWiXl3Q8qm/+aQVqDvix+KsA9tTjnV3RAm1YEo=;
        b=P68/O5ujXsau87zdcDOzyqYuwWaRZarFCLCFdst8yGXorANO67o0Ar7STfp5HuRJIw
         T5eiChx1FjNnmPbq1ilsYmpiyw0MECIHDx3xUGF4YnVZ+asZNqconTeSrPvnnm5Pndkr
         eOAXBshVfmzuljzATwmQZoQ01UJxnnfnDsR1jfv48ATZ+YMvihYrDiycVYiUCgeEbGfm
         lqLkhsCQnkI1SXJs63dJPoBlM5WkGKRlJBpPu9GSgqEZ95AfglgF9pgrFauiiG4DYUAe
         lSCP8+2xucWb+U3PJnUKMvIX2TAniJ9DIOdtVaM3jVDGtyy8QUI58CkL+AOaLp97gMQd
         KPpA==
X-Gm-Message-State: AO0yUKUOyr3xuv8pXVIEo9v0AhB7xd4dh1fJSB8VRDJ7zgDq0brpK3FG
        rDFZLMHoqibu2PbM0ee+UeJtkA==
X-Google-Smtp-Source: AK7set9uzrsntw631tV4DP3rQ7Jj6aGuIrMBBqtNYlcwRR5cuwwLS0QTP9SXjkJTUM56WsqM07CgcQ==
X-Received: by 2002:a05:6870:8a21:b0:16a:a457:655d with SMTP id p33-20020a0568708a2100b0016aa457655dmr6828806oaq.5.1676097595431;
        Fri, 10 Feb 2023 22:39:55 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id ed52-20020a056870b7b400b0016b7fe3be05sm1734264oab.39.2023.02.10.22.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 22:39:55 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     David Virag <virag.david003@gmail.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: exynos: Add CMU_G3D node for Exynos850 SoC
Date:   Sat, 11 Feb 2023 00:40:06 -0600
Message-Id: <20230211064006.14981-7-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211064006.14981-1-semen.protsenko@linaro.org>
References: <20230211064006.14981-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add missing G3D clock domain to Exynos850 SoC device tree.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index a38fe5129937..d67e98120313 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -245,6 +245,15 @@ cmu_peri: clock-controller@10030000 {
 				      "dout_peri_uart", "dout_peri_ip";
 		};
 
+		cmu_g3d: clock-controller@11400000 {
+			compatible = "samsung,exynos850-cmu-g3d";
+			reg = <0x11400000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>, <&cmu_top CLK_DOUT_G3D_SWITCH>;
+			clock-names = "oscclk", "dout_g3d_switch";
+		};
+
 		cmu_apm: clock-controller@11800000 {
 			compatible = "samsung,exynos850-cmu-apm";
 			reg = <0x11800000 0x8000>;
-- 
2.39.1

