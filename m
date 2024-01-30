Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF8E60B98
	for <linux-clk@vger.kernel.org>; Tue, 30 Jan 2024 09:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706607514; cv=none; b=dYe6o94Vo7z4c+7815zseePfA+3H20ugyV3Bx6u1KFA5KVyMNMzd+81lIkgXcAOsiFxnkSLB+4t7UD6romYpYY0eh23eLGHDf6RE3cAs3ac2VkJoh1caSBb2s3Ls0f/DAMBxeB8jTZBo7UpAOFVRPUlF5vlJGrbtONGlOmMUgZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706607514; c=relaxed/simple;
	bh=KmlVQI5t6vRCllo/cOaAJqkCPGhX9wTEE9PDUFITUjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k+mjZqshowwSSrEfUXG5iRqFTvem57775fG/eBPv7HPToqtrBVJ8kudG3GBhGSQKLQTgaQ4Bv78uvUMsWHUVulhA86QE9EPyb0BwU7KTD8f40C93N9fzA4Z/ylyPVcS1FwFlNPdvZYkzv2+Xbq+DLQW2DL+lXbqSh5DCVjr8dLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yQCaAXXb; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yQCaAXXb"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55f0b2c79cdso2602720a12.3
        for <linux-clk@vger.kernel.org>; Tue, 30 Jan 2024 01:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706607509; x=1707212309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAQSA+kK9jYgf9iRBFCJiMz1V0l84ZXoobUQ8ktAm0o=;
        b=yQCaAXXbt9/VBWNTUatbrRUbuxcKR3GlRGwqpgUcaro7C9RK5gO2EC+rtK10qrfVhY
         vD78PqQ9Qr5UI/IuM+4LgGTS0nQNlxhHF/9M4nBIOTju5ZkfFWnB3fyKYChK3fIESymk
         uLXevaiAMx06iE6RimyEgqnDX55Nvo/n/9DTOR1p37XOFd605q6O11Ettwe1Q2DFwTVM
         QLDFgJGIxqqeYTJRxl/FC57aVwun0rPS48NpjoV0IT9u//S7Xt6fQJVUm3kWgfdJdf57
         3foYMkd3mitmRQbX60dcvQr+00tgMRgS8kDbFrQOz4P1U164Kqlrze3d6Nf2KM24esyF
         fz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706607509; x=1707212309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TAQSA+kK9jYgf9iRBFCJiMz1V0l84ZXoobUQ8ktAm0o=;
        b=iG0Y5v1rIhwrpNvCK5j6x6VOM3wsk68Z9EHlpvGxyd/Mdvj5a61djpOmb87zH6Z2Ze
         J3nzBHUnMvDhCAAoIzvjeHLs18Pz6gPsXspDU0uS/D3hALIrBk44SWHcFKRVCukv6/2w
         RDQLbDojqoRr+uIPA2LeoqdmzVvxRPu35KT4o+/fRo8FHFfxuFOHDSRmLcJJlWrPPyEU
         mMiaxJNayUG6ZTviVkpJ4HDrQDkcuHwUnNhexungAA+ll0jrQflRk89jvpV16ahmn4vB
         pmJD5qulwUdo5I1t34kVhLPPNrSBHhZ43YPOKjUMzYcHSqZRpwpoyuQULNtAl8Yj9zOu
         1Izg==
X-Gm-Message-State: AOJu0YwI3OjvTc0Rco/cZbgY33YaYsR6WsYSsPDj0GdBPeJFtMcLCawx
	mnU46FKPOHXHXkl43PGkIxvscMGDomJC34PSfgKz3Sz7orrGwFDGZqmWNLvFVL0=
X-Google-Smtp-Source: AGHT+IF/m5mOArbCMzdGKzrOsjS0gVO6XRzIQWNVZ+HOi84zCHVgcM0i192IppW0vZqT+Xw+n90eTw==
X-Received: by 2002:aa7:d7c4:0:b0:55f:aa:12a7 with SMTP id e4-20020aa7d7c4000000b0055f00aa12a7mr3320283eds.16.1706607508887;
        Tue, 30 Jan 2024 01:38:28 -0800 (PST)
Received: from puffmais.c.googlers.com.com (94.189.141.34.bc.googleusercontent.com. [34.141.189.94])
        by smtp.gmail.com with ESMTPSA id q10-20020aa7cc0a000000b0055ef56f4575sm2281225edt.39.2024.01.30.01.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 01:38:28 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 4/6] arm64: dts: exynos: gs101: use correct clocks for usi_uart
Date: Tue, 30 Jan 2024 09:36:43 +0000
Message-ID: <20240130093812.1746512-5-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240130093812.1746512-1-andre.draszik@linaro.org>
References: <20240130093812.1746512-1-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Wrong pclk clocks have been used in this usi_uart instance here. For
USI and UART, we need the ipclk and pclk, where pclk is the bus clock.
Without it, nothing can work.

It is unclear what exactly is using USI0_UART_CLK, but it is not
required for the IP to be operational at this stage, while pclk is.
This also brings the DT in line with the clock names expected by the
usi and uart drivers.

Update the DTSI accordingly.

Fixes: d97b6c902a40 ("arm64: dts: exynos: gs101: update USI UART to use peric0 clocks")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Tested-by: Tudor Ambarus <tudor.ambarus@linaro.org>

---
v2:
* fix a typo in and add an empty line to the commit message
* collect Reviewed-by: Tested-by: tags
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index e5b665be2d62..f93e937d2726 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -410,7 +410,7 @@ usi_uart: usi@10a000c0 {
 			ranges;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI0_UART_CLK>,
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_0>,
 				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1020>;
@@ -422,7 +422,7 @@ serial_0: serial@10a00000 {
 				reg = <0x10a00000 0xc0>;
 				interrupts = <GIC_SPI 634
 					      IRQ_TYPE_LEVEL_HIGH 0>;
-				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI0_UART_CLK>,
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_0>,
 					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <256>;
-- 
2.43.0.429.g432eaa2c6b-goog

