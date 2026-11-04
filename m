Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780281;
	b=HJ2H3UUmmLdYGnLQVULABKItt0GXDczK1V6a/nSjmaN4hXc7BgLctSyFHbp4McLsUrbE
	 HNye3240rSFU0iFWCTAykAJvONOsz57fY5Yg0PdkXsKqDsw7CHmbjJhXBAChrUwojD9ip
	 Zu8R2NZMAbvUl4yYG2eIt2D6/GKi1cmvRy4TdEJXAJC9CD+RYg8l2a4vjcHrJCTjlh1N8
	 atYBIar8zy/1p1ojcicwch8MsJeXWp/Pec6dLafjjeFR6ssY9D3u5KtytbjfIyWstHDAu
	 HmClmWb9nh4rrH/eLU0sEP84R/v+t0ctUXPL5Wc8Ll+PMgv89IhtVnbz6on+wsReKFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780281;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XPtIL3s6s68TgM260sPxbQX+3w9FytSmTvOFqRvTVyA=;
	b=gT+R2K0udGh2vLIX/qzHozS+Ydu9I9qQg8ZRAFkkZ6nMIZBlUfOlzAa0E6jKVKZaJBB4
	 jdwsHccN+HhRgsFHBLieNXy5fu3pbFmGaF7fEZJ350WZ+GNKxtqXQzYjiM4NEa7qxAiVu
	 rkES8srx9Fd+qZtJmlymSL8tUGnM3OX19F7GtGwOSmeX9hpxRa8wwp0riOLN2dT+h5DUX
	 K9X6vH1IpZ4Ns9kwaKuS6lsVJHA4q2IOaV5/xaYTlT4Xmg4LbH1i8MZxo+zPb0pIcwuYs
	 3ahU1aJ55r4+hMGrZVJT+hyPuLlAd0loQnyuscuzUXIlSWAQ+ehOtlQNqyhyIz6Ov/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZIgDBGnz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3F0606A31B;
	Wed,  4 Nov 2026 08:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZIgDBGnz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2BF21F000C1;
	Wed,  4 Nov 2026 08:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793780281;
	bh=XPtIL3s6s68TgM260sPxbQX+3w9FytSmTvOFqRvTVyA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZIgDBGnz6OqRnaEpILQ7dUAmMeTFWk2Yr6U7OACaGJatJzFEhc955nqBNhi8N6jvn
	 mKSZSdAM3KggaXugHO/h9LDxsVIWuwNj7q9n2uHBKY+qLdThz+MoI1mIIkqIWfmIdD
	 3fLgdTAsB5mb13gc+UFYeHQIGDS2s4P9sLZ4N5b/UQ2IgzZpSRrVq0tVZ+kK9bXpw8
	 FJZNmYZY9gPKTUIBGZHUv0MrL76DOkSFxmdgxW4mzJVNb7iskd/A0+CCqsnSd663wQ
	 Wlwikfc2FqGF1MO2hvog0CniE24iSoOoqkTEZVaUlZ7mBhOOSZhaJKRla42Yt4YKj1
	 as3Sm4iOF1ciA==
Message-ID: <sashiko-outbox-196870@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 6/6] arm64: dts: qcom: Add SM7250 devicetree file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeshankar K" <sreeshankar0910@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-master-v12-6-57fbe9eef978@gmail.com>
References: <20261104-master-v12-0-57fbe9eef978@gmail.com>
 <20261104-master-v12-6-57fbe9eef978@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 08:18:00 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: sm7250: lmh_cluster1 cpu6 rejected by lmh_probe()
- [Medium] arm64: dts: qcom: sm7250: invalid PSCI parameters in domain-idle=
-states
- [Medium] clk: qcom: gcc-sm7250: out-of-bounds -EINVAL lookup for GCC_VIDE=
O_XO_CLK
- [Medium] arm64: dts: qcom: sm7250: non-page-aligned ipa_gsi_mem and gpu_m=
em regions
- [Low] arm64: dts: qcom: sm7250: child nodes under soc@0 not sorted by add=
ress
- [Low] arm64: dts: qcom: sm7250: unused dt-bindings/power/qcom-rpmpd.h inc=
lude
--

