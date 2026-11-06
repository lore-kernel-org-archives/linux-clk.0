Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978162;
	b=Bk2Am9tvNMZVWICg+/lbtxv0Nidec3UJMY31Z3phLfJHif0ogxljbXpOSvJ+dUbLe0mT
	 alcZgrcpMCBYYUE86Vg9qPSvtmB+JfyHZpIsBdEGLV2RsUyTkCEbdYBOL2FXYN3NynCGR
	 v4eUMbSTpDyv54S3ZGJTBNPD0BQ6vFdZhy9rIYPZpllWeIUvNlG748mDV6KREVwxifwcY
	 M2w/haicHVNGWw31DzHxjdNoXtqpTG4NSCn+eO4dF8vtKk61mRYjfthz6ndlOYCWwB9B9
	 i7asncD2AJL4qEKxPo8GW+h3s39YVuJEoAGQKG8zTav02qfdt1d1HGF+FbRNr6Q1nUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=B4J/6TkXuddv5POxVMnpXxgr+cSVHYzZg56TwlcDLAQ=;
	b=TXx58aDGV4SwECiubEeWcNsKCNSvzN/jg4WOQYXV1KVh7+JNi/6UBk9QAkqXWE6F9ynF
	 lIIrixB61MA9qHId0+v8/fuQOTUyweDcUKj2XVAY5T9A2s+jInM6+b88Np//isUCxiCL1
	 hjEqw2l21aCVgf6sZpKideJLSTcZWnwM258nCAPRUkj0mUa65LKUibfTKc5+btz7fEoQa
	 moi5iyITACC1XOrybJ6ZAOttpP98jUKx5OvlTUcQ1bPVsqg90wxNl9JjQM62UlDtccE1T
	 YcqKU7ODBatl05jN33OE6vaa0uAV8xYsvweMzoFIHEnEJNrzku28pCLXGBlob44qsqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QRkjWf5F;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF958606A32E
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 15:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF958606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QRkjWf5F
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36e795af1d4so653913eec.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 07:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793978161; x=1794582961; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B4J/6TkXuddv5POxVMnpXxgr+cSVHYzZg56TwlcDLAQ=;
        b=QRkjWf5FeBJRvwsWNSgdII77QvX6vn2zyelZ8wGlj77G8z5i4Eh1LAGbldwAZ2Rkt5
         Uksm59NRIxKR0Lr4vBNKDILaOrXFOdEw7ZU4SZ/KcsajkM9rpBzLwsojfcNNl/1SKVQC
         f6mkrfmcw9h9/qDs/Sr/+THVqe01itkCcFGP3PS17GZppkrh309lOILM1y9giONC9m7e
         VlGTn4Z6gNlYlVkzUl/k3HwhfcR9roRvjUW73UtQRyyZk33ka2GvgtvmzB0D5lTf287+
         huh13z/viCjYQ5q2xAdKK5+JpyPA0MIjtiyFyUYEaFYIFLVaw+5MEVKhmvdbOmWZzvu9
         0agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978161; x=1794582961;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B4J/6TkXuddv5POxVMnpXxgr+cSVHYzZg56TwlcDLAQ=;
        b=2jRY1RPOQDfBZoTlevbl0qMIzzPsOpy9wQBJUdwvPJudp13nEq2O86RIzwBqwHsq8W
         yOxhP5gbvBXjl2ArhADqfrE4XHwwRUOo4wBWBNAJEyPGU0meViLJ43MQRQeMj5PNRUtN
         acuJ/M9Phx8RmhHeeUtlasLG+Eq1D6cirMgdZUtwc9EHFqYCbDenmfV7dFHKKxur6p29
         tOUHrAoq0o2JOLCleoosNvujmsIONtzKBnhyWV2l863szZjQ0VCYCIUcb1ajtoeBxDti
         YumGn33cLnMEjojXrJEcLCXWBWfXHx5LBpAdigo3KI+NJLBE6KVxIVjC5tafEoRb/UoS
         6oOg==
