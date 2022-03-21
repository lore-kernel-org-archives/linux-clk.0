Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C04C4321E
	for <linux-clk@archiver.kernel.org>; Mon, 21 Mar 2022 20:09:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353040AbiCUUKi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Mar 2022 16:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353044AbiCUUJw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Mar 2022 16:09:52 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1E5A182D80
        for <linux-clk@vger.kernel.org>; Mon, 21 Mar 2022 13:08:06 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id d7so22216930wrb.7
        for <linux-clk@vger.kernel.org>; Mon, 21 Mar 2022 13:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=glbkwheqgo+YAwXKKccRcXjFIyD1/ids9/fwj2aHXuM=;
        b=IIFdmZFGMTy1XTsiFJ2yuqXCl4xUkZYDLDbpk+6xncAzjuKnt6aj29k14JEwZtQxcT
         q9iZem4IhopHHo2Pi25oKJ5SGuvfeQBLl/gneyZ22nthVW0TOqxNEFibVrf2TWeBOigu
         6NicvGvRoHntUToJ0n0snGfypZyo2f/OdxCLh6rBUHcwpIJRkXC1GGyq//bX6MUlHq9J
         Mbrv+brDGYH7J0c+BwIzgFLX26OOLAgUoTbAOKXNLUEuEosOi0lFGvrVmNvNb6EhZRNE
         IwuXCSte1ffXtUE4wxgTyKSlbwxn2ow0fCODAo0hi5WGjmDCLMR18NcyYERWnR6MfKlQ
         /Jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=glbkwheqgo+YAwXKKccRcXjFIyD1/ids9/fwj2aHXuM=;
        b=UHnjReE0b6mWKeXTLQVXJ5DVbafyotlksnKHLeWQ2VrZJxFVRsgx5V1fUFGDAKwkxN
         9YrlL1BiQJQAoLTqGsZjj+DIvxdC8DEqFOsSHTUo8Tm/jH+EnR1so+c+1QDRMabSJxrA
         U6wunL09phNCiATus0g8l45rq9KQ/ULXCDAQM9rbfDStcb3LuzFkhsaQrFNsp32NNR3x
         2ZQ07OutKYcQxxkXS3asUdZK/qTUxhRIrmAekNMMcYqgh58miHVUWg7UeaUFm9NqEzgx
         mPdEjBX03VKv4h5Z2StR8ludFJiIXnF5A56dS7WJK1iUEH/E4KmOuX3zVPdF0pHZUqy4
         wivw==
X-Gm-Message-State: AOAM533P/ep7PA0N5RwdCG/3SLidx/Xxwxqi2oHA1QShr00ngvfdJnzA
        +1sirHdv8DQmc4NVTRrf4yLjnw==
X-Google-Smtp-Source: ABdhPJz7fCs1t2aqp8p1p2t3TcSgtujQDHRA0ZZy7GQGPnJaxekip2TbpedVAZt8pxnpLiZRg9JGPg==
X-Received: by 2002:a5d:6483:0:b0:203:801e:ad1b with SMTP id o3-20020a5d6483000000b00203801ead1bmr19292641wri.30.1647893285166;
        Mon, 21 Mar 2022 13:08:05 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id i14-20020a0560001ace00b00203da1fa749sm24426988wry.72.2022.03.21.13.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 13:08:04 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, herbert@gondor.apana.org.au, krzk+dt@kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 20/26] ARM: dts: rk3288: crypto does not need reset-names anymore
Date:   Mon, 21 Mar 2022 20:07:33 +0000
Message-Id: <20220321200739.3572792-21-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321200739.3572792-1-clabbe@baylibre.com>
References: <20220321200739.3572792-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

reset-names are not necessary anymore for the crypto node.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm/boot/dts/rk3288.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 26b9bbe310af..50f0890b3f6e 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -979,7 +979,6 @@ crypto: crypto@ff8a0000 {
 			 <&cru SCLK_CRYPTO>, <&cru ACLK_DMAC1>;
 		clock-names = "aclk", "hclk", "sclk", "apb_pclk";
 		resets = <&cru SRST_CRYPTO>;
-		reset-names = "crypto-rst";
 	};
 
 	iep_mmu: iommu@ff900800 {
-- 
2.34.1

