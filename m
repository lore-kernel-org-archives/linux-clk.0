Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863865;
	b=ogoV6J31C5zRFRNPYQicIXQ+Ftgz9HC0JmZd2f3IHpB5yHbY+vIuFYV9uBkoplmw+8ep
	 TTxAz0r5RElqQuXbOtMcz0FmlqzRpz/M706A3RMnwdKMJFbGXEt3K4/kwGse637/hNAAm
	 qa1Zb4QPHniq8CmYiWygL58IEjziGBff4GQ0BLcmXeSzuR/OrdCILf9aPsdLK6t795MY0
	 Poc48wRPqgaoRBNubS/nw+pBOtXJP2kDOaPzR3OK67dYYldtSVPvhfjVzds48+YrZd3ti
	 5uInhUakk+SBla0QfcuAwR1RkzdZbV1QtWlHvsuoL9OiA0iuynP8KKlxYPz5Klha70w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863865;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=2ReSCqiYRzhcY8pvK0Xw+Betyxrde4Jd2Azo5nXUksQ=;
	b=PDMpCKXa/x7V+FMujAURVKeGy3wyFSSVp5oH0dQcgPTxQq7jJhFXikG+ykltUU0G8w3b
	 YGRYsszNHyGHLfcm8BSUpurHndc5XURvQlNQBYAS7C6MR9rE4ozxJdFtJgJHRg+Bs/Hz/
	 uiqv+3qxAwFUGXJnGgv53kyFkAIquI1cyQcE/tR7BbV7ntJ3RRc7fbbnYPFi/u8voImuH
	 B45KHPNnPjv1CfyKp/Osulkf0aELfXOK9LisZinQcPJjZ3J2TsAydA+GR1Awgo7MJHCCP
	 FyERsJjrUNbUfMgJ8QCKNk1RNV5vVISqPQei89jom+iXiowKTtwil/gpFhiSwX6lliQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAqPZhPr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE8A606A8AF;
	Mon, 16 Nov 2026 21:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAqPZhPr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D55D1F000C4;
	Mon, 16 Nov 2026 21:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794863865;
	bh=2ReSCqiYRzhcY8pvK0Xw+Betyxrde4Jd2Azo5nXUksQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=KAqPZhPrmsBKWuIiqJN1F+M1GHtk1ssOgzfXjTLC0tlt0GpOdLWZWMyBCoKQ+voRW
	 C6IttYzSmfplRWcmvNzLsOBQdSsSDfEMyDxs1jDFdjgbjW5dBnIrcc7uKinitbwX0B
	 pfXLG9ipTibJlw1cAY8LAdRblfRQ2d8wpOmlgZpH7xwFSrDMuempTtnqYZ9lOSM1Ri
	 4T4L5fFH32v02VulKuovK3sI1rnaNxBZC5KRaA9JQNVUx8eIhnJNaHqq2TVGwxzNQl
	 EAwwIXt0QT10axh5ldIZ+2pwbd8uXR95KXGOlV0Cj5gqzAxCKvxCpozwWymFfGmthZ
	 sur+G7+aOT1/w==
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
Subject: Re: [PATCH v2 3/3] clk: divider: test: Add tests for rates above
 4.29 GHz
From: Brian Masney <masneyb@kernel.org>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Maxime Coquelin <maxime.coquelin@st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Michael Turquette <mturquette@linaro.org>, 
 Stephen Boyd <sboyd@codeaurora.org>, 
 David Laight <david.laight.linux@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261112-upstream-clk-divider-large-rates-v2-3-18f3bb888b0c@baylibre.com>
References: <20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com>
 <20261112-upstream-clk-divider-large-rates-v2-3-18f3bb888b0c@baylibre.com>
Date: Mon, 16 Nov 2026 16:17:29 -0500
Message-Id: <179486384988.178014.2005904014802633024.b4-review@b4>
X-Mailer: b4 0.17-dev-ca76d
X-Developer-Signature: v=1; a=openpgp-sha256; l=6900; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=24d0H8IdgJNfzYkVAabDUA1qkyDheb37yRCBM/6wePg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ+F70Xe/pD0+qcQ5Cbt9Fzn4l/ygzq/FI7XU1bPkXd6
 9I3+6bbUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwES+FDIyTDM59vfz7K06k77I
 vWb95njn+ptXM/XqnIt/el4z15XicGT4K9F2tuJO0RKh9D2sj68aXA+fLd2ms2ifqqU5m/6DCfU
 9TAA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Carlo,

