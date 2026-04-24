Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6454A3246EF
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 19:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777059329; cv=none; b=i0LxnzuiOPeVxm4725RM64GrQokkbEeFmpkc8LY4zeVd8rWHuixJOR9cSUzlX14tAZdouFtOGmVkzJFL1Sw+14LooYJFvgHGiEkvO8andyNP7PANKYnRdaIvQZCwT6jP22n6+2czUaf+dp5RKMlPP6JshP1Tk7ytOev8qMMtb/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777059329; c=relaxed/simple;
	bh=8T2h/xXNxVMpGNLo4TJ2AaQXR3upn9cMcFlZih5hV6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYjZJWOCcMqFILgzUfqiDkuqPWo4uRNwZcC0yhg5buMf5vhp5XUC6rQsfaH5bVayYtVAGqpRSflKtEsErfW5VZqWxzw84y0iXF0FSd5MO+eRIt+KYEJFIDjhhWVpx2i0eqv7+P0CXatlEss857u7U+RzVDosz5JlBdMQYuljGQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cLyRl1n7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NR9mHbvy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cLyRl1n7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NR9mHbvy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777059326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rC1UcT5G0LjtrhKB5Hz3oEWFi7KPBAZMScKEUyovlfQ=;
	b=cLyRl1n7l3AX/alVprNBnqi5lZz/dZvvTEnV0QOptqt6hFH5UVb9LypnRvbPT2k1MQ+vFX
	qRub5oV1Ciscrd303luPGvwXMFQ66hyBRALtK5rluNuV0H/GU+jEShTY1XvsMIeGQGg9ip
	vAjbchZKpPQ4OcqlBrYkGQ/24fYtabg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-QJacwQQkNbW1BpG9yzJFdg-1; Fri, 24 Apr 2026 15:35:24 -0400
X-MC-Unique: QJacwQQkNbW1BpG9yzJFdg-1
X-Mimecast-MFC-AGG-ID: QJacwQQkNbW1BpG9yzJFdg_1777059324
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a16036c90eso205526786d6.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 12:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777059324; x=1777664124; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rC1UcT5G0LjtrhKB5Hz3oEWFi7KPBAZMScKEUyovlfQ=;
        b=NR9mHbvyNi+f0qSrfauFSqVJZc7pT2a46Hq1Qb6IW2CKradDBV8uJ1smkW8ALg2sFD
         ovlkqdq5MHvof0/3bnKlNf+1xIy++O3Oi5OVBNza/5mToAifvpCCmmAoSlamM8mXoqwA
         qp3oay+zKYQltIvfOjg6RcZWwTFYRMxJel1lIHXTiU58Pj4DBcAoYZGXlwQ8djFRsonh
         cOeaQoNZIO6pNpsJ1hSMqiKR+EVaNH/AIxkGxzOjeEEhCD6BDtl97kZrnAprFQOGbz9e
         ZYd2FgJ+5Iyr7KuHXyqT35Lqa8Jtt7HsD6QKipY54u5HuVORiFOMZz408Yg/5pO6PQQS
         jwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777059324; x=1777664124;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rC1UcT5G0LjtrhKB5Hz3oEWFi7KPBAZMScKEUyovlfQ=;
        b=VynZKfJj4r08ZS2gTwsXm8Cr8zQDy5pAbaLwJo9qrhIiRHGSPQGZOi9+Teg7kmnzCO
         9X+sngokCfmw2RlPTN7WHTjUEtqenfQ5dmz4NazYRJyiil8vz1tWKGnljKmVZ4vtZS/3
         S1ouRwHt7qIXG2kwlZbrp1I/NvxWoe9b0Ua+JBQxsQuvH9TD+DaCsp9R8m1bcRqc6B1g
         IdUvISixspQDT1CUfhUBdxzHuLzy7vjZshUsI20v1TszNdIKzvP6yRUa3+J8Y40EXCv/
         lPhVtLTkSg1CJpIkbgFuiU5N9uqZeXwXgJ6T35gyx3JdxGMsqetZ90L8jkeBrHF437ww
         NkSw==
X-Forwarded-Encrypted: i=1; AFNElJ8ISk7Eo4YDQucNBbyQgXw/9V4jELYn4UB+t0ttjZiTzfXqMGUyQxCbMmoIM6sqNMHp8x3MkXK+HlU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+2O4BTC7J8W/u5HE5qcxXgLz/J/e0Y99GsqID8sSgZYO5fSYz
	GK5UwMhqAlVyvQ4RUaq7mkfcGZcvL1gJ8U176YcOfUUcCAUhjvVLG8QErwvpzDbTEfTG3zBbCKt
	yTuf9p+ZU7CkZHxKkYiuVsWUkp3tdxlwU4j+zmAP83ibyIUPqYv6RcUc0yIB1nA==