X-Forwarded-Encrypted: i=1; AL+hErG6Ilu0J6UHbQtgCmzfVxMo30LYDzrfwAJ4a3mOaj11+DHTZ7+s3zIzqOVgLqwtdbfytfFESgTKOsE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IrtGlFj6nRnETZZkgw52phv4H1CO0eTGKFJEu9kgW+tJSf+n3
	8q7ABe69kM/kgmMIvoreDg2gHCTBLQLXv57cRtnQmdrEUPxfYWPST56Y
X-Gm-Gg: AYBFou247n+SpH8XsqwJxw9ROImRuh0A6vgx7/gzEKa1xY5WPsCYP1gGr5Bvl8RBmc3
	wToL0Y5SOwB/p75toaEVzrMq2M69koCymXuPGfP8RVg+6bwtkdDgxVXG5BR7PgiXCQYN27plJRZ
	2WH8Gj35s5DpCqoYCktfCU33GPfBpxLqL2tugDIEXdMotRzerbINZPi5G4VQMwpiHjPusflj9Vj
	YxOt6TcEGUEkumuU2kRQMOm5Pcijn/Q0SRsFiS0CzfBplZVMb+UlIFF+6R90zFiyxiOh1S6BNdQ
	LmVkknQz2Odbjz2uMTUkcDq7aS4yVOnqOHU0BRJuOVxFeSB6Wh0XKH3iGYu37aZ/sW/J17jrcPV
	/hYWfpMQdAkaTk/U0T9lR9JYb3gl8XqiBdBG7npUOKQnwkieL98ANnSCvKbqw18kFiUMQM1XMnu
	h/yo9fGxxTQRd/NB/LIOQLWaDAbrYicOQoMrFbWdOkjYOyrxRFZTK9vb89BUWD4bG5c59bRPN5b
	0QoWYUKZ+bgP3aUiyd0lxdg7jk9ZmOusOLq29ZeBHWz+swgEQHqVw3ouEiFpTce9LEmg73v/aL/
	a3UAv7/TaJTnb4ekzHaEymc2R3zVS2CobCmdXmbHSNccmMFcL57KADjScFHwx7Qvtpz739h7ALs
	isc8dt+WATCKovo1NxAiobq97wNfL
X-Received: by 2002:a05:7301:9c07:b0:362:2e2f:c261 with SMTP id 5a478bee46e88-36de7932f28mr7904176eec.27.1793978156008;
        Fri, 06 Nov 2026 07:15:56 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.221.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm7581500eec.18.2026.11.06.07.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:15:55 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v14 0/8] Add initial support for Qualcomm SM7250 SoC
Date: Fri, 06 Nov 2026 15:15:35 +0000
Message-Id: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIABfv7WoC/2WMQQ6CMBAAv0L2bM1urSV48h+GA7QLbGIpaQ3RE
 P5u5epxJpPZIHMSznCrNki8SpY4FyBzqsBN3TyyEl8EaNSWCK3KodZXVNw49mR6pgtCiZfEg7y
 P06MtPEl+xfQ5xiuZn/57FK9QoW76oSHrHdb3MXTyPLsYoN33/QvfYV5knwAAAA==
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Sreeshankar K <sreeshankar0910@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793978147; l=8021;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=Jdcg0FIRiPPS8y53623ewxFjt0O6itT2iFkpqT7Eqaw=;
 b=rMtnrqhcGqJnkxmXaLwxkxrJtbpP4pPh7Og41dSYThdyhvHW8ZTfF9MgfbvnKVrMEtH238WUt
 JH4cy4nxB8BBYD0FSU4nVEM1hPcV3EStVdteSxJatCcWzV78WhWGkNe
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
 drivers/thermal/qcom/lmh.c                         |   84 +-
 include/dt-bindings/clock/qcom,gcc-sm7250.h        |  163 ++
 10 files changed, 3332 insertions(+), 24 deletions(-)
---
base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1
change-id: 20261106-sm7250-e9ced14be130

Best regards,
-- 
Sreeshankar K <sreeshankar0910@gmail.com>