> On 64-bit platforms, the divider truncated rates above 4.29 GHz when
> computing a divisor.
> 
> Add tests rounding and setting such rates on a divider with a 6 GHz
> parent, one for each divisor computation, and rounding the maximum rate
> (ULONG_MAX). They are skipped on 32-bit platforms, where rates cannot
> exceed 4.29 GHz. Also test round-closest dividers above their parent
> rate.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  drivers/clk/clk-divider_test.c | 244 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 242 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_test.c
> index 8ee1614128d0..734cbdad55dd 100644
> --- a/drivers/clk/clk-divider_test.c
> +++ b/drivers/clk/clk-divider_test.c
> @@ -1,16 +1,20 @@
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
> +#define PARENT_RATE_10GHZ	(10 * GIGA)
>  
>  KUNIT_DEFINE_ACTION_WRAPPER(clk_hw_unregister_fixed_rate_wrapper,
>  			    clk_hw_unregister_fixed_rate, struct clk_hw *);
> @@ -147,7 +151,243 @@ static struct kunit_suite clk_divider_bestdiv_test_suite = {
>  	.test_cases = clk_divider_bestdiv_test_cases,
>  };
>  
> -kunit_test_suite(clk_divider_bestdiv_test_suite);
> +/*
> + * Register a fixed-rate parent at @parent_rate and a 3-bit divider (/1 to
> + * /8) using @fake_reg as its register.
> + */
> +static struct clk_hw *clk_divider_large_rate_init(struct kunit *test,
> +						  u32 *fake_reg,
> +						  unsigned long parent_rate,
> +						  unsigned long flags,
> +						  u8 div_flags)
> +{
> +	struct clk_hw *parent_hw, *div_hw;
> +
> +	if (BITS_PER_LONG < 64)
> +		kunit_skip(test, "rates above 4.29 GHz need a 64-bit unsigned long");
> +
> +	parent_hw = clk_hw_register_fixed_rate(NULL, "large-rate-parent",
> +					       NULL, 0, parent_rate);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_hw);
> +	KUNIT_ASSERT_EQ(test, 0,
> +			kunit_add_action_or_reset(test, clk_hw_unregister_fixed_rate_wrapper,
> +						  parent_hw));
> +
> +	div_hw = clk_hw_register_divider(NULL, "large-rate-div",
> +					 "large-rate-parent", flags,
> +					 (void __iomem __force *)fake_reg,
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
> +	div_hw = clk_divider_large_rate_init(test, fake_reg, PARENT_RATE_6GHZ,
> +					     0, 0);
> +
> +	KUNIT_EXPECT_EQ(test, clk_hw_round_rate(div_hw, PARENT_RATE_6GHZ),

clk_core_round_rate_nolock() has an lockdep_assert_held() on the clk
prepare lock. You can use clk_hw_get_clk_kunit() and clk_round_rate() to
fix this.

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
> +	div_hw = clk_divider_large_rate_init(test, fake_reg, PARENT_RATE_6GHZ,
> +					     0, CLK_DIVIDER_ROUND_CLOSEST);
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
> +	div_hw = clk_divider_large_rate_init(test, fake_reg, PARENT_RATE_6GHZ,
> +					     CLK_SET_RATE_PARENT, 0);
> +	clk = clk_hw_get_clk_kunit(test, div_hw, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, clk);
> +
> +	KUNIT_ASSERT_EQ(test, clk_set_rate(clk, PARENT_RATE_6GHZ), 0);
> +	KUNIT_EXPECT_EQ(test, clk_get_rate(clk), PARENT_RATE_6GHZ);
> +	KUNIT_EXPECT_EQ(test, *fake_reg, 0);
> +}
> +
> +/*
> + * Round ULONG_MAX, the usual way to ask for the maximum rate, on a divider
> + * with a @parent_rate parent: it must return the parent rate.
> + */
> +static void clk_divider_large_rate_check_max(struct kunit *test,
> +					     unsigned long parent_rate,
> +					     u8 div_flags)
> +{
> +	struct clk_hw *div_hw;
> +	u32 *fake_reg;
> +
> +	fake_reg = kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
> +
> +	div_hw = clk_divider_large_rate_init(test, fake_reg, parent_rate, 0,
> +					     div_flags);
> +
> +	KUNIT_EXPECT_EQ(test, clk_hw_round_rate(div_hw, ULONG_MAX), parent_rate);
> +}
> +
> +static void clk_divider_large_rate_round_max(struct kunit *test)
> +{
> +	clk_divider_large_rate_check_max(test, PARENT_RATE_6GHZ, 0);
> +}
> +
> +/* Same with a parent more than twice the 32-bit limit */
> +static void clk_divider_large_rate_round_max_10ghz(struct kunit *test)
> +{
> +	clk_divider_large_rate_check_max(test, PARENT_RATE_10GHZ, 0);
> +}
> +
> +/* Same with CLK_DIVIDER_ROUND_CLOSEST */
> +static void clk_divider_large_rate_round_max_closest(struct kunit *test)
> +{
> +	clk_divider_large_rate_check_max(test, PARENT_RATE_6GHZ,
> +					 CLK_DIVIDER_ROUND_CLOSEST);
> +}
> +
> +/* Same with CLK_DIVIDER_POWER_OF_TWO and a 1 GHz parent */
> +static void clk_divider_large_rate_round_max_pow2(struct kunit *test)
> +{
> +	clk_divider_large_rate_check_max(test, PARENT_RATE_1GHZ,
> +					 CLK_DIVIDER_POWER_OF_TWO);

This test is skipped on 32-bit platforms, and could run there.

Brian

-- 
Brian Masney <masneyb@kernel.org>
