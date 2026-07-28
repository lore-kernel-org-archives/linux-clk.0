Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BD239AD5E
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 17:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785258152; cv=none; b=SOBWAb8gyWB4g/+6+bL9q1ExG4MQx/SPDfHGjMBXE9H7XaYCmihwRL3Kidpy7qjoPnYNiw+dbi0iJgr2CbTVhk1tGy7s/t7RZmkyCDQ8Yk3jV3IFTAIVMIJsqU4YB2kS0eH0XCLd9h8Zr6MXIVphV+GRwmxD+Xb7NoG6CzEoSmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785258152; c=relaxed/simple;
	bh=bxFyUwwzs7IjS6nJSP45CpJDbZptu7ycVzrkumfnro4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BdrifaKh6P8rW0RtZr70+F1V8dbyV2JiXSI2oNm531pOjrj/3jGKKNdVCZGJJYeHc5rMc1QgF75dguVt9+E24lZ0pHv4e04hnhmf4eWtZ15+Mc3bvNFyFjyXILsp9S0f3JvbyWWXQelgGjK1hrvya4m50zVfU63gGO+NPSR7xjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b82WnSCr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b82WnSCr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB271F00ACF
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 17:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785258150;
	bh=9oe9UV20xRbrU+lzvVnG9jZANXjcjtMpLhecIgsxtCo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=b82WnSCrWCjiiRXWQJ4BHNCDM9WM11Q5bzIpvuitixDRsOOf1B7FPKsDBcU0VdAd5
	 TNiFDU/KSlDAXVW6gvISaXu3kH0Vx5NECZHXyxUxarrtY6UNnIQI6Q4sgEsq3JSywu
	 ZsD+Ll1k5N52fgTMdiPOZIKAZzdI//FDAYmNvZWByV9jEUWq7GlPkW7gK3MucckXme
	 3VY4SI8yceU6m9fkMhogBCeEz91BxJZAy7g7SCzBjw7WxbAzxqrsClkUEjrBq/f/DV
	 T1/tIwLr3SfGEEooRAODTmQnVy6kLkBnxXW8PnMNsUxXHnDUNa59TWAIWoM40VW1H5
	 mhH4NRgl56wKw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39c83acb86eso35989721fa.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 10:02:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrJh2pKRLSakIRmAGUtsSctHSdPx55iZm52Y3wVFRBkBt8OQXWka21jnUgN57XIAVcCya0Bl5g+zhE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuJ4i34SCrJRyyXo+5uJJ+1fTp0dfheCc9hq4FQGnThZZfk9s8
	3UZZ0ys0/lS5xQaU2Bjtxo+WZ/WTqYqgb/zgBfCHAjUynLpE79UxmcV/dL3Ooq8Zy+F/aLh4BRz
	6qiFzg5qIwuFrLcQj146MYC68TJT1NbI=
X-Received: by 2002:a05:651c:b09:b0:39e:e995:1685 with SMTP id
 38308e7fff4ca-39f51e523a5mr6555341fa.38.1785258149154; Tue, 28 Jul 2026
 10:02:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com> <20260719211319.982285-5-juanmanuellopezcarrillo@gmail.com>
In-Reply-To: <20260719211319.982285-5-juanmanuellopezcarrillo@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 29 Jul 2026 01:02:16 +0800
X-Gmail-Original-Message-ID: <CAGb2v65gfLhY3qipJrcuE51CJ2WV=oNSbFDu7QP-6VFKF3v_WA@mail.gmail.com>
X-Gm-Features: AUfX_mxwEoOQfPBDHt1Bhhdm8fNwHOj6ohky5Q9xhsCCChtpmB1_uNVjxEEhUG4
Message-ID: <CAGb2v65gfLhY3qipJrcuE51CJ2WV=oNSbFDu7QP-6VFKF3v_WA@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] arm64: dts: allwinner: t527-orangepi-4a: add GPU
 OPP table
To: =?UTF-8?Q?Juan_Manuel_L=C3=B3pez_Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Brian Masney <bmasney@redhat.com>, Andre Przywara <andre.przywara@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 5:13=E2=80=AFAM Juan Manuel L=C3=B3pez Carrillo
<juanmanuellopezcarrillo@gmail.com> wrote:
>
> Add the Mali-G57 operating points from the vendor BSP universal table
> (150/200/300/400/600 MHz) so panfrost devfreq can scale the GPU
> instead of running at the boot clock.
>
> All operating points use 920 mV: the BSP table specifies 900 mV for
> every universal OPP, but on this board the GPU rail (AXP717 DCDC2,
> vdd-gpu-sys) is a fixed 920 mV supply, so the OPP voltage states the
> actual rail value and voltage transitions are no-ops.  The higher
> speed-bin points of the BSP (648-792 MHz) are not included: they are
> gated by a SID efuse bin and need pll-gpu as a live parent.
>
> Depends on the sun55i-a523 GPU clock divider fix (the OPP rates are
> only produced correctly with the cycle-masking divider model);
> validated on hardware with the Mali cycle counter: 149/199/300/399/597
> MHz measured under load, thermal-emulation throttling included.
>
> Signed-off-by: Juan Manuel L=C3=B3pez Carrillo <juanmanuellopezcarrillo@g=
mail.com>
> ---
>  .../dts/allwinner/sun55i-t527-orangepi-4a.dts | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/=
arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> index 055be86e5..0fd73a1bb 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> @@ -30,6 +30,35 @@ ext_osc32k: ext-osc32k-clk {
>                 clock-output-names =3D "ext_osc32k";
>         };
>
> +       gpu_opp_table: opp-table-gpu {

The table should be in the .dtsi file. The OPP table reflects the
requirements of the SoC, not the board. Any board specific adjustments
are done later.

> +               compatible =3D "operating-points-v2";
> +
> +               opp-150000000 {
> +                       opp-hz =3D /bits/ 64 <150000000>;
> +                       opp-microvolt =3D <920000>;

Please use the <min nominal max> variant to specify a voltage range.
The minimum and nominal voltages should be the one from the BSP table.
You can set the maximum arbitrarily, but 920 mV should be fine to cover
this board.

> +               };
> +
> +               opp-200000000 {
> +                       opp-hz =3D /bits/ 64 <200000000>;
> +                       opp-microvolt =3D <920000>;
> +               };
> +
> +               opp-300000000 {
> +                       opp-hz =3D /bits/ 64 <300000000>;
> +                       opp-microvolt =3D <920000>;
> +               };
> +
> +               opp-400000000 {
> +                       opp-hz =3D /bits/ 64 <400000000>;
> +                       opp-microvolt =3D <920000>;
> +               };
> +
> +               opp-600000000 {
> +                       opp-hz =3D /bits/ 64 <600000000>;
> +                       opp-microvolt =3D <920000>;
> +               };
> +       };
> +
>         leds {
>                 compatible =3D "gpio-leds";
>
> @@ -116,6 +145,7 @@ &gmac1 {
>
>  &gpu {
>         mali-supply =3D <&reg_dcdc2>;
> +       operating-points-v2 =3D <&gpu_opp_table>;

Same here. This should be in the .dtsi file. It should be fine to add it
right now since all boards have the supply added.


ChenYu

>         status =3D "okay";
>  };
>
> --
> 2.47.3
>
