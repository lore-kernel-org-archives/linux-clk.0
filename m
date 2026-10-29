Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258798;
	b=5aftkwI1RUWpJkvMZ4SMgRoYrbH+4POFcK0jB4gV8tj8E5uo0J50HE4NC/zc82I4sg/F
	 ED8SokcGbLK60TI5OsJpkS8PD5CfLUmQJhm5HPHSkg2Ca0TpyVk9EkjXwrgF25goFHMIV
	 bnzNs+GzZmFI3QNvJfgghxAl/lCJrbH8Om7ciinn7x4Kcc1UdHKx3icSg0+DvUQO5J3TG
	 glNJ82ftKFAwGpOiussdiMo2QbQXu2dDmLfxebZjGbDYH2qVf+BlTQnz0rHzuQxr7OPLh
	 5vaAjB5f3jeyhA8H2/+D3RBFRUO5kjBaUGo+nGeV88tX8Mn/U/2h3sJ59mdusWwTegg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258798;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TGujUlVHoneAQAenhErRir79HI4JtKW6U1B4x7MbHz0=;
	b=2GhBbocpGh/cNxjjpaM635MSnOvZdUFrXHWOFGXpI4wYVwRk0RBglDVEUrVYdSWuIXIK
	 Uq1RdRv7fDMHP+fdP/ijQ1eAR0+alFqV83tiR+017K4p49blLD9nDGLFZH4t7TvXZPdX2
	 zLw7eLWxKOorx+gkgfPGir329qigkoLyke3BET2p+iHvYyNVkyV+wS+J9jPNlwo2Dm+Ca
	 inD86WQGbwIHp0BUABxLvqQN78Op4T4hYZcCPKhnWK7/W8k5MjvBFKVGxq6jbcOKCiKL9
	 bvXMtiO33DIKj6G3LXeS3yeIWtLGAmmJY2ptt2W5pJI9IxuPGi6wniBvXXk90rxmvJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RrBYn+MF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88146606A322;
	Thu, 29 Oct 2026 07:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RrBYn+MF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D321F01825;
	Thu, 29 Oct 2026 07:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793258797;
	bh=TGujUlVHoneAQAenhErRir79HI4JtKW6U1B4x7MbHz0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RrBYn+MFLLoNwEpbrKAAvq3kA4f+nI2ss5vg+BZ+g6GWIMKPVqikF1SxMljVOS3Yj
	 FiM8jDFdibqhyGUAlti2JaMZkmsWn887OSI93V6W+j60TtcvaZ7TUco0CGj+WLEPcC
	 kww04VQUyvS7VRITW7X2OH6vPpEfPTmqzHnmj3aZCfy3+RGlG52ATdXXcCFkbi/ZaR
	 18nLcgDVLEtEGVtwlqgWdTGbScxEXP7bHh+DYgtJOX4qKbBvolNRorw+6ka8hXkeXd
	 +LleApUPkXX3vbQTu1AF1bMkhixrzwrWqox4BRhAvtwleBAUSZLtRzvJgl2KMwbDRZ
	 QMF23ZcnuzEkw==
Message-ID: <sashiko-outbox-188866@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v11 5/5] arm64: dts: qcom: Add SM7250 devicetree
 file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeshankar K" <sreeshankar0910@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029-master-v11-5-2c29e382162c@gmail.com>
References: <20261029-master-v11-0-2c29e382162c@gmail.com>
 <20261029-master-v11-5-2c29e382162c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 07:26:37 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: sm7250: invalid cpu-map core numbering in cluste=
r1/cluster2
- [Low] arm64: dts: qcom: sm7250: invalid empty ranges in timer@17c20000
- [Low] arm64: dts: qcom: sm7250: undocumented properties in gcc node
--

commit bf84a1845e05761eee023636ff9d6f3060fa7b0d
Author: Sreeshankar K <sreeshankar0910@gmail.com>

arm64: dts: qcom: Add SM7250 devicetree file

This commit adds the base devicetree file for the Qualcomm SM7250 SoC,
including CPU, PSCI, reserved memory, clock controller, interrupt controlle=
r,
RPMh, cpufreq, and timer nodes.

> diff --git a/arch/arm64/boot/dts/qcom/sm7250.dtsi b/arch/arm64/boot/dts/q=
com/sm7250.dtsi
> new file mode 100644
> index 0000000000000..48480e6855f0c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7250.dtsi
> @@ -0,0 +1,771 @@

[ ... ]

> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu =3D <&cpu0>;
> +				};
> +
> +				core1 {
> +					cpu =3D <&cpu1>;
> +				};
> +
> +				core2 {
> +					cpu =3D <&cpu2>;
> +				};
> +
> +				core3 {
> +					cpu =3D <&cpu3>;
> +				};
> +
> +				core4 {
> +					cpu =3D <&cpu4>;
> +				};
> +
> +				core5 {
> +					cpu =3D <&cpu5>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core6 {
> +					cpu =3D <&cpu6>;
> +				};
> +			};
> +
> +			cluster2 {
> +				core7 {
> +					cpu =3D <&cpu7>;
> +				};
> +			};
> +		};

