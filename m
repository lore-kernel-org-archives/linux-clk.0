Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF52C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 21 Mar 2022 20:09:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353087AbiCUUKf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Mar 2022 16:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353042AbiCUUJw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Mar 2022 16:09:52 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 169E5182AED
        for <linux-clk@vger.kernel.org>; Mon, 21 Mar 2022 13:08:05 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id j18so12588444wrd.6
        for <linux-clk@vger.kernel.org>; Mon, 21 Mar 2022 13:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ALP0rhmdyOFskfZyrCUywCyi9ACOSmK3EYQ8ApiRER4=;
        b=PgoKWs6BqTd0YVwXlKBTcyBVNt7mdUfOIGxdK2fjBUMqsY8QYZujGa40w7xZBZA/yp
         esIJw6J9JSeWIhA+U6x2mYwng+KEadRC1WZHfCqjm0WL/XS3cQcbxVphfXFhjW7U03L4
         SNF/O75AKTknPDP2nfoWBmQEH5lTIMm9DWh1VCa4ZX7nP/eynUi5fmB0QP30fkDj7k5Z
         sAtqVOVA9VEEw36jbB62quDplN0EFDiUtJ9Una41golcgA5MfXd7pzSuAvzbkakLaeaf
         SE/tp7FpbXGtBq8Vd2tcXJI8tzVejLR3DGCuOlBj9FPXxChNf47ychi8mDpXDCqNpLEZ
         /Olg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ALP0rhmdyOFskfZyrCUywCyi9ACOSmK3EYQ8ApiRER4=;
        b=nQUiqBFBySxUoAMG2wUzIm0uo38zYTheI0qXlvp2Nfs0Vr/iCE1d429+4OzX50Y/wH
         AqaaxlGQ5TV+A5PTqjyvVJn3R+S73cA8bZvAuzLNDJEmP1UuumQIMtf5oM9clR2biSDT
         kqLwOU7olfytzg+C6ueJ/3FNSQ/7nBrKG6nBIx6nr4Hz0dQC6gouwa1JkOm/hIN99+Mn
         4o4phn4q5o9pbg5/b3d1/yeCiDSsV2jQ2+v+MZXT3sDbAEJZkQjn6v6oxoBnF3a8G5sx
         i3wb17baLMlfG6sEQ06qB5bCm7rhAy+jjzhBOmdeRCPKluLRc5banaLkCjPUIEIrAdFH
         loFg==
X-Gm-Message-State: AOAM533LzIlpKCr3hSWpaLRyJkAO0bo3//1LbE2XnYBAR16U3bwll9To
        xCsDkbB8B3Uh7pUrroW1IUU+YA==
X-Google-Smtp-Source: ABdhPJzDjnGj7IJraPSCtEXEfN9Mb8TcdmAUQ8cWd4O9rEnCAZpJ5de3D55tdtOi3oK+SbIlHh7IFg==
X-Received: by 2002:adf:8128:0:b0:203:e32d:4d03 with SMTP id 37-20020adf8128000000b00203e32d4d03mr19172030wrm.540.1647893284321;
        Mon, 21 Mar 2022 13:08:04 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id i14-20020a0560001ace00b00203da1fa749sm24426988wry.72.2022.03.21.13.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 13:08:04 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, herbert@gondor.apana.org.au, krzk+dt@kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 19/26] arm64: dts: rockchip: add rk3328 crypto node
Date:   Mon, 21 Mar 2022 20:07:32 +0000
Message-Id: <20220321200739.3572792-20-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321200739.3572792-1-clabbe@baylibre.com>
References: <20220321200739.3572792-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

rk3328 has a crypto IP handled by the rk3288 crypto driver so adds a
node for it.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index b822533dc7f1..e83e0bf7e517 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -1007,6 +1007,16 @@ gic: interrupt-controller@ff811000 {
 		      (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 	};
 
+	crypto: crypto@ff060000 {
+		compatible = "rockchip,rk3328-crypto";
+		reg = <0x0 0xff060000 0x0 0x4000>;
+		interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_CRYPTO_MST>, <&cru HCLK_CRYPTO_SLV>,
+			 <&cru SCLK_CRYPTO>;
+		clock-names = "hclk_master", "hclk_slave", "sclk";
+		resets = <&cru SRST_CRYPTO>;
+	};
+
 	pinctrl: pinctrl {
 		compatible = "rockchip,rk3328-pinctrl";
 		rockchip,grf = <&grf>;
-- 
2.34.1

