Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6B24A0156;
	Thu, 10 Sep 2026 14:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050523; cv=none; b=E+UExcl5+P/4imi2/d981IbIRMLX3bkcdGZmSiqcg5VGVjLwlgSoeL71q4nCTb9mfiPc82k2cVPD2HGC7tB5rRFUyEdgceD++EIXHw4TTaE3HQqlcEFch4OLwdHtqegzqSchTLb7+S09hS+B5o8icOeELD2/SPd4OMrgpsIGtjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050523; c=relaxed/simple;
	bh=6uzoTk6pRgskcGAwVF2kdGjoCbGL0fJQn7nJlDK0emY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cAsK+LUsiPxkmDBrJkYu8aoIfKI3gcDA1GZ1/C2CUdJAyNULtY+1mNTBNkKE42eOU90yTB11rQV762VS32WLUf4uu8x6mM/t9/pXXgoLAQN/wABlEgpqSbOFfXcJYc0FAZakgIvMaWqz6XOhqbxMnrgxMB+8qQeMP8KeDZCI5sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYmDl1zU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYmDl1zU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB1C1F00893;
	Thu, 10 Sep 2026 14:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789050521;
	bh=lhmcHeF8/twUzKjB4X2CMyXN5bSOopKCoc9U0mx2bgM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YYmDl1zUNdWBEvuckCmO4SV3nTReHarFEbSYcv1ELzBvBxEEaXpjTdQQY7yHYiEal
	 Jbmarm/lT8HxzXAHJM8P7O9TmjL9phgrZm9fsUOzKB8im/KLvlxRxC3PvWYQAsxlHN
	 DSs5b6L9XTMeOJufoLrpWgy75qnWiOJJimyFSoQ/DfqEU5XQT3PFB5cvev4x/UR6Ix
	 G03DC+jQce4rcmztXjfIDIyssJWbtyCjnxQ2Dl8fQHhNAuehqSjUDA2HTjm0kUhph9
	 uc7fr2aOtrreLxBIhLgLd3uA+LcPW7MkLu8DvxH/Qu/aTJxUfXg3pecMpBqnEvg5M1
	 mmmkcMh5W37fQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/7] of: property: fw_devlink: Report unsupported
 supplier linking
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ernest Van Hoecke" <ernestvanhoecke@gmail.com>
Cc: linux-clk@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260910-fw-devlink-nexus-ready-v2-2-17ac82dbe226@toradex.com>
References: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
 <20260910-fw-devlink-nexus-ready-v2-2-17ac82dbe226@toradex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 14:28:41 +0000
Message-Id: <20260910142841.7BB1C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing MSI controller binding support for `msi-map` in `of_suppli=
er_bindings`.
--

commit 47987c8dc7b7519422af5f39cc351a7527565d09
Author: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

of: property: fw_devlink: Report unsupported supplier linking

OF supplier linking is deliberately disabled on OLPC and Intel CE4100 syste=
ms.
This commit changes the add_links operation to return -EOPNOTSUPP when
supplier linking is unsupported, which allows OF unit tests to skip link
assertions on these systems.

> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 380df0861ab97..eba7e9fe6c386 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1691,7 +1691,7 @@ static int of_fwnode_add_links(struct fwnode_handle=
 *fwnode)
>  	struct device_node *con_np =3D to_of_node(fwnode);
> =20
>  	if (!of_is_fwnode_add_links_supported())
> -		return 0;
> +		return -EOPNOTSUPP;
> =20
>  	if (!con_np)
>  		return -EINVAL;

[Severity: High]
This isn't a bug introduced by this patch, but does of_supplier_bindings
miss support for the msi-map property?

Looking at of_supplier_bindings in drivers/of/property.c:

static const struct supplier_bindings of_supplier_bindings[] =3D {
	...
	{ .parse_prop =3D parse_panel, },
	{ .parse_prop =3D parse_msi_parent, },
	{ .parse_prop =3D parse_pses, },
	...
};

Failing to handle the msi-map MSI controller DT binding variant causes
fw_devlink to not establish required dependency links.=20

As a consequence, consumer devices (such as PCIe host controllers) may probe
before the MSI controller is ready, leading to MSI allocation failures and
potential device unavailability (which can render the system unusable if
critical devices like storage or network are affected).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-fw-devlink=
-nexus-ready-v2-0-17ac82dbe226@toradex.com?part=3D2
