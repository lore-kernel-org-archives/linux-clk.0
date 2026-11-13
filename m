Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794536860;
	b=pY5h7th7YNF3dLnhJW5UXOZ1hvXvfH9juCquzQsCNWz+Hqo3ki+ez69rJ9uzBfmw67fD
	 BisEHaa4hDxQa3NPmAHz2XepU5GfuD4X6Yhg6wgzIZy+k9QtUaguYzg/56VgqpRMJrt/C
	 MfnEgOmT4cYc7P9if1VhPeTHVodufMruJWgZQpbhyFXdVW+yBjWSFlIuBL2dHPXgkfsjq
	 b855i9YH0Ye/d9XG2li0BLstw0/nrS46jH2DmWXjKTIxK8xiuJEd5ahEtEXp4VZeXcN56
	 Ohou14BnWQCG6uaNhkC4OUgaPbt9qpluEtrm38chmJB1aEKkAPdr/Ub/Lix62Y+NkbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794536860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mhmgHqxT9q9D0dhD6vPj0pvXXso4EsLhMvW2R188fnU=;
	b=UCn1dtxGlZsaRwwNZhZhKNHx51AHESlaOV+51lj5JL8u9RZ/MNBoNQ7w3L2E00ZGEUWH
	 I24kzP13jU2IlcT0shqA5xn2RxfJLohxDklsPnLeqSq6XoKUiTHsyF/MtzG+5cKj+Jspe
	 8SFY4eRBGwf2oYNjLps0Q2Y5INmG7zD4RT1lx3l5vqlLoY0PBeYjuGUBoA4+aX1QazvDH
	 uxUGd6HHxxKygK2Bv/5QjxO84S1jHzhbSrC//bTZEuniTXQ4Jsx8xcEU0I1BgLYx6v6bl
	 6cfpHJI8d4tCHd0GNwMXyZXf6jB1qwTkDKRDZNgmHQsDzCWRems61zEkAPE2hVktSYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wi9X0uD2;
	arc=fail smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE82606A331
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 02:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEE82606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wi9X0uD2
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d473cfff6so73531966b.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 18:27:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794536858; cv=none;
        d=google.com; s=arc-20260327;
        b=jy4gHleUr6By9ywSVIk9xK7cZwe3b9CZZydC1/jhJHinSF7obiTUutUKsz+X0e0Gen
         9AOc3dg1IX3bTutufmO25lmJM0p5R44SA6LdFtkW4AaTVk8VfHJQqMdGCTmWjN4tKZYL
         y3P10XUwCNRH7UrMiuvSNfYUeyrj0h6yvbLwNGmKqojMtzOSo78ZZvuG3W9+e5JLpG5D
         O/24SDmPpiJcSNfDVSn5GmoLi/CPLBQ6owlFi28rF5t5h+G5PO1V5St2StdNjaJ+tDl3
         ZNYv1p59VTTNmp/YGX6p3VcK2dHPMks528cCAiFQahbW74Hv/k6cP/ZyQb9Y/pn/Cf8o
         NNkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mhmgHqxT9q9D0dhD6vPj0pvXXso4EsLhMvW2R188fnU=;
        fh=YAeVtl7rF2C5D8Jz1qHQbBd9+ahYtnE4TxGv+QO5rI8=;
        b=c1jPp7zgDUqY2WME3d+NVKYdvU2UxHouiJXfSgbHCobWR9jhV06Jn+oFVBsnwC6Ud/
         x1/mz3JWz97D/WpCq8e4lyBnaE6gowyTM7Pc+f5WcwvS3Cs6eOMONmXj9is8ZtHjE6De
         QKEBQq4wCPwYW7TnQtjLMcRwGBsN9YOMoXw5DN9QvRbkPdtoCW7Kb11hMR2LpcFPXl1K
         wOi3r1aQzD2ZHJLEHCNti5JTuMwrPvLZhme2+fv3IqkkTQoiFQnXlJ2blp3PWaxdjRNq
         6SOW0EYa/nNSchAGdxf7+l1kjgW3IfQlPhrmQWoTqRp6EO5QTR4RaOw8jCwsrJjz+Rjx
         8sAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794536858; x=1795141658; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mhmgHqxT9q9D0dhD6vPj0pvXXso4EsLhMvW2R188fnU=;
        b=wi9X0uD23pyD1hwud2ZUTYw9RLw7zgv2HRQixNQf4/ghFgY7jliAhsEY3WdB5s8p+l
         5LniB4F4Cn/5YKoegW1i7RA91FP86bwpiHaCVfnZHvXRUMgzaL8qf+0w/PoXnwsA1TDW
         bHUK/q2+fSmCNCH3V4JwSCOGLLE8SocrEKSjFZzlihMEuShMuitJ8BRBCp7GJ1fEbbLg
         Piv2YNNY6UyEwojmjTB7RqDOtTGPPDQNrVjiyEbpNKw3iFkqSXn3sLLivRYfnwg90SaZ
         Bg2f0gcsIaEZUYt4FEF8riYyvgneE234ST27Me1UjA6kDF9eiKZOG0RqO18Kx6y776nv
         O6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794536858; x=1795141658;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mhmgHqxT9q9D0dhD6vPj0pvXXso4EsLhMvW2R188fnU=;
        b=vVNKDCw4yu8SNj9HuS9v2M3vLi+spEA9TlaawKCeqbKMCDmrqz2ov4HWYb/kDUi4KE
         E8MLL2hWvVIE0JAaTd/fmV84MMUJuKCyn1f2YgmbzQnli37mEC3msADzlowOayBBGD/w
         UbHUnGmb4D+ntnmYuPkGEFIIC72drPVAlXfLQg3wjkaGC4bKMxV7yFqIUIb0OZCr/L7T
         RTv6XWNVWvaYD1gXQCVj4f1AQ8RfcrqaQucJfq8vm1c/4vgpWpOksixEQuV0S9tqMG4r
         B26c8YRWQevrCWRBsojyqjo1RSanplra71Q1m+rmA8THRbe9m4Q0x4MNF6KBggQyrkur
         qwdQ==
