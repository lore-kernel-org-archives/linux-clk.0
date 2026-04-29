Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985D738B7A6;
	Wed, 29 Apr 2026 03:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434437; cv=none; b=BcYIaKK16AP2pUISKrOl8By2zCG6HRr7waEyISBhQx7a57bdm3bFciZfF/jMyebLwYcuvoxXJ/ZMHfPBprIy1p+jlbqtjghj/4w21Zo6mZQ1ej8K3imXy2GwsUncRuaahTL6isWwXZLy/oRsbSTwvMQZLd+ErlxjXFmU6pgSwZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434437; c=relaxed/simple;
	bh=B2MxUIU/9qAaXrCQHc2wOOoDvcafiNI2e+7E+HVZ9Qk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=VsRBUVEP3kFgLh2Cztchjvq2/8ILMDUVh80ZQHIQEG5tAEt2QAiDta+w4TNg8YuSyXMWsGlRdPRtFLUJg+CzDxUhL5acPV01o5XeI1nOOCxY2Wvt3kNc//oA79XnWNP0pKLoCCV2Cq/SPAqb9zCg4ftai4eOixZMNNSCAWKEyDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMQu5Idj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMQu5Idj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62037C2BCC9;
	Wed, 29 Apr 2026 03:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434437;
	bh=B2MxUIU/9qAaXrCQHc2wOOoDvcafiNI2e+7E+HVZ9Qk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=DMQu5Idj43hB7Yjsko9N0wdASQFZAb4VovZmMhPrmyluiSaDzNMjeOQqDoIZBsRfI
	 EB3yPOxnsd39MrFtK9bNbpvdqpZUPVsJSGvtAjFFYqlJIoGiiOxkA5I4mjOToy0KqT
	 YlHypgClXZzwuuE/f8PKvmcSzU5I8B6gAMP4rrZxHS7Nv+ZuYOLrL0wD5JDFLICvpY
	 10nIxoTcZFygLv1myfvIUj/PDZllog9PNmdLIfm8of3ciqYVhhLaL+lctHxu6AxJ4P
	 Fid0RXES3FMbI7NJnykqg9AwUtZCu58/m/u9bv3NpuoLQ/gC5lg/coNnjUj3lWZfUL
	 SyS1hyzLp4EuA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260312-clk-ssc-v7-1-v9-4-0a9d2e188d9e@nxp.com>
References: <20260312-clk-ssc-v7-1-v9-0-0a9d2e188d9e@nxp.com> <20260312-clk-ssc-v7-1-v9-4-0a9d2e188d9e@nxp.com>
Subject: Re: [PATCH v9 4/6] clk: Add KUnit tests for assigned-clock-sscs
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Sebin Francis <sebin.francis@ti.com>, Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 28 Apr 2026 19:38:36 -0700
Message-ID: <177743031609.5403.8748588339056479001@localhost.localdomain>
User-Agent: alot/0.12

