Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A8D18A6A7;
	Fri, 17 Jan 2025 16:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737129978; cv=none; b=Dr1Rl8QkweatLlsVzYPs5UjOave/LbpeZnw2zjRwHwonnw+Dub7rd0w4qA2Ffw2Q6dX+DsqBt4QYwCpQQlK5nBvlbrqmas1Mjyi9BOAzbQetHJGYXThiWSSh5Z6gJX4qZ1UTHkIj1zxXebLVPsxP5TwRtVs0j5czfKJhfrNl51Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737129978; c=relaxed/simple;
	bh=DyQ+mwDm/HCyhYzaFSV8STpG5LVsNiT8WNZvA4ejKSQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=K244dTMNTZfaZFnt5tZB8wM4IMH703aLa9sevdOS7a42E4sFhTMzz1k7yODwUqRmKaU0/EkOb1c/y80cqTpYcQwktwGshf2BOVkxxanmFIT0Cjldok6J4TDO8e//CKxHkAyCUVoABenWM2ug/Uv1SSNbOxQDans8EszZFcPa3dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2IQkPxf; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2IQkPxf"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa6c0d1833eso453465366b.1;
        Fri, 17 Jan 2025 08:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737129975; x=1737734775; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1tWIOeqFhQsNAse8col4KN+L/njYkn0cnkMeGeZdV4=;
        b=H2IQkPxfBil8M3kCOL/aIjK8p+oVXO0mDFGc+1M/mERTDUdT0zYifuqS2jUX4lnKwX
         /sLXloymjuynN4M7Id8r3qsTOojiu8keGiit1vfK3bmRABy6PyQkpAQY9UPD4vBmV/Jx
         ZuFzpXMOt0RQuWGXm9D4Qo+2hVomON3S4w+ovba1TRJFhi6bsQ96u93Sk8U3zfysQqGk
         rle2tMEoE5mhdC9LBUGlPgAKDDOjrS1+Ly+3FcQjUaJRTqn1UObg2YcxacR/YT1FIEPO
         zE4TSeLgu/uxILb+I19UNBYphib/s3685y0cCzA/RlrPEuYSCq2Dy2oDzKDqfxYQr29d
         R/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129975; x=1737734775;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1tWIOeqFhQsNAse8col4KN+L/njYkn0cnkMeGeZdV4=;
        b=H5DerCRNWjRdx3aSZwYk8Y4qIPYqNIxNl5aU5qf+6sdYVNsiVPlrccsQn05B/JOo07
         OpG+v2nyUENsuoUORGa1BfQJ9VCzivYD0rSk41EDCQzE3hNzeF8Q/6EsR51+1693jY8C
         u47peQfA/9syQnvCpJs9/JiwImNx6AUoew8Eb9nljkmchgVM1p17HL6Twi/xjwvvToMI
         L8hXX9njG14dhn+K3QWSkSAtoLro0U5UIy2a0LMbq+kr68j6x7qYhRwnggw0DVXMbVpK
         pYMCHSNAPRlMJdUxt+ejM7enWwe2+hhM66yJbT40XutodB87m+A8TelcPkNMDbYpuXSt
         CBeA==
X-Forwarded-Encrypted: i=1; AJvYcCWFNnlZJEN2ikb6VNdtBovNwYmEUg7Gor8LaVMDZqwLqtIK8Mw+Javdeaujy/nROmMgU1KQW3SOO78=@vger.kernel.org, AJvYcCXCUkjvljDRsessTVwY94pHAzN9g4jqLwS9i8r0YdXUUmo1YT/kuNby2FF/MU7Y9cuq1E9OumnYEuTXrVd2@vger.kernel.org
X-Gm-Message-State: AOJu0YylCPXsPb5/5jSTTVNBT59ss7J6hFoOV0RHNzxIzPOkSm83ASVG
	FpygfmF55ofQWqiZsuyPhvtyuYsWlOCs7nAMJdEaiKkua7amfbTLi+ko/ZXR
X-Gm-Gg: ASbGnctOmItW2FZ7C0xKqVRmfpstrj3vnYFp+fmh4T1qjuAWKGujNQpaJCSFLHz75uk
	5ac6FTfU7M+PaiEwlE9+cW9uEZMLtJG0IPvdCP4W/omRbqdhXXpQrkBSM9+474HA2EtLj8KOFnj
	NWKYm6ZM8vXNh162M1KwWInR6/ZcoWBaC0Uxc0cvnQCLBJAQVU5PGLcMrtvYvSKr1zNe8yfL80C
	a/dGTN2159wJ8NR8o2pThz0iU40ERVtYNsXnKqcCr6R5WsGqsQW+JaD5WCQQ9xAuTU/JBvVxLMq
	0fM=
