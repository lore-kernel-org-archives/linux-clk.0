Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C89130EF98
	for <linux-clk@vger.kernel.org>; Thu,  4 Dec 2025 06:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764829040; cv=none; b=Elgv6W6yH08Kz4pOkyMeja197c+wH9x140EJ7gaI8yyakkvHB5vxi1BbX9pIfjicZpBDdnsUld3ev6SSXM21aoc5lOnvOE5EUxLjm9YK7XkJI9cX0qT5hxB/QS0yr9r/+E4eWkEJtn/QhWM8sawfCUbQx9LFVN3hUM8dJyNA1Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764829040; c=relaxed/simple;
	bh=eWyb4phIDaB9Lh/G9uzUO+x1BpVASAfd4mHwSb0xves=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LEnU23qlvcxxsYkX8YwifAd4P/VJUx8Rz68HLm1zEDILxBiEqBySeKPzg097fbBfZ/l6U4Oz4yNPb6jyqIdPFO+D9qadkX9Z0CGiuRz9dTmyOH0RdA/yqpSzdcfyfmc/ZiOkPn4m30VUIpLcl2VDVAc4NQy12u+QFdnDTtfd/uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+lwXgVX; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+lwXgVX"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b736d883ac4so90641766b.2
        for <linux-clk@vger.kernel.org>; Wed, 03 Dec 2025 22:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764829037; x=1765433837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xO0aKgv2KbReOFRNCLP5zz82s3c058MLvHztpGFjRTA=;
        b=D+lwXgVXdQseiKugeTT8HEZFr0ZO6YSkedO8eM+HLQ50AhzKD0DNdNZnvpEclhBohM
         d59s76kADxcGJP0o0w1XVGJTgVRjjrdqsU+vqiSKVexm7rdkm8Xlqc/iqGMpqvDp0q2X
         lHvH5Q+ltT6ZpBy5pCWBM+d/WA5Lmvmken6ZPSCIMcAGcx1KLbNm/hPpV4Go+ifmXE6o
         2yGHXOEYsYb4eJMkDLtibyNR49HvUljuHsMAkj6BljNflzHmEqzfmOGdjP99u7RlwnQt
         nsAAlV5ksTVU6R55KEsgqiyFNstg5Xz3bNPXgBV80wjgWzGnzUGat5L4CHD8/ocs5wqY
         mT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764829037; x=1765433837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xO0aKgv2KbReOFRNCLP5zz82s3c058MLvHztpGFjRTA=;
        b=ei58OcYLQHY+0b13iNrPt5Z0tX4P4S6MN6KHMOp0L91K9FTSMPZBsNtqk0v1lvomB2
         xFidzq6cw7CDkK9KKuHW8mrzULkVxeXFfcP1ND20gKq+7/l/Cx2caUKMitHeHPMl2B+/
         5tgQj1HOj7IkCdYU/ZmdjEC6PJJctxME5tFgsBhq3ZUhaiZ5piHZ80ooMlyOGcyeCReF
         lNTtok5L6TPryJGez3m+ZUwa4ID+XdIihCXvAsNJgPdDk6KD+EeDuRc/vcHQhSYT/eLb
         ioGkKgegajE92gU/tE3JGytFEL3sIpn1zQlDbtwZinNeV21CyWD2hzz4Fn/rhQIGUB/4
         +Ulw==
X-Forwarded-Encrypted: i=1; AJvYcCWczuqOoHSgNVVQCg0ZierN2rBzu8U28eS2Om+oyKTlcV4XVw/dYXorV2CtFzeBwB4clffp9JYIqP0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd/ricke/FycAbTlWNjTnmET7mDFowMhCmZm7aOjSOjkYIuKlE
	0yKmlklglX01DMEknXzGXgj/a4Gn87X+PudmiG2Mdmv+xdX5wQZtktil
X-Gm-Gg: ASbGncuvsPaZzF1I18UfCGaqA3+Ww0/eWJt6TKaQdOnillz2i2Z7X/OgQhQ0QDZwPYH
	SRCViJLN+ih6kRvV9onW4YX+Um8ajJyrc4VXB+7OUOp4CBtGyVSKCpIQhME4q7nNIYb7FtaoXxe
	r3lM5rtgATUhoIlB89QMHfch8pDXbAZhRBmH55YdLIVbRlkHQZp21wyM1zfnh6kiKCJJAuWhDPv
	aQOFPPlVB3dl2ucDfLHPE3pcSTt6M8OpNFe/y1KZJQg1NrubmKggFPeGmpFQMR3rvQzLQpWI186
	fZW3QYuq0/nPxXmSJlkHDY+YJkPKkkTu6poKuyz5qKF1kTCehF41w+go+krbSXV6vBf8P7PqdYl
	qJEg+A7UnKgd4sB72FEcA+CYZtWvT1JlaHiz4zU97MCk9JENH+tehu2/EvBts31nKc51UgxccX9
	mmuaypx5UWqg==
X-Google-Smtp-Source: AGHT+IF1K60L8X5YUUDbUfaqT+WhDWzWe2HWAZE3zZLtHiewIpC9IHuMviFoxvCFWSRO/KZ3uycBcQ==
X-Received: by 2002:a17:906:6a20:b0:b73:b05b:1f9c with SMTP id a640c23a62f3a-b79dbe857e6mr544792366b.14.1764829036626;
        Wed, 03 Dec 2025 22:17:16 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ec2d8csm490159a12.5.2025.12.03.22.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 22:17:16 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4 RESEND] ARM: tegra: adjust DSI nodes for Tegra20/Tegra30
Date: Thu,  4 Dec 2025 08:17:03 +0200
Message-ID: <20251204061703.5579-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204061703.5579-1-clamor95@gmail.com>
References: <20251204061703.5579-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing nvidia,mipi-calibrate and cells properties to DSI nodes.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra20.dtsi | 4 ++++
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi b/arch/arm/boot/dts/nvidia/tegra20.dtsi
index 5cdbf1246cf8..39c0f791c7ee 100644
--- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
@@ -238,7 +238,11 @@ dsi@54300000 {
 			reset-names = "dsi";
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&dsi_dvfs_opp_table>;
+			nvidia,mipi-calibrate = <&csi 3>; /* DSI pad */
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index be752a245a55..fecd4891e751 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -343,7 +343,11 @@ dsi@54300000 {
 			reset-names = "dsi";
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&dsia_dvfs_opp_table>;
+			nvidia,mipi-calibrate = <&csi 3>; /* DSIA pad */
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 
 		dsi@54400000 {
@@ -356,7 +360,11 @@ dsi@54400000 {
 			reset-names = "dsi";
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&dsib_dvfs_opp_table>;
+			nvidia,mipi-calibrate = <&csi 4>; /* DSIB pad */
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 	};
 
-- 
2.48.1

