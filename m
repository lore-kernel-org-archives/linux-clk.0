Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793019482;
	b=cie9xVA+xXLBwDQxiFTK3hzV5mSHCD23HaXs2MblNGjGlnty7ApShZupRnXR2e3+Ti2t
	 0oFFn1p+FWy1I/sIbHxxGyRFLodXSOhcnrV56Qbhx+J+qBdNMHpemU+FkpSRcpLZcPGuF
	 fkBugHodkJk98Uhou36htn5CcRmpofCkVUb3elbWIlrX8ZMPCte74yXDqQSg7Ge+Z0Q/8
	 wxYdrDl3fnrB4WVG0wkisaVKpW4GUEeImyawegqSS4mON/Ep7qWSLqoOophxNIeBHwEx1
	 m+eRT0uUch2Uq6496RkxWF6NGfdQU+LLzsUPgjJYxymMURwW+Yg2ki8//2MCOFPU5uQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=t6GH884chvgzD9Ofd9SmMJ/+b4uyUbpGX7r6FVPRzJk=;
	b=VmOBnh26bVjcbcLIbtT1/TqwKxlv60cMWh0Jgd5+e6MWIAqJet1ABCQPpl8vfk6wdvNk
	 ROzizmRI5OtbvisHQVMpnd+No0WxL3i6ENCUkO5CFaeG8jGOdkpk3FZGcmzaS8egRQ+ag
	 pprX3wzY4c35rHdEanRO96AWGAVUS8IjIbnfKaVwmTk0mHT9/ypA0TP5c0bWiOztQdWeM
	 nI1nWN9lZxOhDBi1tZCO5TQKCoQXvXt480uZe5cEeM6AGozYeOTvqptgUj36/nfke7fjH
	 O0QZPV6P2R4Vk8LqRgf6jtRBNal1fUtZGqSTX0auh9rvuyG6Ox22qixbxZWEelSr5pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VqO1lUQC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01DA606A324
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 12:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B01DA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VqO1lUQC
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4395d31228so441342966b.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 05:58:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793019480; cv=none;
        d=google.com; s=arc-20260327;
        b=KnC6O29UDwyC1L5ZwRbjMnXbIlAvFdUHX8J2K0wdrrAHHlYI5/80oK7XEn/DhG4Cga
         qZICGks4aELThb7ZDPm+1UeebFL8DLSlB33t6GbxdfetPdM6PKRCGQ7MPIQ5RmahxgYC
         VInojMNQlxxqXAUKVnwf1XGzlNek/aszMX+ZkfpwXi8fekL2js4FVsPPw7mZz6P5l4zV
         fM/ti41e7V4klcfkeCHTkXVWxgnqN81jMBt9j5S2LyNjp2O1zu/O9rkARXHth73Xq4xG
         B2Z67BPxDSS56SC+pd6so4XI1ME2Me0gvYHWn5oYh93aSkJiszous+2c9yf3R5/w9Mki
         Tk7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t6GH884chvgzD9Ofd9SmMJ/+b4uyUbpGX7r6FVPRzJk=;
        fh=VWlGgrMTKLopszyGCuCtnbiiP2SNLsFBODBLb4KSq2U=;
        b=DIjEyGzccYlFSFSU/WVa/RPIRYlQn/dTn4wyIM4ianGv74G3xTPrE5VleCmRjL1Fsq
         RwLvPeXKOQBV3j3fZ1tN2zxixZ+tNUO7flbFZwyvkOEtY8CUf/2r+aUL/UHiqLtvhXj/
         rY7yxTxwVd6QDINq3KmCnbK9/yddHhDX6itlHEEHx0gbgphlb94ED6WML8wGMXZS8Fk5
         DvgsM3enaCloqe6p5yYiNlj7IlR6NJa5fJShe/ZnyqyEqZ25JHE9oWj9fKQ0hrdcKd2J
         tLHItxWw+3lsz5CCP6tOQd0sMrDJnk30vg4FCu6p1W9Wu5Yrf4N9NoGToXrtz1u3b+PN
         IvzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793019480; x=1793624280; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6GH884chvgzD9Ofd9SmMJ/+b4uyUbpGX7r6FVPRzJk=;
        b=VqO1lUQC4/ZB86Bob7PuaqandeKM0dkfftYDf5kB1TzT/vAYMZe3lWFJmSvZDNQ2p9
         sDs/pmOD9xySol00LCkT1+BYr+oRmPmkkXNiLVRP6PmngB72HdMm5g/SZzk+u05QZrCu
         dwTKE/BsTEwIbISZ1/SonNGe9z5faC+s6z1Jaw//IB41QqG1RqiHUDmeu26WlXOt7fbL
         m5pscN98Aazfrf2wgOXYqTbTd3iEaeou3IvdOMut0xwuS7UcIdRKxvYt+4f2c8tojo9g
         8aPAA+x+JKtNX97Dq/ubP+/3fbU7CMAUbo4Ix4cYJ0fz/o9rvSxc3VtFQJlOuo3W+3ok
         8StQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019480; x=1793624280;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t6GH884chvgzD9Ofd9SmMJ/+b4uyUbpGX7r6FVPRzJk=;
        b=TMVTr3EEmko0DBxZVHfRX0OknlE1k5W7U/ksNfL19RwGsS7gkQEL5xrkQmhLz6TeHL
         zBVkSqNVenbVV20TFUzWMgIV4Rk7HLARvl6Wov50X0kZeIgicvz6ODDZAqPt8O1zDXzm
         1gaZbFvbQQ2UzjIkedhwO7iqgW+STdXAGHVmk8wuXf6ExJ59XZrliyHv0oZ5StVpCWZ8
         xEZxYG/iyEsqWhWQ9a4tg14IRlbA1UmNqofT1e/F3GBna0dFVyvnlcHdLxf3Dtwrxd3m
         Hylpx40Ol0NL5zNj22arA+t/bjtbdGbf7sYYEUEhIupALdbKSytTubGwVRoy3NNXRwRK
         RLTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHjqdOogplP9SH4Mb1cCt5u5r0kNsVSXPVAcSwFRz3AVA+cuzjmpNLV3U2sE2TGJYB6dzslF+4tbk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKk9pj5wpV4t7rogQu6t9ucWPN9ORHqa3vCmTSRkTtwA21QwoXa
	BM/FzVuGIQ6RYs1mEt73+8uz7+JYkuw4i7jcCl7G7RBu06HgnSbHeomexDaC30nWbhKnyPlNk1D
	rNma+755Gy8dnLtb/4LcrXB7cpb8QH8Y=