X-Gm-Gg: AeBDiet4Az+nOX9K83XuuG5zK7efB6lNHl/jYnkGWGRYsk+6ZYeOdT3ZRlvZ8j7dZMA
	7Rw6tKPGylMlU43IUXag89gDT9Xl9T1ta1qAOQS3rgrnnBraBdWDpKSzL2yq5cjrC4Krf8+97s6
	+qCgsVQy2WLoD4GFI9RhLepJGVUi/gYzT/54QboqHmKtUId1pgHzjmsu4wkp44ziwqR5YorrOrn
	ncITswrxXIMYvazSIkNoBarLGDs1y73jVM4eSOWHVPFqWPkmC7P3npbKUfvsmya1Cwc5kJHCdTy
	4FD0Oyli7C2g9/b8mLks4gFwfulxZRUfml0KSc6xQT3ctobFjeWknVvc2wx6hty1IEl+6W1oJxo
	NHd8Ni15rg52G6HbvP4zy//Xtsyg57U5txT1Zq5qJh2Byr5Lhq41phsWikBI2ha8EKeY=
X-Received: by 2002:a05:6214:20a5:b0:8ac:aaac:4034 with SMTP id 6a1803df08f44-8b0280e9efdmr537408286d6.29.1777059324289;
        Fri, 24 Apr 2026 12:35:24 -0700 (PDT)
X-Received: by 2002:a05:6214:20a5:b0:8ac:aaac:4034 with SMTP id 6a1803df08f44-8b0280e9efdmr537407666d6.29.1777059323731;
        Fri, 24 Apr 2026 12:35:23 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae7d79esm188461036d6.36.2026.04.24.12.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 12:35:23 -0700 (PDT)
Date: Fri, 24 Apr 2026 15:35:21 -0400
From: Brian Masney <bmasney@redhat.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 1/2] clk: divider: Add KUnit tests for
 clk_divider_bestdiv() ULONG_MAX handling
Message-ID: <aevF-aA0FMp00wHW@redhat.com>
References: <20260421182529.3055114-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260421182529.3055114-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421182529.3055114-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Lad,

On Tue, Apr 21, 2026 at 07:25:25PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add KUnit tests to verify the behaviour of clk_divider_bestdiv() when
> clk_round_rate() is called with ULONG_MAX, which is the canonical way
> to probe the maximum rate a clock can produce.
> 
> Two test cases are introduced:
> 
> - clk_divider_bestdiv_ulong_max_returns_max_rate: registers a 1 GHz
>   fixed-rate parent driving a table-based divider whose smallest entry
>   is div=2 (entries: 2, 4, 8). Calls clk_hw_round_rate(div_hw, ULONG_MAX)
>   and checks the result.
> 
> - clk_divider_bestdiv_mux_ulong_max_returns_max_rate: places a two-input
>   mux (4 GHz and 2 GHz fixed-rate parents, CLK_SET_RATE_PARENT) ahead of
>   the same table-based divider to verify correct parent selection under
>   ULONG_MAX.
> 
> Both tests use an explicit clk_div_table with a minimum divider of 2 so
> that the pre-loop maxdiv clamping in clk_divider_bestdiv():
> 
>     maxdiv = min(ULONG_MAX / rate, maxdiv);
> 
> clamps maxdiv to 1, causing _next_div() to return 2 on the first
> iteration and skip the loop body entirely. This makes bestdiv fall back
> to the maximum divider, returning the minimum rate rather than the
> maximum.
> 
> The expected values intentionally reflect the buggy output:
>   - test 1: PARENT_RATE_1GHZ / 8  (minimum rate, not maximum)
>   - test 2: 0                      (invalid, loop never populated bestdiv)
> 
> These will be corrected to PARENT_RATE_1GHZ / 2 and PARENT_RATE_4GHZ / 2
> respectively once the fix to clk_divider_bestdiv() is applied.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Added false positive expected values
> - Updated the commit message
> - Added dependency on !S390 in Kconfig
> ---
>  drivers/clk/Kconfig            |   8 ++
>  drivers/clk/Makefile           |   1 +
>  drivers/clk/clk-divider_test.c | 158 +++++++++++++++++++++++++++++++++
>  3 files changed, 167 insertions(+)
>  create mode 100644 drivers/clk/clk-divider_test.c

