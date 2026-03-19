Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9836E3BC665;
	Thu, 19 Mar 2026 09:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911403; cv=none; b=IWnHrsgPzFHGFsNvc1pPTTVOk024B/bwFiOnSnNmWkdGkpGwkDBybM2/gHyOFOOaK1tFVk2OtIcKuvmP0GOCTfo/k4aFUMDxABItxy4BpFT2KyVHWnGQcOFhlxc49Ke8wczs+VsUMqiu4+X8vUfP/Tb99Lmpu8GNQUBiNr7wn6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911403; c=relaxed/simple;
	bh=ZAh4zRf64ouBgVhnt1xCAmcNvx1/yq14s8/edC3tlQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eSqjzSZgsa+lXr26yhaFrwGIG94uuF+795rNnpvrKVgcSVwYs0TPnpGDZTPHjz3uic2ExkFroKEdEFyVKKGfr7Uoz0VdUWVfJsBqL2cMYsu9JaC0VPA3lF+OU7LEGIg/8mIt5t2aERNUVA+1WLG8UphrhkCLE0uckV95xP5U/sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o688UlA7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o688UlA7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC251C2BC87;
	Thu, 19 Mar 2026 09:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773911403;
	bh=ZAh4zRf64ouBgVhnt1xCAmcNvx1/yq14s8/edC3tlQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o688UlA7+CdYUNmo5p0hd9Sq8SLKH/Xb1DvqPaXOMcN9pTzo6PJD9JWKpdBVD0MJH
	 UjVq/I1HC7b/UNWwdVXU5dowaNVpCXrkOAC/O6HxhnfXB6cifq23mBj4rI6grF8TTj
	 +8DfUS2/Ix83Gt+6oPKFmS1ZHYeNVmS9aGCIK3XTBttK0Jyms/bxIioUKmRTleJt+z
	 6UxVFbQzFR3FXlpA8gliTRfpDgRDeJMwEMG6N7iW5pnRD2Uif7DmvaJMzXLgNKCRQY
	 Z72kfkayY48fc4lHdIDw3KLRN0kcpXWlUaQtz1pWTXR94KZMEyksPRVPPzZU7wIcva
	 DHXCcHwWKnnIQ==
Date: Thu, 19 Mar 2026 10:10:00 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Alberto Ruiz <aruiz@redhat.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/7] clk: test: introduce test suite for sibling rate
 changes on a divider
Message-ID: <20260319-spry-incredible-dinosaur-e2d9da@houat>
References: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
 <20260313-clk-scaling-v6-2-ce89968c5247@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="7xqlmptmcrkw5eeh"
Content-Disposition: inline
In-Reply-To: <20260313-clk-scaling-v6-2-ce89968c5247@redhat.com>


--7xqlmptmcrkw5eeh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/7] clk: test: introduce test suite for sibling rate
 changes on a divider
MIME-Version: 1.0

Hi,

On Fri, Mar 13, 2026 at 12:43:09PM -0400, Brian Masney wrote:
> Introduce a kunit test suite that demonstrates the current behavior
> of how a clock can unknowingly change the rate of it's siblings. Some
> boards are unknowingly dependent on this behavior, and per discussions
> at the 2025 Linux Plumbers Conference in Tokyo, we can't break the
> existing behavior. So let's add kunit tests with the current behavior
> so that we can be made aware if that functionality changes in the
> future.
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
> Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
> Link: https://lpc.events/event/19/contributions/2152/
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/clk_test.c | 146 +++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 146 insertions(+)
>=20
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index 88e35f4419c958983578750356a97c0a45effb55..325da7c84ab2ecdcf6b7a023c=
e4c2c4ef2d49862 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -7,6 +7,7 @@
>  #include <linux/clk/clk-conf.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/units.h>
> =20
>  /* Needed for clk_hw_get_clk() */
>  #include "clk.h"
> @@ -652,6 +653,150 @@ clk_multiple_parents_mux_test_suite =3D {
>  	.test_cases =3D clk_multiple_parents_mux_test_cases,
>  };
> =20
> +struct clk_rate_change_sibling_div_div_context {
> +	struct clk_dummy_context parent;
> +	struct clk_dummy_div child1, child2;
> +	struct clk *parent_clk, *child1_clk, *child2_clk;
> +};
> +
> +struct clk_rate_change_sibling_div_div_test_param {
> +	const char *desc;
> +	const struct clk_ops *ops;
> +	unsigned int extra_child_flags;
> +};
> +
> +static const struct clk_rate_change_sibling_div_div_test_param
> +clk_rate_change_sibling_div_div_test_regular_ops_params[] =3D {
> +	{
> +		.desc =3D "regular_ops",
> +		.ops =3D &clk_dummy_div_ops,
> +		.extra_child_flags =3D 0,
> +	},
> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(clk_rate_change_sibling_div_div_test_regular_ops,
> +		       clk_rate_change_sibling_div_div_test_regular_ops_params, desc)
> +
> +static int clk_rate_change_sibling_div_div_test_init(struct kunit *test)
> +{
> +	const struct clk_rate_change_sibling_div_div_test_param *param =3D test=
->param_value;
> +	struct clk_rate_change_sibling_div_div_context *ctx;
> +	int ret;
> +
> +	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +	test->priv =3D ctx;
> +
> +	ctx->parent.hw.init =3D CLK_HW_INIT_NO_PARENT("parent", &clk_dummy_rate=
_ops, 0);
> +	ctx->parent.rate =3D 24 * HZ_PER_MHZ;
> +	ret =3D clk_hw_register_kunit(test, NULL, &ctx->parent.hw);
> +	if (ret)
> +		return ret;
> +
> +	ctx->child1.hw.init =3D CLK_HW_INIT_HW("child1", &ctx->parent.hw,
> +					     param->ops,
> +					     CLK_SET_RATE_PARENT | param->extra_child_flags);
> +	ctx->child1.div =3D 1;
> +	ret =3D clk_hw_register_kunit(test, NULL, &ctx->child1.hw);
> +	if (ret)
> +		return ret;
> +
> +	ctx->child2.hw.init =3D CLK_HW_INIT_HW("child2", &ctx->parent.hw,
> +					     param->ops,
> +					     CLK_SET_RATE_PARENT | param->extra_child_flags);
> +	ctx->child2.div =3D 1;
> +	ret =3D clk_hw_register_kunit(test, NULL, &ctx->child2.hw);
> +	if (ret)
> +		return ret;
> +
> +	ctx->parent_clk =3D clk_hw_get_clk(&ctx->parent.hw, NULL);
> +	ctx->child1_clk =3D clk_hw_get_clk(&ctx->child1.hw, NULL);
> +	ctx->child2_clk =3D clk_hw_get_clk(&ctx->child2.hw, NULL);
> +
> +	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MHZ);
> +	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 24 * HZ_PER_MHZ);
> +	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);

