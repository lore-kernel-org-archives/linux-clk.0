Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768818;
	b=ca7I/ueyHKSH3WeMMKlk/wOopOjeQUKmAV8kMqvmRZllFKe3Fsi/0RO9oIAefdmUdEb5
	 rVgNpdRRYLWYOU8lcslNjLcICFMBaIzLQBHOXFc2tcoDVf92qU/rzTlizs8IOWLIjgV3Q
	 pTgUqsKnuWvFbGZHNmJ6adzy+sm+6YIUSHBWdZ7hMSnCmRM/TRVovVJ3t8LFu1gns3vMM
	 OBOYGMEM2akgnd3d1bDbbD/QX7Qt1IzAeNzRBDgiQF2SFTrmFBdGEdHi8chhuAUcUtVmP
	 49v/vdAJf9Sm6rplBPr2wPR7/9ld1gSyFXxMsdbKKnzekDURJ08QC5YCPUMQ2BdFZLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768818;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QYiVcolQP4YPmyD5TVZRLEjuRTUmNUpPSBwkFHeEFNw=;
	b=lMaZqYy8iTNumdX0rYefO24er8ykVRFK0svl/9QYSRe3cftWkotSOsg94Ep797IAJBCo
	 OIldLW+H9I0IB9CzSrsYJ7zJl57ASlXXJIDfRsCCkuO6jzvW6eytkQjpLfwUw+hGKOJoT
	 AYyWIwHWPCaZ1ih8hLUNuTt9mU01SUD6/6RX11cAGpxrgv9GZpOtic6HitP0Irp0aVmUA
	 BrpvV/ZPRm0h2mOwlcBxfXooTQddv5UG9QjlQ8KrmB1AHVsVhx172OeYV0BHky1iamjnw
	 lE3YZktIdQ34FQ9GQkk7YpkUqZ8RKiYk0ThSjUgm9M19/324iPc7HqQ3SipkZ6skXSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="FC/YNG3J";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513A6606A31A
	for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2026 15:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FC/YNG3J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9FAA1F031E1;
	Fri, 23 Oct 2026 15:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792768817;
	bh=QYiVcolQP4YPmyD5TVZRLEjuRTUmNUpPSBwkFHeEFNw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FC/YNG3JhfheorIszishyUak+IM0cvCTSzkndfnLbkwt+CLSyMe+UBCn57AJ+Pmec
	 ThePFzk/TTs1gwecfXhhN7UpoXJSDd/V8x6cAxIz+A4x4nTwxCOPVPfF+aZcRmJxVN
	 lO0vYd1OxyvvCbWqV4+nNrObfP/r6sH6y7/BIQg6fRixw1MR2ouEdf0KbosPrTZ7GL
	 CUp42BPTFwwV1aAa0gCIAmaqC/Eno2DIpqzARNy+j5CdwbYuQYntJbQ01WyWvREkml
	 XJP85k/NOqRD+si5nkfmRfh+bROh5eRgkyMCJ1/ZqTdJfDJ4Pp7RGYg/9W2U5TRd2b
	 hNjd5xRpX2Nig==
Message-ID: <sashiko-outbox-182901@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] clk: ti: dpll: apply the spread spectrum
 configuration right away
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dario Binacchi" <dario.binacchi@amarulasolutions.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261023145555.3578469-4-dario.binacchi@amarulasolutions.com>
References: <20261023145555.3578469-1-dario.binacchi@amarulasolutions.com>
 <20261023145555.3578469-4-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 15:20:17 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: ti: dpll: broken bypass check in omap3_noncore_dpll_set_sprea=
d_spectrum()
--

commit 64256b22bd32636a50ecb98dab75abb69bbaf964
Author: Dario Binacchi <dario.binacchi@amarulasolutions.com>

clk: ti: dpll: apply the spread spectrum configuration right away

This commit updates omap3_noncore_dpll_set_spread_spectrum() to reprogram
the DPLL at its current rate immediately when configuring spread spectrum
clocking, unless the DPLL is in bypass mode or the configuration is
unchanged.

