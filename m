Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A6D3164D9;
	Thu, 12 Feb 2026 10:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770893882; cv=none; b=sIl6C/xiHKBYJdofy73FPTcMs6Jh2lCAWUKLO3erOhDHZQ9GXHiOMLKSR7UTOfqR2D0t26tDfkwMj09XFfhP6KiFyQDonKser3uNxYK89P43JOc8zB6hgD0f3oFDkU4k8eA+LdvzdGiGWrFRb+X0Ofo0w2DDEg0YxJZqDxPEe3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770893882; c=relaxed/simple;
	bh=a10gybJK/rglyWHCmyBwBN8EflBOeOZkgZ5xBklxWGE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=JFdHRObDrfK+pq/75/IR8UQOq2k4fs9zRrJaOBXwFlk3/nGuafWukjOf6kjYTwnHvDURdPB0QdYctbGoTx8L1w8EJ7qmbmtQ/dX5m3sM2zuRM/LO1FQ7lIw8wmSeVzh1QhVM64CjnD2MZ/bHeTzWcpkEg5bsLtuH94nMvK+XJrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GzKFBSxg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GzKFBSxg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09EF2C4CEF7;
	Thu, 12 Feb 2026 10:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770893882;
	bh=a10gybJK/rglyWHCmyBwBN8EflBOeOZkgZ5xBklxWGE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=GzKFBSxgykC0qt/3n9plxUDNDHJJHjV6L5z37PAXqjd/B7Ep1XKSfD1faRoke3gIY
	 Y4CRX1UbfJ59/w+AUfPT9nAKyCHmSGB9igBhNEsRULaAeYfDjYfZ4huGbHD71p4quE
	 yOdDZiwuK/yAQlP07y7wa4cOc50ejAe0FmyjEUwW8QrhQEg5FSy8EjS5+FW7fDKFh1
	 k8Kw81xtMrzmv7GdRhXd6kq4GymfZFiX+DeeTAkDrDwFUdmL76c5eBmMn8E0tJ+wMv
	 n02Cc1XYoMXu9f5RoenP84OkDyz+YQg3r8vWgw9Rz7Krw4RuQZIZgSS7Asyi7PtBxC
	 +Fmdop0DMe7qQ==
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Feb 2026 11:57:56 +0100
Message-Id: <DGCXHJSE6HF8.1UVG9WV27XEK@kernel.org>
Subject: Re: [PATCH] clk: scu/imx8qxp: do not register driver in probe()
Cc: "Alexander Stein" <alexander.stein@ew.tq-group.com>,
 <abelvesa@kernel.org>, <peng.fan@nxp.com>, <mturquette@baylibre.com>,
 <sboyd@kernel.org>, <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>,
 <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <hanguidong02@gmail.com>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
To: "Daniel Baluta" <daniel.baluta@oss.nxp.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260211142321.55404-1-dakr@kernel.org>
 <10809444.nUPlyArG6x@steina-w>
 <9e33e5e5-76cd-4395-acb4-e2e03e436bf5@oss.nxp.com>
In-Reply-To: <9e33e5e5-76cd-4395-acb4-e2e03e436bf5@oss.nxp.com>

On Wed Feb 11, 2026 at 3:59 PM CET, Daniel Baluta wrote:
> On 2/11/26 16:43, Alexander Stein wrote:
>> Am Mittwoch, 11. Februar 2026, 15:23:16 CET schrieb Danilo Krummrich:
>>> imx_clk_scu_init() registers the imx_clk_scu_driver while commonly bein=
g
>>> called from IMX driver's probe() callbacks.
>>>
>>> However, it neither makes sense to register drivers from probe()
>>> callbacks of other drivers, nor does the driver core allow registering
>>> drivers with a device lock already being held.
>>>
>>> The latter was revealed by commit dc23806a7c47 ("driver core: enforce
>>> device_lock for driver_match_device()") leading to a deadlock condition
>>> described in [1].
>>>
>>> Additionally, nothing seems to unregister the imx_clk_scu_driver once
>>> the corresponding driver module is unloaded, which leaves the
>>> driver-core with a dangling pointer.

Actually, this fixes a third bug: If there are multiple matching devices fo=
r the
imx8qxp_clk_driver, imx8qxp_clk_probe() calls imx_clk_scu_init() multiple t=
imes.
However, any subsequent call after the first one will fail, since the drive=
r
core does not allow to register the same struct platform_driver multiple ti=
mes.

>>> diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qx=
p.c
>>> index 3ae162625bb1..d89a2f40771e 100644
>>> --- a/drivers/clk/imx/clk-imx8qxp.c
>>> +++ b/drivers/clk/imx/clk-imx8qxp.c
>>> @@ -346,7 +346,29 @@ static struct platform_driver imx8qxp_clk_driver =
=3D {
>>>  	},
>>>  	.probe =3D imx8qxp_clk_probe,
>>>  };
>>> -module_platform_driver(imx8qxp_clk_driver);
>>> +
>>> +static int __init imx8qxp_init(void)
>>>
>>>
> I would call this imx8qxp_clk_init. Same for=C2=A0imx8qxp_exit.

Sure.

>>> +{
>>> +	int ret;
>>> +
>>> +	ret =3D platform_driver_register(&imx8qxp_clk_driver);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret =3D imx_clk_scu_module_init();
>>> +	if (ret)
>>> +		platform_driver_unregister(&imx8qxp_clk_driver);
>>> +
>>> +	return ret;
>>>
> Also, because the logical flow is that CLK driver is uing SCU for calls I=
 would first call
> imx_clk_scu_module_init and then register the imx8qxp_clk driver.=20
>
> But there is no functionality issues your your approach too, just a bette=
r logical flow.

Sure, I will send a v2 shortly, as it would be good to get this into an ear=
ly
-fixes PR.

Thanks,
Danilo
