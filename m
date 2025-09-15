Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471D12ECE8F
	for <linux-clk@vger.kernel.org>; Mon, 15 Sep 2025 08:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757923358; cv=none; b=fyLQnI8F5fzUK+UOiqwuEQ21oS6Zq+YzDDBWFt5bR0/Gj/WgOLIpp15VuMnj2Zce7YAslNK2Uw/8OfeDaQ6IS9yjRaH/qyBEuCHMTpUBPYq1EH7ioHZmfuN0kNFUozwlEkTz2+J8oV6eWGUn0ua1BDsaQDVwmPN+98xavPh6My0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757923358; c=relaxed/simple;
	bh=ZP8BJdLxVhqepTeoAprsQQoaHGTUWulf0MMPVFLawG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j2jEWRlWicNkYIT6sf/HtnNQtPeZ+qNaB8IiYhYjKjnDsMebZ9luBeix9J3X1Lw78tBR9kxRTVBG+I6dzeuXX61yOjoC5ncHDYieKnbM4rR9++WBwVZj9e/qfsuiXZ1HL01OUyppeuHQlT1nZiUKhKviU+UbCmu+9AAQ1010HAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+fuKF7w; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+fuKF7w"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5720a18b137so1599596e87.2
        for <linux-clk@vger.kernel.org>; Mon, 15 Sep 2025 01:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757923354; x=1758528154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Q6qzvg9zj4AYnHkCVKkeQvxjf2xeDhmuMq00LQsCh0=;
        b=c+fuKF7wx+JJzb6++e9BxCG9/jzPP4EM0AjgBnzHrrJRbzLoI8iLp3tPeqOIOkbb+s
         kTxvpg9VrJ9xxdG1QjKGO/7Fx02F6cUD1Nbv43OtAM6pan3MzQ8J79G/QnzAGDZXSRK6
         4iOV8pfFmFF9CiYmZzfmgKIH76hFrmmj71cQq71kbzjhWLaOM1Yq2+GHCZxoqRwZOckz
         cIWJLDxCKnPx/3ymuIq309nW17SmKX6smQSCphfpmvqFeOvewHfQT6pl2VJR4p8roFE0
         ByWmcmwzmG5dDs82qVPS6Y1b8l7hdZerHCkjh4hC/0KxRYoJudeaknz0Td2JmkW4vAOh
         dCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757923354; x=1758528154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Q6qzvg9zj4AYnHkCVKkeQvxjf2xeDhmuMq00LQsCh0=;
        b=Dxc149/wXK0O6p03mKFC4b2rWjDD8rcKXVdkbGmeZHntRvhp7CWa3GjgZdi3cTfCXk
         Kmpxr4isjTTBGou7cjAHFci5zlUL+mHRP7hZSHGVrGAIWpltb4wysx4vE0dZeqVX95EN
         uK3ilnMohajs57rK2GLF0RT06FWZsoxVqeMaI0tIq4VAtgUehF4ZPkZxHz0/36h/LSfp
         u2nLtk5VxARDaJ6cnDUI0LDXOA95wahQyGDDIPorzXu8YVg168vt6O2PL067rw1BnBog
         051JR2rnUFLcJg7/zwfsLHKe0TFNCuz/qk+ts+tS1aylPoA0vtqzOKWGzK0iU7xqKMqi
         U8Sw==
X-Forwarded-Encrypted: i=1; AJvYcCXj2qgdVNkXMhdqrk/hjrtp69h2QEk3jT/zO7R13x0EfjeziG4XiOJJ+9/lsswn5EwcBNh1i7pw7yo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMQvMaQ01uGOchTHDLBQRwIMmhDS1tgsyp6bdqkxxm2G/I3awM
	gLUQbbiwX7vOp/BG1V9Ys5dAWlvaM2gWLtiKInlauxkyjmo7DSwsDa0h
X-Gm-Gg: ASbGncteGhWVqxGRq4EbE/ZleGYh8c064gGJ0jF1t6Ytyefpq/Xptd7SUhRaC2L0oE1
	2yKOkXPy4eBXGKIvnXRrjMNq0NQ3EFp+lbAo17ihyf5kaalqA1K54bh7NNwXR1vvnEvHmmEHF64
	O+es10wWbPQUY/zFXInyhUELSHDWU83kdbljm6meGxZAol1f1gzAAjkF8sw2ciNzCcStuCfHwdk
	8RM+EcBruMvpjTG3w366LdXOVgBsbDSQ0GhjIG1BPmb/KLFCArpvaELwECcGRRRXNaNmebWP14k
	cKTFlkAV6RngaX13tiLrhMCZ9Ww0eCgTCqvOCJcn5GyjoaFRvW/VhSK5sQ+GiR5iAAkyK7WAyNY
	dtYKemWgPQP6l4CSv5t1ehFND
X-Google-Smtp-Source: AGHT+IFZHs9D3Q3V6b7uZxWsk/CxcN0Yj5+tr/3CYQ3DU6NoLaQn7oKgyUGIpmZVSIsX3gAHlFow2w==
X-Received: by 2002:a05:6512:79a:b0:55f:536f:e89b with SMTP id 2adb3069b0e04-5704fd772d9mr2486863e87.53.1757923353985;
        Mon, 15 Sep 2025 01:02:33 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e6460dec4sm3392381e87.103.2025.09.15.01.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 01:02:33 -0700 (PDT)
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
Subject: [PATCH v3 09/11] ARM: tegra: Add External Memory Controller node on Tegra114
Date: Mon, 15 Sep 2025 11:01:55 +0300
Message-ID: <20250915080157.28195-10-clamor95@gmail.com>
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

Add External Memory Controller node to the device-tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index 08f81a3d11de..e386425c3fdf 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -195,6 +195,8 @@ tegra_car: clock@60006000 {
 		reg = <0x60006000 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
+
+		nvidia,external-memory-controller = <&emc>;
 	};
 
 	flow-controller@60007000 {
@@ -591,6 +593,16 @@ mc: memory-controller@70019000 {
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
2.48.1

