Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9800D2ED846
	for <linux-clk@vger.kernel.org>; Mon, 15 Sep 2025 08:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757923361; cv=none; b=kgBEfBqnIzG1B39HAo3/ko9Fd/bTxc/K1uvAUTk5gS1ksfJLkMBJf+7nTN1HwkNoG+Sxk11qgI7QnUd775FwdtYAXHRQHGxeblfpuiHLQAB48o7uDsDC2n1WYwJtBF1ba3zK0HmvSD6atKazcZfK4cdkyROIrYvXcovTR3JTWXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757923361; c=relaxed/simple;
	bh=B4GtJKJBH9yFTatMG63gRF6gGdMXdBZOsjLfxiQMoh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nsm7lfVLWao4tERcQPT1b2aamsIk4OU1RO6L7gKptRjQ5BaVaYyJqJn2mzT+TMhxPz0opF6pWweo89hs2CXk1A2ZSkYaR8Tqp7vkSXEKoHsPEs7FNuUrC0GjcPBy9Lcbc3iq4EldsrW11Jyxhn7xjD0qDvne1qOSrijD7EAXwEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRhIkQZ8; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRhIkQZ8"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55f7ab2a84eso3685067e87.1
        for <linux-clk@vger.kernel.org>; Mon, 15 Sep 2025 01:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757923357; x=1758528157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiS/YOa0S583TqGV9YqRvORe5l4bhLwLn8JjJheNcUo=;
        b=GRhIkQZ8uuVK9O3QHTpsQCbgJr0cQmcJkaoTAft5RTSRRoKNEfBidg8f9uMzxJsDAV
         HsHCUiwLa4NX8J6ngY5SVrBwQdpvHWbq5kGE5J2F2bdp2zJjlSdA7i98RTYlrUI4NMe2
         SzEE3RpMRmZ0f4pailEh/eJmtYZ8ZITnGXzmJGe6He5f7GVL+4WkSCyiDJfKvkLZpQqo
         zYmt65dKs3ApNrpEM1sliXjuv4rsbDdoA9k2QiPaqktCRpovS7pRf5MeTIUvuKS6ULjd
         CZqKDDJ38yyI1okayYBC90Hnp8VeRgvI9kh+YsNzXqQFlSljLUSFpwYW5xmR9nR0At6h
         zkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757923357; x=1758528157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fiS/YOa0S583TqGV9YqRvORe5l4bhLwLn8JjJheNcUo=;
        b=suW5rKI39Z0gTGxXkCg+FKyi+30uuFF8MrXKAKnMeMWjmYMByDJ8HALVT6Q62YDQsA
         idQLmLc4/1VaW1NTRwpArkxIFiyP53wEDw4vf5/1JsNZkv4gcXWyICodfXj1y4qpobYw
         6kIHNz59BeGEWbrc0yXCWhXMow9D7dxMZvG9AiN5OGiAM4jQQEmV9PJDX561OkTpScBp
         m2pzZmXYKDGi1XgFOHAlsjzEYejFgKerZfO+WGnq2xyPLeUi9yVrNFasgbwDsoUKcvHf
         C9XdQt96Plati/qFPS7g/aLXKsV/GVbHSfeGXlqUraqVYjgOjtVYxlodhRiCRjPY7Vbw
         8w0w==
X-Forwarded-Encrypted: i=1; AJvYcCW7AKmJ404vYdTnrIbhYNSDu5fKFfvNc694S5xp5TO1jtMyAAvraloJzQiJ6Gt6PHXpbW8BZ6pGw4c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzScGg65LgxszrCpZPDsQy23iCCwTeBvx+xuTkSHydRfJfg4tgx
	WN7h+qdtL9AKerIENg8Hp91XnGx0YFtX+eTqv69UCdFiQvULyu14HUnJ
X-Gm-Gg: ASbGncvgMSoXj8bVgqg/V7MYqL1p6pAvjytjaLf/KkzrbALKORxeJp5c5W/i2fAryjJ
	uhMlR/LqhdPUs7dJ2FsSDLD/06STwLj5+ax+xoFhSNjp4mUKRfhT2nsZnyNG/8sl0ABa04cL/cL
	Nx1ItdIKecMAHbNZLaXL6Vw7euMKj3JPo57jPgcRslueEYyQ4c5gNTfxhwLQo8+Bg6gpKzqz6FY
	wMCbkNa+xOyM1DeoAFfqp2ufWtH9yKKWMklRu6PlWfdVdrGW4RNKd3aUvNplQc/LOECTqxu/0lK
	Yof8yYKJQtVvDcaivy7gn/M2S6boue69M7x2PX5FsWYEhDRtINWmTIshwhN9vrt4OG40brtpAwh
	WTiOXM0lUSvXErg==
X-Google-Smtp-Source: AGHT+IE+5sSGPH4rlFHoNVcXJtfPfdaGh32XS3N4z2KPM735+7UyzmLj5bDMEXfZtAVl5BWR4mXUTQ==
X-Received: by 2002:a05:6512:2311:b0:562:d04d:fa06 with SMTP id 2adb3069b0e04-5704f99c572mr3714704e87.32.1757923356547;
        Mon, 15 Sep 2025 01:02:36 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e6460dec4sm3392381e87.103.2025.09.15.01.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 01:02:36 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 11/11] ARM: tegra: add DC interconnections for Tegra114
Date: Mon, 15 Sep 2025 11:01:57 +0300
Message-ID: <20250915080157.28195-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250915080157.28195-1-clamor95@gmail.com>
References: <20250915080157.28195-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DC interconnections to Tegra114 device tree to reflect connections
between MC, EMC and DC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index e2bc8c2cc73c..63214109ec00 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -86,6 +86,17 @@ dc@54200000 {
 
 			nvidia,head = <0>;
 
+			interconnects = <&mc TEGRA114_MC_DISPLAY0A &emc>,
+					<&mc TEGRA114_MC_DISPLAY0B &emc>,
+					<&mc TEGRA114_MC_DISPLAY1B &emc>,
+					<&mc TEGRA114_MC_DISPLAY0C &emc>,
+					<&mc TEGRA114_MC_DISPLAYHC &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winb-vfilter",
+					     "winc",
+					     "cursor";
+
 			rgb {
 				status = "disabled";
 			};
@@ -105,6 +116,17 @@ dc@54240000 {
 
 			nvidia,head = <1>;
 
+			interconnects = <&mc TEGRA114_MC_DISPLAY0AB &emc>,
+					<&mc TEGRA114_MC_DISPLAY0BB &emc>,
+					<&mc TEGRA114_MC_DISPLAY1BB &emc>,
+					<&mc TEGRA114_MC_DISPLAY0CB &emc>,
+					<&mc TEGRA114_MC_DISPLAYHCB &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winb-vfilter",
+					     "winc",
+					     "cursor";
+
 			rgb {
 				status = "disabled";
 			};
-- 
2.48.1