X-Gm-Gg: AYBFou0KFaSWGP/ZCbmhMS98hgQxbWR3shfOG2xEXRq0bnQ3f7yf1xm1vaz9GvGOvrT
	bAQbAQ62VbxzBHH9Ba25aIG4W5VA0k7pi7INoCnIl6luj1DzU0cLj0DIQ9Zm+SbfW4D6qwVRcG4
	ZJiY8Ld3qqz3dRq5NTPjlr3pSkcUZwHjkqHTSUYVI9fKmktATVQkl99go1/PsAauOXGbyB+4wSG
	AsD1nf+LCRdi5BEheuJOaiQtr110Pjc4aSXoddmWPZReccp+Xbb24OoLSS1cQfnFalBMNturDmV
	otlC4ED60xie4hHsBU1XzIrPmZMgUUE1RrP+cXXYH7nSoO/Q60KY86I1KqUKNUWZkf9UtTfqXg5
	rQzli1PY+7qZgu4lhSy4vwx8pCaRANQSbKW31TnoVOQkiQNFWFeQ3Sgo2UvjzxvwezDl4COgiWY
	MtrAJGj/m7shzPUAEjHjlB7gHytNE=
X-Received: by 2002:a17:907:6e86:b0:c3f:c878:7c1d with SMTP id
 a640c23a62f3a-c46bddb3308mr817681666b.9.1793019479919; Mon, 26 Oct 2026
 05:57:59 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016042432.824-1-sreeshankar0910@gmail.com>
In-Reply-To: <20261016042432.824-1-sreeshankar0910@gmail.com>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 26 Oct 2026 18:27:48 +0530
X-Gm-Features: AclHuK-qVOdu5LbOqp6_F0580cdJ42kSYQZoFTTe2Es-FxZ1SlI0qmd8PhmgExM
Message-ID: <CAA-+ukL=H6W84__TtD2C5oxbRr7jgsDqOj=2KN4rMtJ6wBgc=g@mail.gmail.com>
Subject: Re: [PATCH v11 0/5] Add initial support for Qualcomm SM7250 SoC
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	konradybcio@kernel.org
Cc: danila@mainlining.org, davidwronek@gmail.com, mani@kernel.org, 
	robimarko@gmail.com, linux@gurudas.dev, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Oct 2026 at 09:57, Sreeshankar K <sreeshankar0910@gmail.com> wrote:
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
> dt-bindings: firmware: qcom,scm: Document SM7250 SCM
> dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
> arm64: dts: qcom: Add SM7250 devicetree file
> >------------------------------------------------------------------------------<
>
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
> Sreeshankar K (5):
>   dt-bindings: clock: Add SM7250 global clock controller
>   clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
>   dt-bindings: firmware: qcom,scm: Document SM7250 SCM
>   dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
>   arm64: dts: qcom: Add SM7250 devicetree file
>
>  .../bindings/clock/qcom,sm6375-gcc.yaml       |    4 +-
>  .../bindings/cpufreq/cpufreq-qcom-hw.yaml     |    1 +
>  .../bindings/firmware/qcom,scm.yaml           |    1 +
>  arch/arm64/boot/dts/qcom/sm7250.dtsi          |  771 ++++++
>  drivers/clk/qcom/Kconfig                      |   10 +
>  drivers/clk/qcom/Makefile                     |    1 +
>  drivers/clk/qcom/gcc-sm7250.c                 | 2286 +++++++++++++++++
>  include/dt-bindings/clock/qcom,sm7250-gcc.h   |  163 ++
>  8 files changed, 3236 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7250.dtsi
>  create mode 100644 drivers/clk/qcom/gcc-sm7250.c
>  create mode 100644 include/dt-bindings/clock/qcom,sm7250-gcc.h
>
> --
> 2.43.0
>

Hi everyone,

A friendly ping on this patchset. Please let me know if there are any
remaining concerns or if anything needs to be updated.

Thanks,
Sreeshankar K