> diff --git a/drivers/clk/ti/dpll3xxx.c b/drivers/clk/ti/dpll3xxx.c
> index 634fe0a1f9fda..c181bba2792db 100644
> --- a/drivers/clk/ti/dpll3xxx.c
> +++ b/drivers/clk/ti/dpll3xxx.c
> @@ -690,17 +690,26 @@ int omap3_noncore_dpll_set_rate(struct clk_hw *hw, =
unsigned long rate,

[ ... ]

> @@ -718,9 +727,37 @@ int omap3_noncore_dpll_set_spread_spectrum(struct cl=
k_hw *hw,
>  		return -EINVAL;
>  	}
> =20
> +	if (!memcmp(ss_conf, &dd->ssc_conf, sizeof(*ss_conf)))
> +		return 0;
> +
> +	old_conf =3D dd->ssc_conf;
>  	dd->ssc_conf =3D *ss_conf;
> =20
> -	return 0;
> +	/* In bypass: SSC is programmed along with the next rate change */
> +	if (clk_hw_get_parent(hw) !=3D dd->clk_ref)
> +		return 0;
> +
> +	/* Disabling SSC does not need to reprogram the DPLL */
> +	if (ss_conf->method =3D=3D CLK_SPREAD_NO) {
> +		omap3_noncore_dpll_ssc_program(clk);
> +		return 0;
> +	}
> +
> +	rate =3D clk_hw_get_rate(hw);
> +	clk_hw_init_rate_request(hw, &req, rate);
> +	ret =3D omap2_dpll_determine_rate(hw, &req);
> +	if (!ret && req.rate !=3D rate)
> +		ret =3D -EINVAL;
> +	if (!ret)
> +		ret =3D omap3_noncore_dpll_set_rate(hw, rate,
> +						  clk_hw_get_rate(dd->clk_ref));
> +	if (ret) {
> +		pr_warn("clock: %s: rate %lu can't be kept with SSC enabled\n",
> +			clk_hw_get_name(hw), rate);
> +		dd->ssc_conf =3D old_conf;
> +	}

[Severity: High]
Does comparing clk_hw_get_parent(hw) against dd->clk_ref in
omap3_noncore_dpll_set_spread_spectrum() in drivers/clk/ti/dpll3xxx.c
actually detect when an AM33xx or AM43xx DPLL is in bypass mode?

In drivers/clk/ti/dpll.c, dd->ssc_enable_mask is only set for
ti,am3-dpll-no-gate-clock and ti,am3-dpll-clock. In
arch/arm/boot/dts/ti/omap/am33xx-clocks.dtsi and
arch/arm/boot/dts/ti/omap/am43xx-clocks.dtsi, all DPLLs using these
compatibles (such as dpll_disp_ck and dpll_extdev_ck) specify the same clock
for both the reference clock (index 0) and the bypass clock (index 1):

arch/arm/boot/dts/ti/omap/am33xx-clocks.dtsi:
	dpll_disp_ck: clock@498 {
		#clock-cells =3D <0>;
		compatible =3D "ti,am3-dpll-no-gate-clock";
		clock-output-names =3D "dpll_disp_ck";
		clocks =3D <&sys_clkin_ck>, <&sys_clkin_ck>;
		reg =3D <0x0498>, <0x0448>, <0x0454>, <0x044c>, <0x0450>;
	};

When _register_dpll() in drivers/clk/ti/dpll.c initializes the DPLL:

	dd->clk_ref =3D __clk_get_hw(clk);

	clk =3D of_clk_get(node, 1);
	...
	dd->clk_bypass =3D __clk_get_hw(clk);

both dd->clk_ref and dd->clk_bypass point to the same struct clk_hw
(sys_clkin_ck). Even when omap2_init_dpll_parent() in
drivers/clk/ti/clkt_dpll.c returns parent index 1 because the hardware is in
bypass mode, clk_hw_get_parent(hw) still returns sys_clkin_ck, so
clk_hw_get_parent(hw) !=3D dd->clk_ref is always false.

When of_clk_set_defaults() runs on a bypassed DPLL with assigned-clock-sscs,
 the call chain is:

of_clk_set_defaults()
  __set_clk_spread_spectrum()
    clk_hw_set_spread_spectrum()
      omap3_noncore_dpll_set_spread_spectrum()

Because __set_clk_spread_spectrum() runs before __set_clk_rates(),
clk_hw_get_rate(hw) returns the bypass reference clock rate. Depending on
dd->min_divider, won't this either prematurely lock the bypassed DPLL at
ref_rate with M =3D N (where last_rounded_m < 20 triggers the out-of-range =
SSC
multiplier warning in omap3_noncore_dpll_ssc_program()), or fail in
omap2_dpll_determine_rate() and revert dd->ssc_conf to old_conf so that SSC
is lost when __set_clk_rates() runs next?

Should this check the hardware bypass state via dd->control_reg and
_omap2_dpll_is_in_bypass() (similar to omap2_init_dpll_parent() in
drivers/clk/ti/clkt_dpll.c) instead of comparing parent pointers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023145555.3578=
469-1-dario.binacchi@amarulasolutions.com?part=3D3