commit 133903425754af1429d60a918bf4c66666da655c
Author: Sreeshankar K <sreeshankar0910@gmail.com>

arm64: dts: qcom: Add SM7250 devicetree file

This commit adds the base SoC devicetree file for Qualcomm SM7250, defining
CPU topology, PSCI idle states, reserved memory regions, clocks, interrupt
controllers, RPMh, cpufreq, LMh, and timers needed to boot to serial consol=
e.

> diff --git a/arch/arm64/boot/dts/qcom/sm7250.dtsi b/arch/arm64/boot/dts/q=
com/sm7250.dtsi
> new file mode 100644
> index 0000000000000..02901f0b08a3f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7250.dtsi
> @@ -0,0 +1,795 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
> + */
> +
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,gcc-sm7250.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/power/qcom,rpmhpd.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>

[Severity: Low]
As reported by Sashiko on v11 [1], is the dt-bindings/power/qcom-rpmpd.h
include needed here? SM7250 uses the RPMh power domain definitions from
dt-bindings/power/qcom,rpmhpd.h, and none of the legacy RPM definitions from
qcom-rpmpd.h are referenced in this file.

[ ... ]

> +		domain-idle-states {
> +			cluster_sleep_pc: cluster-sleep-0 {
> +				compatible =3D "domain-idle-state";
> +				arm,psci-suspend-param =3D <0x40000004>;
> +				entry-latency-us =3D <2752>;
> +				exit-latency-us =3D <3048>;
> +				min-residency-us =3D <6118>;
> +			};
> +
> +			cluster_sleep_cx: cluster-sleep-1 {
> +				compatible =3D "domain-idle-state";
> +				arm,psci-suspend-param =3D <0x41000224>;
> +				entry-latency-us =3D <3638>;
> +				exit-latency-us =3D <4562>;
> +				min-residency-us =3D <8467>;
> +			};
> +
> +			cluster_sleep_aoss: cluster-sleep-2 {
> +				compatible =3D "domain-idle-state";
> +				arm,psci-suspend-param =3D <0x41000c24>;
> +				entry-latency-us =3D <3263>;
> +				exit-latency-us =3D <6562>;
> +				min-residency-us =3D <9826>;
> +			};
> +		};

[Severity: Medium]
As reported by Filippo Falezza on v11 [2], are the arm,psci-suspend-param
values in cluster_sleep_pc, cluster_sleep_cx, and cluster_sleep_aoss encoded
as expected by psci_pd_power_off() and __psci_enter_domain_idle_state()?

When cluster_pd powers off in PSCI OSI mode, __psci_enter_domain_idle_state=
()
replaces the per-CPU state parameter with ds->state:

drivers/cpuidle/cpuidle-psci.c:__psci_enter_domain_idle_state() {
	...
	if (ds->state)
		state =3D ds->state;

	ret =3D psci_cpu_suspend_enter(state);
	...
}

Because ds->state replaces the per-CPU parameter rather than being ORed with
it, Qualcomm cluster domain-idle-state parameters encode the per-CPU rail
power collapse state (0x4) in bits [3:0], the cluster mode shifted left by
4 bits in bits [15:4] (0x004 << 4 =3D 0x0040, 0x224 << 4 =3D 0x2240, and
0xc24 << 4 =3D 0xc240), and affinity level 1 in bit 24 (0x01000000).

Here, cluster_sleep_pc uses 0x40000004 (which is the affinity-level-0 per-C=
PU
rail power collapse parameter used by little_cpu_sleep_1 and big_cpu_sleep_=
1),
and cluster_sleep_cx and cluster_sleep_aoss use unshifted 0x41000224 and
0x41000c24. Should these three parameters be 0x41000044, 0x41002244, and
0x4100c244 instead?

[ ... ]

> +		ipa_gsi_mem: ipa-gsi@8bc10000 {
> +			reg =3D <0x0 0x8bc10000 0x0 0x5400>;
> +			no-map;
> +		};
> +
> +		gpu_mem: gpu@8bc15400 {
> +			reg =3D <0x0 0x8bc15400 0x0 0x2000>;
> +			no-map;
> +		};

