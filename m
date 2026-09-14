Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEADC382F03
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 23:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789428694; cv=none; b=BF9OwQ2wG7A8+/TmCpRl0JVwlelx88m6N5SUnKLpbavWBnsCHQEpFOPpAqcG7UpGDDLr4WlBVa8uPwBKDwBUvnhbcM6VkqPhucIH3/h4dh98xGXb+hrvnEQx15MpHZDCyO00Nkr1zuD9D0u1FaJcvjqtL95SaELJN/z4crps/zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789428694; c=relaxed/simple;
	bh=tvyhpZ9PMeEWnxpKh46p4PWv6FWx++TuQkNuO/lnShM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kG7zbLXbSumKQYV2vKhN3jo5QY7YpRBMYM5Yjde5JhUhHesyKq3VqEtz5QwcaM2/QtLr7tXGUicipdcg8bmRyvDCsXKL9A8wzK5f6KldRq1dEJqY//6mAPeBiIsdSIxAnRdr9K6APLJ7PoArBNfRQ30KsDjxg051BSW0ZJDVqC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DARKpz73; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DARKpz73"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738E91F000FF;
	Mon, 14 Sep 2026 23:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789428691;
	bh=5VDu1NYe7KR26E7ySw3awqbUMNWPKVsi5eyw/TAN3M0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DARKpz73L6+gQTA5dxS5bREZlWtOsni1ezqhHUE1h3dskA3guTlXhazrBJkRamUjo
	 twzNsZIG3H6jUUa9na5bbvgvicbonL88bTJuR2Wz/WAQOXjnCQ9SB65mx96ksBYuyN
	 dopME1kINcEFQvHKrYC9/0LmNgULDPEhVfaL5hfASli5Fs2ZWMpMAdekPCawk9d68O
	 +W1W2q5UWP+9yn7y9vDHti4F+zX676nQsSTym70fVSiOOLuFKAOl8SQM2G05W5Px/P
	 V5Vw7Ffad04chcIMgXbRTjNPD0hWZlB7qHTLsfrcf3ng8xMa+ReXLfhbuTnPQOm0sg
	 N8Snhtw4/iLAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] clk: samsung: acpm: add Exynos850 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Klimov" <alexey.klimov@linaro.org>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260915-exynos850-acpm-clk-v2-2-ffad4a6b3fb1@linaro.org>
References: <20260915-exynos850-acpm-clk-v2-0-ffad4a6b3fb1@linaro.org>
 <20260915-exynos850-acpm-clk-v2-2-ffad4a6b3fb1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 23:31:30 +0000
Message-Id: <20260914233131.738E91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: samsung: acpm: broken rate tracking and missing CLK_SET_RATE_=
PARENT
- [High] clk: samsung: acpm: missing of_node causes orphaned clocks and mis=
sing DT provider
--

commit c667cadd8b070f358391c7469c777edfe81f6617
Author: Alexey Klimov <alexey.klimov@linaro.org>

clk: samsung: acpm: add Exynos850 support

This commit adds Exynos850 support to the Samsung ACPM clock driver. It
introduces a SoC-specific get_rate() callback because the Exynos850 ACPM
firmware doesn't implement a dynamic rate read call. When get_rate() is
set, it populates pdata.fw_name to link the parent clock.

> diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acp=
m.c
> index 4b68b44fe6158..9f46fbdd999d4 100644
> --- a/drivers/clk/samsung/clk-acpm.c
> +++ b/drivers/clk/samsung/clk-acpm.c
[ ... ]
> @@ -58,6 +73,19 @@ static const struct acpm_clk_variant gs101_acpm_clks[]=
 =3D {
>  	ACPM_CLK("bo"),
>  };
> =20
> +static unsigned long bypass_acpm_exynos850_get_rate(struct clk_hw *hw,
> +						    unsigned long parent_rate)
> +{
> +	return parent_rate;
> +}

[Severity: High]
If acpm_clk_set_rate() alters the hardware frequency via IPC, doesn't blind=
ly
returning the parent rate here break the clock framework's rate tracking?

Since the clock lacks the CLK_SET_RATE_PARENT flag, the parent's cached rate
isn't updated when the rate is set. It seems clk_get_rate() will return the
stale parent rate even after a successful clk_set_rate().

> +
> +static const struct acpm_clk_driver_data acpm_clk_exynos850 =3D {
[ ... ]
> @@ -89,14 +120,23 @@ static const struct clk_ops acpm_clk_ops =3D {
>  };
> =20
>  static int acpm_clk_register(struct device *dev, struct acpm_clk *aclk,
> -			     const char *name)
> +			     const char *name, const struct acpm_clk_driver_data *drv_data)
>  {
>  	struct clk_init_data init =3D {};
> +	struct clk_parent_data pdata =3D {};
> =20
>  	init.name =3D name;
>  	init.ops =3D &acpm_clk_ops;
>  	aclk->hw.init =3D &init;
> =20
> +	/* If get_rate is set, the SoC relies on parent topology */
> +	if (drv_data->get_rate) {
> +		pdata.fw_name =3D name;
> +		init.parent_data =3D &pdata;
> +		init.num_parents =3D 1;
> +		init.flags =3D CLK_GET_RATE_NOCACHE;
> +	}

[Severity: High]
Since the acpm-clocks platform device is manually created by the parent dri=
ver
and lacks an of_node, will setting pdata.fw_name fail to resolve the parent?

When core->of_node inherits NULL from dev->of_node, it appears clk_core_get=
()
skips the of_parse_clkspec() lookup and falls back to legacy clkdev, which
fails. Could this result in permanently orphaned clocks where the parent ra=
te
evaluates to 0?

Also, is CLK_SET_RATE_PARENT needed here to propagate rate changes upstream?

> +
>  	return devm_clk_hw_register(dev, &aclk->hw);
>  }
[ ... ]
> @@ -145,13 +185,14 @@ static int acpm_clk_probe(struct platform_device *p=
dev)
[ ... ]
> -		err =3D acpm_clk_register(dev, aclk, drv_data->clks[i].name);
> +		err =3D acpm_clk_register(dev, aclk, drv_data->clks[i].name, drv_data);
>  		if (err)
>  			return dev_err_probe(dev, err,
>  					     "Failed to register clock\n");
>  	}
> =20
>  	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>  					   clk_data);
>  }

[Severity: High]
Does this fail to expose the clock provider to Device Tree consumers?

If dev->of_node is NULL, devm_of_clk_add_hw_provider() will silently return=
 0
without actually registering the hardware provider.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-exynos850-=
acpm-clk-v2-0-ffad4a6b3fb1@linaro.org?part=3D2
