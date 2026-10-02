Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE893472F7F;
	Fri,  2 Oct 2026 09:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932432; cv=none; b=CCgnkVY9YUO4L3QIm9kq1l5GwECy1n/3tznurn7sQSWa/SltdM/9cDve5pe9RC9d0g4ZG1Zk2PCne1buIiwikm2SGxobeSmxKjNN9trvIzORsDTMlA7ZK/vYaznOqT6BFOGK0Kho2AgmOrnf27zff47E9fBO6fgHpA8x3Ym/7zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932432; c=relaxed/simple;
	bh=6BIyO72QIUnw89VR/2eEXayqYbz6x8nAKvELOVM6B3Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RANfGYr+tViojCRGVzVnTaaALkSFkWGV2dEG3+f8TAH55AcaMsqnyvKFTyOqYksgvZWcsElVJx+gtn0KjiEOYjzDK8JcDUC3vABr6C/4M3pDLXg3n51K31P83cnMFDNiSoVcpYoDcJhSrsAcS4Zfoo6EopfNhMzfaUm1uQrgKiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WMuUQoKY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WMuUQoKY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 895461F00899;
	Fri,  2 Oct 2026 09:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932430;
	bh=anTI35LybyHlstlS8bzOKXBDkIwwuh1DISGRsXHEJrA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WMuUQoKY5XLYaaYZEFsdpufYF6eW7Eo3y9RrMQrnyafgDitTThrP7YGEdVFS2yOqL
	 9n4U/INz7QaU/4rpqxDKBQ6eD40d1C+ib/byixbfLDrhi+QlvWY0ovHt1FdJYGm695
	 q9XkPmz4o0oh8KIraMPebs9UJOKpmzNnvTsEDQ7foVBGzWkG6OKapsV6/32zX7eBeY
	 g+ILIb9OEiZcQQgK+9jat+xUSzBOGRQ6FUXshQmo10iQNbNdDB9WZhCJgN23T1rlGi
	 kob3u4M3IdQXRyTbtD5RgaxuoNNxiaMsDYHkFQf3wzyUBqnS383iPaj9MmjsqlcS5U
	 6aqNvS4cIEzjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: clock: Convert HiSilicon clocks to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261001212051.2227941-1-robh@kernel.org>
References: <20261001212051.2227941-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:13:50 +0000
Message-Id: <20261002091350.895461F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing if-then constraints for stub clock properti=
es
- [Low] dt-bindings: YAML conversion dropped all DT examples
--

commit 9d6ccc9389906ef23ff428ed84de04603566232a
Author: Rob Herring (Arm) <robh@kernel.org>
Date:   Thu Oct 1 21:20:48 2026 +0000

    dt-bindings: clock: Convert HiSilicon clocks to DT schema

This commit converts the HiSilicon Hi6220, Hi3660, and Hi3670 clock
bindings from legacy text format to YAML DT schema format. It also
splits out the stub clock binding into its own standalone document.

> diff --git a/Documentation/devicetree/bindings/clock/hisilicon,clocks.yam=
l b/Documentation/devicetree/bindings/clock/hisilicon,clocks.yaml
> new file mode 100644
> index 0000000000000..345c6d0e7a134
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/hisilicon,clocks.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +
> +additionalProperties: false

[Severity: Low]
Were the device tree examples intentionally omitted during the conversion?

The original hi3660-clock.txt and hi3670-clock.txt bindings included example
nodes, but they have been dropped entirely here. Running make dt_binding_ch=
eck
will only validate the schema syntax itself, but without an examples block,=
 it
will not validate any real configurations. This circumvents the primary
self-testing mechanism of the schema conversion.

> diff --git a/Documentation/devicetree/bindings/clock/hisilicon,hi6220-stu=
b-clk.yaml b/Documentation/devicetree/bindings/clock/hisilicon,hi6220-stub-=
clk.yaml
> new file mode 100644
> index 0000000000000..4dd6a01bfd9db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/hisilicon,hi6220-stub-clk.y=
aml

[ ... ]

> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - mboxes

[Severity: Medium]
Should there be conditional (if-then) constraints here to enforce
hardware-specific requirements?

The schema groups hisilicon,hi3660-stub-clk and hisilicon,hi6220-stub-clk,
but lacks variant-specific checks. Without conditional constraints, schema
validation will silently pass incomplete configurations that will later
cause the drivers to fail during probe.

For instance, the hi3660 driver unequivocally requires the reg property:

drivers/clk/hisilicon/clk-hi3660-stub.c:hi3660_stub_clk_probe() {
    ...
    freq_reg =3D devm_platform_ioremap_resource(pdev, 0);
    if (IS_ERR(freq_reg))
        return PTR_ERR(freq_reg);
    ...
}

Similarly, the hi6220 driver unequivocally requires the
hisilicon,hi6220-clk-sram property:

drivers/clk/hisilicon/clk-hi6220-stub.c:hi6220_stub_clk_probe() {
    ...
    stub_clk->dfs_map =3D syscon_regmap_lookup_by_phandle(np,
                        "hisilicon,hi6220-clk-sram");
    if (IS_ERR(stub_clk->dfs_map)) {
        dev_err(dev, "failed to get sram regmap\n");
        return PTR_ERR(stub_clk->dfs_map);
    }
    ...
}

> +
> +additionalProperties: false

[Severity: Low]
Just as with the hisilicon,clocks.yaml file, the examples from the original
hi6220-clock.txt bindings were completely dropped here. Is it possible to
restore the stub_clock example to ensure make dt_binding_check tests a valid
hardware configuration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001212051.2227=
941-1-robh@kernel.org?part=3D1