CONFIG_CLK_DIVIDER_KUNIT_TEST=y needs to be added to
drivers/clk/.kunitconfig.

> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index b2efbe9f6acb..fdeb87ff8fd9 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -573,4 +573,12 @@ config CLK_FD_KUNIT_TEST
>  	help
>  	  Kunit test for the clk-fractional-divider type.
>  
> +config CLK_DIVIDER_KUNIT_TEST
> +	tristate "KUnit tests for clk divider bestdiv" if !KUNIT_ALL_TESTS
> +	depends on KUNIT
> +	depends on !S390
> +	default KUNIT_ALL_TESTS
> +	help
> +	  Kunit test for the clk-divider type.
> +
>  endif
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index a3e2862ebd7e..dc653b458f56 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -21,6 +21,7 @@ clk-test-y			:= clk_test.o \
>  				   kunit_clk_hw_get_dev_of_node.dtbo.o \
>  				   kunit_clk_parent_data_test.dtbo.o
>  obj-$(CONFIG_COMMON_CLK)	+= clk-divider.o
> +obj-$(CONFIG_CLK_DIVIDER_KUNIT_TEST) += clk-divider_test.o
>  obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-factor.o
>  obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-rate.o
>  obj-$(CONFIG_CLK_FIXED_RATE_KUNIT_TEST)	+= clk-fixed-rate-test.o
> diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_test.c
> new file mode 100644
> index 000000000000..3087c77fb157
> --- /dev/null
> +++ b/drivers/clk/clk-divider_test.c
> @@ -0,0 +1,158 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KUnit tests for clk_divider_bestdiv()
> + */
> +#include <kunit/test.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/limits.h>
> +#include <linux/units.h>
> +
> +#define PARENT_RATE_1GHZ	GIGA
> +#define PARENT_RATE_2GHZ	(2 * GIGA)
> +#define PARENT_RATE_4GHZ	(4 * GIGA)
> +
> +static const struct clk_div_table bestdiv_table[] = {
> +	{ .val = 0, .div = 2 },
> +	{ .val = 1, .div = 4 },
> +	{ .val = 2, .div = 8 },
> +	{ /* sentinel */ }
> +};

Is it possible to drop the table like I suggested in v2? You can use
CLK_DIVIDER_ONE_BASED. (See docs in include/linux/clk-provider.h).
You can also use CLK_DIVIDER_POWER_OF_TWO if you want the divider to be
larger.

> +
> +static void unregister_fixed_rate(void *hw)
> +{
> +	clk_hw_unregister_fixed_rate(hw);
> +}
> +
> +static void unregister_divider(void *hw)
> +{
> +	clk_hw_unregister_divider(hw);
> +}
> +
> +static void unregister_mux(void *hw)
> +{
> +	clk_hw_unregister_mux(hw);
> +}

Can these 3 wrapper functions be dropped, and you just call the inner
function in the call to kunit_add_action_or_reset()? For example,
instead of:

    static void unregister_fixed_rate(void *hw)
    {
        clk_hw_unregister_fixed_rate(hw);
    }
    ...
    KUNIT_ASSERT_EQ(test, 0,
                    kunit_add_action_or_reset(test, unregister_fixed_rate,
                                              parent_hw));

You should be able to do this:

    KUNIT_ASSERT_EQ(test, 0,
                    kunit_add_action_or_reset(test, clk_hw_unregister_fixed_rate,
                                              parent_hw));

I think we should just drop the wrappers completely if they aren't
needed. If more functionality is needed in the future, then the wrappers
can be added then.

