Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4F726CE2C
	for <linux-clk@vger.kernel.org>; Sat, 12 Sep 2026 06:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789195806; cv=none; b=VimWicrdNaKn8PdVxnMxc4YnD76jpnGTc0OenHvJcPyUt+nZAD2poz1CMvKv90EE8/uD5vnIedMKOEMQ6+qVHQYUF8HjYPorIXPhd7fxVT/l7SrQaL/+DhpQ69hrKB7ZB77PKMXZPgrlOLGxpFEWAJWa9+ml7pyEcYyk7GeP2Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789195806; c=relaxed/simple;
	bh=J2axY4Ry0UEjYJBCiBu0feYV4X0EKwce8+wYNcBP1R4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Bfpy6/XpmYUt25K9jioGZWGXul8Y5btLN72GDTW2qklHoWIAJTZR+VmSveovHaK+6lfN+ZYlYF+dPox9MEiNXyArOvBoXcQ6lLTNuDcAVLJ8HTJkqrByTnRAArH7HNOnyNU28MrWzMCkE8c2LSAyjdpYUY3Nt4Y3GsPPwznI2C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VnReB6pm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VnReB6pm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463FF1F000FF;
	Sat, 12 Sep 2026 06:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789195804;
	bh=zpomGFyJ/p5oqgkMfWIMEcjMDwhR/SM9Oixmi3vm31I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VnReB6pmbHjXMUNzU6yO5JorWcB60oujKJkapgEplrTLX/7ZVni4zmEQwfE1Ul4wx
	 HQswBfGWC5dV3zAuJkNT2P559vyTTdG46mSwgVpJdZmN5sANYjC5FGxn0sYfs0UT30
	 gE+KHOzZhE/NmYnaMlG4vjWDDn/mwOKhZeCIOiocVGsb0lAYnSUzeQUFGojCuWGrzU
	 /oP8eKc99Uq90gbkrVsa0BNvNDX6kc/MP3WF+b6U2dHiVn9RcXKu1kmU+EWaQx6BkS
	 5jXOo+BAhgwUb0tQDODHDRUCFgxDBsZhnvaaqUHTDNVZL/oMLYjWlZl6oV7+sLD1NE
	 43ajID+AsDzZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] clk: mediatek: mt8173: fix the FHCTL DDS mask width
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260912-mt8173-fix-dds-mask-width-v1-1-3d0c0292c85c@gmail.com>
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
 <20260912-mt8173-fix-dds-mask-width-v1-1-3d0c0292c85c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 06:50:03 +0000
Message-Id: <20260912065004.463FF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing platform_set_drvdata() in probe causes a NULL pointer dere=
ference in the remove function.
--

commit 89002485f2d73ae2cb8fc035297e800427c96c19
Author: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: clk: mediatek: mt8173: fix the FHCTL DDS mask width

This commit fixes the FHCTL DDS field mask width for the MT8173's hoppable
PLLs by changing the mask from 22-bit to 21-bit. This resolves a 1000 us
polling timeout issue during rate changes that resulted in a warning and
register dump on every hop.

> diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8173-apmixedsys.c
> index d7d416172ab35..327240cd34fbe 100644
> --- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> @@ -100,7 +100,7 @@ enum fh_pll_id {
>  			.fh_id =3D _fhid,					\
>  			.fh_ver =3D FHCTL_PLLFH_V1,			\
>  			.fhx_offset =3D _offset,				\
> -			.dds_mask =3D GENMASK(21, 0),			\
> +			.dds_mask =3D GENMASK(20, 0),			\
>  			.slope0_value =3D 0x6003c97,			\
>  			.slope1_value =3D 0x6003c97,			\
>  			.sfstrx_en =3D BIT(2),				\

[Severity: High]
This is a pre-existing issue, but while reviewing this file, I noticed a
problem in the probe and remove functions.

In clk_mt8173_apmixed_probe(), the driver successfully returns without savi=
ng=20
the allocated driver data:

	r =3D of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get, clk_data=
);
	if (r)
		goto unregister_ref2usb;

	return 0;

Later, if the driver is unbound, clk_mt8173_apmixed_remove() attempts to
retrieve this data:

	struct clk_hw_onecell_data *clk_data =3D platform_get_drvdata(pdev);

	of_clk_del_provider(node);
	mtk_clk_unregister_ref2usb_tx(clk_data->hws[CLK_APMIXED_REF2USB_TX]);

Could this cause a NULL pointer dereference when clk_data->hws is accessed,
crashing the system if a privileged user unbinds the driver via sysfs? Shou=
ld
we add a call to platform_set_drvdata(pdev, clk_data) before the probe
function returns to prevent this?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912-mt8173-fix=
-dds-mask-width-v1-0-3d0c0292c85c@gmail.com?part=3D1
