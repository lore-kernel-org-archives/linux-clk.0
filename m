Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6E83B8BB9
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 07:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787209706; cv=none; b=fhqPM8qF6JjLyMsZZDGd9kEiLKGv0eqJ8NVvkooSU8gOmK2B2kCvhFKLKarqc/+GCTBHo0Tcr/VecqPyxnN7sEK0pBPVIu4LIVP9RielNZ/sXOv4X3HxgF1Td77EoYj/RCYNBWfJ2Zgp0OOvfpr0CMIrS8hdumjxxjIJYoKFLPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787209706; c=relaxed/simple;
	bh=QfVm5yuZcUO9hvyfW7nU1h8h9iPyw4CJRVJIDXXuC7k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iVz/Y1Tyj1xF/ZUC97IiR0T8utXl5Dnk++tflmpGc3yIP59Us89kSAJHqe8MYOGsB11UgRqPez2CnMMJsG/QWHRBhLFQQMY7pyrkextdWWML6VBcjhdHU08KIOgkGRNr1NdEYKXLO4wo669Wowh5MkljYB5Hh5jniYLF7Gp3UUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J0yashXP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J0yashXP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B291F000E9;
	Thu, 20 Aug 2026 07:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787209704;
	bh=PD9/mWfU1elJMjzJgx+5v/nIhBOKtNvtTBZCNiba0FQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J0yashXPx17twCurnxNwuqXdyxnBEyW36Sf71IW2EiQk498/KvHJli3yYAhImPVeJ
	 K/kh5ahJZVTbu/Pvier/l7+swEX/pby3ptbnSO5nuNDZMwxkqd5He11KDlhe3PqAVQ
	 sy2TSIbJLk3MxgCM8AuUdS9lWrKd7XuqQS2oP+AnZyhTxvZqQBnn1dX51ObbTxLCD6
	 wpYqEQ27qmxRHEDvzGo6pwwjV07K85tfap/MclVbv9itJ9GQ5oUSiNAya5DPJloD3w
	 aymmfKHYziPsz8sNalzivkjm7543BRT+V0oQOEyqCXDKHunvAgjaYIQRFhI6Q3nVmN
	 luMi7X8BrCx8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drivers/clk: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Triet Hoang" <triet.hoang.dev@gmail.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260820065904.2032536-1-triet.hoang.dev@gmail.com>
References: <20260820065904.2032536-1-triet.hoang.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 07:08:24 +0000
Message-Id: <20260820070824.B8B291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Clock references obtained via `of_clk_get_by_name()` are leaked on=
 the successful probe path.
- [Low] Missing named initializers for struct i2c_device_id array elements.
--

--- Patch [1]: [PATCH] drivers/clk: Convert to DEFINE_SIMPLE_DEV_PM_OPS() -=
--
commit 905f2dc2a103be650ab5a8a95761cebf0202b40a
Author: Triet Hoang <triet.hoang.dev@gmail.com>

drivers/clk: Convert to DEFINE_SIMPLE_DEV_PM_OPS()

Convert the deprecated SIMPLE_DEV_PM_OPS to DEFINE_SIMPLE_DEV_PM_OPS and
pm_sleep_ptr(). This lets us drop the maybe unused annotations from its
suspend and resume callbacks, and reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

> diff --git a/drivers/clk/clk-si521xx.c b/drivers/clk/clk-si521xx.c
> index ceadc07bcb6df..9336d08e80830 100644
> --- a/drivers/clk/clk-si521xx.c
> +++ b/drivers/clk/clk-si521xx.c
[ ... ]
> @@ -379,12 +379,12 @@ static const struct of_device_id clk_si521xx_of_mat=
ch[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, clk_si521xx_of_match);
> =20
> -static SIMPLE_DEV_PM_OPS(si521xx_pm_ops, si521xx_suspend, si521xx_resume=
);
> +static DEFINE_SIMPLE_DEV_PM_OPS(si521xx_pm_ops, si521xx_suspend, si521xx=
_resume);
> =20
>  static struct i2c_driver si521xx_driver =3D {
>  	.driver =3D {
>  		.name =3D "clk-si521xx",
> -		.pm	=3D &si521xx_pm_ops,
> +		.pm	=3D pm_sleep_ptr(&si521xx_pm_ops),
>  		.of_match_table =3D clk_si521xx_of_match,
>  	},
>  	.probe		=3D si521xx_probe,

[Severity: Low]
This is a pre-existing issue, but I noticed the si521xx_id array assigned
to the id_table near here uses a positional initializer for the
i2c_device_id name field. Does the I2C subsystem require named initializers
for i2c_device_id arrays?

> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
> index 913fcc5675f19..bf2276981e01d 100644
> --- a/drivers/clk/clk-versaclock5.c
> +++ b/drivers/clk/clk-versaclock5.c
[ ... ]
> @@ -1335,12 +1335,12 @@ static const struct of_device_id clk_vc5_of_match=
[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, clk_vc5_of_match);
> =20
> -static SIMPLE_DEV_PM_OPS(vc5_pm_ops, vc5_suspend, vc5_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(vc5_pm_ops, vc5_suspend, vc5_resume);
> =20
>  static struct i2c_driver vc5_driver =3D {
>  	.driver =3D {
>  		.name =3D "vc5",
> -		.pm	=3D &vc5_pm_ops,
> +		.pm	=3D pm_sleep_ptr(&vc5_pm_ops),
>  		.of_match_table =3D clk_vc5_of_match,
>  	},
>  	.probe		=3D vc5_probe,

[Severity: Low]
This is also a pre-existing issue, but similar to the si521xx driver, the
vc5_id array uses a positional initializer. Should this be updated to use
a named initializer to match I2C subsystem guidelines?

> diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsun=
g/clk-exynos-clkout.c
> index 5f64d93b2facf..9c8b17cb5e7c1 100644
> --- a/drivers/clk/samsung/clk-exynos-clkout.c
> +++ b/drivers/clk/samsung/clk-exynos-clkout.c
> @@ -214,7 +214,7 @@ static void exynos_clkout_remove(struct platform_devi=
ce *pdev)

[Severity: High]
This is a pre-existing issue, but looking at exynos_clkout_probe() right
above this remove function, do we leak clock references on probe success?

It appears that exynos_clkout_probe() retrieves parent clock references
using of_clk_get_by_name() and stores them in a local parents array. While
clk_put() is correctly called in the err_clk_unreg path, the function
returns 0 on success without dropping the references.=20

Could this permanently leak the references when the local array goes out of
scope, preventing the provider modules from ever being unloaded?

>  	iounmap(clkout->reg);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820065904.2032=
536-1-triet.hoang.dev@gmail.com?part=3D1