> +
> +/*
> + * Test that clk_round_rate(clk, ULONG_MAX) returns the maximum achievable
> + * rate for a divider clock.
> + */
> +static void clk_divider_bestdiv_ulong_max_returns_max_rate(struct kunit *test)
> +{
> +	struct clk_hw *parent_hw, *div_hw;
> +	u32 *fake_reg;
> +	unsigned long rate;

Reverse Christmas tree order.

> +
> +	fake_reg = kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
> +
> +	parent_hw = clk_hw_register_fixed_rate(NULL, "bestdiv-parent",
> +					       NULL, 0, PARENT_RATE_1GHZ);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_hw);
> +	KUNIT_ASSERT_EQ(test, 0,
> +			kunit_add_action_or_reset(test, unregister_fixed_rate,
> +						  parent_hw));
> +
> +	div_hw = clk_hw_register_divider_table(NULL, "bestdiv-div",
> +					       "bestdiv-parent",
> +					       CLK_SET_RATE_PARENT,
> +					       (void __iomem __force *)fake_reg,
> +					       0, 2, 0, bestdiv_table, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
> +	KUNIT_ASSERT_EQ(test, 0,
> +			kunit_add_action_or_reset(test, unregister_divider, div_hw));
> +
> +	/*
> +	 * ULONG_MAX is the canonical way to probe the maximum rate a clock
> +	 * can produce.
> +	 */
> +	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
> +	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_1GHZ / 8);
> +}
> +
> +/*
> + * Test that clk_round_rate(clk, ULONG_MAX) returns the correct maximum rate
> + * when a mux clock sits between a divider and its parent candidates.
> + *
> + * Topology:
> + *
> + *   [fixed 4 GHz] --\
> + *                    +--> [mux CLK_SET_RATE_PARENT] --> [div {2,4,8} CLK_SET_RATE_PARENT]
> + *   [fixed 2 GHz] --/
> + *
> + */
> +static void clk_divider_bestdiv_mux_ulong_max_returns_max_rate(struct kunit *test)
> +{
> +	static const char * const mux_parents[] = {
> +		"bestdiv-mux-parent-a",
> +		"bestdiv-mux-parent-b",
> +	};
> +	struct clk_hw *parent_a_hw, *parent_b_hw, *mux_hw, *div_hw;
> +	u32 *fake_reg_mux, *fake_reg_div;
> +	unsigned long rate;
> +
> +	fake_reg_mux = kunit_kzalloc(test, sizeof(*fake_reg_mux), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg_mux);
> +
> +	fake_reg_div = kunit_kzalloc(test, sizeof(*fake_reg_div), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg_div);
> +
> +	/* Higher-rate parent: the mux should select this for ULONG_MAX. */
> +	parent_a_hw = clk_hw_register_fixed_rate(NULL, "bestdiv-mux-parent-a",
> +						 NULL, 0, PARENT_RATE_4GHZ);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_a_hw);
> +	KUNIT_ASSERT_EQ(test, 0,
> +			kunit_add_action_or_reset(test, unregister_fixed_rate,
> +						  parent_a_hw));
> +
> +	/* Lower-rate parent: should not be selected. */
> +	parent_b_hw = clk_hw_register_fixed_rate(NULL, "bestdiv-mux-parent-b",
> +						 NULL, 0, PARENT_RATE_2GHZ);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_b_hw);
> +	KUNIT_ASSERT_EQ(test, 0,
> +			kunit_add_action_or_reset(test, unregister_fixed_rate,
> +						  parent_b_hw));
> +
> +	/*
> +	 * 1-bit mux register selects between the two parents.
> +	 * CLK_SET_RATE_PARENT allows the divider's rate request to
> +	 * propagate into clk_mux_determine_rate().
> +	 */
> +	mux_hw = clk_hw_register_mux(NULL, "bestdiv-mux",
> +				     mux_parents, ARRAY_SIZE(mux_parents),
> +				     CLK_SET_RATE_PARENT,
> +				     (void __iomem __force *)fake_reg_mux,
> +				     0, 1, 0, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mux_hw);
> +	KUNIT_ASSERT_EQ(test, 0,
> +			kunit_add_action_or_reset(test, unregister_mux, mux_hw));
> +
> +	div_hw = clk_hw_register_divider_table(NULL, "bestdiv-mux-div",
> +					       "bestdiv-mux",
> +					       CLK_SET_RATE_PARENT,
> +					       (void __iomem __force *)fake_reg_div,
> +					       0, 2, 0, bestdiv_table, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
> +	KUNIT_ASSERT_EQ(test, 0,
> +			kunit_add_action_or_reset(test, unregister_divider, div_hw));
> +
> +	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
> +	KUNIT_EXPECT_EQ(test, rate, 0);
> +}
> +
> +static struct kunit_case clk_divider_bestdiv_test_cases[] = {
> +	KUNIT_CASE(clk_divider_bestdiv_ulong_max_returns_max_rate),
> +	KUNIT_CASE(clk_divider_bestdiv_mux_ulong_max_returns_max_rate),
> +	{}
> +};
> +
> +static struct kunit_suite clk_divider_bestdiv_test_suite = {
> +	.name = "clk_divider_bestdiv",
> +	.test_cases = clk_divider_bestdiv_test_cases,
> +};
> +
> +kunit_test_suite(clk_divider_bestdiv_test_suite);
> +
> +MODULE_DESCRIPTION("KUnit tests for clk_divider_bestdiv()");

KUnit tests for clk divider.

I have another tests that will eventually be added to this file.

Brian

