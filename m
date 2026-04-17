Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448AC3CA4A1
	for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 15:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776438722; cv=none; b=bL9A2hRRzZELSp+ct1bzhlO5nuuMncEefHFS/3UvmkNl2bVo4ZcFtBvDAGcVNNAb7Xoav7gp6uD6dO9ZXXrbDHCrO6kTah6iwyae9yBQBywYyccHdMevqHNZhjhhyBve3r3dLZbuqdeK08CFWzGga5425C/qmQf16uDcjdSD3Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776438722; c=relaxed/simple;
	bh=Iv35X0YItRmd6w3u4XU1Hvta1/Hwj6onkb318swFieU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u3NuAa/KWkFJ5VofxWksh+GUEOCFk1G/VNNIbmzFJRmANr4RN+0MQ4x1wUJwArHuYZWYLUpVFo315yyT2Fw4fENifpc1TIGHcyIc9pFAnJbMN27AGBAdYzls3UinH1BRflFd7pQriN/TY7lc+C4KV/ojZcbr04/cdg3ugnhT7/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=33gSa5m8; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="33gSa5m8"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso762197f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 08:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1776438719; x=1777043519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9FDj+1Kksm8urlrZ9+RrkwbXsGoKIaMKcDpK7X2i8Zs=;
        b=33gSa5m8dnb8DSbY0erUjKdFK54y94xbN8h+0qV/L6ZQgMZ1E6xe1cIXKj28+DsXR+
         FywOuB5vB5wSnC8LrbAxgTsYoYPZEPMYTD7uLMivlTrZtpQd99d4CNbvHIUV9E57I1Jg
         e98vtfMnln3zgnvM8DrcoefTFgcT99i4Tv6gvIs6UEm8MNx2JpbGhHwaOaKwbaCJivuY
         DBxhkiEjLlZIgqdMla4Pkdv/8VK/etkz6P/5WkUl/mlhD8XKxv0lLOJOtLo5Wm7KFLFA
         yT6VxQsJu/HGuqMSU7682OfgoEEQeJry7sM/5KyeasEGUPPlPOZpkACJEpW3HdgCcXIk
         wC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776438719; x=1777043519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9FDj+1Kksm8urlrZ9+RrkwbXsGoKIaMKcDpK7X2i8Zs=;
        b=tPKSZ8e5jvTPS63xfEyAUHid0jV5SLraJsVlyriPlBIVQ0eevCbVg3Ty6DyYpYrMXj
         Bsaw00uqOUr7uLWTTIH1ZQuqxfofZbuNNgPE3A3QfkaFxMJOGM0uWfladDA9B9Rbr7k7
         ZYnxjSaD1EKgkGaeo3m/qryelBD2qekPS7iqUPx11ZykdzcLRxkL8px+aQFEQWKsGYWz
         x2UpqmyJRFM7ws1gkXFRRyPhOhRuGjlbEyeC/eBcYkKTo6/Sp1N5z+lZpVipTNo+qyWB
         3AJhiHmgWUp1uB8M/C1DAbDTkFtmRrQE4NxK79bUhu+SmSYpteB+L310vufGGmDMZk/X
         DASw==
X-Forwarded-Encrypted: i=1; AFNElJ+3cawPsMaykEkM/tQY0261rAO/H5f/GhQFikoI2GnX6c2HCQ1MQsf7WbUNevauAM04tN7ECn2vrfY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8vulcAUVkY33pLVEesr0FCvTueNiIab8lL0wXiCA8V71/8qrC
	qPrJEC8E0QSIRbcK9Uj88dk45hegVC7ChFn9w6F52cDPuZytLB3ZIvMbuZn5wlk0990=
X-Gm-Gg: AeBDieuIvX3TRa/KPMgPPQwdfK2zfgpU/AUiYbWWRV4tjMyEaQQqJhAUcYLE++w4uQX
	2g2Q6q36B2sIkEK1MvUovG6LzWHVhKQHCmjOIFqT8tKI0CrUaR5dPfTbFzijs9GfSmeYbYaFkgF
	sLnH6BZ3Y4xEsBWGhXPoUYNs3av9mplIF7mAxr/Sg4WvpzTuT/VB7CJ0Tmko1aiLEDf4QDCipZb
	2WQ2QUMr/Kl8461nrOrERrTUl4Jys+1UR+IwciMjYuYZdCUHqVce6AkP2qGOhe3gJ891xU2svmX
	eoS0Ao8/mFcGIDWAbm/HcJqyO7SD51NvKWl5RqYkYNtPGuke/syQmfbfasOq6hXLNgK7HPxEIui
	bnbNA6OkqjVuQqGCVmh/lUSnualAp/RIB0JXwVaL3E2Y+paDVFTcmD/uiWYuobPOATcC6HG7up0
	xLFCiYZA8iopfk0WVZLZQDhel+ZyAe+ExDYF9ZJlOGkXqnXuBWx4smhOYqjBKpbLu2XLjC46nt2
	VOJ16P5A59xxnPQlbFoJIv4QEY=
X-Received: by 2002:a5d:5850:0:b0:43e:a69b:d803 with SMTP id ffacd0b85a97d-43fe3e23f23mr5312603f8f.47.1776438719544;
        Fri, 17 Apr 2026 08:11:59 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e591cesm7376426f8f.36.2026.04.17.08.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 08:11:59 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 17 Apr 2026 19:11:44 +0400
Subject: [PATCH RFC 1/4] arm64: dts: rockchip: rk3576: assign dclk_vp1_src
 to VPLL
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-rk3576-dclk-v1-1-26a9d0dcb2de@flipper.net>
References: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
In-Reply-To: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Pavel Zhovner <pavel@flipper.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=922; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Iv35X0YItRmd6w3u4XU1Hvta1/Hwj6onkb318swFieU=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQ+8t0WUda9/sCcx2V/UpPvama3/LOLkZC4de2NsUV4w
 d15/X6HOiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjq4+8Z/pm8++hxhGN95La0mM1spzbpKOYuyp9U1rHvy478JHtJVxVGholr+4q
 Yj3reCPmh7DNllRFXmllP+SNzNldHgX9nbs1ZxwcA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Reparent dclk_vp1_src from GPLL to VPLL at the SoC level. VPLL is a
programmable PLL with no other consumers, allowing the CRU to synthesize
accurate pixel clocks for VP1's output with arbitrary display modes.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index e12a2a0cfb89..2b05900c6c1c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1338,6 +1338,8 @@ vop: vop@27d00000 {
 				      "dclk_vp1",
 				      "dclk_vp2",
 				      "pll_hdmiphy0";
+			assigned-clocks = <&cru DCLK_VP1_SRC>;
+			assigned-clock-parents = <&cru PLL_VPLL>;
 			iommus = <&vop_mmu>;
 			power-domains = <&power RK3576_PD_VOP>;
 			rockchip,grf = <&sys_grf>;

-- 
2.52.0

