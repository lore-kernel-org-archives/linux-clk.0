Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D413B3446B0
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 04:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124838; cv=none; b=oCADQn/YI2FLvl5bGU/TnOkGQzNX1IqgVAjLqu+zpqrDEh+WYu4aWlJqnvLpRonJ2WzwXBK3qtL+ffq9WBS12BqtrDtJ4mBUBGFx8e3ralx6jqKpT71rgzjAg5UOUm7g6p3a59fY68Ugu8M9i0EnvcuxRZMbW2DCDP14dsdryWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124838; c=relaxed/simple;
	bh=NPselX8jhTM98gzV932AP1M18hySEO6deIgAQViShos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kIDLgSo++Jyc9APHSlISpSj+UftjyqUAxioPDyB532e9H/wir/GSOwR0h6uOAVj6w+zM0YJ+xbhj9ZEYW6dj9vjDofKDC74lVXf/csswAg8Xm6LlDi6sH8Lv73Cw11iKuJ3g+2fLVmdVjx7lx6/Y01Hk8zJ1sAZpLFYRVA1uXCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qr/PPGXy; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qr/PPGXy"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-16ad92569b5so5787860c88.1
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 21:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792124836; x=1792729636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mntqcOgaEVA2dJqWvU6cdKK600RbvIE/Xn15gv5EFmo=;
        b=Qr/PPGXyGdsY4ei1n1QH9xOaY5j9sCBORfFnJp78jRw1Al9Be74YM8KSLX+Xq/HlF1
         J5XAiR545tYh2y7ZVTZeR+Zvqx5neJAdrX8kyrFcQno7HGrwTvRFLr0AgVE7M2LZYq2E
         0cZyCLN+gJ5mrvwqhPbtIIGthG/NYqAn2C8iEe5BZdLUd+9NUhXOSvS0AmdUygTTrvkL
         RhFbiPjJBY2IEQ9UWu1NKv9KmbwLu9Dm3Z2jSKLr3ZaEsIFvIUfhhPVX/Q8JmLWhCt1m
         svVWXuiNiC8sD2fLeftSnrM9htYxO0iLvc+OS1Io+JfMRBABJGEw1jbjdpini6oVocQF
         1Z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792124836; x=1792729636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mntqcOgaEVA2dJqWvU6cdKK600RbvIE/Xn15gv5EFmo=;
        b=q1jGN+9G1NO6h/D3Lm4XHlJbBmdjTr+E4wpOP4ImHg/vOKsUZsyPPtBPddfinbgS6Q
         NGyIIfhvolyMR456zUOfpJf8flZkKDTcr2OVPpYGiQeF0YR+LYjW/nOKkP5DSgwDEON2
         y+Akaj8wN9vIO6feugvxBTmbCxCVJ/2DfMnNlcNEhkjAb2OfBKRnkz5svW7NfQ65F/AP
         VXj13zbFK0qq3XoQbUWuoKnsAZef7rlJy/ri0IWteyjCWet6m58GOKKC12l+Nl/rpwlt
         SZXMrYyKd6WqLEi5zejpAMw+JXHuHNv8uOfEFVnbKUpSPqJ30lmFbsLIirevjBF+nLft
         iZuA==
X-Forwarded-Encrypted: i=1; AKwUvBzma5flhTuwBiYlCCaOvyDsRiYQu6Z/YO2KsTbwM0pZd1sp0awHdbyfBiGwEO7M8F6vqnVUW+GeOMQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI//bASIKnZo5SlAz7/u6ss/K6DWLnrPruUthPtKUFcKBV9LcF5
	fK+tdYTarvp8zIg+4puCACG8xJdNJueeeoYNg9oR+G1jmlYcnfUV1QNw
