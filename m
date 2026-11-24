Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515062;
	b=PidhscQw2QSf7jzs8bwqIG9I+0feYBQk4k4bRLu+sOTldL2Fsve/T0pKJ7nmiKeSwM0j
	 xPhBEkQ035YiN3KSbCNHqWphpvFZiyfsVYv4G8PETd/eflsgmtrtfWvQ7STox6QymIP5y
	 OCk4aEB/8MrQVSBfLSGtgYzP8YfE09Sgz3w3UUjTjc2TJ43vO5YvtZ8aP34TWLoghSVj1
	 jUtB2g/3hGyRYzemnEw6GiYnOn7alqWEMhSrlObFxuF5uSYL1S53qJoDfgmI1V1dwVPI/
	 OXHiP/xJ8yN8EFAM31ws89UNU/z3LMA3EtC8d2gGVs8nUlxAahtttgojTxrKc7OIIJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515062;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bn66p4czJlIsFN3fgxrVGg4Pt3dHttr6GRisYnhTJJU=;
	b=toWgW5E0FB0G/SLFdgRunjbvEdv8IPzOPhTPpK1rWX1E84ghgjxvHfDyLfcjOo033GMU
	 vhKGQNsRy4sKkp+Hessq/w/ed1RmPSb/IIOhnxyeNTzG3VaM01QmHTMR4cKXp4xq7Qfdz
	 ZYCQS34cqySXDCWQso9U0sPBdZ2yZbyAotLZbQL0TzXPjWusgco5be5fpQgpE804MvBo1
	 qpJEsItVCCzowJt0MmstoaCYSt0DpMc76p8awIsomScRGYDbUhYQGA8+iyu4qZ8gSUTLq
	 9sQ4oUjwM0hT6PvPZmS+3ePyfXKRgiL1CKSph9JRlRSu2gGbquPO1D9KX6feGn+vgKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A2yBDoP3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42E5606A31E;
	Tue, 24 Nov 2026 10:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A2yBDoP3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB121F000C6;
	Tue, 24 Nov 2026 10:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795515061;
	bh=bn66p4czJlIsFN3fgxrVGg4Pt3dHttr6GRisYnhTJJU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A2yBDoP3NWBiE1HM/s9zQ66YeWifwZUpQjqtKiBuVK0zi15NR2FBhWw4kexUTjdgP
	 lw8McPjk4IaHqqbvcJSlYwzWoc+4EppkcdSGFcx/EbF/ZKKJDrFiJXzIFKaP40T8HH
	 Ps2F0z3/Ph4UdSuJ+woO0ITGe+KSy9cgZsaVo0lHhhRuF5UufdvzW8ua98EeFf6FO+
	 k2PKzlJLoXjlsrwdRtivJ7F68kcbNjbaeBvNO3+gLsH6Kxm521jvabkHqzt2DKVgK5
	 ZMVl3qqGs/ArIGPYbi2FUcNF2uOW/Apz++DpZWuUldSECI120xvc5n4Jptxm6nuAIw
	 nGNsRFmSmFadQ==
Message-ID: <sashiko-outbox-230920@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: Add Qualcomm Netrani GCC
Reply-To: sashiko-reviews@lists.linux.dev
To: SignKirigami <prcups@krgm.moe>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-netrani-clock-v1-v1-1-ce10cedbfa4b@krgm.moe>
References: <20261124-netrani-clock-v1-v1-0-ce10cedbfa4b@krgm.moe>
 <20261124-netrani-clock-v1-v1-1-ce10cedbfa4b@krgm.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 10:11:01 +0000
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
- [Medium] dt-bindings: clock: netrani-gcc: GDSC IDs continue reset
  numbering at 27
- [Low] dt-bindings: clock: qcom,netrani-gcc: missing power-domains
  property
--

commit 0e3fa161746caedb31f6d1ea2fcad4a06d7279ab
Author: SignKirigami <prcups@krgm.moe>

dt-bindings: clock: Add Qualcomm Netrani GCC

This commit adds the Device Tree binding schema and clock, reset, and
power-domain identifier header for the Qualcomm Netrani global clock
controller.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,netrani-gcc.yam=
l b/Documentation/devicetree/bindings/clock/qcom,netrani-gcc.yaml
> new file mode 100644
> index 0000000000000..f05e0ca78cb94
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,netrani-gcc.yaml
> @@ -0,0 +1,77 @@
[ ... ]
> +  clock-names:
> +    items:
> +      - const: bi_tcxo
> +      - const: sleep_clk
> +      - const: pcie_0_pipe_clk
> +      - const: ufs_phy_rx_symbol_0_clk
> +      - const: ufs_phy_rx_symbol_1_clk
> +      - const: ufs_phy_tx_symbol_0_clk
> +      - const: usb3_phy_wrapper_gcc_usb30_pipe_clk
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - '#power-domain-cells'
> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false

[Severity: Low]
Should this binding define and require power-domains for the parent CX power
domain, like the register-compatible qcom,sm4450-gcc.yaml?

Because qcom,gcc.yaml does not declare power-domains and this schema sets
unevaluatedProperties: false, a devicetree node cannot specify the parent CX
power domain without failing schema validation.  Without power-domains on
the GCC node, gdsc_register() cannot attach GCC_UFS_PHY_GDSC and
GCC_USB30_PRIM_GDSC as subdomains of the CX domain.

> diff --git a/include/dt-bindings/clock/qcom,netrani-gcc.h b/include/dt-bi=
ndings/clock/qcom,netrani-gcc.h
> new file mode 100644
> index 0000000000000..b4d4a39d4d690
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,netrani-gcc.h
> @@ -0,0 +1,184 @@
[ ... ]
> +#define GCC_VIDEO_AXI0_CLK_ARES					25
> +#define GCC_VIDEO_BCR						26
> +
> +/* GCC power domains */
> +#define GCC_UFS_PHY_GDSC					27
> +#define GCC_USB30_PRIM_GDSC					28
> +
> +#endif

[Severity: Medium]
Should the GCC power domain IDs start at 0 instead of continuing the reset
numbering from GCC_VIDEO_BCR (26)?

qcom_cc_really_probe() and gdsc_register() register GDSCs as a separate
onecell genpd provider indexed from 0 to desc->num_gdscs - 1, independent
of the reset controller array.  Using 27 and 28 in the ABI header differs
from other Qualcomm GCC bindings (including qcom,sm4450-gcc.h) and either
forces the driver's GDSC table to carry 27 unused leading NULL entries or
causes out-of-bounds lookups when indexing by GDSC count.  Also, since this
controller is register-compatible with SM4450 GCC and defines the
GCC_PCIE_0_* clocks and resets, is GCC_PCIE_0_GDSC intentionally omitted?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-netrani-cl=
ock-v1-v1-0-ce10cedbfa4b@krgm.moe?part=3D1