[Severity: High]
Will parse_cluster() in drivers/base/arch_topology.c fail to find cpu6 and
cpu7 with this cpu-map node layout in arch/arm64/boot/dts/qcom/sm7250.dtsi?

During boot, init_cpu_topology() calls parse_dt_topology() -> parse_cluster=
(),
which looks up core subnodes inside each cluster sequentially starting from
core0:

drivers/base/arch_topology.c:parse_cluster() {
	/* Now check for cores */
	i =3D 0;
	do {
		snprintf(name, sizeof(name), "core%d", i);
		struct device_node *c __free(device_node) =3D
			of_get_child_by_name(cluster, name);

		if (!c)
			break;
}

Because cluster1 and cluster2 only contain core6 and core7 (with no core0),
of_get_child_by_name(cluster, "core0") returns NULL on the first iteration,
logging empty cluster warnings and never calling parse_core() ->
get_cpu_for_node() -> topology_parse_cpu_capacity() for cpu6 or cpu7.

Since parse_core() succeeds for cpu0..cpu5, raw_capacity is allocated with
entries for cpu0..cpu5 set to 1024 while raw_capacity[6] and raw_capacity[7]
remain 0. When parse_dt_topology() subsequently runs:

drivers/base/arch_topology.c:parse_dt_topology() {
	topology_normalize_cpu_scale();

	/*
	 * Check that all cores are in the topology; the SMP code will
	 * only mark cores described in the DT as possible.
	 */
	for_each_possible_cpu(cpu)
		if (cpu_topology[cpu].package_id < 0) {
			return -EINVAL;
		}
}

topology_normalize_cpu_scale() sets the scheduler capacity scale (cpu_scale)
for cpu6 and cpu7 to 0, and parse_dt_topology() returns -EINVAL because cpu6
and cpu7 still have package_id < 0, causing init_cpu_topology() to call
reset_cpu_topology() and discard the DT CPU topology.

Should core6 and core7 be placed under cluster0 (since all 8 cores share l3=
_0
and cluster_pd) or renamed to core0 within their respective clusters?

[ ... ]

> +	soc: soc@0 {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges =3D <0 0 0 0 0x10 0>;
> +		dma-ranges =3D <0 0 0 0 0x10 0>;
> +
> +		gcc: clock-controller@100000 {
> +			compatible =3D "qcom,sm7250-gcc";
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

[Severity: Low]
Should clock-names and power-domains be dropped from the gcc
(clock-controller@100000) node in arch/arm64/boot/dts/qcom/sm7250.dtsi, or
documented in the binding schema?

In Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml (which cove=
rs
qcom,sm7250-gcc and references qcom,gcc.yaml), unevaluatedProperties is set=
 to
false and neither clock-names nor power-domains is defined, causing dtbs_ch=
eck
validation to fail on clock-controller@100000. In addition,
drivers/clk/qcom/gcc-sm7250.c resolves its parent clocks by DT index rather
than by name.

[ ... ]

> +		timer@17c20000 {
> +			compatible =3D "arm,armv7-timer-mem";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			ranges;
> +			reg =3D <0x0 0x17c20000 0x0 0x1000>;

[Severity: Low]
Does the empty ranges property in timer@17c20000 in
arch/arm64/boot/dts/qcom/sm7250.dtsi trigger dtc ranges_format warnings when
building a board dtb?

The parent node soc@0 uses #address-cells =3D <2> and #size-cells =3D <2>, =
while
timer@17c20000 uses #address-cells =3D <1> and #size-cells =3D <1> with an =
empty
ranges property. In scripts/dtc/checks.c, check_ranges_format() checks for
this mismatch:

scripts/dtc/checks.c:check_ranges_format() {
	if (prop->val.len =3D=3D 0) {
		if (p_addr_cells !=3D c_addr_cells)
			FAIL_PROP(c, dti, node, prop, "empty \"%s\" property but its "
				  "#address-cells (%d) differs from %s (%d)",
				  ranges, c_addr_cells, node->parent->fullpath,
				  p_addr_cells);
		if (p_size_cells !=3D c_size_cells)
			FAIL_PROP(c, dti, node, prop, "empty \"%s\" property but its "
				  "#size-cells (%d) differs from %s (%d)",
				  ranges, c_size_cells, node->parent->fullpath,
				  p_size_cells);
	}
}

Should this use an explicit mapping such as ranges =3D <0 0 0 0x20000000>; =
as on
other Qualcomm SoCs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-master-v11=
-0-2c29e382162c@gmail.com?part=3D5
