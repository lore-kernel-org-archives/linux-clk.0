Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90912F7EFC
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 06:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789107605; cv=none; b=DuXttUi5UFGBRf2Nj/dHxItkehI5oPUkit6GLH1iM1FORMJoMQ3Anakiyxfvs9N1QL0bZkhkVybZfkwQCxn2TBov4pgXVJMx5wfL2u+jR4uO0EYLZsZbNyypzZEpbsBeSGU4BSS49Erc5orZuNoxFkSvyIj7sMLbxd0t1tV6usY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789107605; c=relaxed/simple;
	bh=cIidhWA+ZHczxEwai25bvgAJ9x1noCR6adY4XmsOVek=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XzpVsLuLde7ECKs+wtvkTfKWp0ke+vqL/WzQnMA+7/12K05Ad0Zzv+a1auPtgb8L8S5BkxoIb1wPPfNz/ojP3Efe6z9zWHFKL0tniylz8PUz4l+MwVRDBqJnSgpMsG/Wy/ti8K5v6mXX+WOctHNhrENIpP5q0vI/EO3nNWIhMSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iAlZrgdq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iAlZrgdq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A89D1F000FF;
	Fri, 11 Sep 2026 06:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789107604;
	bh=pHGUd7e9J12cRSVKcRbkleWYSBJreGiQM4XJqki2Rdk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iAlZrgdqtVgN0Jrzp9pJTPuHC7CvzpKmzAep9//goLo8MnQakdxLS+l5RVEF0LGhR
	 Jx2jDz+l8OBtluGEXL3NL5sIF354As0O4lRuK8r3Es5BcL1BT7nz/wmN+/IEwQngiG
	 ZurOQQ6HyFpADv3BnKBwax/CO2AnddpCHLjTA1TffrjzZK6ip1/qGcJuHS0ZTBcGBk
	 6Ye07vxwPgv2XwI1+hRjQXg/LMmB083ABw0U2MZENLG9h5clAgjtKZ2MtomTS6lR5N
	 SsqB+v3S/DyGzwVTOIPxHux/GIl+/hJGxafTldBtBIfeogGuI4Vn/lMiRXakVXbZ5v
	 24f4oxbvXRbGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC] clk: keystone: sci-clk: check the growing discovery
 array
Reply-To: sashiko-reviews@lists.linux.dev
To: "Slavin Liu" <bolin.liu@seu.edu.cn>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260911060906.94179-1-bolin.liu@seu.edu.cn>
References: <20260911060906.94179-1-bolin.liu@seu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 06:20:03 +0000
Message-Id: <20260911062004.3A89D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing of_node_put() leaks parsed device node references in args.=
np across normal iterations and error paths.
- [High] Calling memcpy() with a NULL pointer is undefined behavior when ma=
x_clks or num_clks is 0.
- [High] Firmware-provided num_parents exceeding 255 causes silent u8 integ=
er truncation during clock registration.
--

commit 6d9b6324e89980ef5061c0575c46655eac6f8228
Author: Slavin Liu <bolin.liu@seu.edu.cn>

clk: keystone: sci-clk: check the growing discovery array

Check each newly allocated discovery array before copying existing
entries or publishing its first element. Devres releases prior storage
when the probe fails.

> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-cl=
k.c
> index 9d2094bd48e3b..dad2fb67c4052 100644
> --- a/drivers/clk/keystone/sci-clk.c
> +++ b/drivers/clk/keystone/sci-clk.c
> @@ -496,6 +496,8 @@ static int ti_sci_scan_clocks_from_fw(struct sci_clk_=
provider *provider)
>  			tmp_clks =3D devm_kmalloc_array(dev, max_clks + 64,
>  						      sizeof(sci_clk),
>  						      GFP_KERNEL);
> +			if (!tmp_clks)
> +				return -ENOMEM;
>  			memcpy(tmp_clks, clks, max_clks * sizeof(sci_clk));

[Severity: High]
This isn't a bug introduced by this patch, but when max_clks is 0 on the
first iteration, clks is NULL. Does this evaluate to memcpy(tmp_clks, NULL,=
 0)
and trigger undefined behavior?

Additionally, later in this function, if the firmware returned no clocks,
num_clks is 0 and clks is NULL. Does calling devm_kmemdup_array() ultimately
result in memcpy(ZERO_SIZE_PTR, NULL, 0) which is also undefined behavior?

>  			if (max_clks)
>  				devm_kfree(dev, clks);

Further down in the same ti_sci_scan_clocks_from_fw() function:

	sci_clk =3D devm_kzalloc(dev, sizeof(*sci_clk), GFP_KERNEL);
	if (!sci_clk)
		return -ENOMEM;
	sci_clk->dev_id =3D dev_id;
	sci_clk->clk_id =3D clk_id;
	sci_clk->provider =3D provider;
	sci_clk->num_parents =3D num_parents;

[Severity: High]
This is a pre-existing issue, but the num_parents fetched from firmware is a
32-bit value. Unlike the DT parsing path which explicitly limits it to 255,
there is no bounds checking here.=20

When _sci_clk_build() later assigns this to init.num_parents (which is a u8
in struct clk_init_data), does a value >=3D 256 get silently truncated,
resulting in defective clock registration?


Also, looking at the related DT parsing path in ti_sci_scan_clocks_from_dt(=
):

	do {
		ret =3D of_parse_phandle_with_args(np, *clk_name,
						 "#clock-cells", index,
						 &args);
		if (ret)
			break;

		if (args.args_count =3D=3D 2 && args.np =3D=3D dev->of_node) {
			sci_clk =3D devm_kzalloc(dev, sizeof(*sci_clk),
					       GFP_KERNEL);
			if (!sci_clk)
				return -ENOMEM;

[Severity: High]
This is a pre-existing issue, but does this error path abort immediately
and leak both the previously acquired np and the newly acquired args.np?

[ ... ]
		index++;
	} while (args.np);

[Severity: High]
This is also a pre-existing issue, but does this loop finish using args.np
without ever calling of_node_put()? The reference appears to be overwritten
on the next iteration or lost when the loop terminates.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911060906.9417=
9-1-bolin.liu@seu.edu.cn?part=3D1