X-Gm-Gg: AYBFou2yta8ve3Ssnhip9zlQp7q2eJGU2qyqCqx5KDQ9aH/8SgqtWG/Pp0sdMOl2FJr
	aD631rufeltb9R6fsZuqdHdcte+SinIk17QfXHwLrVJlv7qtkVYKsO0iftSJcZkx2GaBEH+v07h
	5P0zw6POQA9BiMBSPJlgxXPo3VdLl1aUJjyrcW72rTYOOxZC07KcNq+7rw+MSfemibv7mTNd56i
	2zXEN9CcMciSNi6HiYfkMzLzS408TbQUlTOkEagTiAOt2oQbCxKkJp3Ep79UFL4dVxFy+VBiJsg
	ya0bLLSjMzkRy8xvuWKwhrUndKXtutrUrwgHxkrunxTYOwrscH0QaOvYMQHuZPsvYSICAKTaTxx
	sk6rRDsEA0cm7T9tV5IC5h1KxNgnvzGOK0uaYs16sJub/BE1oaIFsHu032FfSeTUNMIlBauio6a
	659rIwJCfMKfneCfJCPrWd9YWKsiBzA2DqTsWnkM9ojAFDTjmke5AjPHTOmf+F0PvWjz5ILAKDU
	23rKj9R96tKy5dE8H11VS7gQSVNS3vWJ2oOuMIWZoHofYLVarpjMHQcU6a2D+qK
X-Received: by 2002:a05:701b:4508:10b0:154:fa0b:6df1 with SMTP id a92af1059eb24-16a5e49d6c9mr25908560c88.37.1792124835685;
        Thu, 15 Oct 2026 21:27:15 -0700 (PDT)
Received: from localhost.localdomain ([152.58.201.32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm2644712c88.16.2026.10.15.21.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:27:15 -0700 (PDT)
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
	konradybcio@kernel.org
Cc: danila@mainlining.org,
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
Subject: [PATCH v11 0/5] Add initial support for Qualcomm SM7250 SoC
Date: Fri, 16 Oct 2026 04:24:27 +0000
Message-ID: <20261016042432.824-1-sreeshankar0910@gmail.com>
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

>-----------------------------------------------------------------------------<
Merged patches:
dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
soc: qcom: socinfo: Add SM7250 SoC ID
dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible
clk: qcom: rpmh: Add SM7250 rpmh clocks
dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
pmdomain: qcom: rpmhpd: Add RPMh power domains
dt-bindings: arm: cpus: Document Kryo 475 CPUs
dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC

Pending patches:
dt-bindings: clock: Add SM7250 global clock controller
clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
dt-bindings: firmware: qcom,scm: Document SM7250 SCM
dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
arm64: dts: qcom: Add SM7250 devicetree file
>------------------------------------------------------------------------------<

Changelog [v11]:
[PATCH v11 2/5] clk: qcom: Add Global Clock Controller (GCC) driver
> Drop hw_ctl clock branches
> Populate default values for GDSCs

Link [v10]: https://lore.kernel.org/linux-arm-msm/20261015051926.13752-1-sreeshankar0910@gmail.com/T/#t
Changelog [v10]:
[PATCH v10 2/6] clk: qcom: Add Global Clock Controller (GCC) driver
> Update .halt_check and .ops are per the review.

Link [v9]: https://lore.kernel.org/linux-arm-msm/20260901092447.3028-1-sreeshankar0910@gmail.com/T/#t
Changelog [v9]:
[PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Make all clk_init_data instances const across the driver.

Link [v8]: https://lore.kernel.org/linux-arm-msm/20260901070717.20513-1-sreeshankar0910@gmail.com/T/#t
Changelog [v8]:
Same as v7. Resending the full patchset as v8 due to a transmission interruption during v7.

Link [v7]: https://lore.kernel.org/linux-arm-msm/20260901064357.20055-1-sreeshankar0910@gmail.com/T/#t
Changelog [v7]:
[PATCH v7 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Fixed missing (struct device *dev) in gcc_sm7250_clk_regs_configure

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

Sreeshankar K (5):
  dt-bindings: clock: Add SM7250 global clock controller
  clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
  dt-bindings: firmware: qcom,scm: Document SM7250 SCM
  dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
  arm64: dts: qcom: Add SM7250 devicetree file

 .../bindings/clock/qcom,sm6375-gcc.yaml       |    4 +-
 .../bindings/cpufreq/cpufreq-qcom-hw.yaml     |    1 +
 .../bindings/firmware/qcom,scm.yaml           |    1 +
 arch/arm64/boot/dts/qcom/sm7250.dtsi          |  771 ++++++
 drivers/clk/qcom/Kconfig                      |   10 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-sm7250.c                 | 2286 +++++++++++++++++
 include/dt-bindings/clock/qcom,sm7250-gcc.h   |  163 ++
 8 files changed, 3236 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7250.dtsi
 create mode 100644 drivers/clk/qcom/gcc-sm7250.c
 create mode 100644 include/dt-bindings/clock/qcom,sm7250-gcc.h

-- 
2.43.0