[Severity: Medium]
Can the non-page-aligned boundary between ipa_gsi_mem and gpu_mem cause page
mapping and PAS setup issues when loading the GPU zap shader?

Here ipa_gsi_mem has a size of 0x5400 (ending at 0x8bc153ff) and gpu_mem
starts at 0x8bc15400 (ending at 0x8bc173ff), so both no-map regions share t=
he
4KB physical page at 0x8bc15000, while map_mem() and __free_memory_core()
round the start of the following System RAM region up via PAGE_ALIGN() /
PFN_UP() to 0x8bc18000, leaving the remaining 3KB at 0x8bc17400..0x8bc17fff
unmapped.

When adreno_zap_shader_load() -> zap_shader_load_mdt() in
drivers/gpu/drm/msm/adreno/adreno_gpu.c loads the GPU zap shader, it remaps
and initializes the region via:

	mem_region =3D memremap(mem_phys, mem_size, MEMREMAP_WC);
	...
	ret =3D qcom_mdt_load(dev, fw, fwname, pas_id,
			    mem_region, mem_phys, mem_size, NULL);

generic_ioremap_prot() aligns mem_phys (0x8bc15400) down to page boundary
0x8bc15000 (overlapping the tail of ipa_gsi_mem), and qcom_mdt_load() ->
__qcom_mdt_pas_init() -> qcom_pas_mem_setup() -> qcom_scm_pas_mem_setup()
passes the unaligned base address 0x8bc15400 to TrustZone PIL setup (similar
to the issue fixed on SM6350 in commit 44bcded2be4f ("arm64: dts: qcom:
sm6350: Fix ZAP region")). Should ipa_gsi_mem and gpu_mem be aligned to 4KB
page boundaries?

[ ... ]

> +	soc: soc@0 {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges =3D <0 0 0 0 0x10 0>;
> +		dma-ranges =3D <0 0 0 0 0x10 0>;
> +
> +		gcc: clock-controller@100000 {
> +			compatible =3D "qcom,gcc-sm7250";
> +			reg =3D <0x0 0x00100000 0x0 0x1f0000>;
> +			clock-names =3D "bi_tcxo",
> +				      "bi_tcxo_ao",
> +				      "sleep_clk";
> +			clocks =3D <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> +				 <&sleep_clk>;
> +			power-domains =3D <&rpmhpd RPMHPD_CX>;
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +			#power-domain-cells =3D <1>;
> +		};

[Severity: Medium]
Does instantiating qcom,gcc-sm7250 expose an out-of-bounds lookup for
GCC_VIDEO_XO_CLK in qcom_cc_clk_hw_get()?

In include/dt-bindings/clock/qcom,gcc-sm7250.h, GCC_VIDEO_XO_CLK is defined=
 as
122, the highest index in the header:

	#define GCC_VIDEO_AHB_CLK					120
	#define GCC_VIDEO_AXI_CLK					121
	#define GCC_VIDEO_XO_CLK					122

In drivers/clk/qcom/gcc-sm7250.c, GCC_VIDEO_XO_CLK is enabled as a critical
clock in gcc_sm7250_critical_cbcrs[] and omitted from gcc_sm7250_clocks[],
where the highest designated index is [GCC_VIDEO_AXI_CLK] (121):

	[GCC_VIDEO_AXI_CLK] =3D &gcc_video_axi_clk.clkr,
	[GPLL0] =3D &gpll0.clkr,
	[GPLL0_OUT_EVEN] =3D &gpll0_out_even.clkr,
	[GPLL6] =3D &gpll6.clkr,
	[GPLL9] =3D &gpll9.clkr,
};

Because ARRAY_SIZE(gcc_sm7250_clocks) (stored in cc->num_rclks) is 122, any
consumer requesting <&gcc GCC_VIDEO_XO_CLK> hits idx >=3D cc->num_rclks in
drivers/clk/qcom/common.c:qcom_cc_clk_hw_get() and gets ERR_PTR(-EINVAL)
instead of NULL as returned for lower-indexed critical clocks such as
GCC_CAMERA_XO_CLK or GCC_DISP_XO_CLK.

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
> +			clocks =3D <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
> +			clock-names =3D "xo", "alternate";
> +			#freq-domain-cells =3D <1>;
> +			#clock-cells =3D <1>;
> +		};
> +
> +		lmh_cluster0: lmh@18358800 {
> +			compatible =3D "qcom,sm7250-lmh", "qcom,sm8150-lmh";
> +			reg =3D <0x0 0x18358800 0x0 0x400>;
> +			interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +			cpus =3D <&cpu0>;
> +			qcom,lmh-temp-arm-millicelsius =3D <60000>;
> +			qcom,lmh-temp-low-millicelsius =3D <84500>;
> +			qcom,lmh-temp-high-millicelsius =3D <85000>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <1>;
> +		};
> +
> +		lmh_cluster1: lmh@18350800 {
> +			compatible =3D "qcom,sm7250-lmh", "qcom,sm8150-lmh";
> +			reg =3D <0x0 0x18350800 0x0 0x400>;
> +			interrupts =3D <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +			cpus =3D <&cpu6>;
> +			qcom,lmh-temp-arm-millicelsius =3D <60000>;
> +			qcom,lmh-temp-low-millicelsius =3D <84500>;
> +			qcom,lmh-temp-high-millicelsius =3D <85000>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <1>;
> +		};

[Severity: High]
Will lmh_cluster1 fail to probe and prevent cpufreq_hw from initializing wh=
en
cpus =3D <&cpu6> is passed to lmh_probe()?

In drivers/thermal/qcom/lmh.c, lmh_probe() resolves the CPU node via
of_cpu_node_to_id() and only accepts logical CPU IDs 0 and 4:

	if (cpu_id =3D=3D 0) {
		node_id =3D LMH_CLUSTER0_NODE_ID;
	} else if (cpu_id =3D=3D 4) {
		node_id =3D LMH_CLUSTER1_NODE_ID;
	} else {
		dev_err(dev, "Wrong CPU id associated with LMh node\n");
		return -EINVAL;
	}

Because cpu6 is logical CPU 6 on SM7250 (where cpu0..cpu5 are in frequency
domain 0 and cpu6 is the first big core in frequency domain 1), lmh_probe()
returns -EINVAL for lmh_cluster1 before calling irq_domain_create_linear().

Because cpufreq_hw references <&lmh_cluster1 0> in interrupts-extended and
lmh_cluster1 is enabled in DT without ever registering its IRQ domain,
fw_devlink blocks cpufreq_hw on the unmet interrupt supplier link; even if
cpufreq_hw probes, qcom_cpufreq_hw_cpu_init() -> qcom_cpufreq_hw_lmh_init()=
 ->
platform_get_irq_optional() returns -EPROBE_DEFER for domain 1 (and also le=
aks
policy->freq_table and dynamic OPPs allocated earlier in
qcom_cpufreq_hw_read_lut()). In addition, because qcom_cpufreq_hw_driver is
registered at postcore_initcall while lmh_driver is registered at
device_initcall (and cpu0 has no interconnects property to defer
qcom_cpufreq_hw_driver_probe()), domain 0 also hits -EPROBE_DEFER during
cpufreq_register_driver() while domain 2 (cpu7, which has no interrupt entry
and gets -ENXIO) succeeds.

> +
> +		tcsr_mutex: hwlock@1f40000 {
> +			compatible =3D "qcom,tcsr-mutex";
> +			reg =3D <0x0 0x01f40000 0x0 0x40000>;
> +			#hwlock-cells =3D <1>;
> +		};
> +
> +		timer@17c20000 {

[Severity: Low]
This isn't a bug, but several child nodes under soc@0 are out of ascending
unit-address order: interrupt-controller@17a00000 is placed before
interrupt-controller@b220000 and spmi@c440000, lmh@18358800 is placed before
lmh@18350800, and hwlock@1f40000 and timer@17c20000 are placed at the end
after lmh@18350800. Could the child nodes under soc@0 be sorted by unit
address in ascending order to match the DTS coding style?

[1] https://lore.kernel.org/r/20261016042432.824-6-sreeshankar0910@gmail.com
[2] https://lore.kernel.org/r/20261030004903.1068342-1-effeffe99@gmail.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-master-v12=
-0-57fbe9eef978@gmail.com?part=3D6
