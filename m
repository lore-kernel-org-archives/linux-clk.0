Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829134;
	b=llMKhBktyFXJChyHVgXOf3di9KVWxqdpf2x4siN6sw9yT5OxtC7Ak8SruCVC+PlQN/Hh
	 qqrz/mk3qUpUzpyiWIy7VpvEFd4iRC8YxUakDRbuAGjs7LoaOC7ObbtvSeBpnWMlXaubw
	 OstAD4LO/1+tNn/7bsbgnU04hZyx06VXSqX/IcFeP2seLdX7cCvNJWmWCdTTkM0Kyy/YI
	 wkLxU6tsQyUzRkJbq58qtY2tnlp5NV6epVCqKeS6qWAQ7ygyyRVM3KcOEr5VF6yml0Fca
	 vJleI+uWmh0rT/cep3C6cvk3+YxZn+CgyKrhdBVKl5JZ1lUvTZaOQZh40DOfqmTb9nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829134;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=NNAX7oeewr0DTDjzuu1E2uxLIHv2V3iqMdDbGeZw588=;
	b=c8LYSPzFX5N2h8tq8vLSra511czJhNCsFa7zsShUE1tcIsngOyvRBh9HKg/QiWNf0zvW
	 LVTGD8zB0dY6gPUQgNsGw/yF2q0WJe+9+tN5nOlU6r2EHk9sxDQwWDwpqUZanyyYdyie8
	 +VNKncv4FTvfhQMtFAuaR6WT1Ry77phVnAgx0U0PcFrEQYfDrAYQ69nTah/wPIs8Xx3Yy
	 snP/T0UXNsAzoZdmiFwb8veYujEI/x3sgrifRN7laCFyfVYiTejbxUphbxZ2FoKMwnfj/
	 5JEIU92WdyY6R1NKxELJg35n9S1Bcx1UXEEZMdGGdT49GfrS8FIpbMw/Jbcu4U2fLzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YrC92/K0";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BC9607350D;
	Wed,  4 Nov 2026 21:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YrC92/K0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772CC1F00A15;
	Wed,  4 Nov 2026 21:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793829133;
	bh=NNAX7oeewr0DTDjzuu1E2uxLIHv2V3iqMdDbGeZw588=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=YrC92/K0ISl/UJ+QgFOimlNsMrf4mDetACtHRUYGgJkV25M1yKzs+Md+WPKe0MVtR
	 jjtMR3OeAwEeqTv/uxW6KZtjtzbUcEJwD1tItnUvH/EooeChDCWAXFWXrxI0YKzCt2
	 GURBkCVeq2wVCOSN7ysBndinkjc8EeCk17u+1nSf6DBkJEeD5rtxNLN+PyGS5JVuKi
	 jkiubvNXZT9aa0iInX0gVh5pDa0IUdfMX8xMMJpq+ct9dw1VN4ujJpvIbvU0/v24G0
	 twA2PR0FoEcryj/CQB/NM3x3yef+Z0sAngSAKo5tn5olQx/A8X3IMLFPw47Ij8U9Sb
	 abBW/9b2sytdw==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] clk: divider: test: Add tests for rates above 4.29
 GHz
From: Brian Masney <masneyb@kernel.org>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Brian Norris <briannorris@chromium.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 David Laight <david.laight.linux@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261102-upstream-clk-divider-large-rates-v1-2-eb17035bfad2@baylibre.com>
References: <20261102-upstream-clk-divider-large-rates-v1-0-eb17035bfad2@baylibre.com>
 <20261102-upstream-clk-divider-large-rates-v1-2-eb17035bfad2@baylibre.com>
Date: Wed, 04 Nov 2026 16:52:04 -0500
Message-Id: <179382912410.620422.8437245756684753979.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=5422; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=BlvgzkmmHaIMjL/WEBpsqMmxjbC1px3hKG+/QiYl+DQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJer2QP+Pep6frugzG9Ng1L2ZLfm0Sv6rAK1rBKmrJw9
 87GE39OdpSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCR+hKGf9YKF0yerNjfxXdq
 78GPPP2tus8DZd1cj1699EItY9mR+ZsYGZ677ZwTdP6M9tSsxebCzp8Y7Tu28Wt9SMv1l/wfKrL
 Vhh0A
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Carlo,

