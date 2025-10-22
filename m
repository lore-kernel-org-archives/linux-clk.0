Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A6534C13A
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 14:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761144584; cv=none; b=I+Dl3SV33LL3T9s7LYhJ7LLqPuIi5voaosYD+FKf7X3Ke57FVHJ4EaAZXok4xrwW1vYHebitUbmTFJsYlQQmt4bOIYrSvaNcXeMp+ESfFSzLiLpebT1PzKqyOzT+jH5OR01GnvEz8f+XUzdGoqx65S5eA5tOsoFYfz0o3Reei3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761144584; c=relaxed/simple;
	bh=DxarD8TnJr61kRFsvLf+3W5F4BVamSRc5LKPNeE+jqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KTk0Qye76K37L5oG9CL1R4i2avj65p3+SklPzywxoPv6cmdCx4jwaM/sds2llpjmDKI+02qJoAYaNm9i1qB4vLaE0srn2ccxL65mGvKppQbAwKJU8o4YCk6tRRRLbxPZxxy16QL7L/isuHaRzSiQ4pun4FBq+2QCHSKt85g+YLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fK0ObCXn; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fK0ObCXn"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-475c696ab72so4654435e9.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 07:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761144580; x=1761749380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYj7EXPz+vvQTqjjNn2xCYOEsNBPpMyP80swSO3NtRk=;
        b=fK0ObCXnz2k7dYMybMNXtOSlZu92WXN+oD7cV5uDLJP/WkSTPN679x5VLJW8f5TaI+
         AtnPoUehgnIGRlzaHH90td2gT21uMNCUU3a1sfinbWWnhOyJgz5ZSi+GvwlnCSTBu7dP
         DYwAV8URbXL3LPxrgpRu2yvm+2gju86C5JAim2XyMRn9UdWRy1Po32186GGSGRG21B+V
         TG63SFE7WvP7o+Y5aTPcavxJ6IZaa+NTdCysyF9hgFkpfK7e4ejU34XjVGEkaq0ajFIk
         xHYxehZi2lXX7xDtEzR7XXgoWdoqZCyoUzD09o73o+2SkKr6vyrAB3EVVuNSpEjx3Lsf
         ZZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761144580; x=1761749380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYj7EXPz+vvQTqjjNn2xCYOEsNBPpMyP80swSO3NtRk=;
        b=KcfeYzkTsDnS9x0qOPzJ1a9+Tkcjm1nIYzVQ3gHqLS+Lg9o/bOCnC8IJPo6Xp1Fqu+
         72KuPiPj1CbPQYoUHlci5gZZSIcjWDvrTIB3q4VkG4uo2WyFMTwleTfeeAjsiEfy6d90
         KEAWFWh7B0iBfkJrAkW6mx42R5KRs3V9QOGGr84JELWMiHNgUsADxET/J1UDeZ8fDDuh
         +i4bzwtSSybbj93qonN7HmUOGStm/FsEyiCv9ohOXOJ7Rbklm0K4U3Lf0rItCVPhksE0
         7pLzyT2OL0G9QhquludKnhqTHadGZyrAOORMqgTw1qBvLNHHI50IYOYuu5N11bkD0qfZ
         K8Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUlwtTxQFhtj8WWjys34XcZmqnumhhyciCkVn/Ekf59tIQjARxj0ElGv/HBs2qpSqN+Eu/AECZ7jA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWrNtsLFESWbct5G2ytTHPbF6JvhGce6UdDhk/tDh93DUqah/4
	vedeYanvbgN1IdC8Rdy3xfZpMNxn2LjnVzNc6nqN1p+3ey71Z5hSdM2h
X-Gm-Gg: ASbGncvyScCr6QldkqEiz91sHdqX1eDPHeGZd89Q8GhYNFQKrlpu6vLpMX9YU4/BUfp
	G5+QshyR0SJKvm1/Shggl4buTb6ZLW/AZLHZYaEhDXpGFwPaarh+XhqqY7xPrbGYS0oB35XOdHf
	egYqAdwsfB25uwbR9G7Al0AKQEZulSi098NcnYBeosa2DaX9K8o7vR/JN90wQqTje7xQ1QhP0j3
	7KQxUnZImTgfqNpH0sAXFxwm6NKU+/hglXWs9IuxeyD0dUWCD//0l/G20a2nljRxcYafe0YviF2
	gUEKJy3JSO+HSWkHm1fVe+guwCcPo0bQaDVhDx9B+NjaoWtiUebFmvowXpLO3Zm0CpCduB+MgMb
	Jfb8tWK5yVBfnXyqvaKoro0LjUgCB6eZoMoblat2koqk1pDT4dH2HOzumTPma9I1RbnY=
X-Google-Smtp-Source: AGHT+IFQPTCWm/+rvvBIUt0UXHZaN56MajrHW+8ZDd5b9VAy+C4orsub3LKR2q3U+XbF/HSoJxwJiw==
X-Received: by 2002:a05:600c:3488:b0:46c:d476:52f3 with SMTP id 5b1f17b1804b1-47117907a6bmr159176745e9.26.1761144580197;
        Wed, 22 Oct 2025 07:49:40 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm49956525e9.3.2025.10.22.07.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:49:39 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 22/23] ARM: tegra: add CSI nodes for Tegra20 and Tegra30
Date: Wed, 22 Oct 2025 17:49:29 +0300
Message-ID: <20251022144930.73272-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022144930.73272-1-clamor95@gmail.com>
References: <20251022144930.73272-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CSI node to Tegra20 and Tegra30 device trees.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm/boot/dts/nvidia/tegra20.dtsi | 19 ++++++++++++++++++-
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 24 ++++++++++++++++++++++--
 2 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi b/arch/arm/boot/dts/nvidia/tegra20.dtsi
index 6ae07b316c8a..5cdbf1246cf8 100644
--- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
@@ -64,7 +64,7 @@ mpe@54040000 {
 
 		vi@54080000 {
 			compatible = "nvidia,tegra20-vi";
-			reg = <0x54080000 0x00040000>;
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA20_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -72,6 +72,23 @@ vi@54080000 {
 			power-domains = <&pd_venc>;
 			operating-points-v2 = <&vi_dvfs_opp_table>;
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi: csi@800 {
+				compatible = "nvidia,tegra20-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA20_CLK_CSI>;
+				power-domains = <&pd_venc>;
+				#nvidia,mipi-calibrate-cells = <1>;
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		epp@540c0000 {
diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index 20b3248d4d2f..be752a245a55 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -150,8 +150,8 @@ mpe@54040000 {
 		};
 
 		vi@54080000 {
-			compatible = "nvidia,tegra30-vi";
-			reg = <0x54080000 0x00040000>;
+			compatible = "nvidia,tegra30-vi", "nvidia,tegra20-vi";
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -162,6 +162,26 @@ vi@54080000 {
 			iommus = <&mc TEGRA_SWGROUP_VI>;
 
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi: csi@800 {
+				compatible = "nvidia,tegra30-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA30_CLK_CSI>,
+					 <&tegra_car TEGRA30_CLK_CSIA_PAD>,
+					 <&tegra_car TEGRA30_CLK_CSIB_PAD>;
+				clock-names = "csi", "csia-pad", "csib-pad";
+				power-domains = <&pd_venc>;
+				#nvidia,mipi-calibrate-cells = <1>;
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		epp@540c0000 {
-- 
2.48.1

