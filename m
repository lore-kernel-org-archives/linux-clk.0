Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808173;
	b=MGiX8sshD0vVssK+tY3KNcNsOWA0LYar4Ui+mtRMPZ3LkcryZReqGEzRd57M2bspB/lA
	 jsPFilSb07bdPTYf7hXH4Owej6hUEnCw/ZC4bmCnfFSXj7AqJN9teLaFrZ83oIhD2njzm
	 AsR+mc3G9yVRc4vY6Q+3n2yVdUkmbAYgMWc9XU8KRGuR2Ck3n8b08pKwi5iOC2DcS6IHv
	 RN5ogGJ40G6CPJPBONpF1pdBWEq6nG/qWatFkv4U8LIHzv0huhabopbSfE7x3PuzKs8Sh
	 iBXlQeP4CseeiYOvg7rMI5/S3I8+TVyxgwrQHXAc2cqAuQZnm+SIheDdBhXUaSpN08g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808173;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GcDHG/YAA8MMTf2ppOcjIw3VpsY3HUsKpmmpJJMNEbc=;
	b=GsLL6A7ClRMr3j1g8QwWymR59Rqm0huC8bCL/OqdabEPKcSjskmWsOxmnbWKR/LuQB1T
	 NCG+m2iVR7+y6TXv5oG4insofNW25oCVSnisUGvXahU4yT04C9YXPq6aGkZjn/FgPFOzE
	 9t1OsJ7H7zutbJiq9ah9WHwaahHt/YINhOYddQ7ohWC5lCTVQqRBL1JOBHMN+khUt6TpL
	 DDF6+PCZAZdkd4eq5b4D3il7Oa2JlWRPtsPnjr9uJpJH2FTgdRJBF9pCMom0p0CDMJEqu
	 HvQz0tEIYl7qbcJvYDPgi2GmjjGDYLzZ52Mda8+lBdswa4Ecogg2AhNdhO09DXYQXFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V2z4HcZ3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E292606A31C
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 19:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V2z4HcZ3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F6B1F00893;
	Fri, 27 Nov 2026 19:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795808172;
	bh=GcDHG/YAA8MMTf2ppOcjIw3VpsY3HUsKpmmpJJMNEbc=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=V2z4HcZ38fV5vHb0VzIbwye+QLU2RAlDe+qAIGYM3gufhZd9BhOSRwz594ZlREwjK
	 AMZRE8RhGIKwAwGwh7l5bsj+ojTL3n/PPxJMLWGFRWBliLDBnjYkTRVyqHgCcbGnkJ
	 gQ6WnUKILQJzTTh4uJqyLQbycc0eYfFRkt1I6w8FnJdbQchk6OWPPOTy+XIAVw1vI0
	 F6cgWi+wt/3ozwu/rE7UDdeTL6mItxIaO50REGlAZjo2CwBoXsDuQtw9f5Fx64vnMN
	 rqJ2MRj7iTfgcrWJzn+Kx/eWr7W41Lb/UxpwjFJcf2OfIDmcLM+5XTQs5YNnOc8zw0
	 kAgVWjXPBpcPg==
Message-ID: <sashiko-outbox-238171@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/10] clk: tegra: bpmp: Drop manual clock unregister on
 provider failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, linux-clk@vger.kernel.org
In-Reply-To: <20261127192620.3443537-3-lee@kernel.org>
References: <20261127192620.3443537-1-lee@kernel.org>
 <20261127192620.3443537-3-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 19:36:12 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] clk: tegra: error pointer dereference in
  tegra_bpmp_clk_of_xlate() [1]
--

commit 44882aa0bdd34b806a054776ef80a0aa5e952e08
Author: Lee Jones <lee@kernel.org>

clk: tegra: bpmp: Drop manual clock unregister on provider failure

This commit removes tegra_bpmp_unregister_clocks() and its call on
of_clk_add_hw_provider() failure so devres handles clock cleanup without
dereferencing error pointers or double-unregistering clocks.

> diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
> index 3649324e2e1fd..e4b4f3eec7773 100644
> --- a/drivers/clk/tegra/clk-bpmp.c
> +++ b/drivers/clk/tegra/clk-bpmp.c
> @@ -648,14 +648,6 @@ static int tegra_bpmp_register_clocks(struct tegra_b=
pmp *bpmp,
>  	return 0;
>  }
> =20
> -static void tegra_bpmp_unregister_clocks(struct tegra_bpmp *bpmp)
> -{
> -	unsigned int i;
> -
> -	for (i =3D 0; i < bpmp->num_clocks; i++)
> -		clk_hw_unregister(&bpmp->clocks[i]->hw);
> -}
> -
>  static struct clk_hw *tegra_bpmp_clk_of_xlate(struct of_phandle_args *cl=
kspec,
>  					      void *data)
>  {

[Severity: High]
This problem wasn't introduced by this patch, but can
tegra_bpmp_clk_of_xlate() also dereference an error pointer in
bpmp->clocks[i] [1]?

drivers/clk/tegra/clk-bpmp.c:tegra_bpmp_clk_of_xlate() {
    ...
	for (i =3D 0; i < bpmp->num_clocks; i++) {
		struct tegra_bpmp_clk *clk =3D bpmp->clocks[i];

		if (!clk)
			continue;

		if (clk->id =3D=3D id)
			return &clk->hw;
	}
    ...
}

Because tegra_bpmp_register_clocks_one() stores ERR_PTR values in
bpmp->clocks[i] when a clock fails to register, checking only !clk before
reading clk->id will crash during device tree clock lookup. Should this
check IS_ERR_OR_NULL(clk)?

[1] https://sashiko.dev/#/bug/linux-3d54138a-c3d2-4466-952a-f7e44259adfe

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127192620.3443=
537-1-lee@kernel.org?part=3D2
