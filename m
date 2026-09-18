Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1847A46F483;
	Fri, 18 Sep 2026 17:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789751717; cv=none; b=QA33GmqgTujSYp9Nac1Mji+DvOFk6Y7ln1twJLk1cR4wlObWjnpaPSOUbh12qCxsqj+rJ7nNGZJTYRjkyhtaGq/IuOcOjF7fEWUrereOUd9BaG9FCDtKz+pkJ/ibV7GWSCa3vDHv4IfEjElehq7A0kuekhquILH2QzhO872M7B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789751717; c=relaxed/simple;
	bh=qspgTyuRu7XwR8ACfPkALjGOq+VRhCOa+r1C7BiJM7U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AqkqbBgODvhHVa5om92tFijVdaHFyfDrcmP921jpzZbeELtjCyI4FyUFzqXAAPcYZJqYFJ5N9rBqjFVPPD+Vj3OSv6PNshbWKvRD/XShZTiM4mcihuWHIximR6SFvamhg5XxYJGn7HUYMYtnjXnXEXeRezPSqqowJK6t2JHbszo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8o72ES0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8o72ES0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81CC41F000FF;
	Fri, 18 Sep 2026 17:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789751715;
	bh=YZ5yUEp2UopIB8xMVT3xbu3+W22kIx21Otqoefwf6H0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j8o72ES0UFvJyN0H610UbgdyKBcp+35jFe78Z5RtlgK4XhT9XqRqcvpMSv25G+W0m
	 8MTGvA0PWAFy7ZH5bfWlMd8JV0QvlFQzo4dncrUTa2eY8gV/L4XBF4RKZisCWvZ7Cu
	 UVMAm0ZHUbNubQPNa1RlrZFD1QTC/08y86hEBzVpxKZxsvZtPGQ9MeI+s8+L5HbL9j
	 nia0jj2QKF7YEy6HNQPouhwiWlIJ+yGuz6GbPU6i7uJrlxRLstlXsqBiK6YFAOOOq+
	 LUal/Ard/VMCLt8k1u7gMfW1P+w1NWdwkKhBGKeq5fzMP1sXXxhcsFG1nr2k1Lkpk9
	 pB++tKHggoJBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH DNI v2 11/11] media: rcar-fcp: Check device revision at
 probe time
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Elder" <paul.elder+renesas@ideasonboard.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org, linux-clk@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-11-dbe9236bfd22@ideasonboard.com>
References: <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-0-dbe9236bfd22@ideasonboard.com>
 <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-11-dbe9236bfd22@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 17:15:14 +0000
Message-Id: <20260918171514.81CC41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] pm: resource leak on probe error due to async pm_runtime_put()
- [Low] macro: malformed macro RCAR_FCP_REG_PICINFO1_STRIDE_DIV16 missing p=
arameter list
- [Low] type: compiler warning from direct pointer-to-enum cast on 64-bit a=
rchitectures
--

commit 4a6c9e446d9f471665024b004ad3e5842c693332
Author: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

media: rcar-fcp: Check device revision at probe time

Verify that the device revision register reports a valid value,
otherwise reject the device.

> diff --git a/drivers/media/platform/renesas/rcar-fcp.c b/drivers/media/pl=
atform/renesas/rcar-fcp.c
> index 76d4c250b3081..5f2c483f71f42 100644
> --- a/drivers/media/platform/renesas/rcar-fcp.c
> +++ b/drivers/media/platform/renesas/rcar-fcp.c
[ ... ]
> +#define RCAR_FCP_REG_TL_CTRL			0x0070
> +#define RCAR_FCP_REG_TL_CTRL_TLEN		BIT(31)
> +#define RCAR_FCP_REG_TL_CTRL_VPOS_C(n)		((n) << 16)
> +#define RCAR_FCP_REG_TL_CTRL_VPOS_Y(n)		((n) << 0)
> +
> +#define RCAR_FCP_REG_PICINFO1			0x00c4
> +#define RCAR_FCP_REG_PICINFO1_STRIDE_DIV16	((n) << 0)

[Severity: Low]
Is this macro missing a parameter list? It looks like the missing (n) after
the macro name will prevent it from taking arguments, treating ((n) << 0)
as the literal expansion.

[ ... ]
>  static int rcar_fcp_probe(struct platform_device *pdev)
>  {
>  	struct rcar_fcp_device *fcp;
> +	int ret;
> =20
>  	fcp =3D devm_kzalloc(&pdev->dev, sizeof(*fcp), GFP_KERNEL);
>  	if (fcp =3D=3D NULL)
>  		return -ENOMEM;
> =20
>  	fcp->dev =3D &pdev->dev;
> +	fcp->type =3D (enum rcar_fcp_type)device_get_match_data(&pdev->dev);

[Severity: Low]
Can this direct pointer-to-enum cast cause a compiler warning on 64-bit
architectures?

To avoid precision loss warnings on 64-bit platforms like ARM64, should the
pointer be cast to an integer of the same size, such as unsigned long or
uintptr_t, before being cast to the enum type?

>  	platform_set_drvdata(pdev, fcp);
[ ... ]
>  	pm_runtime_enable(&pdev->dev);
> +	ret =3D pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret < 0)
> +		goto error_pm_disable;
> +
> +	ret =3D rcar_fcp_setup(fcp);
> +	if (ret < 0)
> +		goto error_pm_put;
> +
> +	pm_runtime_put(&pdev->dev);
> =20
>  	mutex_lock(&fcp_lock);
>  	list_add_tail(&fcp->list, &fcp_devices);
>  	mutex_unlock(&fcp_lock);
> =20
>  	return 0;
> +
> +error_pm_put:
> +	pm_runtime_put(&pdev->dev);
> +error_pm_disable:
> +	pm_runtime_disable(&pdev->dev);
> +	return ret;

[Severity: Medium]
Does calling pm_runtime_put() immediately before pm_runtime_disable() leak
the device power state?

Since pm_runtime_put() queues an asynchronous suspend, the subsequent
pm_runtime_disable() can cancel it, leaving the hardware active after a pro=
be
failure.

Should this use pm_runtime_put_sync() instead to ensure the device powers
down correctly before being disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919-epaul-v7-3=
-rc1-x5h-vsp-fcp-v2-0-dbe9236bfd22@ideasonboard.com?part=3D11
