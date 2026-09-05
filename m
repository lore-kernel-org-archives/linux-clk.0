Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45653655D7
	for <linux-clk@vger.kernel.org>; Sat,  5 Sep 2026 13:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616381; cv=none; b=km1r2jWeIPZfqPiT+Y56HL2tviV6aWDerku50y+AkIj6XQKpdaR6yCwo7lU03cisrnyExB4576PBye1U2TXwrT/RPr/efgKK+PgwMBE+27RjCNZhmw8mEr+ManObqBMXpT0ZHYG7PJehRyDs6R6k2fbpZ7Xl0i4mehg4QwwPIPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616381; c=relaxed/simple;
	bh=paHVpTp2I5IxGNa2eOYY9/12V0BgV6hNpTH9g3u9uH0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m1o5ZOCZj7iG394UdbgYsZr3rydmtN55Mxry8l+ntjfUxZN/NYG66Rcd46KIKo3l4JaqKiXI3F8GAaVtrDS4QZdDP322yIn6xREnSVDIf4Bd15FUKccaqY0QrtmHWEzLLNbr4Vk550gv/0p96rNGWfao4ht6GPqRb9eW+gAC5z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZtzERdKV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtzERdKV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58BD51F00A3E;
	Sat,  5 Sep 2026 13:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788616380;
	bh=zTTxt3+aAwpFUkcX8KItzP/DuR3wKL9dAFJ+NncMyFE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZtzERdKViRbtVM9JoDtLQdaPRf5iI9lAGiQDbOwmmRh2wW2DpAc/LuY3HmjSf3a2y
	 RBDKKjtqVDOb7q60tQ1zw7khFihIIwD98DNFmUaoE7GSILXGNOxoUM+M+5uoEdWsz0
	 +Vy7BtvFImxEJ/GrDSWuE/gyB9WEySDI5UrVL+ycvYbJveruzAl3wPr3N2JbmALyvs
	 TKxE6TlPmdDGudXpnJf5LzsX2dSz+51c/oQu3aH6lqtXV4zjRwDeTjaVuhAQ9C7G8j
	 R5qjZ3J2GU7pgp7RpllIiFMRuh4NnFuC5RcPkEN6d508AJVZjmDnlUBXAcpWMHBs+x
	 1fzYJLuAj48tw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: mediatek: mt6735-mfgcfg: Publish the OF module
 alias
Reply-To: sashiko-reviews@lists.linux.dev
To: hpp.iscas <hppiscas@163.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260905133337.64201-1-hppiscas@163.com>
References: <20260905133337.64201-1-hppiscas@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 13:52:59 +0000
Message-Id: <20260905135300.58BD51F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix: missing MODULE_DEVICE_TABLE in clk-mt6735-imgsys
--

commit cac832a79fbea2def985b765c45556612cbb95cb
Author: hpp.iscas <hppiscas@163.com>

clk: mediatek: mt6735-mfgcfg: Publish the OF module alias

This commit fixes module auto-loading for the MT6735 mfgcfg driver by
publishing its OF match table. The driver was built as a module but
lacked the module alias, preventing auto-loading.

> diff --git a/drivers/clk/mediatek/clk-mt6735-mfgcfg.c b/drivers/clk/media=
tek/clk-mt6735-mfgcfg.c
> index 1f5aedddf209d..8a18ee244a4de 100644
> --- a/drivers/clk/mediatek/clk-mt6735-mfgcfg.c
> +++ b/drivers/clk/mediatek/clk-mt6735-mfgcfg.c
> @@ -45,6 +45,7 @@ static const struct of_device_id of_match_mt6735_mfgcfg=
[] =3D {
>  	{ .compatible =3D "mediatek,mt6735-mfgcfg", .data =3D &mfgcfg_clks },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, of_match_mt6735_mfgcfg);

[Severity: High]
This is a pre-existing issue, but does this fix need to be applied to
other drivers introduced in commit 0bd9b1211f74 as well?

Looking at drivers/clk/mediatek/clk-mt6735-imgsys.c, the clk_mt6735_imgsys
driver is also a tristate module with an OF match table, but it appears to =
be
missing the MODULE_DEVICE_TABLE declaration:

static const struct of_device_id of_match_mt6735_imgsys[] =3D {
	{ .compatible =3D "mediatek,mt6735-imgsys", .data =3D &imgsys_clks },
	{ /* sentinel */ }
};

static struct platform_driver clk_mt6735_imgsys =3D {
	.probe =3D mtk_clk_simple_probe,
	.remove =3D mtk_clk_simple_remove,
	.driver =3D {
		.name =3D "clk-mt6735-imgsys",
		.of_match_table =3D of_match_mt6735_imgsys,
	},
};

Without the table being exported, udev fails to auto-load the imgsys driver
on boot, which causes dependent imaging subsystems to fail to probe. Could =
we
include the missing MODULE_DEVICE_TABLE for clk-mt6735-imgsys in this patch
or a follow-up?

> =20
>  static struct platform_driver clk_mt6735_mfgcfg =3D {
>  	.probe =3D mtk_clk_simple_probe,
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260905133337.6420=
1-1-hppiscas@163.com?part=3D1
