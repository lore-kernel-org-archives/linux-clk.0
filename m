Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F207322A28
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 12:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764072396; cv=none; b=egr2MaGvq5Q9ktCK1tAfykZ4oUeW6ngtFxfODQxEKSQBh9f1tPe5AfMjywJUeedSjotgg+BhT+Q9Rsuv+7EFq1dkSvAvqZ0jYpWfq/FpURsz4ldAXqE62zoLmRQmy2EDQ/G3gRi86cF+4K2y8/XHfo3jz/N/k2qC1s5E+LLkqQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764072396; c=relaxed/simple;
	bh=23kuWoTWNKvhOROVMoXGvX+wd8gYIFlqPE8dKxScrdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tjtVf2mpjbUPffvVLh4lv5Hm4pM9WIdvPbs8Qyyre0WWApCHP/r5rUZMkwFSsRmAyAdv4v83xPp2XYQUAUirVEU8vs3Z+DlyMPOd+R6xuHEn12/Fx/TM3gNNngOeP+zWQejPvbyVbzY7yGMQkD/zU9q6/6SsCDpBFr7SA7YvCao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUXRuzwi; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUXRuzwi"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-595819064cdso7586485e87.0
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 04:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764072392; x=1764677192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMCaC95H9hS9yxKlb4Uz3MEUVo/SgdFt0jQNHE6SwU0=;
        b=ZUXRuzwis3BHnptx7LFgyUczJ4vAiUvSBxicbHjW5XC8ihOS2YHlel+ntZ41QZy0/p
         TFkPR0sjj81hCTQMpRsK+6fWsmdzM6sJZ4gWsASJ0dwfsTN559qDBeyS2lUh0qLJqbkp
         xg0k77O1FCQ0iy8h4uBRV0DjGSV9TGgZrIdpq5WJVQGkxv6EIeLfbKQgXy07LPD8vaWt
         3ZK2sHUPJBQl9jV4xO+cb/f66SYYq2ijreGbL43aEUxIBM/564JRS+ScjEYZqPKCk1OQ
         jbg0tSNFvRonPPR/tXEj665yB8fKIOmGRdeSNrG4o1HR1qMIXCx5MRNX9WIAUnQJZ4XW
         Doug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764072392; x=1764677192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lMCaC95H9hS9yxKlb4Uz3MEUVo/SgdFt0jQNHE6SwU0=;
        b=TzndlDzgAEkUHI6KPzwyG3CRUyhFSiErJkNYHemkl/fpbhCmJYhAlrPCy+FvLvNHnT
         3pGfNXYI/uKfZTwiAZgMhKemQm02BwVV93RQ1d0MeoUojmjo/cPYYF105Dz3SYfp6HzQ
         jFJ1zAcj/affon1qj2rY7fiABuJqyWGj1XKpFM9C+M6CnUIIRQN+djrMRbf7I3WeASe/
         UKRZUhbjJXPUfeo/+2FVPaa68NJwUJxBN6+LBtInWmmi2iTLp3nT2TizrBcXZ2zaR+zL
         ZcFmYSuL2sQtNd85x1/I2xmWddbV6jWwVXHkffB9jjyYIJKN81zUQzLGL5+w+hAwoe1u
         6vSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdZojOd3IWZPvPnuTbZE2BtFj2TnUaV8svAKVR0z3lgfYoVzi6Qt2fbR0+mEhnfLciDCGShaLf/bU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4IhGlOtPviD/YNjHvSjS+FrpPLoUQyL+G0lm7zDScYBeuK7mC
	P1xtAFvwjyrOlhnrAVZ+e/QFrB9SiWfobpi0pcjXbzNCSuhBUqbbo5XX
X-Gm-Gg: ASbGncuATLD8uwu6hYjSvL+yZ1T7NbRqR7PDypKG3GnOugRwRR41eEnoHARkQlQpjQ0
	2PwUJtWhbe2sNrTBfzdc5YmhIhichciDR2hOmB6cIipr6IFhx7QM8gRxZ66ozWIkXgHmtWF/Let
	cUQ5RWXmoEObpIJ17tGXn03Fci6w+CuGngOj70F15sCMQ1VFFA2C/5xRzdzVm4WrO9TK+MRPFZt
	lhpYwFF7HV0QVSlC6OiA4DqvHY0J5RJyPP5v+zi1OAZ0owd7kNKvrnhmB9UH5CFoAQaqEc0w4Ik
	JnFv2KV9m7LXEq6VDERQNSoZGJWThwcalinelAqz14M1wpb9Z3lun6lNUYXIsdCCbaqSQN5qfP2
	vsgTrn56VxL8lf3sIDID/g/xNNHAA1tBBUl30HDLKlLGlW9+9wmLEY/9jT3/Dvg27erCXZqM/xZ
	A=
X-Google-Smtp-Source: AGHT+IF6vHfga2SRbBlVN5XPN/hZcnukK3C8CPi+5DnZqYSQF6ScQiOLUKDEqTQnFS5G246k7ucsWw==
X-Received: by 2002:a05:6512:3d9e:b0:595:997e:19ad with SMTP id 2adb3069b0e04-5969ea31e39mr6934217e87.21.1764072391479;
        Tue, 25 Nov 2025 04:06:31 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbecb9sm5150993e87.58.2025.11.25.04.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 04:06:31 -0800 (PST)
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
Subject: [PATCH v4 10/12] ARM: tegra: Add External Memory Controller node on Tegra114
Date: Tue, 25 Nov 2025 14:05:57 +0200
Message-ID: <20251125120559.158860-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125120559.158860-1-clamor95@gmail.com>
References: <20251125120559.158860-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add External Memory Controller node to the device-tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index ef0618e9eec1..a920ad041c14 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -259,6 +259,8 @@ tegra_car: clock@60006000 {
 		reg = <0x60006000 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
+
+		nvidia,external-memory-controller = <&emc>;
 	};
 
 	flow-controller@60007000 {
@@ -655,6 +657,16 @@ mc: memory-controller@70019000 {
 		#iommu-cells = <1>;
 	};
 
+	emc: external-memory-controller@7001b000 {
+		compatible = "nvidia,tegra114-emc";
+		reg = <0x7001b000 0x1000>;
+		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA114_CLK_EMC>;
+		clock-names = "emc";
+
+		nvidia,memory-controller = <&mc>;
+	};
+
 	hda@70030000 {
 		compatible = "nvidia,tegra114-hda", "nvidia,tegra30-hda";
 		reg = <0x70030000 0x10000>;
-- 
2.51.0

