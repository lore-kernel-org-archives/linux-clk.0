Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A61736197F;
	Fri, 18 Sep 2026 17:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789751914; cv=none; b=gWC5XDoqqdzhOojkyseMrXL0kP87GCS7GL7RDwFXTXHhvB77x/ZdcmtvJ+/xpmo0+itGJE7QKmLOQlgkpWQm9cnA1Ekv+wVnAelH8jnWWjmuIL4xf7Go9Xrab64+EOhnGHU8ihl3Ur4zpB69B5ZJqKXosjBmINW606pP+yYIwr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789751914; c=relaxed/simple;
	bh=JsXnY3cl3RRdbZ4LnmR0TxAf/7UP5+NVXUCc2gO2H8g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZieMDklpmipA43gc1ul3PnJzNxqhWiBNptFDHfDGiSHc656Bv5hIGi1wWDqqPD1KTK4TaUZHT+Z8GCW6FBDD6bXgBdsvmUtxFrg4nPbcRJsd0zYH0KTUVglOIs2JDzqcD6ZJJCw+NV1DIvtesRiNiloynhAMUCXtkTCLSVPBReQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qtz+oJIl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qtz+oJIl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0716E1F000FF;
	Fri, 18 Sep 2026 17:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789751913;
	bh=sss8ccV88h3LonxkKUZt2aTH+MJP1lwUp00YCxxLSn0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qtz+oJIl9t5kmSU29VUqcShq0mk7CtlyeJBJ0CxLo88BXmnhFj2YuY2zkHvbokDVM
	 zMjXgvafQiqiavXDHUy2WQaOBUiWiYg/PcrmEb0QijXxR1kxw5X1ojwqqDovtJwKoA
	 OX0RZCc7xI/EFefrzTML3gNnHfFFB73uQOxul8sh9SnmPeUUCGcliXyaj7PXmMu6vt
	 uNB1+BqD07Zayteo7eEqkex3RKzFD8PHsCLsM2mleEH2JSQmTlEJkRRrqNVSDzD939
	 qY40JsM28giJYnAa8ab3WK9q22am8iR5KOBHHzAg3CjneR/bN/DxzMN0l6mDe0tEUB
	 te8OtYE9oQu9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/11] pmdomain: renesas: r8a78000: Add maps for VIO
 for SCP FW SDKv4.36
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Elder" <paul.elder+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, media-ci@linuxtv.org, conor+dt@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-3-dbe9236bfd22@ideasonboard.com>
References: <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-0-dbe9236bfd22@ideasonboard.com>
 <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-3-dbe9236bfd22@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 17:18:31 +0000
Message-Id: <20260918171832.0716E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] pmdomain: r8a78000: probe regression on older SCMI firmware vers=
ions
--

commit 15cae81644d1a9205daae4b85676910b2400fe02
Author: Paul Elder <paul.elder+renesas@ideasonboard.com>

pmdomain: renesas: r8a78000: Add maps for VIO for SCP FW SDKv4.36

Add maps for VIO for the VSP and FCP power domains and reset domains.

> diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/=
renesas/r8a78000-mdlc.c
> index a0d83f27735e7..cabe6435ecd79 100644
> --- a/drivers/pmdomain/renesas/r8a78000-mdlc.c
> +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
[ ... ]
> @@ -997,8 +1047,8 @@ static const struct mdlc_info r8a78000_mdlc_fw_4_31_=
0[] =3D {
>  		/* FIXME .mod_map =3D r8a78000_mdlc_vips_mod_fw_4_31_0, */
>  	}, {
>  		.base =3D 0xc5000000 /* mdlc_vio */,
> -		/* FIXME .power_map =3D r8a78000_mdlc_vio_power_fw_4_28_0, */
> -		/* FIXME .mod_map =3D r8a78000_mdlc_vio_mod_fw_4_31_0, */
> +		.power_map =3D r8a78000_mdlc_vio_power_fw_4_31_0,
> +		.mod_map =3D r8a78000_mdlc_vio_mod_fw_4_31_0,

[Severity: Medium]
The commit message indicates these are maps for SCP FW SDKv4.36, but they a=
re
being unconditionally assigned to the r8a78000_mdlc_fw_4_31_0 struct.

If older firmware lacks the newly added VIO IDs, will this cause an immedia=
te
probe abort?

In fill_power_map():

	genpd =3D of_genpd_get_from_provider(&scmi_spec);
	if (IS_ERR(genpd))
		return dev_err_cast_probe(dev, genpd,
				"Failed to get SCMI power domain %u\n",
				map[i].fw_id);

If an older firmware (e.g. SDK v4.31) reports fewer SCMI domains than the n=
ewly
added VIO IDs, of_genpd_get_from_provider() will return -ENOENT, aborting t=
he
probe and rendering dependent devices unusable.

Should these maps only be applied when the correct firmware version is
detected?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919-epaul-v7-3=
-rc1-x5h-vsp-fcp-v2-0-dbe9236bfd22@ideasonboard.com?part=3D3