> On 64-bit platforms, the divider truncated rates above 4.29 GHz when
> computing a divisor.
> 
> Add tests rounding and setting such rates on a divider with a 6 GHz
> parent, one for each divisor computation. They are skipped on 32-bit
> platforms, where rates cannot exceed 4.29 GHz.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  drivers/clk/clk-divider_test.c | 117 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 115 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_test.c
> index 8ee1614128d0..fc96ac07ecff 100644
> --- a/drivers/clk/clk-divider_test.c
> +++ b/drivers/clk/clk-divider_test.c
> @@ -1,16 +1,19 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * KUnit tests for clk_divider_bestdiv()
> + * KUnit tests for clk divider
>   */
> +#include <kunit/clk.h>
>  #include <kunit/test.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
> +#include <linux/io.h>
>  #include <linux/limits.h>
>  #include <linux/units.h>
>  
>  #define PARENT_RATE_1GHZ	GIGA
>  #define PARENT_RATE_2GHZ	(2 * GIGA)
>  #define PARENT_RATE_4GHZ	(4 * GIGA)
> +#define PARENT_RATE_6GHZ	(6 * GIGA)
>  
>  KUNIT_DEFINE_ACTION_WRAPPER(clk_hw_unregister_fixed_rate_wrapper,
>  			    clk_hw_unregister_fixed_rate, struct clk_hw *);
> @@ -147,7 +150,117 @@ static struct kunit_suite clk_divider_bestdiv_test_suite = {
>  	.test_cases = clk_divider_bestdiv_test_cases,
>  };
>  
> -kunit_test_suite(clk_divider_bestdiv_test_suite);
> +/*
> + * Register a 6 GHz fixed-rate parent and a 3-bit divider (/1 to /8) using
> + * @fake_reg as its register.
> + */
> +static struct clk_hw *clk_divider_large_rate_init(struct kunit *test,
> +						  u32 *fake_reg,
> +						  unsigned long flags,
> +						  u8 div_flags)
> +{
> +	struct clk_hw *parent_hw, *div_hw;
> +
> +	if (BITS_PER_LONG < 64)
> +		kunit_skip(test, "rates above 4.29 GHz need a 64-bit unsigned long");
> +
> +	parent_hw = clk_hw_register_fixed_rate(NULL, "large-rate-parent",
> +					       NULL, 0, PARENT_RATE_6GHZ);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_hw);
> +	KUNIT_ASSERT_EQ(test, 0,
> +			kunit_add_action_or_reset(test, clk_hw_unregister_fixed_rate_wrapper,
> +						  parent_hw));
> +
> +	div_hw = clk_hw_register_divider(NULL, "large-rate-div",
> +					 "large-rate-parent", flags,
> +					 (void __iomem __force *)fake_reg,

The fake_reg causes issues on s390, and I see that CLK_DIVIDER_KUNIT_TEST
already excludes this test on that architecture, so we're good on that
front.

> +					 0, 3, div_flags, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
> +	KUNIT_ASSERT_EQ(test, 0,
> +			kunit_add_action_or_reset(test, clk_hw_unregister_divider_wrapper,
> +						  div_hw));
> +
> +	return div_hw;
> +}
> +
> +/*
> + * Test that rounding a rate above 4.29 GHz computes the divisor from the
> + * full rate: the parent rate needs /1.
> + */
> +static void clk_divider_large_rate_round_up(struct kunit *test)
> +{
> +	struct clk_hw *div_hw;
> +	u32 *fake_reg;
> +
> +	fake_reg = kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
> +
> +	div_hw = clk_divider_large_rate_init(test, fake_reg, 0, 0);
> +
> +	KUNIT_EXPECT_EQ(test, clk_hw_round_rate(div_hw, PARENT_RATE_6GHZ),
> +			PARENT_RATE_6GHZ);
> +}
> +
> +/*
> + * Same with CLK_DIVIDER_ROUND_CLOSEST: 4.4 GHz is closer to 3 GHz (/2) than
> + * to 6 GHz (/1).
> + */
> +static void clk_divider_large_rate_round_closest(struct kunit *test)
> +{
> +	struct clk_hw *div_hw;
> +	u32 *fake_reg;
> +
> +	fake_reg = kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
> +
> +	div_hw = clk_divider_large_rate_init(test, fake_reg, 0,
> +					     CLK_DIVIDER_ROUND_CLOSEST);
> +
> +	KUNIT_EXPECT_EQ(test, clk_hw_round_rate(div_hw, 4400 * MEGA),
> +			PARENT_RATE_6GHZ / 2);
> +}
> +
> +/*
> + * Test that setting a rate above 4.29 GHz programs the right divisor.
> + * With CLK_SET_RATE_PARENT the rounding searches the parent rates and
> + * finds /1, so this only checks the set_rate path.
> + */
> +static void clk_divider_large_rate_set_rate(struct kunit *test)
> +{
> +	struct clk_hw *div_hw;
> +	struct clk *clk;
> +	u32 *fake_reg;
> +
> +	fake_reg = kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
> +
> +	/* Start from /2 */
> +	writel(1, (void __iomem __force *)fake_reg);
> +
> +	div_hw = clk_divider_large_rate_init(test, fake_reg,
> +					     CLK_SET_RATE_PARENT, 0);
> +	clk = clk_hw_get_clk_kunit(test, div_hw, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, clk);
> +
> +	KUNIT_ASSERT_EQ(test, clk_set_rate(clk, PARENT_RATE_6GHZ), 0);
> +	KUNIT_EXPECT_EQ(test, clk_get_rate(clk), PARENT_RATE_6GHZ);
> +	KUNIT_EXPECT_EQ(test, *fake_reg, 0);
> +}
> +
> +static struct kunit_case clk_divider_large_rate_test_cases[] = {
> +	KUNIT_CASE(clk_divider_large_rate_round_up),
> +	KUNIT_CASE(clk_divider_large_rate_round_closest),
> +	KUNIT_CASE(clk_divider_large_rate_set_rate),

Would it be useful to add a test case for round max? A consumer may
want to request the maximum rate possible with:

    clk_round_rate(clk, ULONG_MAX);

Brian

-- 
Brian Masney <masneyb@kernel.org>
