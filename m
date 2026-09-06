Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E539B363C48
	for <linux-clk@vger.kernel.org>; Sun,  6 Sep 2026 03:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666320; cv=none; b=LH+WQYQ4WMRLSryqJUuI7Mhq7e+0TBU8wJ/1MrIG6TPHhDRC00S/EMky9WVWW861cmHEYs4t3td7N7RFMNKdAtEYa6c/8TMleMnf/akl4Bt115Mrsn3Rsu/9UstOHmj68elsNT4tq4NW838TadI4zmhDi217n5t46IKPpiFZK28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666320; c=relaxed/simple;
	bh=/3pMbXfhkpx7XK5gjuiSTzOPkK+4V2e7x5ODko9vB5c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EB7X0p8LOMgHus/Au9f5hzCYejPseC+Ohn0D5h+PSuRjpc15PaE/pdsBhGAKr9ygQHW1zfuU5spcINFruumdoPZDcfQya0TP4EwHs+7Xgj/xo7JGQHPri6+p3kzaaittjfYuauE4W9J8oT9RHHs09Fl1mJVcX0NPtTeV/eOmOLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TC7X+AaP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TC7X+AaP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB351F00A3A;
	Sun,  6 Sep 2026 03:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788666318;
	bh=detQELwSsjQEEfm7gen4lIkXRu87rv6iNGv6E3x3zXs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TC7X+AaPUepN1KHzmNFtsKmHY2rCvhGk1cdkRHtnQWCTjNO3uz+vT512U5vkPZQbx
	 L6RjobnNEcytLdhJiX2J7OCGsauap5UK/4Pf3BCXt1R8bvOI5KwlVDDytWhNlggvLZ
	 gRm3kfEXltls8B8EvMb+wLlsvZ9Muhw0R75PE1H6JrQMZ+b2SgLoWIZqLKlaa5x30q
	 x4Q4HZR1jZCFcwrB5SZun6m/P1jCHhGijHuc08Ws2HPIHBFW2c2dQpys1UyPg4LCeg
	 TkrU+dhWxOO7XBecUOMmXsExuj1h7I/vKCY3bxfX2w2OIzefbFD+MewejNQIKEeNK+
	 GnTYggp0JsBLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: s2mps11: Propagate OF provider registration
 failures
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <hppiscas@163.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260906033651.84082-1-hppiscas@163.com>
References: <20260906033651.84082-1-hppiscas@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 03:45:17 +0000
Message-Id: <20260906034518.5FB351F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] of_clk_add_hw_provider() unconditionally marks fwnode as initializ=
ed on failure.
--

commit 70cc7ee16e2987b440f1878c683c89d530c69a34
Author: Pengpeng Hou <hppiscas@163.com>

clk: s2mps11: Propagate OF provider registration failures

This commit updates s2mps11_clk_probe() to correctly check the return value
of of_clk_add_hw_provider() and propagate registration failures. It also
adjusts the cleanup path to handle omitted clocks.

> diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
> index fa5ac8f673f6e..94969d97d6e99 100644
> --- a/drivers/clk/clk-s2mps11.c
> +++ b/drivers/clk/clk-s2mps11.c
[ ... ]
> @@ -192,8 +192,10 @@ static int s2mps11_clk_probe(struct platform_device =
*pdev)
>  		clk_data->hws[i] =3D &s2mps11_clks[i].hw;
>  	}
> =20
> -	of_clk_add_hw_provider(s2mps11_clks->clk_np, of_clk_hw_onecell_get,
> -			       clk_data);
> +	ret =3D of_clk_add_hw_provider(s2mps11_clks->clk_np,
> +				     of_clk_hw_onecell_get, clk_data);
> +	if (ret)
> +		goto err_reg;

[Severity: High]
This is a pre-existing issue, but by properly propagating the error from
of_clk_add_hw_provider(), could this cause dependent consumers to fail their
probe instead of deferring?

Looking at of_clk_add_hw_provider() in drivers/clk/clk.c, if it fails, it
unconditionally marks the fwnode as initialized before returning the error:

drivers/clk/clk.c:of_clk_add_hw_provider() {
    ...
	ret =3D of_clk_set_defaults(np, true);
	if (ret < 0)
		of_clk_del_provider(np);

	fwnode_dev_initialized(&np->fwnode, true);

	return ret;
}

If of_clk_set_defaults() fails (e.g., returning -EPROBE_DEFER),
of_clk_del_provider() unregisters the provider and correctly marks the fwno=
de
uninitialized, but it is then unconditionally forced to true.

Since fw_devlink relies on this initialized state, does this trick consumers
into thinking the supplier is ready, thereby breaking the EPROBE_DEFER
mechanism for dependent devices when this failure path is taken?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906033651.8408=
2-1-hppiscas@163.com?part=3D1
