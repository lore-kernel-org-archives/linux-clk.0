Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F6527AC31;
	Mon, 24 Aug 2026 12:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573973; cv=none; b=UNf6L3FMfG19sA3Dybyyo1Prke1uIAxUlImr3XV1i+88e2MCcLQGQOVVfs7RK/L8atJaXDTuQL9PfCmvM2CgFRadlt1c89K/s219iFH3Tc53ZLtrs8F6hE7VadtwhA1IvnObHK7jx/hhwbfeHgxkEefnpe7oBaR0ESVoP1mHurE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573973; c=relaxed/simple;
	bh=mnhUp5JuFDGzkI09Jf5+3yHQC3emu3QfPB5zMgC9UtI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bW/jsOGGjwpzlnjJc8qAtnXNY0JEkp9rhS/sxz8IHko4LFd38nJIQjRaYsjrorPUtQVyW2Hb/J7Ml9mQyCEeCcTXer2300zBkNeyT9ia6NurS3vYG2Vl3V68viBWpmmvHtd5NIhXGI4gVBur+gLBFJlRzBJdtSe80vT1ujhu0A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bf84WCJ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bf84WCJ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511F71F000E9;
	Mon, 24 Aug 2026 12:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787573971;
	bh=NCnQDfLjrgv2izmFLwBvtK1tWnHCLnbJA6vZxE5ly0I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bf84WCJ+rIT957gYjPvaRgVuBmcxlopwymY0DUVwyKj/+B7C6j94WlU/CpkiN6kjH
	 vQ5RYfDF4HIDet4k1oLgDSZjSEFZP06HfVJ5wccVz2tTihPp7Td8RLEara4F6yTPvd
	 FiEaNqsevkDw55bxQQ6AK49gcz3PZWtJUeN5Zh3Fc7vwYcTGH1su6KfVhyU7CBOPTJ
	 nM2ehdTGurPLiPL9uBqFJyV95E3zM3nwjnCIgMOMdx+ONWtbxsBhEk3ZHSBAOTf3Hq
	 qAKwgMfp3kX+Q6Rl7AH2lRxq3hkwhiC9SJrn8ufXKWoU9ehzOPDLNxt+NVzg6TBp72
	 Sew3LaV0d3fEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 16/47] clk: qcom: gcc-sar2130p: Tie the CX power
 domain to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-16-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-16-f1205a92682b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 12:19:30 +0000
Message-Id: <20260824121931.511F71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] In gdsc_register(), when an error occurs during gdsc_init() or sub=
sequent subdomain attachment, the function fails to unregister the previous=
ly initialized pm_genpd domains, leading to a permanent leak and linked-lis=
t corruption upon driver reprobe.
--

--- Patch [16]: [PATCH v3 16/47] clk: qcom: gcc-sar2130p: Tie the CX power =
domain to controller ---
commit a5913ce7b2e1ade74a139dc203b812733f756b77
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-sar2130p: Tie the CX power domain to controller

This commit enables runtime PM for the controller by setting use_rpm to true
in the gcc_sar2130p_desc structure. This allows the CX power domain to be
powered down once all GCC consumers release their clocks and GDSCs.

> diff --git a/drivers/clk/qcom/gcc-sar2130p.c b/drivers/clk/qcom/gcc-sar21=
30p.c
> index 475e2cda3618b..1a16f9d68babb 100644
> --- a/drivers/clk/qcom/gcc-sar2130p.c
> +++ b/drivers/clk/qcom/gcc-sar2130p.c
> @@ -2308,6 +2308,7 @@ static const struct qcom_cc_desc gcc_sar2130p_desc =
=3D {
>  	.num_resets =3D ARRAY_SIZE(gcc_sar2130p_resets),
>  	.gdscs =3D gcc_sar2130p_gdscs,
>  	.num_gdscs =3D ARRAY_SIZE(gcc_sar2130p_gdscs),

[Severity: High]
This is a pre-existing issue, but I noticed something when looking at how
GDSCs are registered for this controller.

If gdsc_register() in drivers/clk/qcom/gdsc.c fails, could this lead to a
memory leak and linked-list corruption on a subsequent driver reprobe?

drivers/clk/qcom/gdsc.c:gdsc_register() {
    ...
		ret =3D gdsc_init(scs[i]);
		if (ret)
			return ret;
    ...
err_pm_subdomain_remove:
	gdsc_pm_subdomain_remove(desc, i);

	return ret;
}

When an error occurs during gdsc_init() or subsequent subdomain attachment,
the function returns without unregistering the previously initialized pm_ge=
npd
domains.

Since the gdsc structs and their embedded generic_pm_domain structs are
typically statically allocated by clock drivers, a subsequent driver reprobe
(such as from deferred probe) will call pm_genpd_init() again on the same
structs.

Will this attempt to list_add() the node into gpd_list when it is already
linked, corrupting the list?

> +	.use_rpm =3D true,
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-qcom-tie-c=
x-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com?part=3D16