I think we should move those expectations (assertions, really) to the
drivers. It will make it much clearer what the individual test relies on
and why it makes sense.

> +	return 0;
> +}
> +
> +static void clk_rate_change_sibling_div_div_test_exit(struct kunit *test)
> +{
> +	struct clk_rate_change_sibling_div_div_context *ctx =3D test->priv;
> +
> +	clk_put(ctx->parent_clk);
> +	clk_put(ctx->child1_clk);
> +	clk_put(ctx->child2_clk);
> +}
> +
> +/*
> + * Test that, for a parent with two divider-only children with CLK_SET_R=
ATE_PARENT set
> + * and one requests a rate compatible with the existing parent rate, the=
 parent and
> + * sibling rates are not affected.
> + */
> +static void clk_test_rate_change_sibling_div_div_1(struct kunit *test)
> +{
> +	struct clk_rate_change_sibling_div_div_context *ctx =3D test->priv;
> +	int ret;
> +
> +	ret =3D clk_set_rate(ctx->child1_clk, 6 * HZ_PER_MHZ);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MHZ);
> +	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 6 * HZ_PER_MHZ);
> +	KUNIT_EXPECT_EQ(test, ctx->child1.div, 4);
> +	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
> +	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
> +}

That's not something the clock framework guarantees at all.
divider_determine_rate does, but I'm not even sure it's something it
guarantees. It's not documented anywhere at least.

Plenty of drivers do not work that way though and will just forward
their rate request to the parent if CLK_SET_RATE_PARENT is set. Maybe
that's a problem of its own, idk.

Anyway, what I'm trying to say at least is that, at least, we shouldn't
frame it as a guarantee the framework provides, because it's really not
the case.

> +/*
> + * Test that, for a parent with two divider-only children with CLK_SET_R=
ATE_PARENT
> + * set and one requests a rate incompatible with the existing parent rat=
e, the
> + * sibling rate is also affected. This preserves existing behavior in th=
e clk
> + * core that some drivers may be unknowingly dependent on.
> + */
> +static void clk_test_rate_change_sibling_div_div_2_v1(struct kunit *test)
> +{
> +	struct clk_rate_change_sibling_div_div_context *ctx =3D test->priv;
> +	int ret;
> +
> +	ret =3D clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
> +	KUNIT_ASSERT_EQ(test, ret, 0);

Going back to my comment about the init assertions, here for example
this whole test only makes sense if the original rate wasn't equal to
32MHz, but it's not obvious if it is.

Maxime

--7xqlmptmcrkw5eeh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCabu9YQAKCRAnX84Zoj2+
dvwAAX4+chpmORX6ZjySN4I5nWjJwGPubG/8qDkaPdV+0DFX5Rx2rNACt8PWJPgx
GOyRCDQBgOqq2lRwgq/uIuIQXbwur/VGiD9YbEJ2yfiU27sV4i563e2vhJZYeYAd
Unq2gHkY5Q==
=ukfY
-----END PGP SIGNATURE-----

--7xqlmptmcrkw5eeh--