X-Forwarded-Encrypted: i=1; AL+hErGz6XLNn6ZwavqDPtMwDFcjM2RrUs4Ztoc/NTxFB8LuXMar5+NFNXo+LLS7WHqoiDyGf0WehWTuPbQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UUO3rcLoD1/1R/V4YJQ5T3qox31jpjQewnYA9gEb3qqN2eLH1
	CRyjSKQA+j8/ZTpzGUSC5RcbABUMl6tlKIfpYtX8PrZ/MzMdNn1R+eza0KByxfGRx6M9oeeaqV+
	p8cSRTDnm7zgOCwraQ61eEjB78pFIQuY=
X-Gm-Gg: AYBFou3LMG5PAaLKN5QHgHZWQTWRa5e5vlXbemOZ45t3hIqS90gffLszTXPYFnpv9Mh
	TlFGJwSuoszhmo3xFFx0bmNev1QGS+ZIcf0XeVzSDhHHtMve2Ca5R6b9NHBHkPfiNM5VBeAeuqS
	tw2IxobhJEs3RAn9Xo2+BEO4pjNFNRhCZiL68dHt96weLQkCBQNywsMXwBh+EIo6HjF/4RDRfNE
	uIvojMzMa1G1aU3S04wuX9F/doB6MN9pWdL6XW3tN6pis9Ehe7k49mJeLMkO0n4IKeq+zDuDI/e
	+YU5P5mUkNgS+W4SDGvJJslvQ06a5fMjZJdHD57TLV3q9GKZsbgTrBnPCgxyxiJ0JOaJZQwy29Y
	/f8p+c0U/MdqbOwdOyHDAKnJtuzIXJWf6c74ErQR+51kyvsy5oQf3ZWppTwKDNuMQvHi7
X-Received: by 2002:a17:907:3f18:b0:c4d:212a:192a with SMTP id
 a640c23a62f3a-c509642889emr75412566b.48.1794536858155; Thu, 12 Nov 2026
 18:27:38 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
