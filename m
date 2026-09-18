Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6784F93D8;
	Fri, 18 Sep 2026 17:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752217; cv=none; b=BJ7ey2ovAE46bCZZMmgx+wzuTVahucFWzpNdbSBbePopxDq4ghRMjkwyi8puYo/O44Q0CXUoYXxDjAALEiKF31ebiAHpZ8Zv9OvghIAYQsfIsn8eiQ3+Q0+Oj13keTs9PTjefEES06KPCPFmPZLKtYbKr0rbC4wxIM9GNfmaW7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752217; c=relaxed/simple;
	bh=4HVxzaIfsH50Tjqhhk4MQQPCUdZvbbsnSooyTXY7uCo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bTh7UFez07w3ZU4LsqUMnbqHPwL0XMzxBMMsZ32GcwZPzA+I7S9AQv3vCYdOUjE+knjjFnzLZLon49I6ZNZTdokBlcbSyJ+SQPa50Gkanux6q9zmhrHVwOCKj3IqfHA7AH3ZLHI37MTVwgpNM+Wnf2mDVVLH+aO16pFHG6rRLOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JYGlFNPf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JYGlFNPf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CBEA1F000FF;
	Fri, 18 Sep 2026 17:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789752215;
	bh=dDqlIERKhP3CVyhjJwbIoqR2cBvYfeSKUJptbflUzQA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JYGlFNPfDXkKs9skhszsZ4ZDGHGyW+DNrsdeS/KtJZ2+8Y85S+KthwOiUt8x/5Y3d
	 HdSEpgb+4L6xURz7mwXP0g9FH5stZz1LXsjL7ZcWl8rekqWq3CE6tALqjHyA+gzXk4
	 DP4u2X8JuLDHzX+3SrUyeAlbW1yYh4zmI+jSVtb5gFRGL419jgWw/2W5xMXxD1Y8Xo
	 +j/KlBYUdWIm8ra5Wya7F1x+6A4V01xMkz3onZMcqpb3fQ8y4o/mGV/0RzJoqrlGuy
	 hTCj2kpa3+0Fxi8uY9hbo+vNSxYVbRzyJhFnZVo7QEB4cSf8RJmBEyfCw3Aj5S2ZLI
	 wqwafFDalMEZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/11] media: rcar-fcp: Handle resets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Elder" <paul.elder+renesas@ideasonboard.com>
Cc: linux-clk@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-10-dbe9236bfd22@ideasonboard.com>
References: <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-0-dbe9236bfd22@ideasonboard.com>
 <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-10-dbe9236bfd22@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 17:23:34 +0000
Message-Id: <20260918172335.7CBEA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: rcar-fcp: hardware access while in reset due to PM ordering
- [Medium] media: rcar-fcp: missing reset assertion on driver unbind due to=
 async PM
--

commit d0433a4b8db079b09c43d3564a42e501b20457b1
Author: Paul Elder <paul.elder+renesas@ideasonboard.com>

media: rcar-fcp: Handle resets

On some versions of the FCP, such as the one on the X5H, reset control
is required to operate the FCP. Add support for handling resets
optionally, to continue supporting versions that do not require it.

> diff --git a/drivers/media/platform/renesas/rcar-fcp.c b/drivers/media/pl=
atform/renesas/rcar-fcp.c
> index dfb0ca93e854d..76d4c250b3081 100644
> --- a/drivers/media/platform/renesas/rcar-fcp.c
> +++ b/drivers/media/platform/renesas/rcar-fcp.c

[ ... ]

> @@ -190,6 +197,24 @@ static void rcar_fcp_remove(struct platform_device *=
pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }

[Severity: Medium]
Will this leave the device powered on and out of reset if the driver is
unbound?

A client driver (like VSP1) calls rcar_fcp_disable(), which performs an
asynchronous pm_runtime_put(). If the rcar_fcp driver is removed via sysfs
immediately afterward, rcar_fcp_remove() calls pm_runtime_disable() which
cancels any pending asynchronous idle/suspend work.

Because rcar_fcp_remove() relies solely on pm_runtime_disable() without a
synchronous suspend (e.g., via pm_runtime_put_sync() or manually asserting
the reset), the device is trapped in RPM_ACTIVE and the reset control will =
be
released without being asserted.

> +static int fcp_pm_runtime_suspend(struct device *dev)
> +{
> +	struct rcar_fcp_device *fcp =3D dev_get_drvdata(dev);
> +
> +	return reset_control_assert(fcp->rstc);
> +}
> +
> +static int fcp_pm_runtime_resume(struct device *dev)
> +{
> +	struct rcar_fcp_device *fcp =3D dev_get_drvdata(dev);
> +
> +	return reset_control_deassert(fcp->rstc);
> +}

[Severity: High]
Does tying the reset control to runtime PM here cause the hardware to be
accessed while still in reset?

The vsp1 driver's PM resume callback (vsp1_pm_runtime_resume) calls
vsp1_device_init(), which in turn calls vsp1_reset_wpf(). This function
invokes rcar_fcp_soft_reset(), performing register I/O on the FCP:

drivers/media/platform/renesas/rcar-fcp.c:rcar_fcp_soft_reset() {
    ...
	rcar_fcp_write(fcp, RCAR_FCP_REG_RST, RCAR_FCP_REG_RST_SOFTRST);
	ret =3D readl_poll_timeout(fcp->base + RCAR_FCP_REG_STA, ...);
    ...
}

However, vsp1_pm_runtime_resume() only enables the FCP (via
rcar_fcp_enable()) after calling vsp1_device_init().

Since the FCP is not yet PM-resumed when rcar_fcp_soft_reset() executes, its
reset control is still asserted. Writing to hardware registers while the
device is held in reset causes a bus hang or imprecise external abort.

> +
> +static const struct dev_pm_ops fcp_pm_ops =3D {
> +	RUNTIME_PM_OPS(fcp_pm_runtime_suspend, fcp_pm_runtime_resume, NULL)
> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919-epaul-v7-3=
-rc1-x5h-vsp-fcp-v2-0-dbe9236bfd22@ideasonboard.com?part=3D10