Quoting Peng Fan (OSS) (2026-03-11 23:58:20)
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index a268d7b5d4cb28ec1f029f828c31107f8e130556..97113b61c2841701a44603ca9=
935638374000a2e 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -3203,6 +3223,9 @@ static void clk_assigned_rates_assigns_one(struct k=
unit *test)
>         struct clk_assigned_rates_context *ctx =3D test->priv;
> =20
>         KUNIT_EXPECT_EQ(test, ctx->clk0.rate, ASSIGNED_RATES_0_RATE);
> +       KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.modfreq_hz, ASSIGNED_SSCS_0_=
MODFREQ);
> +       KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.spread_bp, ASSIGNED_SSCS_0_S=
PREAD);
> +       KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.method, ASSIGNED_SSCS_0_METH=
OD);
>  }
> =20
>  static void clk_assigned_rates_assigns_multiple(struct kunit *test)
> @@ -3210,7 +3233,13 @@ static void clk_assigned_rates_assigns_multiple(st=
ruct kunit *test)
>         struct clk_assigned_rates_context *ctx =3D test->priv;
> =20
>         KUNIT_EXPECT_EQ(test, ctx->clk0.rate, ASSIGNED_RATES_0_RATE);
> +       KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.modfreq_hz, ASSIGNED_SSCS_0_=
MODFREQ);
> +       KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.spread_bp, ASSIGNED_SSCS_0_S=
PREAD);
> +       KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.method, ASSIGNED_SSCS_0_METH=
OD);
>         KUNIT_EXPECT_EQ(test, ctx->clk1.rate, ASSIGNED_RATES_1_RATE);
> +       KUNIT_EXPECT_EQ(test, ctx->clk1.sscs.modfreq_hz, ASSIGNED_SSCS_1_=
MODFREQ);
> +       KUNIT_EXPECT_EQ(test, ctx->clk1.sscs.spread_bp, ASSIGNED_SSCS_1_S=
PREAD);
> +       KUNIT_EXPECT_EQ(test, ctx->clk1.sscs.method, ASSIGNED_SSCS_1_METH=
OD);
>  }
> =20
>  static void clk_assigned_rates_skips(struct kunit *test)
> @@ -3222,6 +3251,19 @@ static void clk_assigned_rates_skips(struct kunit =
*test)
>         KUNIT_EXPECT_EQ(test, ctx->clk0.rate, test_param->rate0);
>  }
> =20
> +static void clk_assigned_sscs_skips(struct kunit *test)
> +{
> +       struct clk_assigned_rates_context *ctx =3D test->priv;
> +       const struct clk_assigned_rates_test_param *test_param =3D test->=
param_value;
> +
> +       KUNIT_EXPECT_NE(test, ctx->clk0.sscs.modfreq_hz, ASSIGNED_SSCS_0_=
MODFREQ);
> +       KUNIT_EXPECT_NE(test, ctx->clk0.sscs.spread_bp, ASSIGNED_SSCS_0_S=
PREAD);
> +       KUNIT_EXPECT_NE(test, ctx->clk0.sscs.method, ASSIGNED_SSCS_0_METH=
OD);
> +       KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.modfreq_hz, test_param->sscs=
.modfreq_hz);
> +       KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.spread_bp, test_param->sscs.=
spread_bp);
> +       KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.method, test_param->sscs.met=
hod);
> +}
> +
>  OF_OVERLAY_DECLARE(kunit_clk_assigned_rates_one);
>  OF_OVERLAY_DECLARE(kunit_clk_assigned_rates_one_consumer);
>  OF_OVERLAY_DECLARE(kunit_clk_assigned_rates_u64_one);
> @@ -3384,6 +3426,77 @@ KUNIT_ARRAY_PARAM_DESC(clk_assigned_rates_skips,
>                        clk_assigned_rates_skips_test_params,
>                        desc)
> =20
> +OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_without);
> +OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_without_consumer);
> +OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_zero);
> +OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_zero_consumer);
> +OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_null);
> +OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_null_consumer);
> +
> +/* Test cases that skip changing the sscs due to malformed DT */
> +static const struct clk_assigned_rates_test_param clk_assigned_sscs_skip=
s_test_params[] =3D {
> +       {
> +               /*
> +                * Test that an assigned-clock-sscs property without an a=
ssigned-clocks
> +                * property fails when the property is in the provider.
> +                */
> +               .desc =3D "provider missing assigned-clocks",
> +               TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_without),
> +               .sscs =3D {50000, 60000, 3},
> +       },
> +       {
> +               /*
> +                * Test that an assigned-clock-rates property without an =
assigned-clocks

It is?

> +                * property fails when the property is in the consumer.
> +                */
> +               .desc =3D "consumer missing assigned-clocks",
> +               TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_without_consum=
er),
> +               .sscs =3D {50000, 60000, 3},
> +               .consumer_test =3D true,
> +       },
> +       {
> +               /*
> +                * Test that an assigned-clock-rates property of zero doe=
sn't

Typo?

> +                * set a rate when the property is in the provider.
> +                */
> +               .desc =3D "provider assigned-clock-sscs of zero",
> +               TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_zero),
> +               .sscs =3D {50000, 60000, 3},
> +       },
> +       {
> +               /*
> +                * Test that an assigned-clock-rates property of zero doe=
sn't
> +                * set a rate when the property is in the consumer.
> +                */
> +               .desc =3D "consumer assigned-clock-sscs of zero",
> +               TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_zero_consumer),
> +               .sscs =3D {50000, 60000, 3},
> +               .consumer_test =3D true,
> +       },
> +       {
> +               /*
> +                * Test that an assigned-clocks property with a null phan=
dle
> +                * doesn't set a rate when the property is in the provide=
r.
> +                */
> +               .desc =3D "provider assigned-clocks null phandle",
> +               TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_null),
> +               .sscs =3D {50000, 60000, 3},
> +       },
> +       {
> +               /*
> +                * Test that an assigned-clocks property with a null phan=
dle
> +                * doesn't set a rate when the property is in the consume=
r.

None of these comments are correct.

> +                */
> +               .desc =3D "provider assigned-clocks null phandle",
> +               TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_null_consumer),
> +               .sscs =3D {50000, 60000, 3},
> +               .consumer_test =3D true,
> +       },
> +};
> +KUNIT_ARRAY_PARAM_DESC(clk_assigned_sscs_skips,
> +                      clk_assigned_sscs_skips_test_params,
> +                      desc)
> +
>  static struct kunit_case clk_assigned_rates_test_cases[] =3D {
>         KUNIT_CASE_PARAM(clk_assigned_rates_assigns_one,
>                          clk_assigned_rates_assigns_one_gen_params),
> @@ -3391,6 +3504,8 @@ static struct kunit_case clk_assigned_rates_test_ca=
ses[] =3D {
>                          clk_assigned_rates_assigns_multiple_gen_params),
>         KUNIT_CASE_PARAM(clk_assigned_rates_skips,
>                          clk_assigned_rates_skips_gen_params),
> +       KUNIT_CASE_PARAM(clk_assigned_sscs_skips,
> +                        clk_assigned_sscs_skips_gen_params),
>         {}
>  };

Instead of adding on another case just copy the entire thing,
kunit_case, test_params, etc. and implement the tests you want. Test
code is the opposite of DRY (DAMP?) so don't be afraid to just copy a
bunch of stuff. The reason why that is encouraged is because existing
tests are unchanged, and we don't have to worry that this patch breaks
the existing tests. It also helps the reviewer see the whole picture
because all the test code is in the patch instead of in the context.

For example, clk_assigned_rates_assigns_multiple() is saying that a
clock-assigned-rates property with multiple rates assigns multiple
rates. It's not supposed to be testing ssc. Don't modify it.
