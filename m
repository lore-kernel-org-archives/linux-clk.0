Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669100;
	b=asgAaRw5RYI6JOkj/n6horKzffEodtD8NGalte6vBcIGXYKLC7UEGJAVNczO8+XAdK8k
	 NY6nlgzscPC94ZaJmJ1TMa3s8oK7ZUKl9wrh47fb/iL58rFbLLi3y6Jg0S0wBcl90uRW4
	 6rpOEX4wmtoArm5tr1d9lSEnzDkKlvOEAtPoHIsbB8jaew4sTaMpyplOyNlOtyVvBWsf/
	 oxWM7ZLSyeRfrkb6sxCiKXiniPNc/BLUbEF2H6R6O8+ruXysotcEK0XDpKstjHLn4/RpJ
	 m/3hhq1BbXkxKrbUAgIBqm3MsOv03+cPmRzAnkqYcQnAGDcVI67G3t6M98UETAvDN7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=JI8HfPX41bL6Z32pAsbgbrb/7QYtt9ijsc5D9+fTPhY=;
	b=0q+8x6EiRYDJXP1abpi7948rgLMbGEwiV67WTwQ86JIz1XBe9fX1qIW/4Gh31XzO7esR
	 JhDzKDty3TcgjDzEqKImQxwRIViMICVIcptshS/grem0UaIdnUouxGG3WvClt2sCgYVmn
	 kZUdoO3LQ//r+TXj/vSVY1XTBWfKuvr7u49TLIJdcmcJNM4+QgmtZM81CrmM0WGdOUYh1
	 iF829/efFtPZ6ovGunmW7Vs4DYmrQbr+DP6Ry73UfaDO3bz8XhjJ+qIOcAdQgRcVRKXmN
	 VmwKiN2SJofb8aWUU4kE/R7Pqg9UevaepqygP3zzK0zR/9MLPp8Oed3LscezvqlYAzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kA0qL9Uj;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9961606A323
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 04:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9961606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kA0qL9Uj
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-386c71feeeaso2968313eec.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 20:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669099; x=1796273899; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JI8HfPX41bL6Z32pAsbgbrb/7QYtt9ijsc5D9+fTPhY=;
        b=kA0qL9UjEBH6xoroa4PMEU9xJz2r1G9pleT0UHMh2Fc5IXhMDOJF9jKOZvxypOIdNT
         ozkeS3xcz0FqntWz3f1HxDdF7mr9HpZbIPym27zSIIIOlBOUqlaSMbs+u0N52CI5+28P
         JQWX3uW32UhtR63gxbZhJ+8W0RSafYoY9eCvI7c04S9GR1Cgw/uO0QBu4hxXq6kEQ18K
         OniVmjsvrfrFRtYm4+ccJMTwIPJOF9YUUQ9doGiBw3ln77X3rQeRJI2se35jWLKd5Vc2
         ljMBNk4seCvuvsRIxI+df4W9b2qTDiCw7jwNUEBb/PX0ZWHyjIGkE3To+Q+OBCv1fWZn
         ucvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669099; x=1796273899;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JI8HfPX41bL6Z32pAsbgbrb/7QYtt9ijsc5D9+fTPhY=;
        b=DyAZX+mzOB/GtxS1vCTVk5WamI3XN675a+P4qQyZxv5GRSrnpmBq2hM+T+OHumcC+q
         T03OmoftBOMsVL6jMrIkqrEhqbvxp1T1+TyykXg64c+IJep6k/cYZs1GKkY+AaA6yNNT
         crxSmHkQWDBE4ojn6AknB2ZAuYHxnMHD709yZRFp1EjRI1IM11V/WBX0rM3gEV0h/WPE
         uAf54mBGY7BRoL5IeYxLULqJ5jOsiQmRFUTSBpmcC4+gKMYgfspa47uDOK3Ts84PYrgt
         2F+MnaUERW1kuMeQe1lgJzHudCzpAWxD3nNH68qEqQflRJdH+zcq97dgtATcqCkklwSk
         EPEg==
