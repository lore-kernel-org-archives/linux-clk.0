Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795493649;
	b=jpKDmPIap0d8h3D9U5V82p+4mIV5rw0hwAf/8QGjsyI/B2VFLUvdqytK7Lx/0ijFZMrP
	 gLKcaIinTdPGiuxBk/RLt/sBEdz5fCAAjsl+cbZ/YY4z+18SpqQfPyIAnl1osz3+7NtGY
	 V2yuq8lM71EYrOakYpDEYwa2ATDz6TPOctY3/xZH8RWZ0Tp1UMbDdceUBX/dasBID9M6u
	 iclm6j5pJEhSqYoAO6F6kRKOW6wkFE+7aCJrrm5VycKjzjRqj0vQSJxsydHv7yEqMAavF
	 276yZ7GeUGdRjdBTv0drgor9uaiC+8uW3YIBrkzrwUW2/wQdh7nlSKovCS62CKs1EdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795493649;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ykSEtQSB5XW/4i9oYMaQwnqPOvaXXUXlGKEdyLBEXck=;
	b=vLogv3DR3+hrN2Clt6GG4vsearbY6UaULzC1BYd7vXkCrjYbeOzV3HReeBccISKstfVr
	 cIMqvtLUuHth2B1wBWe7SkL6UDoR/8Lkp7RHBmOB+At/PHRb1q3oqdqXIOISthkumA6I3
	 pZhZdc3SXQzTA8h9kEIIt/R7u/ZAXIDD4t+lSSb47xasA+mxUmNXdJ93eDR4Cc05uscD6
	 Bj4p00wab19IVU1DB1c21xNo5XszdncYBssoo4zxPuhLyMFE2CzTsNMf9VbyzgJtjoTjj
	 uZ/L8qd0KINx2AYil1ROSZQzJjwkReE50WFaMli2g/PtgPMgUVLN20J8LGF7mjP1b3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H9RoKgKF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB51606A31E;
	Tue, 24 Nov 2026 04:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H9RoKgKF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD201F000CA;
	Tue, 24 Nov 2026 04:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795493649;
	bh=ykSEtQSB5XW/4i9oYMaQwnqPOvaXXUXlGKEdyLBEXck=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H9RoKgKFSrj4tG4oT39k+iUf++A9VpiVCc1oiU+3X+MS9ezwqGsr2FD82fQUsPfnz
	 V3z8m5v3M6BZkOw0yoOMAoUMgApQQv2P+udD+uQFY01Bek0C4PnkRA0JeldaZWAVYw
	 3AHBBsVBYjH61XoQqBjJHa9VAFWJcmA2ulasa/88N99rTVPFSvIPDLn/9S3+ye73gD
	 771IQTWeYsO4ncIv02W5a844vWOFTb0U5UtcywFdEd9A+LY9/eZc5MFyrTKrFme2fd
	 V3smTFV6eg1S0oztQ1ErRNUFWG6pHG2L7kXnsgVcqtMY2cFw07SoX3qUOmZGOKnkGS
	 iFlnEZ2KpW9dw==
Message-ID: <sashiko-outbox-230499@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/8] clk: clocking-wizard: Add static-config clock
 provider support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubhrajyoti Datta" <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124035613.1968260-5-shubhrajyoti.datta@amd.com>
References: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
 <20261124035613.1968260-5-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 04:14:08 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] clk: clocking-wizard: unchecked NULL parent in duplicated
  fixed-factor ops
--

commit a94e28a314af06a6c676828212ead79533144464
Author: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

clk: clocking-wizard: Add static-config clock provider support

This commit adds support for the xlnx,static-config property by skipping
AXI register mapping and registering each output clock as a fixed-factor
child of clk_in1 with a 10 us enable delay.

> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xil=
inx/clk-xlnx-clock-wizard.c
> index 649cf2d219437..31fed0e1ed308 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
[ ... ]
> @@ -926,6 +935,85 @@ static const struct clk_ops clk_wzrd_clk_divider_ops=
_f =3D {
>  	.recalc_rate =3D clk_wzrd_recalc_ratef,
>  };
> =20
> +static unsigned long
> +clk_wzrd_static_factor_recalc_rate(struct clk_hw *hw, unsigned long pare=
nt_rate)
> +{
> +	struct clk_fixed_factor *fix =3D to_clk_fixed_factor(hw);
> +	unsigned long long rate;
> +
> +	rate =3D (unsigned long long)parent_rate * fix->mult;
> +	do_div(rate, fix->div);
> +	return (unsigned long)rate;
> +}
> +
> +static int clk_wzrd_static_factor_determine_rate(struct clk_hw *hw,
> +						 struct clk_rate_request *req)
> +{
> +	struct clk_fixed_factor *fix =3D to_clk_fixed_factor(hw);
> +
> +	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
> +		unsigned long best_parent;
> +
> +		best_parent =3D (req->rate / fix->mult) * fix->div;
> +		req->best_parent_rate =3D
> +			clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
> +	}
> +
> +	req->rate =3D (req->best_parent_rate / fix->div) * fix->mult;
> +
> +	return 0;
> +}
> +
> +static int clk_wzrd_static_factor_set_rate(struct clk_hw *hw,
> +					   unsigned long rate,
> +					   unsigned long parent_rate)
> +{
> +	return 0;
> +}
> +
> +static const struct clk_ops clk_wzrd_static_fixed_factor_ops =3D {
> +	.enable =3D clk_wzrd_enable,
> +	.determine_rate =3D clk_wzrd_static_factor_determine_rate,
> +	.set_rate =3D clk_wzrd_static_factor_set_rate,
> +	.recalc_rate =3D clk_wzrd_static_factor_recalc_rate,
> +};

[Severity: Medium]
Can clk_wzrd_static_factor_determine_rate() pass a NULL parent to
clk_hw_round_rate()?

Every static-config output clock is registered with CLK_SET_RATE_PARENT.
If the upstream clk_in1 provider unregisters its clock (for example during
FPGA reconfiguration or overlay removal), the output clock is orphaned and
clk_hw_get_parent(hw) returns NULL, causing clk_hw_round_rate() to
dereference hw->core on a NULL pointer when rate determination runs.

In addition, clk_wzrd_static_factor_recalc_rate(),
clk_wzrd_static_factor_determine_rate(), and
clk_wzrd_static_factor_set_rate() duplicate the exported
clk_fixed_factor_ops callbacks in drivers/clk/clk-fixed-factor.c (where
clk_factor_determine_rate() checks parent_hw for NULL).  Could
clk_wzrd_static_fixed_factor_ops reuse clk_fixed_factor_ops for
.determine_rate, .recalc_rate, and .set_rate?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124035613.1968=
260-1-shubhrajyoti.datta@amd.com?part=3D4
