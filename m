Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302C94CCDFC
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 06:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245065; cv=none; b=d7KYx7MPNk9mUWpfrlcnB1b1A8RVDzSDfokf8bsAilPiunrjPCMlDe5uD/EeRxENC93UjVdkNWsKwD7sOWe54m0FvfILxHibm9Bs2G4W5qUfaaDMlKX0SNIl7r4wfhAXE/Q667zcMVte0z2lBGdNzMowRQllinOVUsLMCeBT/e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245065; c=relaxed/simple;
	bh=hvl+0bAgRYzWOF9f6YHJQyy9sBDMhoZs6nvEmWk5JUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H2CE1W/KUmv7C1u60Pu/AiGwCPgwTddyBc69Mu8suMQjcVzwCvSUeAeQb9tcg5WAt9OMSO6Ik2DVbxLVDpxnzGPNPawGal41tHQ/aVmiHrWynObBl6d6ebo4EQ9HfHSfcHtLqlub2rs6JgwwW1JWk8ce62DcHE6s+HU1LgmF9EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHO7CH2b; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHO7CH2b"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8485b358552so4437531b3a.2
        for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 23:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788245063; x=1788849863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MxhfVXHrtYBbqB+Lo9AOFdGcFZRIzv055R5MqEdCuA4=;
        b=ZHO7CH2bkvA1q5KrjjP2H5SX4fKfOjvOmSp2ycztrFRxjHZm4pUd9AyLDZcFsivefV
         yG44DpK+ZYI9+vQz/6m2ADdhgOWmAz/oHkUviAGvqQ69mZdpwr1/OCRn7Mp7QlkFFWIK
         vsq0xzUZP+K/3PCLzDgajSFCmijq0Hjy9cIuTmLO+S0hM/iqYv/DHlgboOLSc+nD+qY3
         NNHGRFtoSgGdO5sTThl1k+KgrK3jTLCyV9suP7BvHF3lntvlSzV5M4XVwViFAFjevj5/
         BcXczs+BOyI+6hKmOOcVHIpKUcTlgO1jaOtHjrb9VQIetg2tHjuFVTV3pLZsvC9sPtkj
         kzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245063; x=1788849863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MxhfVXHrtYBbqB+Lo9AOFdGcFZRIzv055R5MqEdCuA4=;
        b=XNwXzr1iMndIMTHlCOGH4eVf3Q44nTdB8IXKwgmE44wZyj95yEVKxAEj9uRRVxerD6
         YBJfJ9k7GzxxXYSwUSPR9qVjIvOY66mPQO1UfqfMnlP3yPU2R/Fwhaeh3+pHUZMuakXz
         f01aqXEDj2VvrykwbPMoc/zleoFF4odktxABUicHsWftxJivii3VQp05FodIMc3vOdnG
         3ukmIqEQ0Mq8qSX2Ur2o2aQ05PB50czdiBRHqEeGyIyKBWZuGOCBKnyQcG3ZBvOHotfh
         bjtvQIGVdeqkLQp/PdSvgvXTqi8XVByAGQCutWILzNU9IZ/wnyyPPvPDB9LcdYfLRULC
         LlKg==
X-Forwarded-Encrypted: i=1; AHgh+RrpInuEkMN1ctlJWligvy38XjsPETFIgYbZO6Yaw3st09DFNhKRVIGUdD8SeQSaHqdk9LYtesooFkA=@vger.kernel.org
X-Gm-Message-State: AFuF++kI1MNJtMK1pmG+NywDJKoLsD7qw+TIEZ1sQo8ptbu7wNtxn8X3
	SSIi5omJtOB0G//fN0KrDpQZb1X/3M+jsUQYAr58JO/QpRZ3ir8py28L
X-Gm-Gg: AR+sD13mTatpAffY8gUJ+MVHAZh8jntav1CiWisegyPDDBIVpuakvjgozEegFaxELzQ
	NvSc6OOmSh74QLVF80kZWq+xVChJ+7Dmoy7qb/J2QCrZbO8rPUtwFD3ESLopRAQ+duzA+jsv947
	Hb3mJK9hsUk9j9onI3DKHBumw0m7vJJGSbAV6cKLIN6brXrz6s+fBLu++aC+T5X3b5TuFV7i9dc
	PIifLPP4W0yoNIM2ij0nkV3/KN2d6tsN9yCdWynoG19fjJHYQ/8AkblEf9yiOzhzofrvtMk47C3
	FrkY532q2Clz7mbdyPSV5Di5xeHvwaznVmzQQQF2fff67zJZu3T0iKnWJpjuwHodcOOXI+oZ31s
	bDNkKAoWuhfFxGFlLO8HLzRsXqY1mrt7iivw1llD39K8KqXLrUyNiLgK2TjWAE/xDk6AQSz0W4+
	dXR5zX4L4cPTfClos+K5EFztnhu9b/EDSzdzV5iaQAlcddkZQWp04C0GlPka5rYxxrzFeeqPYR3
	x/Ry1ae53Ub
X-Received: by 2002:a05:6a21:a34c:b0:3b4:7e2d:a3c2 with SMTP id adf61e73a8af0-3d7afe3b13amr10060658637.18.1788245063507;
        Mon, 31 Aug 2026 23:44:23 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b944bsm37019784eec.27.2026.08.31.23.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:44:22 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v7 00/12] Add initial support for Qualcomm SM7250 SoC
