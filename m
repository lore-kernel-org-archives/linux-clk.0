Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FF3192B68
	for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2024 19:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719430992; cv=none; b=qH4kSYkjM+DHj/TzcX9AiqZghYHn2j9iousPVu0DLRIq0pGV0ro5z5rA4jPs49BkXChx6/GwfowS82PCY4QFxUieP3TdeUt7JBIxWHZjmujbANz8xayKTyZp7WPppHxjHfzMfWMildDP4bGfJ4kvAlnAplvaKe+4FZsPNrd7sWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719430992; c=relaxed/simple;
	bh=cSR0gYcxjPBmP6LYpUXWyVrCem1Nc/dEqwkoBvR6aRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J8GjssVz0Pw85D+UenffERzggzM2olluJIZIqoCKWiTcoN42gBioiuF0eSXj9uMkl9+FCvK1rKQXY6mhc3x6GUmt2Y1cMsESm/LK9f7qMXwIF5ttbWb44I2yBi4PmiilZdXpAzIE6TqWWJ+siOOg0bhA26VxJsuzXJSKsXzn8VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RqFF3BY8; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RqFF3BY8"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-424f2b73629so11159645e9.2
        for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2024 12:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719430989; x=1720035789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6B6zMz66mId752W71/Awh4RoZkm3MLOugnC6sEYYCNg=;
        b=RqFF3BY8hvS05OVOt1eDzYCLugrfFsKwbqWl7zV06OKnhPh5nSGckrfh4MgPSuy+Zf
         fiZc43dmgXfEx+TnCPTXLVM9mQlk3QN+HTcvXtGhl5Rv6qf9CVL9qg1vhuHixWw7wNR7
         Zs1MeJOy/0SlB2aX48KF+NprqpsywME3smMYLEXcegL/lsMKto81kUeHSzHYU2tAgUS1
         AARGiRqu0yApnnEns5LOLO+FkYirNEBvy4e74sgnImczvkbNf0RPXXnsWK3JEiUXi7SN
         rUNYEphPWI9dVY87ba+zB1xIsSYpVFxLNjaR/HTKREiRO9WfDL2CUa4nGrgRkZgx4zsX
         lDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719430990; x=1720035790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6B6zMz66mId752W71/Awh4RoZkm3MLOugnC6sEYYCNg=;
        b=AFIBruynxPpJbi4sip5fE9ONrArmuy9PbMYPrXOApVRouFgz+l8sSQgQiVl0S+nqY5
         tODAvmcyzXjTEgPS48D5OKKYIr+44eXDdYwDkdzFzkT8RnuYeD4wrkTF6JoWs9HcfHU3
         V64hfmWkdEpj2qYV8rCi2hf/FrabFEISsHZ/iXZYUOCGCExszhhLmynqJ1tSFTY14jlD
         2LClzwVAtDIYxRlvuhD9dHeseHddkLPGqphU8ldmVDxNOyrcxbKCFiqdfMer6ktMzj7M
         0CgSxwp92IhRiZlBulGn+PBj+0zYukbj8idl3jNmfd759+GgW700gGt7g0va+kvcPb3n
         Cxbg==
X-Forwarded-Encrypted: i=1; AJvYcCVy6ZKMtiui5yHaKbxo3/6rMQhJlq07+7D33JuaPrQRCPWZTcAGDn6UOF/Ptik7Qi2RuQjE3YpYOdyCD1wTfGMHy7kdwAbzJP2L
X-Gm-Message-State: AOJu0YzHpQvov9ihFOzDDBzwyVF92/O3S0gP+6E7cXnoPmUz8UafMOsZ
	DZC7qrtSQJU3VxBoAFIWmr4V+v3g8wIJ3eSmoMGFlYjBBeumq/vlLFY7mRQn0Vk=
X-Google-Smtp-Source: AGHT+IHE/9FMLNxeq1ujy3GK1f/VeuXsMI30Klw5I97NuBAg2W8K6Jh0ubTi20bQaUpHSFcBiirkNw==
X-Received: by 2002:a05:600c:43d4:b0:424:a4a2:9478 with SMTP id 5b1f17b1804b1-424a4a294cemr41167465e9.25.1719430989622;
        Wed, 26 Jun 2024 12:43:09 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:24d9:a20a:2de5:8eda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c837eb2bsm36728905e9.39.2024.06.26.12.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 12:43:08 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 1/3] arm64: dts: exynos: gs101: add syscon-poweroff and syscon-reboot nodes
Date: Wed, 26 Jun 2024 20:42:58 +0100
Message-ID: <20240626194300.302327-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
In-Reply-To: <20240626194300.302327-1-peter.griffin@linaro.org>
References: <20240626194300.302327-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reboot of gs101 SoC can be handled by setting the
bit(SWRESET_SYSTEM[1]) of SYSTEM_CONFIGURATION register(PMU + 0x3a00).

Poweroff of gs101 SoC can be handled by setting bit(DATA[8]) of
PAD_CTRL_PWR_HOLD register (PMU + 0x3e9c).

Tested using "reboot" and "poweroff -p" commands.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
This feature has a runtime dependency on the following series
https://lore.kernel.org/linux-arm-kernel/20240621115544.1655458-1-peter.griffin@linaro.org/
and also the exynos-pmu and clk-gs101 patches in this series to be functional.
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index a66e996666b8..ce24b80985a2 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1394,6 +1394,21 @@ sysreg_apm: syscon@174204e0 {
 		pmu_system_controller: system-controller@17460000 {
 			compatible = "google,gs101-pmu", "syscon";
 			reg = <0x17460000 0x10000>;
+
+			poweroff: syscon-poweroff {
+				compatible = "syscon-poweroff";
+				regmap = <&pmu_system_controller>;
+				offset = <0x3e9c>; /* PAD_CTRL_PWR_HOLD */
+				mask = <0x100>; /* reset value */
+			};
+
+			reboot: syscon-reboot {
+				compatible = "syscon-reboot";
+				regmap = <&pmu_system_controller>;
+				offset = <0x3a00>; /* SYSTEM_CONFIGURATION */
+				mask = <0x2>; /* SWRESET_SYSTEM */
+				value = <0x2>; /* reset value */
+			};
 		};
 
 		pinctrl_gpio_alive: pinctrl@174d0000 {
-- 
2.45.2.741.gdbec12cfda-goog

