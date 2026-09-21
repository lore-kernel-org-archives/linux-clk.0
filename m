Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6A8439F86;
	Mon, 21 Sep 2026 20:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790023616; cv=none; b=Jx+NptfZY7XVLbJUEOQ8CoMp4gk2cickpxFOZR8+UBzDHWykurWQex664QYOvT8ZGwshEHu+jtvlMQB4F/LSbHK4ZCdQRLXgIxUP2uc/0oaTcIBZA50fpiq8sglsxdNRbcQeAt1KUBMVQSnfCSZ8IHBh0XS/ON+rD/ETdIDzGp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790023616; c=relaxed/simple;
	bh=H4MfewAoSTN9fruEsqWWa/wVSyptvYNWfMLQz4HZJCI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fYJV2pexsKbjER6nno9CNxHS88+L9QFA/bEtz7GWE5kCejwXU9TMByqi2sNGHcyNLP5EsAWDpn6qTeEgj57YBO110ro2WTwXqoteRR/laYCeRQW5+TGQ9/exopL+0aX0ekTkNpULKEHyhQzu3WciV1akcUrsqYx1y9Ha/e2OQ+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3ncsebO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3ncsebO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A0AB1F000FF;
	Mon, 21 Sep 2026 20:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790023614;
	bh=xujwL3Aa5RYk1c9NIOeuMZKJY6bZroZ5mtkSz6R3UE0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K3ncsebOde930EN3zCmsv4IvskbKF7fwmSs3VO3KGyOGXoMG/U3xz+y7zkms3tBaP
	 Ymi0UelampRvlcWWsYRqVSp620ZWUawPlM32xHoDFakLUkGFUh5wrR4fDv9TPfARfe
	 tTg2GYkYrST6IrTS+hg1k59Od9ZYXZTTjV2WmdxRNQxC8hznMnd5LcotXJUWngxkla
	 jtHcNSBC7jzS6Xmzi3tKgn9FPWohf7y8OtEK8SMzAJ2CyLqyzf5YHPzzExuZWcvZZO
	 ZSXxdeVI1q7VqsFhSZlJ4HsIuvRkIAXc0lWHomrf9YSJd5AaIdsoWfizCKBPHCDCS0
	 j45Cz1TGXEGww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/8] PM / devfreq: rockchip-dfi: make RK3588 use its
 clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260921-rockchip-dfi-cleanup-v2-7-43ff34ac8599@collabora.com>
References: <20260921-rockchip-dfi-cleanup-v2-0-43ff34ac8599@collabora.com>
 <20260921-rockchip-dfi-cleanup-v2-7-43ff34ac8599@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 20:46:54 +0000
Message-Id: <20260921204654.8A0AB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] kerneldoc: mismatch for num_clks in struct rockchip_dfi_variant
--

commit 27e02ec68846e2b57e63f7073dbf4cd24e5115ea
Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

PM / devfreq: rockchip-dfi: make RK3588 use its clocks

This commit updates the RK3588 devfreq driver to utilize its recently model=
led
DDRMON clocks. It adds a clocks_optional field to the dfi variant structure
so older device trees remain compatible without introducing a breaking chan=
ge.

> diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event=
/rockchip-dfi.c
> index b61ec500eaed9..380361a231a20 100644
> --- a/drivers/devfreq/event/rockchip-dfi.c
> +++ b/drivers/devfreq/event/rockchip-dfi.c
> @@ -117,6 +117,18 @@ struct rockchip_dfi {
>  	const struct rockchip_dfi_variant *variant;
>  };
> =20
> +/**
> + * struct rockchip_dfi_variant
> + * @init: pointer to the variant-specific initialisation function
> + * @stride: address offset between the DDRMON per-channel instances
> + * @ctrl_single: whether only one DDRMON instance monitors multiple chan=
nels
> + * @max_channels: maximum number of memory channels for this SoC
> + * @clk_names: pointer to a constant array of constant clock name strings
> + * @num_clk: the number of elements in the @clk_names array

[Severity: Low]
This isn't a bug, but does this kerneldoc parameter mismatch the struct
definition? The struct member is defined as num_clks, while this block
documents num_clk, which will trigger a kernel-doc script warning.

> + * @clocks_optional: whether not finding the clocks is non-fatal. Set if=
 the
> + *                   DT binding for this variant didn't require clocks i=
n the
> + *                   past, so that the driver remains compatible with ol=
d DTs.
> + */
>  struct rockchip_dfi_variant {
>  	int (*init)(struct rockchip_dfi *dfi);
>  	int stride;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-rockchip-d=
fi-cleanup-v2-0-43ff34ac8599@collabora.com?part=3D7
