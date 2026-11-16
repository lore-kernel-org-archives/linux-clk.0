Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809783;
	b=FAiW4SFA1Um6PmoBCmP0hlizbryBReDxWYBpmBNu/k3KE8SDfOgN5JPq2cTlfpQG92Ro
	 nQS8z9Ncjd6x46sX0h1oNRCoD8Qcw6MDwWUDZjYavz1X8AnkuF8Ea3Ffr6wREQdzkWohh
	 nKvVK5ApfDzA1wO4kfiY8HCW7DpRhHXXILtd5Oa0/ansLoC3AfHEhYPck/BWPqFBW4kwd
	 jxgQhEd0gE/qHI0kJ2RpqdxshDRIvy+VcCtNHsm/Qn4j18jdJZLdKCR8WrGVdVf6TYv2G
	 Xoor/X35KjxQFpdTiN818Tezb0nO83ISx/7W7yeRA9Cb4x1hdzBAGC/nvBPlL0eOsTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809783;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aal6gJyPrs0X0zJDDg81/yGr5HyxFV8p+XgQ6tnnE4Y=;
	b=yhdmKu2VZvKJEKUOaojKiAUG7gZM13Z2vtLYAlnJtCZ+rGhae+L4ZECOEX1iDbLofYH9
	 cyHQHYf+rTq17P6JzAW8Frf3uS5k5ARTqoCEcluC4UIWPxh2pAN1YKa6NdMKcMgdclzKZ
	 NBHQPDtb7BUFYcfFlEp+1KQVVgUej/H4mqynB1+QY5Zo4DBtYlSVTVU5IwknE9FJDynfU
	 +3pqVvtSatXHRLezuE8TgOuStjP9bWA9eD7um65Y0bEPaiHgt5o3/M+ut2AIrglGz1QFR
	 rCR9fajoFpcqfJ/3lO6uhf5ezsjCtlu6tT4YAHXvPOodRlSJiXj8ai2dRGR34AfakWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZTLnJoeq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCAE606A31C;
	Mon, 16 Nov 2026 06:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZTLnJoeq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DD41F000C4;
	Mon, 16 Nov 2026 06:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794809783;
	bh=aal6gJyPrs0X0zJDDg81/yGr5HyxFV8p+XgQ6tnnE4Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZTLnJoeqyl+C7sWmfvSVBLpiFDmFdvF8KpRMqIoz5LAY5D/5WDT1i6EDLSBI5uS/4
	 4WZw57BWxsLkXLGModybnvFf/b5unltGFxbRjd84BXhft0BDYPToXoqCGF0OeZJzYR
	 rvfgk4ET/LbH5T7YouLEKBSwXkw5ZAA2KtsOEoS6JUEpqcJkEaHJKaD0H22tFEs0PK
	 iM/J8vlE9ToKbJNiLTjIl1Sv6iVgzKmdEX0Pr2gBUS2tQx/aKIbZb4TQwupS08CY7b
	 pxhkjImuhdlZ/l63Y0aAh+diwcxdk2s+UTWegrAnd1+m07EvYD9oX+ytBcanDsoJjN
	 t6izZHJQq8/IQ==
Message-ID: <sashiko-outbox-216254@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 8/8] arm64: dts: qcom: Add SM7250 devicetree file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeshankar K" <sreeshankar0910@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-sm7250-v15-8-6acbb232fef8@gmail.com>
References: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
 <20261116-sm7250-v15-8-6acbb232fef8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 06:16:22 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] cpufreq: qcom-hw: partial init and resource leak in
  qcom_cpufreq_hw_cpu_init()
- [Low] arm64: dts: qcom: sm7250: oversized PDC register region in pdc
  node
--

commit a2793b66bb2274241a395fec222892481d4a324f
Author: Sreeshankar K <sreeshankar0910@gmail.com>

arm64: dts: qcom: Add SM7250 devicetree file

This commit adds the base devicetree file for the Qualcomm SM7250 SoC,
including CPU, PSCI, clock, interrupt, and serial console nodes.

> diff --git a/arch/arm64/boot/dts/qcom/sm7250.dtsi b/arch/arm64/boot/dts/q=
com/sm7250.dtsi
> new file mode 100644
> index 0000000000000..231b6ea59a590
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7250.dtsi
[ ... ]
> +		pdc: interrupt-controller@b220000 {
> +			compatible =3D "qcom,sm7250-pdc", "qcom,pdc";
> +			reg =3D <0 0xb220000 0 0x30000>, <0 0x17c000f0 0 0x60>;

[Severity: Low]
Should the first reg region size be 0x10000 instead of 0x30000?

qcom_pdc_probe() maps max_t(resource_size_t, resource_size(&res),
PDC_DRV_SIZE) where PDC_DRV_SIZE is 0x10000, so specifying 0x30000 maps
three PDC DRV regions instead of just the OS PDC DRV region.

[ ... ]

> +		cpufreq_hw: cpufreq@18323000 {
> +			compatible =3D "qcom,sm7250-cpufreq-hw", "qcom,cpufreq-hw";
> +			reg =3D <0 0x18323000 0 0x1000>,
> +			      <0 0x18325800 0 0x1000>,
> +			      <0 0x18327800 0 0x1000>;
> +			reg-names =3D "freq-domain0",
> +				    "freq-domain1",
> +				    "freq-domain2";
> +			interrupts-extended =3D <&lmh_cluster0 0>,
> +					      <&lmh_cluster1 0>;
> +			interrupt-names =3D "dcvsh-irq-0",
> +					  "dcvsh-irq-1";

[Severity: Medium]
Can defining two LMh interrupts across three frequency domains cause
partial cpufreq initialization, leaked frequency tables, and dangling
data->policy pointers?

If qcom_cpufreq_hw_driver_probe() runs when lmh_cluster0 and lmh_cluster1
have not registered their IRQ domains (for example with
CONFIG_ARM_QCOM_CPUFREQ_HW=3Dy and CONFIG_QCOM_LMH=3Dn, or before qcom-lmh.=
ko
loads), platform_get_irq_optional(pdev, index) in
qcom_cpufreq_hw_lmh_init() fails for domains 0 and 1 (CPUs 0..6) but
returns -ENXIO for domain 2 (CPU 7), which qcom_cpufreq_hw_lmh_init()
treats as success:

drivers/cpufreq/qcom-cpufreq-hw.c:qcom_cpufreq_hw_cpu_init() {
    ...
	data->policy =3D policy;

	ret =3D qcom_cpufreq_hw_read_lut(cpu_dev, policy);
	if (ret) {
		dev_err(dev, "Domain-%d failed to read LUT\n", index);
		return ret;
	}

	ret =3D dev_pm_opp_get_opp_count(cpu_dev);
	if (ret <=3D 0) {
		dev_err(cpu_dev, "Failed to add OPPs\n");
		return -ENODEV;
	}

	return qcom_cpufreq_hw_lmh_init(policy, index);
}

When qcom_cpufreq_hw_lmh_init() fails on CPUs 0..6, cpufreq_online()
skips cpufreq_driver->exit() and frees policy, leaking policy->freq_table
and dynamic OPPs while leaving data->policy pointing to the freed policy
(which qcom_cpufreq_hw_recalc_rate() later dereferences).  Because CPU 7
succeeds, cpufreq_register_driver() sees a non-empty cpufreq_policy_list
and returns 0 instead of deferring probe, leaving CPUs 0..6 without
cpufreq support.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-sm7250-v15=
-0-6acbb232fef8@gmail.com?part=3D8