X-Google-Smtp-Source: AGHT+IHbt+Z/r3WUfQtHdL+9uAFCrwgVIV3/2Vuom9Jdp1KWpMp8IiZh03E8i55lSSQ96DOAx16s0g==
X-Received: by 2002:a17:907:72c6:b0:aa6:9624:78f1 with SMTP id a640c23a62f3a-ab38b1e5800mr355722466b.9.1737129974550;
        Fri, 17 Jan 2025 08:06:14 -0800 (PST)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd90csm188578866b.181.2025.01.17.08.06.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jan 2025 08:06:14 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH v2 1/4] clk: add a clk_hw helpers to get the clock device
 or device_node
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20250117-amlogic-clk-drop-clk-regmap-tables-v2-1-d1f77cb0773e@baylibre.com>
Date: Fri, 17 Jan 2025 20:05:59 +0400
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <89059AAC-309E-4BD7-A6DE-63AEAFF3E045@gmail.com>
References: <20250117-amlogic-clk-drop-clk-regmap-tables-v2-0-d1f77cb0773e@baylibre.com>
 <20250117-amlogic-clk-drop-clk-regmap-tables-v2-1-d1f77cb0773e@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: Apple Mail (2.3826.200.121)

> On 17 Jan 2025, at 7:58=E2=80=AFpm, Jerome Brunet =
<jbrunet@baylibre.com> wrote:
>=20
> Add helpers to get the device or device_node associated with clk_hw.
>=20
> This can be used by clock drivers to access various device related
> functionality such as devres, dev_ prints, etc ...
>=20
> Add test for these new helpers in clk-test.
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> drivers/clk/Makefile                    |   1 +
> drivers/clk/clk.c                       |  33 +++++++++
> drivers/clk/clk_test.c                  | 116 =
+++++++++++++++++++++++++++-----
> drivers/clk/kunit_clk_dummy_device.dtso |  10 +++
> include/linux/clk-provider.h            |   2 +
> 5 files changed, 145 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index =
bf4bd45adc3a0ed8c9dc699c76f303dc91b524c4..b38ec888a449249340cd1ef147a77436=
1558af3c 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -18,6 +18,7 @@ clk-test-y :=3D clk_test.o \
>   kunit_clk_assigned_rates_without_consumer.dtbo.o \
>   kunit_clk_assigned_rates_zero.dtbo.o \
>   kunit_clk_assigned_rates_zero_consumer.dtbo.o \
> +   kunit_clk_dummy_device.dtbo.o \
>   kunit_clk_parent_data_test.dtbo.o
> obj-$(CONFIG_COMMON_CLK) +=3D clk-divider.o
> obj-$(CONFIG_COMMON_CLK) +=3D clk-fixed-factor.o
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index =
9b45fa005030f56e1478b9742715ebcde898133f..726f63ecc3758538a75dc4e7b3783ccf=
66029db1 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -365,6 +365,39 @@ const char *clk_hw_get_name(const struct clk_hw =
*hw)
> }
> EXPORT_SYMBOL_GPL(clk_hw_get_name);
>=20
> +/**
> + * clk_hw_get_dev - get device from an hardware clock.
> + * @hw: the clk_hw pointer to get the struct device from
> + *
> + * This is an helper to get the struct device associated with an =
hardware
> + * clock. Some clock, such as with early clock constroller, may not =
be
> + * associated with any struct device.

This is a helper to get the struct device associated with a hardware
clock. Some clocks, such as with early clock controller, may not be
associated with any struct device.

^ still not sure about =E2=80=98such as with early clock controller=E2=80=99=
 but some
other typo=E2=80=99s corrected.

> + *
> + * Return: the struct device associated with the clock, or NULL if =
there
> + * is none.
> + */
> +struct device *clk_hw_get_dev(const struct clk_hw *hw)
> +{
> + return hw->core->dev;
> +}
> +EXPORT_SYMBOL_GPL(clk_hw_get_dev);
> +
> +/**
> + * clk_hw_get_of_node - get device_node from an hardware clock.
> + * @hw: the clk_hw pointer to get the struct device_node from

get device_node from a hardware clock.

> + *
> + * This is an helper to get the struct device_node associated with an

This is a helper

> + * hardware clock.
> + *
> + * Return: the struct device associated with the clock, or NULL if =
there
> + * is none.
> + */
> +struct device_node *clk_hw_get_of_node(const struct clk_hw *hw)
> +{
> + return hw->core->of_node;
> +}
> +EXPORT_SYMBOL_GPL(clk_hw_get_of_node);
> +
> struct clk_hw *__clk_get_hw(struct clk *clk)
> {
> return !clk ? NULL : clk->core->hw;
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index =
f08feeaa3750bc86859294650de298762dea690a..4dcdde283598b7f940c653ebc0d5a5f4=
c27637a2 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -2794,43 +2794,40 @@ static struct kunit_suite =
clk_register_clk_parent_data_of_suite =3D {
> };
>=20
> /**
> - * struct clk_register_clk_parent_data_device_ctx - Context for =
clk_parent_data device tests
> + * struct clk_register_device_ctx - Context for clock device tests
>  * @dev: device of clk under test
>  * @hw: clk_hw for clk under test
>  * @pdrv: driver to attach to find @dev
>  */
> -struct clk_register_clk_parent_data_device_ctx {
> +struct clk_register_device_ctx {
> struct device *dev;
> struct clk_hw hw;
> struct platform_driver pdrv;
> };
>=20
> -static inline struct clk_register_clk_parent_data_device_ctx *
> -clk_register_clk_parent_data_driver_to_test_context(struct =
platform_device *pdev)
> +static inline struct clk_register_device_ctx *
> +clk_register_device_to_test_context(struct platform_device *pdev)
> {
> return container_of(to_platform_driver(pdev->dev.driver),
> -    struct clk_register_clk_parent_data_device_ctx, pdrv);
> +    struct clk_register_device_ctx, pdrv);
> }
>=20
> -static int clk_register_clk_parent_data_device_probe(struct =
platform_device *pdev)
> +static int clk_register_device_probe(struct platform_device *pdev)
> {
> - struct clk_register_clk_parent_data_device_ctx *ctx;
> + struct clk_register_device_ctx *ctx;
>=20
> - ctx =3D clk_register_clk_parent_data_driver_to_test_context(pdev);
> + ctx =3D clk_register_device_to_test_context(pdev);
> ctx->dev =3D &pdev->dev;
>=20
> return 0;
> }
>=20
> -static void clk_register_clk_parent_data_device_driver(struct kunit =
*test)
> +static void clk_register_of_device_driver(struct kunit *test,
> +  const struct of_device_id *match_table)
> {
> - struct clk_register_clk_parent_data_device_ctx *ctx =3D test->priv;
> - static const struct of_device_id match_table[] =3D {
> - { .compatible =3D "test,clk-parent-data" },
> - { }
> - };
> + struct clk_register_device_ctx *ctx =3D test->priv;
>=20
> - ctx->pdrv.probe =3D clk_register_clk_parent_data_device_probe;
> + ctx->pdrv.probe =3D clk_register_device_probe;
> ctx->pdrv.driver.of_match_table =3D match_table;
> ctx->pdrv.driver.name =3D __func__;
> ctx->pdrv.driver.owner =3D THIS_MODULE;
> @@ -2839,6 +2836,16 @@ static void =
clk_register_clk_parent_data_device_driver(struct kunit *test)
> KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->dev);
> }
>=20
> +static void clk_register_clk_parent_data_device_driver(struct kunit =
*test)
> +{
> + static const struct of_device_id match_table[] =3D {
> + { .compatible =3D "test,clk-parent-data" },
> + { }
> + };
> +
> + clk_register_of_device_driver(test, match_table);
> +}
> +
> static const struct clk_register_clk_parent_data_test_case
> clk_register_clk_parent_data_device_cases[] =3D {
> {
> @@ -2909,7 +2916,7 @@ =
KUNIT_ARRAY_PARAM(clk_register_clk_parent_data_device_test,
>  */
> static void clk_register_clk_parent_data_device_test(struct kunit =
*test)
> {
> - struct clk_register_clk_parent_data_device_ctx *ctx;
> + struct clk_register_device_ctx *ctx;
> const struct clk_register_clk_parent_data_test_case *test_param;
> struct clk_hw *parent_hw;
> struct clk_init_data init =3D { };
> @@ -3016,7 +3023,7 @@ =
KUNIT_ARRAY_PARAM(clk_register_clk_parent_data_device_hw_test,
>  */
> static void clk_register_clk_parent_data_device_hw_test(struct kunit =
*test)
> {
> - struct clk_register_clk_parent_data_device_ctx *ctx;
> + struct clk_register_device_ctx *ctx;
> const struct clk_register_clk_parent_data_test_case *test_param;
> struct clk_dummy_context *parent;
> struct clk_hw *parent_hw;
> @@ -3077,6 +3084,80 @@ static struct kunit_suite =
clk_register_clk_parent_data_device_suite =3D {
> .test_cases =3D clk_register_clk_parent_data_device_test_cases,
> };
>=20
> +static void clk_register_dummy_device_driver(struct kunit *test)
> +{
> + static const struct of_device_id match_table[] =3D {
> + { .compatible =3D "test,clk-dummy-device" },
> + { }
> + };
> +
> + clk_register_of_device_driver(test, match_table);
> +}
> +
> +/*
> + * Test that a clk registered with a struct device can provide back =
the
> + * struct device it was registered with.
> + */
> +static void clk_hw_get_dev_test(struct kunit *test)
> +{
> + struct clk_register_device_ctx *ctx;
> +
> + ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> + KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> + test->priv =3D ctx;
> +
> + clk_register_dummy_device_driver(test);
> + ctx->hw.init =3D CLK_HW_INIT_NO_PARENT("test_get_dev",
> +     &clk_dummy_rate_ops, 0);
> +
> + KUNIT_ASSERT_EQ(test, 0, clk_hw_register_kunit(test, ctx->dev, =
&ctx->hw));
> + KUNIT_EXPECT_PTR_EQ(test, ctx->dev, clk_hw_get_dev(&ctx->hw));
> +}
> +
> +/*
> + * Test that a clk registered with a struct device_node can provide =
back the
> + * struct device_node it was registered with.
> + */
> +static void clk_hw_get_of_node_test(struct kunit *test)
> +{
> + struct device_node *np;
> + struct clk_hw *hw;
> +
> + hw =3D kunit_kzalloc(test, sizeof(*hw), GFP_KERNEL);
> + KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
> +
> + np =3D of_find_compatible_node(NULL, NULL, "test,clk-dummy-device");
> + hw->init =3D CLK_HW_INIT_NO_PARENT("test_get_of_node",
> + &clk_dummy_rate_ops, 0);
> + of_node_put_kunit(test, np);
> +
> + KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, np, hw));
> + KUNIT_EXPECT_PTR_EQ(test, np, clk_hw_get_of_node(hw));
> +}
> +
> +static struct kunit_case clk_hw_test_cases[] =3D {
> + KUNIT_CASE(clk_hw_get_dev_test),
> + KUNIT_CASE(clk_hw_get_of_node_test),
> + {}
> +};
> +
> +static int clk_hw_test_init(struct kunit *test)
> +{
> + KUNIT_ASSERT_EQ(test, 0,
> + of_overlay_apply_kunit(test, kunit_clk_dummy_device));
> +
> + return 0;
> +}
> +
> +/*
> + * Test suite to verify the sanity clk_hw helper functions.
> + */
> +static struct kunit_suite clk_hw_test_suite =3D {
> + .name =3D "clk_hw_test_suite",
> + .init =3D clk_hw_test_init,
> + .test_cases =3D clk_hw_test_cases,
> +};
> +
> struct clk_assigned_rates_context {
> struct clk_dummy_context clk0;
> struct clk_dummy_context clk1;
> @@ -3399,6 +3480,7 @@ kunit_test_suites(
> &clk_assigned_rates_suite,
> &clk_leaf_mux_set_rate_parent_test_suite,
> &clk_test_suite,
> + &clk_hw_test_suite,
> &clk_multiple_parents_mux_test_suite,
> &clk_mux_no_reparent_test_suite,
> &clk_mux_notifier_test_suite,
> diff --git a/drivers/clk/kunit_clk_dummy_device.dtso =
b/drivers/clk/kunit_clk_dummy_device.dtso
> new file mode 100644
> index =
0000000000000000000000000000000000000000..5cc89aa11264428b09e47fd29c5f9ecf=
b8c32fdd
> --- /dev/null
> +++ b/drivers/clk/kunit_clk_dummy_device.dtso
> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> + kunit-clock-controller {
> + compatible =3D "test,clk-dummy-device";
> + #clock-cells =3D <0>;
> + };
> +};
> diff --git a/include/linux/clk-provider.h =
b/include/linux/clk-provider.h
> index =
2e6e603b749342931c0d0693c3e72b62c000791b..83852346a32beae919d223f30cb88baa=
4b2fd62b 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -1360,6 +1360,8 @@ void clk_hw_unregister(struct clk_hw *hw);
> /* helper functions */
> const char *__clk_get_name(const struct clk *clk);
> const char *clk_hw_get_name(const struct clk_hw *hw);
> +struct device *clk_hw_get_dev(const struct clk_hw *hw);
> +struct device_node *clk_hw_get_of_node(const struct clk_hw *hw);
> #ifdef CONFIG_COMMON_CLK
> struct clk_hw *__clk_get_hw(struct clk *clk);
> #else
>=20
> --=20
> 2.45.2
>=20
>=20
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

Christian

