Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE10C60BBA
	for <linux-clk@vger.kernel.org>; Tue, 30 Jan 2024 09:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706607513; cv=none; b=FFHuRMk/NK09auTZ37sQnQKPrQ5wQbGv3NAjBcjAeqxZPEERlfqx9yx/j9uq62Rb+ljxzE6jwML6e8F12J6x0E2raDANgul9equD2nBAJlhniGeC4R8qrxB5Exlnv5k6Q/b5Tak/P9WROYW8HCMJ8YJfkGdQZzW0AEhi/vksZtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706607513; c=relaxed/simple;
	bh=QIcvsmj5UOKeB/FB6UARzaoa5YTOGtGlSy4HEi++ZXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fGQ2EP3vppKW+ZRERYALyocVSMHg0owSJv07FySB4WYJp93oDH1cXmGg+h7tN1HIyGVgeVxZmuUIi0O++RES4sJxmrOIo9C8ssswfxUTjNXMiZHTmm3YfNec5f5ALJBX/72BdGH+/3D+e1cJK13DJ5Si7ohXV5zqkWNSQy7hTL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NwJZrQQo; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NwJZrQQo"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3604697d63so141258666b.3
        for <linux-clk@vger.kernel.org>; Tue, 30 Jan 2024 01:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706607509; x=1707212309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBWUUUJCFS/9FtiLA45qfsAAKoxP08mkjZtpzwkxvTA=;
        b=NwJZrQQojwS5gtOS6bOJi/X0x6kuZpF1n4+Wvz93v4GgoYgfQ0xi9fZ6RqtcMDsLYb
         60qjRbxyFCSbxthOUh7zEpbzHcjcN10+qTiwsyJHZ2Pou6Mb/gtycNpjNgpEX3NvzC2l
         ER4dswe6oSxohekH9QS/z/rzeLjxu/QTnVxjPa2gvxfQj0Pl5em0Lqy7MzbCW8LlyHAi
         fD1KJ81078LoIcSmcKH2j0cwYTMogTUfLXGgcYud4A4GaO/BKQY7xmOgVE5GkHsn1jwk
         yfdeNyqTOp7vsf7FUagHtDo3lBjaosvMKtDwXw9jIYmvLIR0/6dNgjy1YpiE4z/dxGdU
         pBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706607509; x=1707212309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBWUUUJCFS/9FtiLA45qfsAAKoxP08mkjZtpzwkxvTA=;
        b=kyRAVeYtyrl+1Gx2gv/YaRQs9Zo1hztj6EJTnHSZl355HIxrYU9UJr4UVWNCn9saKW
         bPbxJM/BhXRUYwMhPJtomkdSlsT5MH8P30RjDXFEZNlCyzpIfEH7CaOJkm5Hp3wWT0jX
         DT/+m7ORTrjmoiGK+k9DsZF7O94b2CZzWBpgR+XkJrplLJYxykgDJ7CJDNlvLAE4mtZ4
         W7nIQCIMqAK1FnpvbrgkqAYyV5mTYIh0JI6gNowVKDvrVlHd36b0mSsASmK4PyNwZQWN
         E2gIYddIR6wv/0FBTv8F0jAeA2hA1f9VVms5MUNfbP4w8Powllzqx6Swdno9q+461EVF
         yTDw==
X-Gm-Message-State: AOJu0Yzf98bD06MTekWrR6W24IU3eXGKWp1sQSaH/CXNUofFHxlg8wQ+
	FjaSsxU9r7Kksh1bYDxNxlJuMuM2wAxlVDBh+yon5/Lk5u4wpotj7JWV+7jR92cG9HgILmoae0j
	XS6c=
X-Google-Smtp-Source: AGHT+IH1eXkaUxJ4mPZQgQ/90RiMgygCUgMPXA+UyHwqbaMjV0BERiWtej6ZrUx8ktC9nwPMG1a92A==
X-Received: by 2002:a17:906:3794:b0:a36:1adf:6900 with SMTP id n20-20020a170906379400b00a361adf6900mr922180ejc.45.1706607509757;
        Tue, 30 Jan 2024 01:38:29 -0800 (PST)
Received: from puffmais.c.googlers.com.com (94.189.141.34.bc.googleusercontent.com. [34.141.189.94])
        by smtp.gmail.com with ESMTPSA id q10-20020aa7cc0a000000b0055ef56f4575sm2281225edt.39.2024.01.30.01.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 01:38:29 -0800 (PST)
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
Subject: [PATCH v2 6/6] arm64: dts: exynos: gs101: reorder hsi2c_8 pinctrl-* properties
Date: Tue, 30 Jan 2024 09:36:45 +0000
Message-ID: <20240130093812.1746512-7-andre.draszik@linaro.org>
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

The preferred order for these is pinctrl-0 pinctrl-names.

Update the DTSI accordingly.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
Suggested-by: Sam Protsenko <semen.protsenko@linaro.org>

---
v2: new patch in this series
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index f93e937d2726..195533fe04c6 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -394,8 +394,8 @@ hsi2c_8: i2c@10970000 {
 				interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				pinctrl-names = "default";
 				pinctrl-0 = <&hsi2c8_bus>;
+				pinctrl-names = "default";
 				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>,
 					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_7>;
 				clock-names = "hsi2c", "hsi2c_pclk";
-- 
2.43.0.429.g432eaa2c6b-goog

