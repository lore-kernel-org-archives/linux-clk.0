Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC394AC165;
	Tue, 15 Sep 2026 15:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486931; cv=none; b=KUoRInfW1FZvEpHEPlT523LB/+DZ5B4rtTdoeodR3B+GIho/54yxXGmjKzEivGVVQIg7Jp4CZVe9VPyd5I9GkYRzCeYZI2RRNGn6MI1nzaaYj1szGbjozoKuBGJJ1tk2XOyvP3iGUbLpGNHQliSxws2/QLh4XIvtVqLfUKanmbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486931; c=relaxed/simple;
	bh=hSkBjCVrxwRuCyj5nUIt95EAdueBdJIhYEbVPz98b7k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kVg5sgsEnLxvj+DAIkoCtukQtdC2wIFpSwfsTgJrO83BbIbKU+5yex8Gdc2mQMXq46eulAF0pIIeQYp1URtp2kTPA2MIiF7vMJrEEkDA6P74DX2j421P+sONXq1a72LtxiakP2KjRdCUyMwABIuPN8bqtTR7G284ntafLIphA7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/W/2yYX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/W/2yYX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8731F000FF;
	Tue, 15 Sep 2026 15:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789486927;
	bh=sli09y6FKQrH8iUVUhgotdFV2otW/66lomos+RBaaBw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N/W/2yYXxWWyEiG0FKXO8V/W1n7VBMQ1m6Q3dkojBAtQB/qvpWS6t9AVC3CMhy/MT
	 +0ipihMJ36L3S21xpWzayl/L4LPaWzZyxfGd9pHxclxqLJ3qnm9SgxMQNR+oAzUcFO
	 6evWXgL2nM/zMg07PjQtrPy3CK3ckBIIDcbG7D2SqWpb6shg6HvTqnoxMGb+p05oRE
	 AfpsCHgJ2M7eloGDzqFctyRO8/RhsxokoA2D6UlJ6Q4TPjua4LQ92XpL2VpPl2v3wh
	 Q1Mnykcs607sgqfwBnMGWufwaLsHvEwCUEnMOFH9Nj/kO2iP/qTkzKW4zMvq5FZajM
	 xW3EeyBWhZOWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 03/20] dt-bindings: mfd: Add
 starfive,jh7110-hdmi-subsystem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, neil.armstrong@linaro.org, mfd@lists.linux.dev, robh@kernel.org, vkoul@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, olteanv@gmail.com
In-Reply-To: <20260915-jh7110-clean-send-v4-3-f0e4fd6f2cc8@samsung.com>
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
 <CGME20260915153218eucas1p278c4870936afe1aaa52438660418f8c8@eucas1p2.samsung.com>
 <20260915-jh7110-clean-send-v4-3-f0e4fd6f2cc8@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 15:42:06 +0000
Message-Id: <20260915154206.6E8731F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dt-bindings: mfd: bus fault during PHY probe due to artificial nod=
e split
--

commit 4723344ba643109500316c0b52d890ec9a27e43e
Author: Michal Wilczynski <m.wilczynski@samsung.com>

dt-bindings: mfd: Add starfive,jh7110-hdmi-subsystem
   =20
Add the dt-binding for the StarFive JH7110 HDMI subsystem.
   =20
The JH7110 HDMI IP is a monolithic block containing both the digital
controller and analog PHY in a single register space. This binding
defines the parent device, which holds the shared register map and
populates its two children: the PHY and the controller. This is
necessary to resolve a circular clock dependency between the HDMI block
and the VOUT clock generator.

> diff --git a/Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-s=
ubsystem.yaml b/Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-=
subsystem.yaml
> new file mode 100644
> index 0000000000000..18034d8273b86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-subsyste=
m.yaml
> @@ -0,0 +1,95 @@

[ ... ]

> +properties:
> +  compatible:
> +    const: starfive,jh7110-hdmi-subsystem
> +
> +  reg:
> +    maxItems: 1
> +
> +  phy:
> +    $ref: /schemas/phy/starfive,jh7110-inno-hdmi-phy.yaml#
> +
> +  controller:
> +    $ref: /schemas/display/bridge/starfive,jh7110-inno-hdmi-controller.y=
aml#

[Severity: High]
Does this artificial split of a monolithic block into child nodes create a
probe order issue?

Because the controller depends on the phy (via clocks =3D <&hdmi_phy> in the
example below), fw_devlink guarantees the phy driver probes first. During
its probe, the phy driver calls clk_set_rate(inno->phyclk, 297000000),
which accesses the shared register space via regmap.

However, since the HDMI system clock (JH7110_VOUTCLK_HDMI_TX_SYS) is
assigned exclusively to the controller child, it is not enabled during the
phy probe.

Will this unclocked access wedge the bus and cause a synchronous external
abort when the phy accesses the shared register window?

> +
> +required:
> +  - compatible
> +  - reg
> +  - phy
> +  - controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/starfive,jh7110-crg.h>
> +    #include <dt-bindings/reset/starfive,jh7110-crg.h>
> +
> +    soc {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +
> +        hdmi@29590000 {
> +            compatible =3D "starfive,jh7110-hdmi-subsystem";
> +            reg =3D <0x29590000 0x4000>;
> +
> +            controller {
> +                compatible =3D "starfive,jh7110-inno-hdmi-controller";
> +                clocks =3D <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
> +                         <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
> +                         <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
> +                         <&hdmi_phy>;

[ ... ]

> +            hdmi_phy: phy {
> +                compatible =3D "starfive,jh7110-inno-hdmi-phy";
> +                #clock-cells =3D <0>;
> +                clocks =3D <&xin24m>;
> +                #phy-cells =3D <0>;
> +            };
> +        };
> +    };
> +...

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-jh7110-cle=
an-send-v4-0-f0e4fd6f2cc8@samsung.com?part=3D3
