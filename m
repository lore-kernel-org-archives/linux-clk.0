Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA5E72622;
	Sat, 18 Apr 2026 18:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776538038; cv=none; b=HVUyyc9wlh+5O36Zdxp5AVoJYLTHXHGEJQt4ns75OXofZteSIAFbc2MFS/sNQHt0d8xYESdsqZtG7aDy/el54nq18fcQv65JRs93+Vl550Bz6/ZEOGxkbaHQ9ag/RfzKK5LCIHC95GTlTHUhGgt8CvQODUMsMOUFIEG9trNMaJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776538038; c=relaxed/simple;
	bh=4W57M5/mbIjePklm+SzLKzfdSMOBHotfFHZsmG0a1sc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=i9h3WCgyOI6Gh2ujaBDdCLPGKJ3xzZoJ5J6VP7bNqBsi9Qf3QFe1CCjPnAjg4hSQWLXlljO38eel/x6kteBJSAVyDFP0Bd4Aj5Kbbxhq4lY3mWbsl/bYVE8Tk81W0KLEM4Ky+7dly8aUpQwKgkeH5+f7XhjfZIUXhhFGiwo3OYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ClxWbbkB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ClxWbbkB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41AA1C19424;
	Sat, 18 Apr 2026 18:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776538038;
	bh=4W57M5/mbIjePklm+SzLKzfdSMOBHotfFHZsmG0a1sc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ClxWbbkBtDbs9B+9Pm9EQ9uvupmnQclGfNgWajOsWZRhGU6QbdjNuC9bYNi7ncFcD
	 05UCGuLleo2OsPTDzhrdzu1QddN/KnBSFaFBiHb4BkEUF7GzFV6z/+i01+gG/Ttm1h
	 kF5KVOX+Cjy3E2tpHJmSVf+ADz6iOVQWgzHWs1w9+oXj77oJipXXRUoymSfgAC+YEz
	 QI9fAWLw2e+EodVdvLwIi7HJ2Q0G4RemdzBXxbyKSRdYi6hltnd+t246QqyDFwIsnk
	 KkLsfsE1bQH2nEP4j8z5k7PB5iq+n8HczoFEW3H2lQj0iXhUeuUgpKLZOzLVw80fFC
	 XBmZyioMNoQkw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260225083413.3384950-1-wenst@chromium.org>
References: <20260225083413.3384950-1-wenst@chromium.org>
Subject: Re: [PATCH RESEND v2] clk: tests: Add tests for clk lookup by name
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Date: Sat, 18 Apr 2026 11:26:05 -0700
Message-ID: <177653676535.5403.14630700858352386940@localhost.localdomain>
User-Agent: alot/0.12

Quoting Chen-Yu Tsai (2026-02-25 00:34:11)
> Clk lookup (by name) recently gained some performance improvements at
> the expense of more complexity within the lookup code.
>=20
> To make sure that this works as intended and doesn't break, add some
> basic tests for this part of the CCF.
>=20
> A new "clk_hw_lookup()" function is added purely for running kunit
> tests.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>=20
> ---

Thanks. One nit below that I can likely fix before merging unless you
send again.

> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index a268d7b5d4cb..a8989566946b 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -175,6 +175,8 @@ static const struct clk_ops clk_multiple_parents_no_r=
eparent_mux_ops =3D {
>         .set_parent =3D clk_multiple_parents_mux_set_parent,
>  };
> =20
> +#define DUMMY_CLK_NAME "test_dummy_rate"
> +
>  static int clk_test_init_with_ops(struct kunit *test, const struct clk_o=
ps *ops)
>  {
>         struct clk_dummy_context *ctx;
> @@ -187,7 +189,7 @@ static int clk_test_init_with_ops(struct kunit *test,=
 const struct clk_ops *ops)
>         ctx->rate =3D DUMMY_CLOCK_INIT_RATE;
>         test->priv =3D ctx;
> =20
> -       init.name =3D "test_dummy_rate";
> +       init.name =3D DUMMY_CLK_NAME;
>         init.ops =3D ops;
>         ctx->hw.init =3D &init;
> =20
> @@ -3541,6 +3543,67 @@ static struct kunit_suite clk_hw_get_dev_of_node_t=
est_suite =3D {
>         .test_cases =3D clk_hw_get_dev_of_node_test_cases,
>  };
> =20
> +/*
> + * Test that clk lookup with a name that is not registered returns NULL.
> + */
> +static void clk_lookup_not_registered_clk_returns_NULL(struct kunit *tes=
t)
> +{
> +       KUNIT_EXPECT_PTR_EQ(test, NULL, clk_hw_lookup(DUMMY_CLK_NAME));
> +}
> +
> +/*
> + * Test that clk lookup with a name that is registered returns the clk.
> + */
> +static void clk_lookup_registered_clk_returns_clk(struct kunit *test)
> +{
> +       struct clk_hw *hw;
> +       struct clk_init_data init =3D {
> +               .name =3D DUMMY_CLK_NAME,
> +               .ops =3D &empty_clk_ops,
> +       };
> +
> +       hw =3D kunit_kzalloc(test, sizeof(*hw), GFP_KERNEL);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
> +
> +       hw->init =3D &init;
> +       KUNIT_ASSERT_EQ(test, 0, clk_hw_register_kunit(test, NULL, hw));
> +
> +       KUNIT_EXPECT_PTR_EQ(test, hw, clk_hw_lookup(DUMMY_CLK_NAME));
> +}
> +
> +/*
> + * Test that clk lookup with a name that was unregistered returns NULL.
> + */
> +static void clk_lookup_unregistered_clk_returns_NULL(struct kunit *test)
> +{
> +       struct clk_hw *hw;
> +       struct clk_init_data init =3D {
> +               .name =3D DUMMY_CLK_NAME,
> +               .ops =3D &empty_clk_ops,
> +       };
> +
> +       hw =3D kunit_kzalloc(test, sizeof(*hw), GFP_KERNEL);
> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
> +
> +       hw->init =3D &init;
> +       KUNIT_ASSERT_FALSE(test, clk_hw_register(NULL, hw));

Should be

	KUNIT_ASSERT_EQ(test, 0, clk_hw_register(NULL, hw))

because clk_hw_register() returns an int.

> +
> +       clk_hw_unregister(hw);
> +
> +       KUNIT_EXPECT_PTR_EQ(test, NULL, clk_hw_lookup(DUMMY_CLK_NAME));
> +}
