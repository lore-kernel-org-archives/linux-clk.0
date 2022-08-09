Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F629C2BB43
	for <linux-clk@archiver.kernel.org>; Tue,  9 Aug 2022 11:33:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242093AbiHILdg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Aug 2022 07:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241483AbiHILdb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Aug 2022 07:33:31 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F5AB22B01
        for <linux-clk@vger.kernel.org>; Tue,  9 Aug 2022 04:33:30 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id t5so14665551edc.11
        for <linux-clk@vger.kernel.org>; Tue, 09 Aug 2022 04:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=889hlD1ho6n/GA784dTSvUCYoqPA1nuSRX9iN5LTl7I=;
        b=s+VQYwlTtMncZwIaDlzTeyk4S2iK9jzrnMXdaNYlJye1sbKxeMHhcfHZC/bz8vpm9l
         IcCbKoyFgltNeGROjglwvzaX3CapMq7mSWeaQf5aLKh+tE093UuKRrwKMq11zPF7thcX
         r/1zAPLj4OyTwAdohRWY6Jmh4bOkTZIPG1o3qJmSRIQZXgtk5SBQzLrignB1WWivFd/e
         PkD+Rfke3huZbSoZkkcAyTmHuW2DYnY6n1wuYhkMfM0zSqqltEVxZb1WsfCslRIWfLG5
         Y1v2kDK1JBKhlbWVfyMvmQt+XeVhhwElmVQpo/mjVP4wOzQ21i3JNwTRbrgnqs9D3xis
         5DqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=889hlD1ho6n/GA784dTSvUCYoqPA1nuSRX9iN5LTl7I=;
        b=FpFVvonr413x6Nl5FhyhTTQKdS8TecKH9PDLZ4ksHGKVYOFa02zzqHbA5XXFLlwMy5
         IHYeeVralJa7IN08wVUbN3O9ylKMaKMYDRua14EO61UFM0GOWfzErp6CkvyiUmQbAZjB
         m5DS53HP6J12N+HkDVboSbu52DuvMuJoN4tsCJiG+Axkg5MzEJ2dZ1UDAUAVdn7+66hx
         s3QM/H1YrX+7auH7+J7HgE6eKuqlOqUmZvjtbhRJXDS6suLSFOG4IGzDSNDaPQwYss0i
         vyGTT/keQK28NN4ReXXwLrUQrDynXUdPeB7IZ6qQv5qdgcfldNN+SpkNVL157F//L4Tv
         +E2Q==
X-Gm-Message-State: ACgBeo0XSGViqPqKdjyc7Dcml1JjbKMvLMHRIZstEiUAWizJNRzL+aDT
        Ncg0QN1vRqbcO+zY/TWASOlTWw==
X-Google-Smtp-Source: AA6agR64lvncagWgUfaaLzpJdMGks7RtcI5cEH5eDUzB7/BxgSwGU/2FDYKyxLysPXYt4yc0tmYluw==
X-Received: by 2002:a05:6402:26c5:b0:43e:2f1b:31c2 with SMTP id x5-20020a05640226c500b0043e2f1b31c2mr21261884edd.424.1660044809162;
        Tue, 09 Aug 2022 04:33:29 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id o3-20020a170906768300b007304d084c5esm1006993ejm.166.2022.08.09.04.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 04:33:28 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 4/9] clk: samsung: exynos850: Style fixes
Date:   Tue,  9 Aug 2022 14:33:18 +0300
Message-Id: <20220809113323.29965-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220809113323.29965-1-semen.protsenko@linaro.org>
References: <20220809113323.29965-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix some typos in comments and do small coding style improvements.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - (none)

 drivers/clk/samsung/clk-exynos850.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index cd9725f1dbf7..ef32546d3090 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -173,7 +173,6 @@ PNAME(mout_peri_uart_p)		= { "oscclk", "dout_shared0_div4",
 				    "dout_shared1_div4", "oscclk" };
 PNAME(mout_peri_ip_p)		= { "oscclk", "dout_shared0_div4",
 				    "dout_shared1_div4", "oscclk" };
-
 /* List of parent clocks for Muxes in CMU_TOP: for CMU_DPU */
 PNAME(mout_dpu_p)		= { "dout_shared0_div3", "dout_shared1_div3",
 				    "dout_shared0_div4", "dout_shared1_div4" };
@@ -599,7 +598,7 @@ static const unsigned long hsi_clk_regs[] __initconst = {
 	CLK_CON_GAT_GOUT_HSI_USB20DRD_TOP_BUS_CLK_EARLY,
 };
 
-/* List of parent clocks for Muxes in CMU_PERI */
+/* List of parent clocks for Muxes in CMU_HSI */
 PNAME(mout_hsi_bus_user_p)	= { "oscclk", "dout_hsi_bus" };
 PNAME(mout_hsi_mmc_card_user_p)	= { "oscclk", "dout_hsi_mmc_card" };
 PNAME(mout_hsi_usb20drd_user_p)	= { "oscclk", "dout_hsi_usb20drd" };
@@ -963,7 +962,7 @@ static const unsigned long dpu_clk_regs[] __initconst = {
 	CLK_CON_GAT_GOUT_DPU_SYSREG_PCLK,
 };
 
-/* List of parent clocks for Muxes in CMU_CORE */
+/* List of parent clocks for Muxes in CMU_DPU */
 PNAME(mout_dpu_user_p)		= { "oscclk", "dout_dpu" };
 
 static const struct samsung_mux_clock dpu_mux_clks[] __initconst = {
-- 
2.30.2

