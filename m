Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888786;
	b=hHTDfqWNxgwDaZG6zjQP8DvHkhhNvGah+b3RHwkQOvefQ2eGmHiLiw/TvnUAAPyK6ZM+
	 Yh9jwa6ndEmpTi9wtXJRou9NxwmrgKv5d3ri1+RAxgerFVdV0/U2D4razzWOnUD5nX8Q2
	 6BEzb4nmDo9R6EmJuMFaU2ivET80MGI55tOt7ghyLq+5heIfMsEtmhLAhDRPgjXgFTPTR
	 dOCsYlYeSHCaRfAISCPNqDIhmXo0F+f4xTkF1MjbgBIoxCNhSBdt2wUhrdEIu55cbz9Jp
	 GEXqufwDqJbeE2gnEfdzcPIXZixX8eufwC7W1m4rJe3GjuBm7Exj+/IxJ13HFtqkBwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888786;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0FpUJ5oPnuH2Vd70hoxesgWQwvSUVNen5oSSTiwYfF0=;
	b=gKhMzBcTeN027iczGqimCWMDRCRaq0X2iLognvOxzMlNvP50U4VztFNC29W3Ng5cs/dt
	 BEbUOwoxknWSg+4AoxHa9mFZwe84HGkt3rwMYm89v9V03FfMwu31BrBcFjMxeG3IX7INa
	 q17qyewT3jG5khscMeZIVCcGafmmAVbVYxQWrgm4yJpq5QGV8LTdBl0wQleqC8Ul7YxGD
	 UFz804WoS5DYIXN63YRwjqKYnq27uTPmNEmQcGozYAm2J989YZPg+/53VU98qGy2mJSkS
	 ErXO5wcfSNZ1bBe1Zd5HEg7cjs1SBRcFSD5rvhlW7uiKLNirC2LE/ozK3SrrjrJY7hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PputdnlR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD4C606A32C;
	Thu,  5 Nov 2026 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PputdnlR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749BF1F000C1;
	Thu,  5 Nov 2026 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888785;
	bh=0FpUJ5oPnuH2Vd70hoxesgWQwvSUVNen5oSSTiwYfF0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PputdnlRLxGFLxVGBYWYgEZkS2IcoSlXhhICK59BJRG9r8U3gSwD243Dz4EUlNzPt
	 ipTi9PWdnc63nQmLsWdDRrMHMKYbiW0562B7CXaLCw+rqYBCrcN6ulsVTmcM5UlETt
	 dGRu9NCki0QdlBNjjyPASDBVP7hOjBS3dkWHgyChw0s8XeVzQAO7b+6JuV/3S6MepD
	 HwZIA6g6CFIkrBQ3StTTH9W53D9uf9uYUvv57Dvge3LWQ2AQOzxlaFuZ+MqBDR1eP3
	 0U5qdExP1k9fLSl/ehkusHWHwbweM/VdiXYW0ODNeDpdjNR71BpKD8Yimcl8LkK+kY
	 TOs3vi2B1FUtg==
Message-ID: <sashiko-outbox-199238@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 13/16] ARM: dts: microchip: sama7g5: Add OTPC clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Dahl" <ada@thorsis.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105110715.2486432-14-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-14-ada@thorsis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 14:26:25 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: at91: out-of-bounds write and lookup failure in sama7g5_pmc_s=
etup()
- [High] clk: at91: uninitialized hw pointer stored in sama7g5_pmc_setup()
--

commit 449771270ea59bc4c7759cd22fba4a55741f936a
Author: Alexander Dahl <ada@thorsis.com>

ARM: dts: microchip: sama7g5: Add OTPC clocks

This patch adds the main RC oscillator and OTPC peripheral clocks to the
otpc node in the SAMA7G5 device tree.

Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c2=
8@microchip.com/T/#u

> diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi b/arch/arm/boot/dts=
/microchip/sama7g5.dtsi
> index b8296391fc696..30193f3bf9775 100644
> --- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
> @@ -1036,6 +1036,7 @@ otpc: efuse@e8c00000 {
>  			reg =3D <0xe8c00000 0x100>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
> +			clocks =3D <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MAIN_RC>, <&pmc PMC_TYPE_P=
ERIPHERAL 67>;

[Severity: High]
Can mchp_otpc_probe() acquire SAMA7G5_PMC_MAIN_RC here, or does this cause
the OTPC probe to fail with -EINVAL due to an out-of-bounds core clock
index in sama7g5_pmc_setup()?

In include/dt-bindings/clock/microchip,sama7g5-pmc.h, SAMA7G5_PMC_MCK1 is
13 and SAMA7G5_PMC_MAIN_RC is 14. However, in
drivers/clk/at91/sama7g5.c:sama7g5_pmc_setup(), sama7g5_pmc is allocated
with ncore set to SAMA7G5_PMC_MCK1 + 1 (14):

    sama7g5_pmc =3D pmc_data_allocate(SAMA7G5_PMC_MCK1 + 1,
                                    nck(sama7g5_systemck),
                                    nck(sama7g5_periphck),
                                    nck(sama7g5_gck), 8);

Because chws only has 14 entries (indices 0..13), writing to index
SAMA7G5_PMC_MAIN_RC (14) in sama7g5_pmc_setup() writes one element past the
end of sama7g5_pmc->chws[] into sama7g5_pmc->shws[0]:

    sama7g5_pmc->chws[SAMA7G5_PMC_MAIN_RC] =3D hw;

Then, when mchp_otpc_probe() calls devm_clk_bulk_get_all_enabled(),
drivers/clk/at91/pmc.c:of_clk_hw_pmc_get() checks:

    case PMC_TYPE_CORE:
        if (idx < pmc_data->ncore)
            return pmc_data->chws[idx];
        break;

Since idx is 14 and pmc_data->ncore is 14, of_clk_hw_pmc_get() returns
ERR_PTR(-EINVAL), failing the OTPC probe on SAMA7G5.

[Severity: High]
Also in drivers/clk/at91/sama7g5.c:sama7g5_pmc_setup() (and similarly in
drivers/clk/at91/sama7d65.c:sama7d65_pmc_setup()), when registering the
main RC oscillator:

    main_rc_hw =3D at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 120=
00000,
                                               50000000);
    if (IS_ERR(main_rc_hw))
        goto err_free;
    sama7g5_pmc->chws[SAMA7G5_PMC_MAIN_RC] =3D hw;

Doesn't this store the uninitialized local pointer hw instead of main_rc_hw
into chws[SAMA7G5_PMC_MAIN_RC], returning a garbage clk_hw pointer when the
OTPC node requests <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MAIN_RC>?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105110715.2486=
432-1-ada@thorsis.com?part=3D13
