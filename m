Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC18737B3ED;
	Thu, 19 Mar 2026 09:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913404; cv=none; b=W7+IAkbK2y4SDkJYkN4/rZzKpfqQA7NdtiGGkZJWxAKNdEdekBIjOMviwtdgIS4oGW4Dn90RdecJ4gQQeh65MkSQYe2I3nSDd9a7M+r778NbQpoWGUIbQwbuDKZ97tTIh6tQuqlxr7aRD21bJufXH8gJbvTTs8mjaZVCTcXRQAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913404; c=relaxed/simple;
	bh=fJ1FJLz7IfxhVNhArSQy6mfZmUXxxH7oiC5RjN0hshY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFQWWrwXZWr1ElkDOGdPKnNfPZ1TRkM0UjevtWbgCSUvh0r+1mbiqSxztaqZ8KXB8dbbNyh9FKsLIv7TIFjrKG3rq94VfaA1IUtLwdYF+RoZ3CADPUN7z15Mi0IdSJnPYgSL5qp/pFTuU7lbTDOryr0MuU+yNhqypNlnfAc5TwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rq2vqjef; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rq2vqjef"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A7D6C19424;
	Thu, 19 Mar 2026 09:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773913403;
	bh=fJ1FJLz7IfxhVNhArSQy6mfZmUXxxH7oiC5RjN0hshY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rq2vqjefqInnlC/dgahSi46BIHMLaq8t5JTMgotKR7IwTGt+idQ4LI6B8goZPiO40
	 PqAW4iV1hyvr1suun5NxVkaFFAH+MK4tcBE6D71PSCUHDyeUJyhBtUxKn4+SNPiNvL
	 lkzAlHjxRJM0NrkgRsfQbjlnJ31bnr7w+VW2S++ENksoTmVNnDpUR9p4ECPLDcNCZt
	 mxw3x3O+8gW5ZIBWz8qoFuY9IdD6LKzLS1kwN7ZGReMkpLvnsF7p8TM2X0cS37beUw
	 ci0ySkqnnKIvNw3DEnaquvGG6vi6elocj2oZjoNddAxWUsDOt45vEFyuS0i7RBZSFl
	 TCmXtrt+4s77A==
Date: Thu, 19 Mar 2026 10:43:20 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Alberto Ruiz <aruiz@redhat.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 7/7] clk: test: introduce additional test case showing
 v2 rate change + LCM parent
Message-ID: <20260319-mellow-cautious-bandicoot-01de99@houat>
References: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
 <20260313-clk-scaling-v6-7-ce89968c5247@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="qroeb4fwakcqeeq3"
Content-Disposition: inline
In-Reply-To: <20260313-clk-scaling-v6-7-ce89968c5247@redhat.com>


--qroeb4fwakcqeeq3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 7/7] clk: test: introduce additional test case showing
 v2 rate change + LCM parent
MIME-Version: 1.0

On Fri, Mar 13, 2026 at 12:43:14PM -0400, Brian Masney wrote:
> Add a test case that uses the clk divider with the v2 rate negotiation
> logic, plus the Lowest Common Multiple (LCM) to calculate the optimal
> parent rate. The test ensures that the parent clk rate is set to a rate
> that's acceptable to both children, and the sibling clock is not
> affected.
>=20
> The test in this commit use the following simplified clk tree with
> the initial state:
>=20
>                      parent
>                      24 MHz
>                     /      \
>               child1        child2
>               24 MHz        24 MHz
>=20
> child1 and child2 both divider-only clocks that have CLK_SET_RATE_PARENT
> set, and the parent is capable of achieving any rate.
>=20
> child1 requests 32 MHz, and the tree ends up with the correct state:
>=20
>                      parent
>                      96 MHz
>                     /      \
>               child1        child2
>               32 MHz        24 MHz
>               div=3D3          div=3D4
>=20
> Additionally, add a note about why clk_dummy_div_lcm_ops + friends are
> still needed.
>=20
> Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
> Link: https://lpc.events/event/19/contributions/2152/
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/clk_test.c | 49 ++++++++++++++++++++++++++++++++++++++++++++=
+++++
>  1 file changed, 49 insertions(+)
>=20
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index 40bc01a0259d8d49ca4c1983b6c10a3684a95f0b..00511afe5faa8b2631633ab79=
6ece1bfe6944fb5 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -181,6 +181,14 @@ static const struct clk_ops clk_dummy_div_ops =3D {
>  	.set_rate =3D clk_dummy_div_set_rate,
>  };
> =20
> +/*
> + * drivers/clk/clk-divider.c has support for v2 rate negotiation, and se=
tting
> + * the parent based on the LCM, however we need to be able to test just =
setting
> + * the parent rate based on the LCM, and not set the v2 rate negotiation=
 flag.
> + * This is to demonstrate existing functionality in the clk core, and en=
sure it
> + * stays the same. That's why we need to keep clk_dummy_div_lcm_ops, and=
 can't
> + * just use clk_dummy_div_ops.
> + */
>  static int clk_dummy_div_lcm_determine_rate(struct clk_hw *hw,
>  					    struct clk_rate_request *req)
>  {
> @@ -709,6 +717,18 @@ clk_rate_change_sibling_div_div_test_lcm_ops_v1_para=
ms[] =3D {
>  KUNIT_ARRAY_PARAM_DESC(clk_rate_change_sibling_div_div_test_lcm_ops_v1,
>  		       clk_rate_change_sibling_div_div_test_lcm_ops_v1_params, desc)
> =20
> +static const struct clk_rate_change_sibling_div_div_test_param
> +clk_rate_change_sibling_div_div_test_regular_ops_v2_params[] =3D {
> +	{
> +		.desc =3D "regular_ops_v2",
> +		.ops =3D &clk_dummy_div_ops,
> +		.extra_child_flags =3D CLK_V2_RATE_NEGOTIATION,
> +	},
> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(clk_rate_change_sibling_div_div_test_regular_ops_=
v2,
> +		       clk_rate_change_sibling_div_div_test_regular_ops_v2_params, des=
c)
> +
>  static int clk_rate_change_sibling_div_div_test_init(struct kunit *test)
>  {
>  	const struct clk_rate_change_sibling_div_div_test_param *param =3D test=
->param_value;
> @@ -836,6 +856,31 @@ static void clk_test_rate_change_sibling_div_div_3_v=
1(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
>  }
> =20
> +/*
> + * Test that, for a parent with two divider-only children with CLK_SET_R=
ATE_PARENT
> + * set and one requests a rate incompatible with the existing parent rat=
e, the
> + * sibling rate is not affected, and maintains it's rate.
> + */

I assume that's only true if the v2 negociation is enabled?

> +static void clk_test_rate_change_sibling_div_div_4_v2(struct kunit *test)
> +{
> +	struct clk_rate_change_sibling_div_div_context *ctx =3D test->priv;
> +	int ret;
> +
> +	ret =3D clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
> +	KUNIT_ASSERT_EQ(test, ret, 0);

If so, we should have an assertion here

Maxime
>

--qroeb4fwakcqeeq3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCabvFOAAKCRAnX84Zoj2+
dv9QAYDfcqiKXI4BpI9oHqT8mBd/rWDfcoDtlD3UA3W6co6pr/6ILzPQUOOe/Chb
prKDYX0BgJyo2QQBD7gh+uai0zqZfce8nZm2ly6ioSSeSYjGXLWh3S4wOZaiGLzF
tS9OpzvYXw==
=8dZs
-----END PGP SIGNATURE-----

--qroeb4fwakcqeeq3--
