Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C433AC0D3;
	Wed, 12 Aug 2026 07:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786520963; cv=none; b=uExLDITZmV6gligHEnpeyKBTxusFjBzyNBZId9p+zpQmUc9ThAj8pYmJ+zpwZ/pBwbGhVtYD4JVP2+e/xMO4h5YrIlpQ1AhjLqE6moRrM8IgTowAYL03ILeMJ+ZVSJdx/ZYsOhgqU1bxAO4aHDOM6IT5Lxxj1Rx+q+P3bgnm8Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786520963; c=relaxed/simple;
	bh=9q0VoIgUKoLudBUE8XLEJXDNTzcxT/iFaWFhy18BuIQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=okziqFqyGko/V0zidxkGtPsuUjW6y9oLpgBotkVtwR1uJhIc5fDidd7+/euA16vmrFIDIogHhxiI8HkyvkcI8sZDjADOcQPzrrFsH0SpJxH25Fs6MsbiF6ot47W3n9OW1MW4cTIuZeSvnKsw4IKiKnjCkLzrvV9NkriubswhENM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mn5hV8gz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mn5hV8gz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF7F1F000E9;
	Wed, 12 Aug 2026 07:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786520961;
	bh=eERgT0saYRbYLHj8r9vtKghMDLk3R3tsNKFcsTSyVPM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mn5hV8gzTknuRXMyupaa4nzbc6d9Gw2jWpk9UeTtDQ23TJcEknW2kZNBpX7yGImpl
	 9jvy7/a9kx+pDPgKzhKr4w7fy1F6R0dpurLWIxpqNJaBbifaVWENvmC38nCguigtJr
	 6HXtkehKexVi/DKRkhnLnOTzhBU5oiwP/oIbkeCCrw6GjnUqcaPIEArcIcNhPAFXgV
	 H033CoAOp/NGujYWfd2oJ1QI5omiZbwiZ3IyMaML5hxedAwdwd3JjLj2B4LgOZkbSo
	 sWIg7Dx68DEAwkPdjl2ySjBtWxys3IqtEDmDyPKTZiG521lsnOtqjXFYSCXO2GY8BB
	 FO+V8LhyyEiHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/6] clk: socfpga: agilex5: add usb3.1 reference
 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ng Ho Yin" <adrian.ho.yin.ng@altera.com>
Cc: robh@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <fd7dfb0bfc9fdd0cc68385960d98ae24b2137416.1786518803.git.adrian.ho.yin.ng@altera.com>
References: <cover.1786518803.git.adrian.ho.yin.ng@altera.com>
 <fd7dfb0bfc9fdd0cc68385960d98ae24b2137416.1786518803.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 07:49:21 +0000
Message-Id: <20260812074921.8BF7F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Returning an error from probe after registering non-devm managed c=
locks leaves dangling pointers to devm-managed I/O memory in the global clo=
ck tree.
--

--- Patch [2]: [PATCH v3 2/6] clk: socfpga: agilex5: add usb3.1 reference c=
lock ---
commit 10f11218bd38bd2427f2a47b44a955f750a91676
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

clk: socfpga: agilex5: add usb3.1 reference clock

This commit adds a fixed-factor reference clock for the Agilex5 DWC3
controller so the driver can request each input by name.

> diff --git a/drivers/clk/socfpga/clk-agilex5.c b/drivers/clk/socfpga/clk-=
agilex5.c
> index f7f0ad884f645..af3009ddc6ab3 100644
> --- a/drivers/clk/socfpga/clk-agilex5.c
> +++ b/drivers/clk/socfpga/clk-agilex5.c
> @@ -526,6 +526,21 @@ static int agilex5_clkmgr_init(struct platform_devic=
e *pdev)
>  	agilex5_clk_register_gate(agilex5_gate_clks,
>  				  ARRAY_SIZE(agilex5_gate_clks), clk_data);
> =20
> +	/*
> +	 * usb31_ref_clk is a 1:1 alias of usb31_suspend_clk. The DWC3
> +	 * controller uses the same source for both its suspend and reference
> +	 * clock inputs on this SoC. Register it as a fixed-factor (passthrough)
> +	 * clock so that enabling it propagates to the parent gate without
> +	 * touching any gate register of its own.
> +	 */
> +	clk_data->clk_data.hws[AGILEX5_USB31_REF_CLK] =3D
> +		devm_clk_hw_register_fixed_factor(dev, "usb31_ref_clk",
> +						  "usb31_suspend_clk", 0, 1, 1);
> +	if (IS_ERR(clk_data->clk_data.hws[AGILEX5_USB31_REF_CLK]))
> +		return dev_err_probe(dev,
> +			PTR_ERR(clk_data->clk_data.hws[AGILEX5_USB31_REF_CLK]),
> +			"failed to register clock usb31_ref_clk\n");

[Severity: High]
If devm_clk_hw_register_fixed_factor() fails and we return an error here,
will this leave dangling pointers in the Common Clock Framework?

The previous clocks registered earlier in agilex5_clkmgr_init() (like PLLs
and gates) are registered globally without devm management. Since clk_data
and the IO memory base are devm-managed, returning an error from probe
causes them to be freed and unmapped.

Could this cause the system to crash due to unmapped memory access when the
clock framework later accesses these dangling clocks (for example, during
clk_disable_unused())?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786518803.gi=
t.adrian.ho.yin.ng@altera.com?part=3D2
