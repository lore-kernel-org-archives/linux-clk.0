Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F394D364D4
	for <linux-clk@vger.kernel.org>; Fri,  1 Mar 2024 01:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709257884; cv=none; b=kl9rGHEi6FafUlavSqTzg58WY9RdB3qeyid3vvXvTEZ9Ty6OfA6sPOlCRg8PJdaDjtfqiRaa24czp4yU70DB11Mnf70AsZgdR6Q1gCArT5kKyZwIm0Qv33HnfvxE/I97fyzQzFLC252KJc442FCT/R29scoOT7HBvRfTTevI0jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709257884; c=relaxed/simple;
	bh=ynSp4BOfTgMg4ogCAHRZ6Dvo2D19rcIObO4Ct27E17o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z/XNP3Qi96pZZSEsHK7bw1uOIPkqj7odcKOMsnSbPMLbprGL85V1VEXYfkev/q3sXPV11ANvdQFfQAJC2XuA88h6sBIUYSX16AOrLWghFObjZDS3q2K2hkLlvhYQkhgMKh51vx2/XmenWSjHFBrX2dOwb71JJcbhyt3peetuULg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ip3sHbMI; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ip3sHbMI"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-204235d0913so928924fac.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Feb 2024 17:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709257881; x=1709862681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiCxGhizFNRcTB4tNXp2x/NDTlkj4gUJN/57L1mqhmQ=;
        b=ip3sHbMIeDpLc+d7dIDNdl/wjOF6EJevj8yb8S5qkEDlbgJTpvzANadccJvdqAAHvO
         0tHBJ3v4M0ap6FxpNPRC7yhEY0zvX4ZeoLWdvnDUc2JcQVgnTc5xGEk1JFoGxnVhiCH3
         uHftbM+ng70tOuRNx1czxCs7nq2TSWw21goVD0jkawQS00TpQiaYYR3S1toCy/lRwe0S
         5IdC37gY6GOvx2OvIyhlUtZhBmgofvMqfXJUAzjvoInMsFz63R4PH6OpsrwaJg88dmRq
         m1BrDlgmo7N3MRB0m+RmMhwv5rLHPYSvtcBb2VFnOB+4J6sGLkswIvw10SAGxeFHhAYK
         Dl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709257881; x=1709862681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jiCxGhizFNRcTB4tNXp2x/NDTlkj4gUJN/57L1mqhmQ=;
        b=kvPYiJZFu89GODBw0Yh8iPy/vvwRQD5epLEweExu4sVKwB8AapiKV6HrnNibIfNMAB
         sHtLqpUTSky8o7KqR3Y8TfCFt4Rsolu6TZUdlH+s21iCe3Tj1HpPxTK2/xFmm1xjIsoZ
         MGpC0xc/nz4FtB4k9dxgxNrCEQWr4LDEYgPQ05Y/5hkiQyRwXqQxgzG+DlGx7zb58DYc
         OzpxvBmd/CcSHc8UB/Zd5cP9GJv3x9QcqnV7bnKtuMco0R+6Gx2Pg0BoNk3jyJqth9IH
         5kPBYPg+Ybbojp4XDrPQJGqnvGB+uKr3neQi6E/6hkdB3Wk0/ZHTUEvlUVT0jgb9hfUV
         JiAw==
X-Forwarded-Encrypted: i=1; AJvYcCWLCUKlCqi1MkVAOxQkx8gjwF56JESPOYlKlregqSaAti+L8/Pj+a6YzMPwV9OaUdT3A4C3EqK3+AJ9pbKF6h7lR/+GCISDszW4
X-Gm-Message-State: AOJu0Yzq7m3s96mxtCzvhXztA0x7Q+EKMbLU8I8ZUxq0mlVAk7S0buad
	vIk+zojNQQAipCl4hRlztMyYN1QGnUZb6Gc0VxZlhf2tQu7zp2MylHmaAXtaDyQ=
X-Google-Smtp-Source: AGHT+IGW/xHch8VdSjPLbyRX6s/pcxfNLRl0cQAlv9++DNTkn4NVmJyqUvzA/3mFGDn1HZks1resxA==
X-Received: by 2002:a05:6870:b001:b0:21e:e9bd:afa9 with SMTP id y1-20020a056870b00100b0021ee9bdafa9mr296486oae.21.1709257881008;
        Thu, 29 Feb 2024 17:51:21 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id wo6-20020a056871a98600b0021fe6bbf8c2sm767017oab.31.2024.02.29.17.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 17:51:20 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] arm64: dts: exynos: Add CPU clocks for Exynos850
Date: Thu, 29 Feb 2024 19:51:18 -0600
Message-Id: <20240301015118.30072-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240301015118.30072-1-semen.protsenko@linaro.org>
References: <20240301015118.30072-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define CPU cluster 0 and CPU cluster 1 CMUs, which generate CPU clocks,
and add corresponding CPU clocks to CPU nodes.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v4:
  - none

Changes in v3:
  - none

Changes in v2:
  - Added "for Exynos850" part to the commit title

 arch/arm64/boot/dts/exynos/exynos850.dtsi | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 2ba67c3d0681..0706c8534ceb 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -93,6 +93,8 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0>;
 			enable-method = "psci";
+			clocks = <&cmu_cpucl0 CLK_CLUSTER0_SCLK>;
+			clock-names = "cluster0_clk";
 		};
 		cpu1: cpu@1 {
 			device_type = "cpu";
@@ -117,6 +119,8 @@ cpu4: cpu@100 {
 			compatible = "arm,cortex-a55";
 			reg = <0x100>;
 			enable-method = "psci";
+			clocks = <&cmu_cpucl1 CLK_CLUSTER1_SCLK>;
+			clock-names = "cluster1_clk";
 		};
 		cpu5: cpu@101 {
 			device_type = "cpu";
@@ -254,6 +258,28 @@ cmu_peri: clock-controller@10030000 {
 				      "dout_peri_uart", "dout_peri_ip";
 		};
 
+		cmu_cpucl1: clock-controller@10800000 {
+			compatible = "samsung,exynos850-cmu-cpucl1";
+			reg = <0x10800000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>, <&cmu_top CLK_DOUT_CPUCL1_SWITCH>,
+				 <&cmu_top CLK_DOUT_CPUCL1_DBG>;
+			clock-names = "oscclk", "dout_cpucl1_switch",
+				      "dout_cpucl1_dbg";
+		};
+
+		cmu_cpucl0: clock-controller@10900000 {
+			compatible = "samsung,exynos850-cmu-cpucl0";
+			reg = <0x10900000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>, <&cmu_top CLK_DOUT_CPUCL0_SWITCH>,
+				 <&cmu_top CLK_DOUT_CPUCL0_DBG>;
+			clock-names = "oscclk", "dout_cpucl0_switch",
+				      "dout_cpucl0_dbg";
+		};
+
 		cmu_g3d: clock-controller@11400000 {
 			compatible = "samsung,exynos850-cmu-g3d";
 			reg = <0x11400000 0x8000>;
-- 
2.39.2