In-Reply-To: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Fri, 13 Nov 2026 07:57:23 +0530
X-Gm-Features: AclHuK-5Jx0NaJBBJK_E2yE52SkSKOFAgAmYCFNDkDQigjVyP_umucpReQmSj6s
Message-ID: <CAA-+uk+=kkeeH-stjS_8=Kgw-m7rxxXoVR2S7UW-TP0gxEktEQ@mail.gmail.com>
Subject: Re: [PATCH v14 0/8] Add initial support for Qualcomm SM7250 SoC
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Sreeshankar K <sreeshankar0910@gmail.com>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 at 20:45, Sreeshankar K <sreeshankar0910@gmail.com> wrote:
>
> This patchset introduces foundational upstream support for the Qualcomm SM7250
> SoC (internally codenamed Lito).
>
> SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
> octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
> and 6x Silver Cortex-A55) and Adreno 620 GPU.
>
> This patchset is organized as follows:
> > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
> RPMh clocks/power domains, GCC and cpufreq hardware).
> > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> interrupt controllers, clock providers, power domains, and reserved memory.
>
> >-----------------------------------------------------------------------------<
> Merged patches:
> dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
> soc: qcom: socinfo: Add SM7250 SoC ID
> dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible
> clk: qcom: rpmh: Add SM7250 rpmh clocks
> dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
> pmdomain: qcom: rpmhpd: Add RPMh power domains
> dt-bindings: arm: cpus: Document Kryo 475 CPUs
> dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
>
> Pending patches:
> dt-bindings: clock: Add SM7250 global clock controller
> clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> thermal/qcom/lmh: Switch to match data for SoC CPU-to-node mappings
> dt-bindings: thermal: lmh: Document SM7250 LMh
> thermal/qcom/lmh: Add support for Qualcomm SM7250
> dt-bindings: firmware: qcom,scm: Document SM7250 SCM
> dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
> arm64: dts: qcom: Add SM7250 devicetree file
> >------------------------------------------------------------------------------<
>
> Changelog [v14]:
> Fixed various issue found from Sashiko's review, Link: https://sashiko.dev/#/patchset/20261104-master-v13-0-355b65c6f764%40gmail.com
>
> Link [v13]: https://lore.kernel.org/linux-arm-msm/20261104-master-v13-0-355b65c6f764@gmail.com/t/#t
> Changelog [v13]:
> Fixed various issue found from Sashiko's review, Link: https://sashiko.dev/#/patchset/20261104-master-v12-0-57fbe9eef978%40gmail.com
> [PATCH v13 3/8] thermal/qcom/lmh: Switch to match data for SoC CPU-to-node mappings
> > Switch to match data mapping instead of hardcoded 4-4 cpu configuration.
> [PATCH v13 5/8] thermal/qcom/lmh: Add support for Qualcomm SM7250
> > Add 6-2 cpu configuration LMh support for SM7250 SoC.
> [PATCH v13 8/8] arm64: dts: qcom: Add SM7250 devicetree file
> > Place the nodes in acesending order.
>
> Link [v12]: https://lore.kernel.org/linux-arm-msm/20261104-master-v12-0-57fbe9eef978@gmail.com/T/#t
> Changelog [v12]:
> [PATCH v12 1/6] dt-bindings: clock: Add SM7250 global clock controller
> > Move dt-binding definition to qcom,gcc-sm8250.yaml. The device tree
> schema of SM7250 matches with SM8250 for clock-controller node.
> [PATCH v12 5/6] dt-bindings: thermal: lmh: Document SM7250 LMh
> > Add LMh compatible.
> [PATCH v12 6/6] arm64: dts: qcom: Add SM7250 devicetree file
> > Remove cluster wise sorting of cpus.
> > Add LMh node.
>
> Link [RESEND v11]: https://lore.kernel.org/linux-arm-msm/20261029-master-v11-0-2c29e382162c@gmail.com/T/#t
> Link [v11]: https://lore.kernel.org/linux-arm-msm/20261016042432.824-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v11]:
> [PATCH v11 2/5] clk: qcom: Add Global Clock Controller (GCC) driver
> > Drop hw_ctl clock branches
> > Populate default values for GDSCs
>
> Link [v10]: https://lore.kernel.org/linux-arm-msm/20261015051926.13752-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v10]:
> [PATCH v10 2/6] clk: qcom: Add Global Clock Controller (GCC) driver
> > Update .halt_check and .ops are per the review.
>
> Link [v9]: https://lore.kernel.org/linux-arm-msm/20260901092447.3028-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v9]:
> [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> > Make all clk_init_data instances const across the driver.
>
> Link [v8]: https://lore.kernel.org/linux-arm-msm/20260901070717.20513-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v8]:
> Same as v7. Resending the full patchset as v8 due to a transmission interruption during v7.
>
> Link [v7]: https://lore.kernel.org/linux-arm-msm/20260901064357.20055-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v7]:
> [PATCH v7 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> > Fixed missing (struct device *dev) in gcc_sm7250_clk_regs_configure
>
> Link [v6]: https://lore.kernel.org/linux-arm-msm/20260824150156.1310-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v6]:
> [PATCH v6 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> > Make all clk_init_data instances const across the driver.
>
> Link [v5]: https://lore.kernel.org/linux-arm-msm/20260824130437.2771-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v5]:
> [PATCH v5 13/13]: arm64: dts: qcom: Add SM7250 devicetree file
> > Reformat multi-entry phandle lists (domain-idle-states) to '<&a>, <&b>'.
> > Reformat multi-entry tuples and string lists (qcom,pdc-ranges, qcom,tcs-config, reg-names)
>   to one item per line.
> > Enable QUPv3 wrapper globally by dropping 'status = "disabled"'.
> > Move compatible property to first.
> > Remove clock-frequency property for timer.
>
> Link [v4]: https://lore.kernel.org/linux-arm-msm/20260821154030.2514-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v4]:
> [PATCH v4 04/13] clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> > Update .fw_name with .index
> [PATCH v4 13/13] arm64: dts: qcom: Add SM7250 devicetree file
> > Added missing capacity-dmips-mhz and dynamic-power-coefficient for cpu@300
> > Added power-domains for cpus and apps_rsc
>
> Link [v3]: https://lore.kernel.org/linux-arm-msm/20260821081125.4522-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v3]:
> [PATCH v3 04/13] clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> > Updated the way of registering critical clocks.
> > Made some more clock critical.
>         GCC_VIDEO_XO_CLK
>         GCC_CAMERA_XO_CLK
>         GCC_DISP_XO_CLK
>         GCC_NPU_CFG_AHB_CLK
>         GCC_CPUSS_AHB_CLK
>         GCC_NPU_BWMON_CFG_AHB_CLK
>   These clocks are flagged as critical in gcc-lito.c
>
> Link [v2]: https://lore.kernel.org/linux-arm-msm/20260819152545.3934-1-sreeshankar0910@gmail.com/T/#t
> Changelog [v2]:
> [PATCH v2 12/13] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
> [PATCH v2 13/13] arm64: dts: qcom: Add SM7250 devicetree file
> > Added SM7250 cpufreq hardware
>
> Link [v1]: https://lore.kernel.org/linux-arm-msm/20260818080754.4362-1-sreeshankar0910@gmail.com/T/#t
>
> ---
> Sreeshankar K (8):
>       dt-bindings: clock: Add SM7250 global clock controller
>       clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
>       thermal/qcom/lmh: Switch to match data for SoC CPU-to-node mappings
>       dt-bindings: thermal: lmh: Document SM7250 LMh
>       thermal/qcom/lmh: Add support for Qualcomm SM7250
>       dt-bindings: firmware: qcom,scm: Document SM7250 SCM
>       dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
>       arm64: dts: qcom: Add SM7250 devicetree file
>
>  .../devicetree/bindings/clock/qcom,gcc-sm8250.yaml |   13 +-
>  .../bindings/cpufreq/cpufreq-qcom-hw.yaml          |    2 +
>  .../devicetree/bindings/firmware/qcom,scm.yaml     |    1 +
>  .../devicetree/bindings/thermal/qcom-lmh.yaml      |    1 +
>  arch/arm64/boot/dts/qcom/sm7250.dtsi               |  803 +++++++
>  drivers/clk/qcom/Kconfig                           |   10 +
>  drivers/clk/qcom/Makefile                          |    1 +
>  drivers/clk/qcom/gcc-sm7250.c                      | 2278 ++++++++++++++++++++
>  drivers/thermal/qcom/lmh.c                         |   84 +-
>  include/dt-bindings/clock/qcom,gcc-sm7250.h        |  163 ++
>  10 files changed, 3332 insertions(+), 24 deletions(-)
> ---
> base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1
> change-id: 20261106-sm7250-e9ced14be130
>
> Best regards,
> --
> Sreeshankar K <sreeshankar0910@gmail.com>
>


Hi everyone,

A friendly ping on this patchset. Please let me know if there are any
remaining concerns or if anything needs to be updated.

Thanks,
Sreeshankar K