X-Forwarded-Encrypted: i=1; AL+hErFxWoiITd7UVTrg5ZpD4E8Il0QDTgMmZ/gm5D2inEG7zx3wRKqXqQ2N4CX8U0R4aD6joHtK6qNoOrM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bfoI3mAavu1im3x0WUH1QGKJwYo1rqh2svRnHubMpQOricyv+
	r+5tYZxF0m0FrxF4ppRASKdGFURNn/8xox7WKz6lDEhZsR1W6K2s5WEf
X-Gm-Gg: AZFdTZd+spyBINzTU9VIeNZP0au3MFdBAd6s6jlxX731jZBrrFiJBnuI9fgX/LuoZlJ
	d++t1g6yZNtstR4N6F+KLq2NKP4/vdypdmir3ecr+BlG0gta56TXZWBt4lSYILWGt8Jb3Wugf2c
	y4DpPX46A430wnOz7IqC1yvraXMhPsYMD6vVjZRSqNp62cxAKYM7bcvmQNa+jScP6Q9wEugR4Y9
	LFDWfZU/YlkzZ71Fo23YJSHFl2f/BIDFmHmO8EFi30ODv7/RZabCdCEb6sCsJ1ULelM5e9Je+t4
	Gicl08qzveY6pjpp6C4shuwgEytCrkKvuS5sAIYR24IUeqCHnLQWur9M3SFULIKecvoPOd/R8T5
	XNJ5PEMKJjnTn87vRnkmgYi8VNvzgpmCEKoA+dOKmFpnelainVrZ/CEFvyL6bszcDh+Wgy1gw4r
	yTX83JXMU1S7F6yDQe4yDZEAAa+mKxSDuZTsBKTufQvEMnB76+LhxKdPeD8sLyFwmyI4NMh4WNR
	JAql7v6PhTqlaOJ8BhybQFrf4w5iF3kJX5r57r+P03kSsHQBCq99qSgsxsFiTp9eMaMB9Vi+bXb
	PfRQu3Umm0BNIk+n3emGYi5AcF7K9OSK3LZaq4czUYkNzdELHSjUo88Qzxe5A+ayxp2kemuMCzy
	2ZY87AYY=
X-Received: by 2002:a05:7301:650c:b0:386:cca5:3626 with SMTP id 5a478bee46e88-386cca53bd1mr7062875eec.31.1795669098625;
        Wed, 25 Nov 2026 20:58:18 -0800 (PST)
Received: from Sobhana.localdomain ([152.59.222.211])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54800362eec.7.2026.11.25.20.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:58:18 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH RESEND v15 0/8] Add initial support for Qualcomm SM7250 SoC
Date: Thu, 26 Nov 2026 04:58:05 +0000
Message-Id: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF28B2sC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDE11FJSSM
 xLz0lN1M1OAAkpGBkZmhoZGZrrFueZGpga6RsYWySlmySbmSYnmSkDFBUWpaZkVYJOilYJcg13
 9XJRia2sBvy3ZPWEAAAA=
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795669088; l=8347;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=sNABgjva2hPKnWVGrROAvMEHWqF0OpGbtuBDXR47Gm0=;
 b=2Zf1TqTwzSOis3UUKFHBV/xWYVXWZYEXIgHSzkou+9E4BAyoCd7gT126wJ6e1J+UVTOeWTcU4
 t0UwEdfgmLXD7ZrAGpwm7skiIGPCt934cyqv6qQX3OWYtWQqHSLRh9H
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

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
thermal/qcom/lmh: Switch to match data for SoC CPU-to-node mappings
dt-bindings: thermal: lmh: Document SM7250 LMh
thermal/qcom/lmh: Add support for Qualcomm SM7250
dt-bindings: firmware: qcom,scm: Document SM7250 SCM
dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
arm64: dts: qcom: Add SM7250 devicetree file
>------------------------------------------------------------------------------<

