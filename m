Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BB249EC41;
	Thu, 10 Sep 2026 14:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050502; cv=none; b=ZyeQfDlPlr4QWi7WIcqzZ7Rr7Q8nmahHyUoPPfki4G8ZqerDXw1SZ+LFf4SVUKuKRMdKUo7YOsPp91jOfpbihaho/oQ6dRoJlH5/mSahWOslcYmtePUndsDln8bJOS00aZhNSkp9KtUOXOhyfwmxvg/iqV6OEC2xLJH189iWpMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050502; c=relaxed/simple;
	bh=IrgONwUxFROqmPU/wGCuO849jkWWb04u8oCXC6Wy2jU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pMOFCJwHv+6J5qPcPBTnqFGI7iPJYF4W8AA5myDyDPNU4zYqMxgj1Bw5Kyya3A/nZwdhzBeDt9T7lHJFTHTjFReeHKEpT7ylCD89fagOdQ/QRelgvSbpe+QqQ7x7d4O9dzz/PvxfjrjlUaILHim8gCJ5hw4gBw0/nUhZAYxf8aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SFrSXjV+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SFrSXjV+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA381F000FF;
	Thu, 10 Sep 2026 14:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789050500;
	bh=4H3YWKqyh8XRjnyZtPNkmw61ua2BEvSRbEHmL/TAJ/w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SFrSXjV+Vuxtts2lCf6Al1YZ3Padi0tKwxLazGHUAvSFJ599aTvjavZbCS8cqQZxA
	 ppd1S3rZ0Fah7LctH1o1zsII6lixti+l7ZUShBfJExRKlUxz+Fjhe2e6Y5dkXRduKK
	 G/CpCqsEfCtrAF14j1cv4RRkqp396SYPR4gFSETfBLI2KqoMdV7P6IOSlY+eVU8jar
	 WnBNhfAiSPTO98t5wDVXDmnXLbOS0dYu979W9/SrwjsHZdV5vVcnuyWnof+p2Aqb4o
	 mXJryrAjhiuV4niilMdNHSJphe2mEZXTyI9/Nk+RDlPO03zkvtRALDoQZnzRDp35My
	 kNEi2ksNRzuag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/7] of: property: fw_devlink: Follow GPIO nexus maps
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ernest Van Hoecke" <ernestvanhoecke@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260910-fw-devlink-nexus-ready-v2-1-17ac82dbe226@toradex.com>
References: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
 <20260910-fw-devlink-nexus-ready-v2-1-17ac82dbe226@toradex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 14:28:19 +0000
Message-Id: <20260910142819.DFA381F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Stack buffer overflow when parsing `#<stem>-cells` property.
- [High] Infinite loop during device tree map traversal.
--

commit 07389d4c4496496ba5a738fbae28d5c3df4427f8
Author: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

of: property: fw_devlink: Follow GPIO nexus maps

This commit modifies fw_devlink to parse GPIO properties using a map-aware
parser instead of direct phandle references. This ensures fw_devlink resolv=
es
the same provider as the GPIO consumer API, properly deferring consumers un=
til
the nexus translation node is available.

Link: https://lore.kernel.org/all/juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jba=
uradujrre@gc5nbdhhixaf/

> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 72cf12907de03..380df0861ab97 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
[ ... ]
> @@ -1311,6 +1311,19 @@ static struct device_node *parse_prop_cells(struct=
 device_node *np,
>  	return sup_args.np;
>  }
> =20
> +static struct device_node *parse_nexus_prop(struct device_node *np,
> +					    const char *prop_name, int index,
> +					    const char *stem_name)
> +{
> +	struct of_phandle_args sup_args;
> +
> +	if (of_parse_phandle_with_args_map(np, prop_name, stem_name, index,
> +					   &sup_args))
> +		return NULL;
> +
> +	return sup_args.np;
> +}

[Severity: High]
This is a pre-existing issue, but by using of_parse_phandle_with_args_map()
during early boot for all -gpio(s) properties, does this expose a stack
buffer overflow to malformed Device Trees?

Looking at of_parse_phandle_with_args_map() in drivers/of/base.c, it reads
list_size from a Device Tree property (e.g., #gpio-cells) without checking
if it exceeds MAX_PHANDLE_ARGS:

drivers/of/base.c:of_parse_phandle_with_args_map() {
    ...
	ret =3D of_property_read_u32(cur, cells_name, &list_size);
	if (ret < 0)
		goto put;

	/* Precalculate the match array - this simplifies match loop */
	for (i =3D 0; i < list_size; i++)
		initial_match_array[i] =3D cpu_to_be32(out_args->args[i]);
    ...
}

If a malformed DT provides a cells property greater than 16, this loop will
read past the end of out_args->args and write past the end of the
initial_match_array stack buffer. Can this lead to memory corruption or a
kernel panic during early boot?


[Severity: High]
This isn't a bug introduced by this patch, but does calling
of_parse_phandle_with_args_map() here also expose an infinite loop when
traversing cyclic maps?

Looking at the map traversal loop in of_parse_phandle_with_args_map():

drivers/of/base.c:of_parse_phandle_with_args_map() {
    ...
	while (cur) {
		/* Get the <list>-map property */
		map =3D of_get_property(cur, map_name, &map_len);
    ...
		/* Iterate again with new provider */
		out_args->np =3D new;
		of_node_put(cur);
		cur =3D new;
		new =3D NULL;
	}
    ...
}

Since there is no depth limit or cycle detection, if a Device Tree has a
cyclic map structure (where Node A maps to Node B, which maps back to Node =
A),
will this loop hang infinitely and cause a hard lockup?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-fw-devlink=
-nexus-ready-v2-0-17ac82dbe226@toradex.com?part=3D1