Date: Tue,  1 Sep 2026 06:43:45 +0000
Message-ID: <20260901064357.20055-1-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset introduces foundational upstream support for the Qualcomm SM7250
SoC (internally codenamed Lito).

SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
and 6x Silver Cortex-A55) and Adreno 620 GPU.

This patchset is organized as follows:
> Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
RPMh clocks/power domains, GCC and cpufreq hardware).
> Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
interrupt controllers, clock providers, power domains, and reserved memory.

Dependencies:
This patchset depends on the following patch:
> [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com/T/#t

Changelog [v7]:
> [PATCH v7 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
Added missing (struct device *dev) in gcc_sm7250_clk_regs_configure
Fixes: https://lore.kernel.org/linux-arm-msm/apYNXZ9TJEC6rVVf@baldur
> Drop applied patches
1) [09/13] dt-bindings: arm: cpus: Document Kryo 475 CPUs (commit: 1c8fe8863780705aba77893fade65f728e82b67a)
Link: https://lore.kernel.org/linux-arm-msm/178822856275.1835959.3848131517961346933.b4-ty@kernel.org

Link [v6]: https://lore.kernel.org/linux-arm-msm/20260824150156.1310-1-sreeshankar0910@gmail.com/T/#t
Changelog [v6]:
[PATCH v6 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Make all clk_init_data instances const across the driver.

Link [v5]: https://lore.kernel.org/linux-arm-msm/20260824130437.2771-1-sreeshankar0910@gmail.com/T/#t
Changelog [v5]:
[PATCH v5 13/13]: arm64: dts: qcom: Add SM7250 devicetree file
> Reformat multi-entry phandle lists (domain-idle-states) to '<&a>, <&b>'.
> Reformat multi-entry tuples and string lists (qcom,pdc-ranges, qcom,tcs-config, reg-names)
to one item per line.
> Enable QUPv3 wrapper globally by dropping 'status = "disabled"'.
> Move compatible property to first.
> Remove clock-frequency property for timer.

Link [v4]: https://lore.kernel.org/linux-arm-msm/20260821154030.2514-1-sreeshankar0910@gmail.com/T/#t
Changelog [v4]:
[PATCH v4 04/13] clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Update .fw_name with .index
[PATCH v4 13/13] arm64: dts: qcom: Add SM7250 devicetree file
> Added missing capacity-dmips-mhz and dynamic-power-coefficient for cpu@300
> Added power-domains for cpus and apps_rsc

Link [v3]: https://lore.kernel.org/linux-arm-msm/20260821081125.4522-1-sreeshankar0910@gmail.com/T/#t
Changelog [v3]:
[PATCH v4 04/13] clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Updated the way of registering critical clocks.
> Made some more clock critical.
	GCC_VIDEO_XO_CLK
	GCC_CAMERA_XO_CLK
	GCC_DISP_XO_CLK
	GCC_NPU_CFG_AHB_CLK
	GCC_CPUSS_AHB_CLK
	GCC_NPU_BWMON_CFG_AHB_CLK
These clocks are flagged as critical in gcc-lito.c

Link [v2]: https://lore.kernel.org/linux-arm-msm/20260819152545.3934-1-sreeshankar0910@gmail.com/T/#t
Changelog [v2]:
[PATCH v2 12/13] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
[PATCH v2 13/13] arm64: dts: qcom: Add SM7250 devicetree file
> Added SM7250 cpufreq hardware

Link [v1]: https://lore.kernel.org/linux-arm-msm/20260818080754.4362-1-sreeshankar0910@gmail.com/T/#t

Sreeshankar K (12):
  dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
  soc: qcom: socinfo: Add SM7250 SoC ID
  dt-bindings: clock: Add SM7250 global clock controller
  clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
  dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
  clk: qcom: rpmh: Add SM7250 rpmh clocks
  dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
  pmdomain: qcom: rpmhpd: Add RPMh power domains for SM7250
  dt-bindings: firmware: qcom,scm: Document SM7250 SCM
  dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
  dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
  arm64: dts: qcom: Add SM7250 devicetree file

 .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
 .../bindings/clock/qcom,sm6375-gcc.yaml       |    4 +-
 .../bindings/cpufreq/cpufreq-qcom-hw.yaml     |    1 +
 .../bindings/firmware/qcom,scm.yaml           |    1 +
 .../interrupt-controller/qcom,pdc.yaml        |    1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml |    1 +
 arch/arm64/boot/dts/qcom/sm7250.dtsi          |  771 ++++++
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-rpmh.c                   |   24 +
 drivers/clk/qcom/gcc-sm7250.c                 | 2275 +++++++++++++++++
 drivers/pmdomain/qcom/rpmhpd.c                |   19 +
 drivers/soc/qcom/socinfo.c                    |    1 +
 include/dt-bindings/arm/qcom,ids.h            |    1 +
 include/dt-bindings/clock/qcom,sm7250-gcc.h   |  163 ++
 15 files changed, 3272 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7250.dtsi
 create mode 100644 drivers/clk/qcom/gcc-sm7250.c
 create mode 100644 include/dt-bindings/clock/qcom,sm7250-gcc.h

-- 
2.43.0

