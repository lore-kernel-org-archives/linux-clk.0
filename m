Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD1937E312;
	Thu, 19 Mar 2026 09:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773912159; cv=none; b=sQ1TkGiAMO/dexIjlP7Z8QFTxVRxLYkK/RDkdQds0Jalz1+CebZh17xfnKhafnGW7vkM8FhEcoZtXNEsxIikzVr7p2UBairze6Q3ZZd7IgOHbRAV/XPWsPMm1dbzhHYiV2X7QNAFQKeQ37QoFSiGPyKcXFjDPkTi4JAl7O2L17s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773912159; c=relaxed/simple;
	bh=9COhg7RAL1wvAVOtxp0h6/qQh8bfjFwqwr8eAabgKcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYPqeqJOs2OGsTGoMONrfD0njl/W1lPZ96xkUl2oYdzgDvbUMV8zFGz812eJFgp/NgyWvTkxmJVRTcTW8rfsgqPqwHgCdfbAr53xAXoOv6LGU4hXc1d+4HaG7Asf2vSpMXOoSAv8fzCFc+rw+/I9DXTmbS5VFqsg0PTjr5Okq/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CcICHk5n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CcICHk5n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD30C19424;
	Thu, 19 Mar 2026 09:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773912159;
	bh=9COhg7RAL1wvAVOtxp0h6/qQh8bfjFwqwr8eAabgKcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CcICHk5nOB5EQ7GyUG8/A4y2Uzuyo7b9K8tahkBdJXhH14V3ZjYdjFWXFjQh2568k
	 rUT+WH5IxAEoq2seXIgGZUiZ2519JjoNAnjiW9LbQIwPETS0Cr7klIBAYn+krkVO3Q
	 V4LlvFCxsX3dTWGJuzzzHzOCRos/8bkJF64jhIQHR8MN3FvPHHyEu6TH2LR47PO4iI
	 U2B4SC+5XMNDU5NQgnrJWtwJ+xPOL7krAugDYOHUS1vQjy6GUrq0tDAr3Grx2E+gmm
	 toXIFcunxglUyDZRwRhdqqfheStw8KLoWrS3GGqGiU7dqkS6f3yz7I1C/mWZnLxe9I
	 Li6KidFyAVBPQ==
Date: Thu, 19 Mar 2026 10:22:36 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Alberto Ruiz <aruiz@redhat.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/7] clk: test: introduce additional test case showing
 sibling clock rate change
Message-ID: <20260319-enchanted-flying-sparrow-5a6446@houat>
References: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
 <20260313-clk-scaling-v6-4-ce89968c5247@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="viumy6yeyylnr2vb"
Content-Disposition: inline
In-Reply-To: <20260313-clk-scaling-v6-4-ce89968c5247@redhat.com>


--viumy6yeyylnr2vb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 4/7] clk: test: introduce additional test case showing
 sibling clock rate change
MIME-Version: 1.0

On Fri, Mar 13, 2026 at 12:43:11PM -0400, Brian Masney wrote:
> Add a test case where the parent clk rate is set to a rate that's
> acceptable to both children, however the sibling clk rate is affected.
>=20
> The tests in this commit use the following simplified clk tree with
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
> child1 requests 32 MHz, and the tree should end up with the state:
>=20
>                      parent
>                      96 MHz
>                     /      \
>               child1        child2
>               32 MHz        24 MHz
>=20
> However, child2 ends up with it's parent rate due to the way the clk
> core currently calculates handles rate changes.
>=20
>                      parent
>                      96 MHz
>                     /      \
>               child1        child2
>               32 MHz        96 MHz
>                             ^^^^^^
>                             Incorrect. Should be 24 MHz.
>=20
> Let's document this behavior with a kunit test since some boards are
> unknowingly dependent on this behavior.
>=20
> Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
> Link: https://lpc.events/event/19/contributions/2152/
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/clk_test.c | 61 ++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 61 insertions(+)
>=20
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index 325da7c84ab2ecdcf6b7a023ce4c2c4ef2d49862..40bc01a0259d8d49ca4c1983b=
6c10a3684a95f0b 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -181,6 +181,26 @@ static const struct clk_ops clk_dummy_div_ops =3D {
>  	.set_rate =3D clk_dummy_div_set_rate,
>  };
> =20
> +static int clk_dummy_div_lcm_determine_rate(struct clk_hw *hw,
> +					    struct clk_rate_request *req)
> +{
> +	struct clk_hw *parent_hw =3D clk_hw_get_parent(hw);
> +
> +	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) && req->best_parent_r=
ate < req->rate)
> +		return -EINVAL;
> +
> +	req->best_parent_rate =3D clk_hw_get_children_lcm(parent_hw, hw, req->r=
ate);
> +	req->best_parent_hw =3D parent_hw;
> +
> +	return divider_determine_rate(hw, req, NULL, CLK_DUMMY_DIV_WIDTH, CLK_D=
UMMY_DIV_FLAGS);
> +}
> +
> +static const struct clk_ops clk_dummy_div_lcm_ops =3D {
> +	.recalc_rate =3D clk_dummy_div_recalc_rate,
> +	.determine_rate =3D clk_dummy_div_lcm_determine_rate,
> +	.set_rate =3D clk_dummy_div_set_rate,
> +};
> +
>  struct clk_multiple_parent_ctx {
>  	struct clk_dummy_context parents_ctx[2];
>  	struct clk_hw hw;
> @@ -677,6 +697,18 @@ clk_rate_change_sibling_div_div_test_regular_ops_par=
ams[] =3D {
>  KUNIT_ARRAY_PARAM_DESC(clk_rate_change_sibling_div_div_test_regular_ops,
>  		       clk_rate_change_sibling_div_div_test_regular_ops_params, desc)
> =20
> +static const struct clk_rate_change_sibling_div_div_test_param
> +clk_rate_change_sibling_div_div_test_lcm_ops_v1_params[] =3D {
> +	{
> +		.desc =3D "lcm_ops_v1",
> +		.ops =3D &clk_dummy_div_lcm_ops,
> +		.extra_child_flags =3D 0,
> +	},
> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(clk_rate_change_sibling_div_div_test_lcm_ops_v1,
> +		       clk_rate_change_sibling_div_div_test_lcm_ops_v1_params, desc)
> +
>  static int clk_rate_change_sibling_div_div_test_init(struct kunit *test)
>  {
>  	const struct clk_rate_change_sibling_div_div_test_param *param =3D test=
->param_value;
> @@ -777,11 +809,40 @@ static void clk_test_rate_change_sibling_div_div_2_=
v1(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
>  }
> =20
> +/*
> + * Test that, for a parent with two divider-only children with CLK_SET_R=
ATE_PARENT
> + * set and one requests a rate incompatible with the existing parent rat=
e, the
> + * sibling rate is also affected. This preserves existing behavior in th=
e clk
> + * core that some drivers may be unknowingly dependent on.
> + */

This description is identical to the one for
clk_test_rate_change_sibling_div_div_2_v1(), so it's not clear to me
what the difference between those two tests are.

Maxime

--viumy6yeyylnr2vb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCabvAWwAKCRAnX84Zoj2+
diQWAYC8IHeo6Uxp49KrVSln7wRZf+HvyB7pAFK8Tpk8/qHHNE1hoTlRg3i1IISk
Bv0d/NgBfRCdhVam7ZD7B5O6sayzHDnlmW3XGhSCpcocPAtMS4v2hiNtAyGqmcGG
gI0zKBlVKw==
=gjns
-----END PGP SIGNATURE-----

--viumy6yeyylnr2vb--
