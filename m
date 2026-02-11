Received: from mx-relay27-hz2.antispameurope.com (mx-relay27-hz2.antispameurope.com [94.100.136.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BA123183C
	for <linux-clk@vger.kernel.org>; Wed, 11 Feb 2026 14:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.227
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770821108; cv=pass; b=bbSpXmHRAGa6MpJyqzaY+8vRLPIUad+tCm09xOW7YjpZhAmV3h7NJSIM/jmeZnhHeEvbHWb4hHM1WUOMxYd7/NJUHIqta1Z34K0600P2CmTUDBaHO8iNenNPbNuJ1r3Fci0y+cWLprWn57KR0sXbcMhqswGuNaU502lbuSEE0vI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770821108; c=relaxed/simple;
	bh=hCi194bm0NWmpJWCGJmmjhLbLsw6bP5FZChrljeU0to=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TfHP05UEDPPhXOe9NeVAtF1x8HHR2vyWgV1QkIQJDPhtw6yRXXVT9CcFH5bhxja9nt29i8gWWUmgG3nPpDtCTr6rRQ7tHpcuFxa/HsWRnAEX/3PIWPPlXFu5o9e+bkHZSVyDMSnBfgMQIJ3I6KTqGzwyC+5aM+2g1Sj5GGBlKQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=k7XsuQWh; arc=pass smtp.client-ip=94.100.136.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="k7XsuQWh"
ARC-Authentication-Results: i=1; mx-gate27-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=yYxQt2OGcmdSWshE3/Ad5apdbgodHOqiD6B7wlmUAZ4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770821035;
 b=C0wQTJLUHKzCJgoSZKWNlV2uzGqor0HtkWdQ2fxv/xRguXPxfDrZC7ZU+LKeJ5D3HzV2Vq+2
 SfXLY1Xj2oC3hyh+iFubB28B1SzwYDjWXrijYnF5bgSfcwbmLr0PpXKQLEYphv3XuU9UXF6lw8L
 6sHFq38rx9nI8Pqny8uXq9wW/8ReEY2omnWLh8mRaE/WGeK4Mqw30APr9iTDKEtHHrSnOOInfZd
 eLqYGytmQerH5r0Lc6zCx7h7uifcKan7DXxW3aEVeamQ04sCTsw53QC7wtOYcCdNxbDYBnfkHbh
 kRZ5sjpZf2xqlH9RGwiiYHIRrPhdPusvyv/QeWwd4dP8A==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770821035;
 b=WRbxI+53GV+XoIZ+axGmuao38/wX/TqCfuNGwzQNVyYV1fnbu62aMSt84iPesDCLr+ei3fGT
 t+5hJwyj7Vqxd/rnT8t0meRK2jR0BQjsqcxvArnqL529O0kUvsLXuoVVLvvKk6erHuaha/wSrc7
 vjU7H8yZlYh6q7xZKQgrrFGdp7JKFRqiMawlLpS5k3AwGHicXNRokwWyQoaTkxyMWyXTutPdNUA
 y97rtW3TH6ZNQbaMWt0ihQsdkbb60INPTiwKcaVzMvTGRihINnACni5C+1aMj79HdPYxaAPlDP6
 Bfa1dfq1eq8t8m9NlVsMFiWPshMcVY6A58KzqunKH5fzA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay27-hz2.antispameurope.com;
 Wed, 11 Feb 2026 15:43:55 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 7AD175A12E1;
	Wed, 11 Feb 2026 15:43:34 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
 sboyd@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, gregkh@linuxfoundation.org,
 rafael@kernel.org, hanguidong02@gmail.com, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] clk: scu/imx8qxp: do not register driver in probe()
Date: Wed, 11 Feb 2026 15:43:34 +0100
Message-ID: <10809444.nUPlyArG6x@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260211142321.55404-1-dakr@kernel.org>
References: <20260211142321.55404-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-clk@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay27-hz2.antispameurope.com with 4fB1QH3NLmz2Nm8r
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:8e7c20d949661fe4b3ede5b8a28db6ab
X-cloud-security:scantime:2.326
DKIM-Signature: a=rsa-sha256;
 bh=yYxQt2OGcmdSWshE3/Ad5apdbgodHOqiD6B7wlmUAZ4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770821034; v=1;
 b=k7XsuQWhJqU0qqJbBHHwngFj0O4o37QJ1do/IvtKtIiWwowqygu1OhR58pMMZ30OBUhvybAN
 ae9VBejW8HAl0D6ZIK03wM85obta41s8YrwKyNQyP3PlqFlyO6WbtPcBkfeOfsOehfLfH71PqJI
 H660QVqdvnxJvE8J5W7A6bYdDYcK2zY3hK+5uGwk3z6b2s844fSzxBVHZWrgbzCKjYtzIz7OiiJ
 GR0WnmX9FqxXt3jCWRdY9ZmhgIeZ1JJB+ugwg6pYRHtHx+XBW2v5UWHFRNlPSJ+XP0C1a49QfeT
 Nn9hSd8Ax5w341xoaGD2kj5U4w7JNvtMTTwAcuKBp7L8g==

Hi Danilo,

Am Mittwoch, 11. Februar 2026, 15:23:16 CET schrieb Danilo Krummrich:
> imx_clk_scu_init() registers the imx_clk_scu_driver while commonly being
> called from IMX driver's probe() callbacks.
>=20
> However, it neither makes sense to register drivers from probe()
> callbacks of other drivers, nor does the driver core allow registering
> drivers with a device lock already being held.
>=20
> The latter was revealed by commit dc23806a7c47 ("driver core: enforce
> device_lock for driver_match_device()") leading to a deadlock condition
> described in [1].
>=20
> Additionally, nothing seems to unregister the imx_clk_scu_driver once
> the corresponding driver module is unloaded, which leaves the
> driver-core with a dangling pointer.
>=20
> Hence, register the imx_clk_scu_driver from module_init() and unregister
> it in module_exit().
>=20
> Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_d=
evice()")
> Fixes: 220175cd3979 ("clk: imx: scu: fix build break when compiled as mod=
ules")
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Closes: https://lore.kernel.org/lkml/13955113.uLZWGnKmhe@steina-w/
> Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/=
 [1]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Thanks for the patch.
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa8x/MBa8x

> ---
> I plan to send the driver-core PR for 7.0-rc1 soon, which will also conta=
in
> commit dc23806a7c47 ("driver core: enforce device_lock for
> driver_match_device()").
>=20
> It also contains an IOMMU commit similar to this one:
> https://patch.msgid.link/20260121141215.29658-1-dakr@kernel.org
>=20
> The commit was originally scheduled for 6.19-rc7, but was deferred to 7.0=
=2Drc1 in
> case more of those cases pop up (which now happened).
> ---
>  drivers/clk/imx/clk-imx8qxp.c | 24 +++++++++++++++++++++++-
>  drivers/clk/imx/clk-scu.c     | 12 +++++++++++-
>  drivers/clk/imx/clk-scu.h     |  2 ++
>  3 files changed, 36 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
> index 3ae162625bb1..d89a2f40771e 100644
> --- a/drivers/clk/imx/clk-imx8qxp.c
> +++ b/drivers/clk/imx/clk-imx8qxp.c
> @@ -346,7 +346,29 @@ static struct platform_driver imx8qxp_clk_driver =3D=
 {
>  	},
>  	.probe =3D imx8qxp_clk_probe,
>  };
> -module_platform_driver(imx8qxp_clk_driver);
> +
> +static int __init imx8qxp_init(void)
> +{
> +	int ret;
> +
> +	ret =3D platform_driver_register(&imx8qxp_clk_driver);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D imx_clk_scu_module_init();
> +	if (ret)
> +		platform_driver_unregister(&imx8qxp_clk_driver);
> +
> +	return ret;
> +}
> +module_init(imx8qxp_init);
> +
> +static void __exit imx8qxp_exit(void)
> +{
> +	imx_clk_scu_module_exit();
> +	platform_driver_unregister(&imx8qxp_clk_driver);
> +}
> +module_exit(imx8qxp_exit);
> =20
>  MODULE_AUTHOR("Aisheng Dong <aisheng.dong@nxp.com>");
>  MODULE_DESCRIPTION("NXP i.MX8QXP clock driver");
> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> index 34c9dc1fb20e..c90d21e05f91 100644
> --- a/drivers/clk/imx/clk-scu.c
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -191,6 +191,16 @@ static bool imx_scu_clk_is_valid(u32 rsrc_id)
>  	return p !=3D NULL;
>  }
> =20
> +int __init imx_clk_scu_module_init(void)
> +{
> +	return platform_driver_register(&imx_clk_scu_driver);
> +}
> +
> +void __exit imx_clk_scu_module_exit(void)
> +{
> +	return platform_driver_unregister(&imx_clk_scu_driver);
> +}
> +
>  int imx_clk_scu_init(struct device_node *np,
>  		     const struct imx_clk_scu_rsrc_table *data)
>  {
> @@ -215,7 +225,7 @@ int imx_clk_scu_init(struct device_node *np,
>  		rsrc_table =3D data;
>  	}
> =20
> -	return platform_driver_register(&imx_clk_scu_driver);
> +	return 0;
>  }
> =20
>  /*
> diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
> index af7b697f51ca..ca82f2cce897 100644
> --- a/drivers/clk/imx/clk-scu.h
> +++ b/drivers/clk/imx/clk-scu.h
> @@ -25,6 +25,8 @@ extern const struct imx_clk_scu_rsrc_table imx_clk_scu_=
rsrc_imx8dxl;
>  extern const struct imx_clk_scu_rsrc_table imx_clk_scu_rsrc_imx8qxp;
>  extern const struct imx_clk_scu_rsrc_table imx_clk_scu_rsrc_imx8qm;
> =20
> +int __init imx_clk_scu_module_init(void);
> +void __exit imx_clk_scu_module_exit(void);
>  int imx_clk_scu_init(struct device_node *np,
>  		     const struct imx_clk_scu_rsrc_table *data);
>  struct clk_hw *imx_scu_of_clk_src_get(struct of_phandle_args *clkspec,
>=20
> base-commit: 192c0159402e6bfbe13de6f8379546943297783d
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


