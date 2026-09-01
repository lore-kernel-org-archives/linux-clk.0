Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D745947669A
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 09:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254715; cv=none; b=Du2OJ3/W6GqObBsO2h5m7AfZ49UpfSASYFOvXccRwLVZtCq+Ib/tHBbBiAcIpr8cGa+TqU7kkhdCzBL15SLRkQthCSLJr0Lnt5Y2YuQayGOM1cbLUBOW3lGSA12bNLDmBhi2kMk2x4ImGRa7BlU4yvqmZrwXhZyT31p5s74OYyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254715; c=relaxed/simple;
	bh=REU9wsPaGJNSTwmn511u8FyP6qTye5YD87sITI9m9ZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b6YM7gXANJG+xo26ZGQc9PLczxHF6dz392PtX62DOhplVRQRNIEJ4hRp6pDs6UzOoBKIwTzc3Uh7w1YH4wNj44ypsn6Ow+TljeL8+kF+oH98ZIPudNx1Fyvm2PunFgMUcrG+wZrB/jYbkGq0X58CY6Ltj77aCk0JrYzDhFfI7QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e8ZPY+wJ; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8ZPY+wJ"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso3112393a12.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 02:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254712; x=1788859512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z60FD1fUHm9+bC0HRYA7KQCUR9Tk0sZxFZNLgaVknjk=;
        b=e8ZPY+wJzu1SRJP5X72gehxlvrce2e53sW86p8Ph+67FMqMfUnTymMQed/5lGAILSb
         t6rFkJQIRg5nhoiUjV9dYYlgjZ8tPv2NS7QwubcCGIkgdw1QhFqtFE0mmGmV/wNP7NoZ
         vnJNwoJekJT8LnHsqH0hgyvughwpCLrC9nsBs+xVENF7SnIb3NUMZaLzrQ3rQyV/rgPU
         X3oh35k5RaZ6ie0udJIbY1d88HV3/dSIZswuTi1CVd79mRkDDfNkLTrt4MNdENQrgOld
         1LCwh6bvvtgnZtu3F40eoKPsU4pvXfuiaxqPAeresBY756B8a4kUgP3TBQ1/UsoJXkT0
         wGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254712; x=1788859512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z60FD1fUHm9+bC0HRYA7KQCUR9Tk0sZxFZNLgaVknjk=;
        b=C2bt8YDAji/9gx8NNfyTiPTwKefoA7M2qCeL0aP4sMvCtGjYDVzmeChGbu2p2iBGy8
         BNYuGVPnlX0OhpNHdig7AoGt7T16CkWX4BczbrnLLvAWOoFW/DzfLDkvi4Um0FP4Mwoz
         pRAKZKPtaKfGgvT4i5Gqs753Jb4+2X8SNo9AD+km3sA828a8MD8jgeZoMHx/+kpl9lua
         oP8rJMX6X2wb5PLWoz/LA/G9bXz+7oPsVdZrd4WWgOSi2y3JUXgOqYIfEKZAzV8wNqlF
         YF3vwEcuVzkJ+tZwp4gDZ+NomUfeON1gBH9Zh7tqJ3wUVeasy9xOwkTzPU/zqTa1ToNp
         p43g==
X-Forwarded-Encrypted: i=1; AKwUvBzF3a3tKGij9u5W9jlc77SPwRN7+jid7mmWf8PeXaMb0WfR0NsQwxfNGcN0W4pJSv5qDfReKO7V8Dw=@vger.kernel.org
X-Gm-Message-State: AFuF++mRCXwTkV7Yw0JWYb1ZmRkrnr4KMUnD5lHqqAiN7S2qljPmTH6U
	KW6xqLHsUtAR4GnclEOlwuSM1tQmOi+7LnTbECirsHO6sUUgKsaNP+6m
X-Gm-Gg: AYBFou20ueXdqw+Kb7yIkzc8f6wGi3PFshgnT0sFWDYahaMMPq3KCNotKvAAAZZC6fE
	+FjCiejee70/xhffN8g1mNB9sot0EjO9iYhP+xl/jqBHw/Q0NpB2zKMkqjsOCw/ax4DCEEVNy1w
	jsi41+zzSG4NC/Hi/ElPm9Ej+dmgy10i4JF1t6whQxs65IT9HrZcktI5+6kIKue9VWFkiwDnozx
	NYx0QUSOmSgdW5e6Se3gYLKpBnYZH3+hd7olPzCwOIGllJmUmOBabj9Rk6Jl8b2O8mf8/xyO+jD
	hICXYiobiK0qGjIvz6SkfuKFh9POdPfKoRvcWuiBMN0eorffzXNvaiqI5oMIZElhUcNGSaVd1P3
	wAKmx3/DvIJrnSizv5+lSvaDnNhJimWze2weaVwTnumEUhZ0eyQJk/Ois4UAWqWQg1Q9kZcGC+S
	SMZ4xb+k+egy6KtUnxjRY4HP4EniYi17t1OxDwNS4ZplUW6vshWB+I2OOn4+0vpDnjyPr2loPP7
	tJWyqIajVuVS0BGpYHQeyg=
X-Received: by 2002:a17:90b:2f0f:b0:380:540:d499 with SMTP id 98e67ed59e1d1-396d0ed0023mr51208197a91.6.1788254712068;
        Tue, 01 Sep 2026 02:25:12 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:25:11 -0700 (PDT)
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
Subject: [PATCH v9 00/12] Add initial support for Qualcomm SM7250 SoC
Date: Tue,  1 Sep 2026 09:24:35 +0000
Message-ID: <20260901092447.3028-1-sreeshankar0910@gmail.com>
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

Changelog [v9]:
> [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
  Make all clk_init_data instances const across the driver.

Link [v8]: https://lore.kernel.org/linux-arm-msm/20260901070717.20513-1-sreeshankar0910@gmail.com/T/#t
Changelog [v8]:
Same as v7. Resending the full patchset as v8 due to a transmission interruption during v7.

Link [v7]: https://lore.kernel.org/linux-arm-msm/20260901064357.20055-1-sreeshankar0910@gmail.com/T/#t
Changelog [v7]:
[PATCH v7 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Fixed missing (struct device *dev) in gcc_sm7250_clk_regs_configure
  Link: https://lore.kernel.org/linux-arm-msm/apYNXZ9TJEC6rVVf@baldur
Drop applied patches
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
[PATCH v3 04/13] clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
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