Changelog [v15]:
[PATCH v15 3/8] thermal/qcom/lmh: Switch to match data for SoC CPU-to-node mappings
> Update the patch to fix apply conflicts with Linux 7.4-rc3

Link [v14]: https://lore.kernel.org/linux-arm-msm/20261106-sm7250-v14-0-7d167e993f9c@gmail.com/t/#t
Changelog [v14]:
Fixed various issue found from Sashiko's review, Link: https://sashiko.dev/#/patchset/20261104-master-v13-0-355b65c6f764%40gmail.com

Link [v13]: https://lore.kernel.org/linux-arm-msm/20261104-master-v13-0-355b65c6f764@gmail.com/t/#t
Changelog [v13]:
Fixed various issue found from Sashiko's review, Link: https://sashiko.dev/#/patchset/20261104-master-v12-0-57fbe9eef978%40gmail.com
[PATCH v13 3/8] thermal/qcom/lmh: Switch to match data for SoC CPU-to-node mappings
> Switch to match data mapping instead of hardcoded 4-4 cpu configuration.
[PATCH v13 5/8] thermal/qcom/lmh: Add support for Qualcomm SM7250
> Add 6-2 cpu configuration LMh support for SM7250 SoC.
[PATCH v13 8/8] arm64: dts: qcom: Add SM7250 devicetree file
> Place the nodes in acesending order.

Link [v12]: https://lore.kernel.org/linux-arm-msm/20261104-master-v12-0-57fbe9eef978@gmail.com/T/#t
Changelog [v12]:
[PATCH v12 1/6] dt-bindings: clock: Add SM7250 global clock controller
> Move dt-binding definition to qcom,gcc-sm8250.yaml. The device tree
schema of SM7250 matches with SM8250 for clock-controller node.
[PATCH v12 5/6] dt-bindings: thermal: lmh: Document SM7250 LMh
> Add LMh compatible.
[PATCH v12 6/6] arm64: dts: qcom: Add SM7250 devicetree file
> Remove cluster wise sorting of cpus.
> Add LMh node.

Link [RESEND v11]: https://lore.kernel.org/linux-arm-msm/20261029-master-v11-0-2c29e382162c@gmail.com/T/#t
Link [v11]: https://lore.kernel.org/linux-arm-msm/20261016042432.824-1-sreeshankar0910@gmail.com/T/#t
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

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
Sreeshankar K (8):
      dt-bindings: clock: Add SM7250 global clock controller
      clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
      thermal/qcom/lmh: Switch to match data for SoC CPU-to-node mappings
      dt-bindings: thermal: lmh: Document SM7250 LMh
      thermal/qcom/lmh: Add support for Qualcomm SM7250
      dt-bindings: firmware: qcom,scm: Document SM7250 SCM
      dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
      arm64: dts: qcom: Add SM7250 devicetree file

 .../devicetree/bindings/clock/qcom,gcc-sm8250.yaml |   13 +-
 .../bindings/cpufreq/cpufreq-qcom-hw.yaml          |    2 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    1 +
 .../devicetree/bindings/thermal/qcom-lmh.yaml      |    1 +
 arch/arm64/boot/dts/qcom/sm7250.dtsi               |  803 +++++++
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-sm7250.c                      | 2278 ++++++++++++++++++++
 drivers/thermal/qcom/lmh.c                         |   74 +-
 include/dt-bindings/clock/qcom,gcc-sm7250.h        |  163 ++
 10 files changed, 3327 insertions(+), 19 deletions(-)
---
base-commit: 40212b29a6f718d4e7fb3275cede181cb8e137cf
change-id: 20261126-sm7250-238cd6c47ba7

Best regards,
-- 
Sreeshankar K <sreeshankar0910@gmail.com>

