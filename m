Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A8B158DAC;
	Sat,  4 Jan 2025 07:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735976448; cv=none; b=jaOtlngnOCLZBxCAo/XSLvPAsBBQS7kS7U2teaktUwkryr7Wx17r9A5GjxHfO28z4NNxcYnSuY0tJSib9EtioEVi7nmczdnftet/T3mxKsTxFeGOf8K3s40Bw5BFIcu2eyHJo7Q8Hs/OGC85PN4nk7k2AaHjWqTMldqSlebap8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735976448; c=relaxed/simple;
	bh=YjINOz4Xv+YahkPpQKBJM0qt92m4mTvbJuNABy6+7Tg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dFVhWEn2U67d1GqWYQBb7h/XSjjXeZB0/lZOgDdVS2dbqjhDDMimKTaGZkfjb23aAS07aedxIzUObGyLS44BhXwJxh1yKDnQr1eKSzQbtT9BcNMWEJDdac/cIljoAk9Ns9C5v+eAZdtuFt0o3mYV+WtpQvx54S7EIQ/WCYN8fro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKU9sNx7; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKU9sNx7"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-216395e151bso131873295ad.0;
        Fri, 03 Jan 2025 23:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735976446; x=1736581246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RemTwaYzBS1si26CVDrNGu9vkTiHrmOVmvsRlAFTpyQ=;
        b=dKU9sNx7FdSX7YaLeACqt2s9UpL72UP7fnVtIQ3eZPwgWDaer4oY55JozWyXS5s5IM
         3TnxKVFafbO+w5+tWFSc/tOTcjpbbjBsNnfUFYTi2n7hfyaRmdpPVr4ZK+EUr3OJ8oWT
         HhHDmkg2+othLQcAZtovkzmkNICe2q/FvAbAioFZ8aqARMzVQY2s83vx/IkucgAY4yho
         zFzGcHoJMUruyDcNcO9jc+h5CpeWZfzZdbY8AD3UOMBHHC3Vtny8zz7qKN/9MQURAlHt
         ioxHMFlY0SNykZwIBEmvj6sM6jdrKQlFRVKSSGBzPjZH8Gu8eGQlsVDN7QuJyTBwPxBj
         DiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735976446; x=1736581246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RemTwaYzBS1si26CVDrNGu9vkTiHrmOVmvsRlAFTpyQ=;
        b=p/asM5QB85d6/ZAeD7s9E99MbJLAD5fYDTNlyVkeXiNqoqrYyZbmDxMTKL+h3cjjWY
         75okBNoIr0nOyMDQ6+/3fnfO4agO+l2qRgzfFxyfRZSXHMeZjpVF9HcuxRz8rcsTeqGJ
         xSWxKyWVqVMM2wEZjat1tiyyLbjQ3hrNARhcqZhqhp3vM+AQw4V67ce0wvib7hRUnUqi
         JwL1VKaBtUhdY+oa4tPmlElygxjzhq0W1sjne4wz3W/p1snDpPj4/jZs2B3nkWsV0uQF
         DGPKKj7CJ2wGC0fy7i3fBEc+dow0GdzCKl+mFCGig28A5ZmtPZRxwbFr5HZaihAMmKwu
         K1KA==
X-Forwarded-Encrypted: i=1; AJvYcCVINzgGvOLW1GiuWHOqwUd6wpRfUmmXe5COJUw1A3FOJyZNhpN6NC6pCabonBWTZKXCaLQLcdy8dhbPzwwl@vger.kernel.org, AJvYcCXLMcaTMfR4f6rKdxFhMWMvOebOoM4uLWEbZ8lOOC//WIztmIZGniz8is9CEfknjxBtvpMB0CgyscW6@vger.kernel.org, AJvYcCXkXNjb9s2yXosTO7zpZsHG6PdCEckwet4kMtYT6E93rOBcdlui3NPnViM3FBvZIT1jDacjvRzPuOWh@vger.kernel.org
X-Gm-Message-State: AOJu0YzbOAR72D0qQkyz1AqU/mxFxo1PuBSShmWM7OC0GO3cQDvYQTw2
	ZzGhy103So5vb7UFEBSuDmz4EHzkeqAV0qT/if/l9D8XulStQQD9
X-Gm-Gg: ASbGncvJmoQxOUwvw2issET0G9QBjaDNtOoV8n3WE3wyMwJNwlb3zsFnwuRtLiuz/0b
	YmkoyshOqGDuDz7Kg/B1qkpzssc8spD9OHaFA68PA4TcZhZ4DGV2TBX/YM8M9X24e3r9jXkE1lY
	z32C4WP0TXnhsH0lQmm4LejBmFoFGgPm+4LrHFlAjiSBDHuy7G8d7vYG6KDJwPdRhbze9+BR7BW
	NhQBxMGyTlJ4t3li/iquOCHRI2w5s/UplN5gHzs7JsWKkRKKA==
X-Google-Smtp-Source: AGHT+IFzAL/sWxagDkVX/+NamzAgakEA8UUO4OYdQZ4vgwAgnJ6fLVP3LLXGLkf1UZM4Gkgyz98S+A==
X-Received: by 2002:a17:902:e746:b0:215:a303:24e9 with SMTP id d9443c01a7336-219e6ca6c2fmr758900565ad.3.1735976446069;
        Fri, 03 Jan 2025 23:40:46 -0800 (PST)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02b34sm256562565ad.252.2025.01.03.23.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 23:40:45 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Roman Beranek <me@crly.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Frank Oltmanns <frank@oltmanns.dev>,
	Stuart Gathman <stuart@gathman.org>
Subject: [PATCH v2 3/4] arm64: dts: allwinner: a64: explicitly assign clock parent for TCON0
Date: Fri,  3 Jan 2025 23:36:59 -0800
Message-ID: <20250104074035.1611136-4-anarsoul@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104074035.1611136-1-anarsoul@gmail.com>
References: <20250104074035.1611136-1-anarsoul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TCON0 seems to need a different clock parent depending on output type.
For RGB it has to be PLL-VIDEO0-2X, while for DSI it has to be PLL-MIPI,
so select it explicitly.

Video output doesn't work if incorrect clock is assigned.

On my Pinebook I manually configured PLL-VIDEO0-2X and PLL-MIPI to the same
rate, and while video output works fine with PLL-VIDEO0-2X, it doesn't
work at all (as in no picture) with PLL-MIPI.

Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts | 2 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts  | 2 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi         | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
index 379c2c8466f5..86d44349e095 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
@@ -390,6 +390,8 @@ &sound {
 &tcon0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&lcd_rgb666_pins>;
+	assigned-clocks = <&ccu CLK_TCON0>;
+	assigned-clock-parents = <&ccu CLK_PLL_VIDEO0_2X>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
index b407e1dd08a7..ec055510af8b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
@@ -369,6 +369,8 @@ &sound {
 &tcon0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&lcd_rgb666_pins>;
+	assigned-clocks = <&ccu CLK_TCON0>;
+	assigned-clock-parents = <&ccu CLK_PLL_VIDEO0_2X>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index a5c3920e0f04..0fecf0abb204 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -445,6 +445,8 @@ tcon0: lcd-controller@1c0c000 {
 			clock-names = "ahb", "tcon-ch0";
 			clock-output-names = "tcon-data-clock";
 			#clock-cells = <0>;
+			assigned-clocks = <&ccu CLK_TCON0>;
+			assigned-clock-parents = <&ccu CLK_PLL_MIPI>;
 			resets = <&ccu RST_BUS_TCON0>, <&ccu RST_BUS_LVDS>;
 			reset-names = "lcd", "lvds";
 
-- 
2.47.1

