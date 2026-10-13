Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F1F51D53A
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905790; cv=none; b=aDXq7di0Cc/LXkWxMvEq7/uj1K8gfH2Eeehfs70CI++ovuUsOn6bVkU7nA8xyXro32SItmZkeMirphHd1xyvlj+6KgL3COLnLbPlMtCPPvzXWAvJUTffY2rVFsAyUBEJcPCoLF7P2ivMxXgSzebbTB2MbHZo59rLwmpE+Fsn7ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905790; c=relaxed/simple;
	bh=CRU4/TmfHqmzDb38e6Fkn05QAz9Jygm/37Pu2N0jpkg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=eO22h8dOGsLDVSU6fsFmPiBsSe2A1DADQsX+Dw1zDVAs+BAfUDOb+iY2pCgEH5Q8lhCwW4X+Y6K8H1qsNvOiuBC9lPXDrOMj3bxceE6XHFMWZtinfzRorK43zWy32hl8dHVKLPacgag2OTE3cOY+6w2qr+z0EvG0RYEARZBGFc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VcCr+7U3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VcCr+7U3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC73E1F00893;
	Tue, 13 Oct 2026 15:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791905789;
	bh=xlWa931nVaYliSHlrZUH15HFtwJdz2/mKNgFWLrjwc8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VcCr+7U3Ns/8UzjBOdpmS3NQQtYmkEHADuSjMteFdf+PU+iotAszEN258z/cGKjwJ
	 WxyUMJ3B6aWib3YdPkvQpBRPv5wvzKrJuzRHXwyRDuCEQfyXmOruGt/5936LOlRPRT
	 M08Zvfxsf4U37h0Ofkkm53/bgPD9NCTF7zUwewWgjMSeXTdvb1zSp0iHd8iqeYB4pH
	 sed0qwcFZE0JWHyDRW/u12hPLI3JJJ11pHLpIQGjfdZ7/o8DI6GkY7m3EgbLRtqmmt
	 Oegi4JvyChEzxXjdmA8tJ4ITcJ55fXm6oHa9Gc05O2fWnstEnRkKyEBfbw7aXDqBKW
	 jar9whyQpSvug==
Message-ID: <sashiko-outbox-170023@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/35] clk: mediatek: mt6795: Fix memory leak on
 module removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akari Tsuyukusa" <akkun11.open@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OkNPTU1PTiBDTEsgRlJBTUVXT1JL?= <linux-clk@vger.kernel.org>
In-Reply-To: <20261013151734.3177690-3-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
 <20261013151734.3177690-3-akkun11.open@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 15:36:24 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] clk: mediatek: commit message mischaracterizes bug severity as memo=
ry leak instead of kernel panic
--

commit a61ee7f5e1c349f92340b7b9ebe198a23e34b370
Author: Akari Tsuyukusa <akkun11.open@gmail.com>
clk: mediatek: mt6795: Fix memory leak on module removal

This commit adds platform_set_drvdata() to the probe functions of three
MediaTek MT6795 clock drivers to properly store the clock data. The commit
message states this missing initialization caused a memory leak during
module removal.

>     clk-mt6795-apmixedsys.c, clk-mt6795-infracfg.c and clk-mt6795-pericfg=
.c
>     do not call platform_set_drvdata() during their driver probe callback,
>     but their remove callback calls platform_get_drvdata().
>     This results in platform_get_drvdata() returning NULL, which leads to
>     calling kfree(NULL) in mtk_free_clk_data(NULL).
>     This leaves clk_data unreleased, causing a memory leak.

[Severity: Low]
Does the missing platform_set_drvdata() actually cause a kernel panic rather
than a memory leak?

Looking at clk_mt6795_apmixed_remove(), clk_data is dereferenced before
mtk_free_clk_data() is called:

drivers/clk/mediatek/clk-mt6795-apmixedsys.c:clk_mt6795_apmixed_remove() {
	...
	struct clk_hw_onecell_data *clk_data =3D platform_get_drvdata(pdev);

	...
	mtk_clk_unregister_ref2usb_tx(clk_data->hws[CLK_APMIXED_REF2USB_TX]);
	...
}

If clk_data is NULL, accessing clk_data->hws will cause a NULL pointer
dereference.

Similarly, in clk_mt6795_infracfg_remove(), mtk_clk_unregister_cpumuxes()
is called with the NULL clk_data:

drivers/clk/mediatek/clk-cpumux.c:mtk_clk_unregister_cpumuxes() {
	...
	for (i =3D num; i > 0; i--) {
		const struct mtk_composite *mux =3D &clks[i - 1];

		if (IS_ERR_OR_NULL(clk_data->hws[mux->id]))
			continue;
	...
}

This also dereferences the NULL pointer before reaching mtk_free_clk_data().

Could the commit message be updated to reflect that this fixes a kernel pan=
ic
during driver unbind?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013151734.3177=
690-1-akkun11.open@gmail.com?part=3D2
