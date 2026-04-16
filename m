Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A1233554F
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 21:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776375330; cv=none; b=kA18sjsWpKmFlIh8Ir1HL0McUKcJN95o5/KOoJuUKupFhkegQgo6R8ZdQLF4u8yPWGimTJb2zWSiZgOzs5rXXyVTRyH/LPjZKV7crl0xNu6l3K7acGuHSb7bEcvPunyGTj20ubD1hWi4h2eu0JB61eFOarOwwLC74Y3Lxm+EAjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776375330; c=relaxed/simple;
	bh=bQYDWw2yWRrPDsipu0p8v7TVMWjI3sci/lJJ3WtUqI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkj05rr1mLCy1z/eXghGvkaEXvrma8AvNuJc7v7a8BlsuV8zAkFck6SBJ34V5bFxleqYQfHTXCUfQbNtVOm1mcU+X1E7Z4MAQJMLuBwrVotBEe3H8jJI01zLMvCowZ6j6tHyAhggub52xR8W1rNy0lv+yyZvK2SwKLzKoWCoaTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YTXiTz/L; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LjpGSOO7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YTXiTz/L";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LjpGSOO7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776375328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YRG/q659xesZWxPYzzEVSdkuUOn2ZHM5fkzo4uR4sjQ=;
	b=YTXiTz/L0MEDLvvTswp7cdzl6Md2GKMfKTaAj0t0XtwacvlNs9qTOUY/PdUnqtjrnRFMQ4
	gZhh6h6V5TEgDyNL0o+ojd5rnQW2Udrv2LwLk5rOVegRM5q2ZAyhPR5puugaHa59AVwB51
	SHj8XqYosF3DFlDxb11SW6/wTw70g5E=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-YD1c89l9MDGuCTIUNM_zbQ-1; Thu, 16 Apr 2026 17:35:26 -0400
X-MC-Unique: YD1c89l9MDGuCTIUNM_zbQ-1
X-Mimecast-MFC-AGG-ID: YD1c89l9MDGuCTIUNM_zbQ_1776375326
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acad256115so151924906d6.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 14:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776375326; x=1776980126; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRG/q659xesZWxPYzzEVSdkuUOn2ZHM5fkzo4uR4sjQ=;
        b=LjpGSOO7lKoizq5MRyY8hUfqoLUZgbLwNwTqY+oGo7PKu1FX54r+lDV5lVj0Uw0iNC
         orpUK5wT+Lx9uqKc55qamSGSW9xZNXH+PltsddwvJfC3GWyk7VvD9xiKtXeNMUmXCBlj
         JL8R4S5QghbN1p5sR5zd+noBOvzDs3131UA7SlgYG2HyWaXasAKDNBg2YhCt9/fyktoL
         tm8K5gAEGtWr3sM32D2uApXdTkV2zFiSBVz9DNE3uWz6l+ORomRTI77Vxl6MZsR3cyYB
         cfJ1aLOiZ2azEKn9bkYzk10eM5yRhbAkhCfl/cc++6kJ7snnN+JrtqdBhvPsOFIBTPXk
         NQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776375326; x=1776980126;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YRG/q659xesZWxPYzzEVSdkuUOn2ZHM5fkzo4uR4sjQ=;
        b=g2Mz1icOMHv9Iy9oAUULcl3/3Ms3sjvtNv2FhJYplwU/EOj2gr05zwLBQcoP5OK4qt
         iHcdERi1iyHgpt73FCYW0/wHrQgHnNGtuwlfLddv3Da0f5/wTXpE937yUtY0cdUuyoSj
         8nUeFPvqIctxuADr5GKple3AoVkXUqh4rlfkZUqlO3LM9hvhhtgT6jbjFUiJliqdEYIV
         uoGJeLSnmIEzu70UmIMbhrpTq/AaQyxNz5hTQYU62rHRm306ed5Ae+fsmROPadPDoCRk
         V+I/LKBAfPB/uqh6zXi1WAV6CZzQEYhf/H7MWBiJ66n3lY0CiEV65rdGM7Ei/FIbH3F1
         BO3Q==
X-Forwarded-Encrypted: i=1; AFNElJ9ndkTdlolZV942mR31znStMXexFHsnJMMy9n4lFBnacXjq4ujoCpKhkD+97mFQil16pk8HvNB/Aso=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDaofIWp1jruvm0ID1QKuMdp6qGb9lRBbc441VFPc+e70rnJbj
	6SQGxSoqSLM/SyW1fdB5UUh6n4xizBcoNHBV0oCUp8l5gdJ+vSMgRAX/ueT099Ywc2F7Jscde0Z
	Km2B/0YsFTafgfjO9T7bzj0cFdG67UVuQoow24ECUCybsnxnylsxAq3KkNSfF/Q==
X-Gm-Gg: AeBDieuJ8R0Mb/NtNiCO2DKwWzU+JNEy/ddmKFkA/PvFIyZS7r7yhMfsKf6SXw5SXmZ
	VVOKMCOvyHQWVtpULeP9Y73hOS2GjE1oHADoVNwGZqz8qyCefucePiQ6TgqThVr42XbMeQtOQqO
	Mre2xaMGvLQFVG41d1/7bDd+RLfnz9rNPRUxA9hJynsLjCSAJyXddLx+/k+yNeeLXeUPjqTLL0i
	E46IapG1MZE+tJ+X/m6fwm2Tq6KCO83LXCNQsUua4a8nlsvcnCipLTSCvvJ7WyBV2Mk/eK9lH7X
	/UOWkCycxsw0rBTPASuscktY+8tlXHQdxgGIKh++DzQ2nsfrnL6+RqySS5kPbKjceKj8h+/o7/K
	N/xswq8mBdILqTX9wpiTVx5eOBcnF6RrOq402CWg1jlfEV6dVz9TquYGCgR7V0/IkVFA=
X-Received: by 2002:a05:6214:3211:b0:895:498e:e9dd with SMTP id 6a1803df08f44-8b028024c49mr5543666d6.2.1776375326026;
        Thu, 16 Apr 2026 14:35:26 -0700 (PDT)
X-Received: by 2002:a05:6214:3211:b0:895:498e:e9dd with SMTP id 6a1803df08f44-8b028024c49mr5543066d6.2.1776375325583;
        Thu, 16 Apr 2026 14:35:25 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ae6cda5a2bsm45376176d6.33.2026.04.16.14.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 14:35:24 -0700 (PDT)
Date: Thu, 16 Apr 2026 17:35:21 -0400
From: Brian Masney <bmasney@redhat.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 2/2] clk: divider: Add some kunit test suites
Message-ID: <aeFWGYaRownx1jdp@redhat.com>
References: <20260413124912.3260571-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260413124912.3260571-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413124912.3260571-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Lad,

On Mon, Apr 13, 2026 at 01:49:12PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add KUnit tests to verify clk_divider_bestdiv() returns the maximum
> achievable rate when clk_round_rate() is called with ULONG_MAX, which
> is the canonical way to probe the maximum rate a clock can produce.
> 
> The first test uses a fixed-rate parent driving a table-based divider
> with no div=1 entry. The second test places a two-input mux between
> the divider and its root clocks to verify correct parent selection and
> that the divider loop does not make redundant calls to
> clk_hw_round_rate() for each remaining table entry after the first
> overflow.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/clk/Kconfig            |   7 ++
>  drivers/clk/Makefile           |   1 +
>  drivers/clk/clk-divider_test.c | 151 +++++++++++++++++++++++++++++++++
>  3 files changed, 159 insertions(+)
>  create mode 100644 drivers/clk/clk-divider_test.c
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index cc8743b11bb1..c8f9eaef6f6b 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -573,4 +573,11 @@ config CLK_FD_KUNIT_TEST
>  	help
>  	  Kunit test for the clk-fractional-divider type.
>  
> +config CLK_DIVIDER_KUNIT_TEST
> +	tristate "KUnit tests for clk divider bestdiv" if !KUNIT_ALL_TESTS
> +	depends on KUNIT

Since the clk divider calls writel(), you also will need to
unfortunately add:

    depends on !S390

This is already on CLK_GATE_KUNIT_TEST. For the reason why, look at
commit a6c3da03ead11 ("clk: disable clk gate tests for s390")

> +	default KUNIT_ALL_TESTS
> +	help
> +	  Kunit test for the clk-divider type.
> +
>  endif
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index a3e2862ebd7e..0c915c6cf3fa 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -20,6 +20,7 @@ clk-test-y			:= clk_test.o \
>  				   kunit_clk_assigned_rates_zero_consumer.dtbo.o \
>  				   kunit_clk_hw_get_dev_of_node.dtbo.o \
>  				   kunit_clk_parent_data_test.dtbo.o
> +obj-$(CONFIG_CLK_DIVIDER_KUNIT_TEST) += clk-divider_test.o
>  obj-$(CONFIG_COMMON_CLK)	+= clk-divider.o

Swap the order of these two lines above for consistency with the
clk-fixed-rate and clk-gate tests where the actual implementation is
first, and then the test.

>  obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-factor.o
>  obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-rate.o
> diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_test.c
> new file mode 100644
> index 000000000000..3a5e3adccb2e
> --- /dev/null
> +++ b/drivers/clk/clk-divider_test.c
> @@ -0,0 +1,151 @@
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
> +static u32 fake_reg_a, fake_reg_b;

Right now this limits this to one implementation. Put these in a
structure and use kunit_kzalloc() so that there can be multiple, and the
runner can execute them in parallel.

> +
> +static const struct clk_div_table no_div1_table[] = {
> +	{0, 2},
> +	{1, 4},
> +	{2, 8},
> +	{0, 0},
> +};

You can pass NULL for the table to simplify this code further. I don't
see where you are testing anything special related to the table. I think
you'll need to pass CLK_DIVIDER_ONE_BASED to the flags when you create
the divider if you use a NULL table.

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
> +
> +/*
> + * Test that clk_round_rate(clk, ULONG_MAX) returns the maximum achievable
> + * rate for a divider clock.
> + */
> +static void clk_divider_bestdiv_ulong_max_returns_max_rate(struct kunit *test)
> +{
> +	struct clk_hw *parent_hw, *div_hw;
> +	unsigned long rate;
> +
> +	parent_hw = clk_hw_register_fixed_rate(NULL, "bestdiv-parent",
> +					       NULL, 0, PARENT_RATE_1GHZ);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_hw);
> +	kunit_add_action(test, unregister_fixed_rate, parent_hw);

You can put clk_hw_unregister_fixed_rate() in the call here, and then
drop unregister_fixed_rate(). There's some cases of this below as well.

Check the return value of kunit_add_action() here and below as well.

> +
> +	fake_reg_a = 0;
> +	div_hw = clk_hw_register_divider_table(NULL, "bestdiv-div",
> +					       "bestdiv-parent",
> +					       CLK_SET_RATE_PARENT,
> +					       (void __iomem *)&fake_reg_a,

You'll need __force for the cast for sparse as well.

> +					       0, 2, 0, no_div1_table, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
> +	kunit_add_action(test, unregister_divider, div_hw);

Same here... you can just put clk_hw_unregister_divider() here and drop
the function above.

> +
> +	/*
> +	 * ULONG_MAX is the canonical way to probe the maximum rate a clock
> +	 * can produce. With a parent at 1 GHz and the smallest table divider
> +	 * being 2, the expected maximum is 500 MHz.
> +	 *
> +	 * Before the fix this returned 125 MHz (PARENT_RATE / 8), the
> +	 * minimum rate, because the search loop was bypassed entirely.

The "Before the fix" comment should go in the commit log. The comment in
the code should describe how the code is right now.

> +	 */
> +	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
> +	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_1GHZ / 2);
> +}
> +
> +/*
> + * Test that clk_round_rate(clk, ULONG_MAX) returns the correct maximum rate when
> + * a mux clock sits between a divider and its parent candidates.
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
> +	static const char *const mux_parents[] = {
> +		"bestdiv-mux-parent-a",
> +		"bestdiv-mux-parent-b",
> +	};
> +	struct clk_hw *parent_a_hw, *parent_b_hw, *mux_hw, *div_hw;
> +	unsigned long rate;
> +
> +	/* Higher-rate parent: the mux should select this for ULONG_MAX. */
> +	parent_a_hw = clk_hw_register_fixed_rate(NULL, "bestdiv-mux-parent-a",
> +						 NULL, 0, PARENT_RATE_4GHZ);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_a_hw);
> +	kunit_add_action(test, unregister_fixed_rate, parent_a_hw);
> +
> +	/* Lower-rate parent: should not be selected. */
> +	parent_b_hw = clk_hw_register_fixed_rate(NULL, "bestdiv-mux-parent-b",
> +						 NULL, 0, PARENT_RATE_2GHZ);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_b_hw);
> +	kunit_add_action(test, unregister_fixed_rate, parent_b_hw);
> +
> +	/*
> +	 * 1-bit mux register selects between the two parents.
> +	 * CLK_SET_RATE_PARENT allows the divider's rate request to
> +	 * propagate into clk_mux_determine_rate().
> +	 */
> +	fake_reg_a = 0;
> +	mux_hw = clk_hw_register_mux(NULL, "bestdiv-mux",
> +				     mux_parents, ARRAY_SIZE(mux_parents),
> +				     CLK_SET_RATE_PARENT,
> +				     (void __iomem *)&fake_reg_a,
> +				     0, 1, 0, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mux_hw);
> +	kunit_add_action(test, unregister_mux, mux_hw);

You can put clk_hw_unregister_mux() here and drop this function above.

> +
> +	fake_reg_b = 0;
> +	div_hw = clk_hw_register_divider_table(NULL, "bestdiv-mux-div",
> +					       "bestdiv-mux",
> +					       CLK_SET_RATE_PARENT,
> +					       (void __iomem *)&fake_reg_b,
> +					       0, 2, 0, no_div1_table, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
> +	kunit_add_action(test, unregister_divider, div_hw);
> +
> +	/*
> +	 * Expected maximum: mux selects the 4 GHz parent, divider applies
> +	 * the smallest table entry (2): 4 GHz / 2 = 2 GHz.
> +	 */
> +	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
> +	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_4GHZ / 2);
> +}
> +
> +static struct kunit_case clk_divider_bestdiv_test_cases[] = {
> +	KUNIT_CASE(clk_divider_bestdiv_ulong_max_returns_max_rate),
> +	KUNIT_CASE(clk_divider_bestdiv_mux_ulong_max_returns_max_rate),
> +	{}
> +};

Usually I'd ask for a few other tests for basic functionality to be
added rather than just testing the maximum. However there's actually
some stuff broken with the existing dividers and the clk core where a
clk can change the rate of it's siblings. I have a series to address
this at:

https://lore.kernel.org/linux-clk/20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com/

I think the tests that you have are fine.

Stephen: If you have time after the merge window closes I'd appreciate
it if you could take time to provide feedback about that series.

Puss in Boots please... :)
https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExaXg5cGFhbGdmbTZjdnRkdWs4aXM5d3FlYnFmbTNudWFsZ3Fwc3o5NiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/qUIm5wu6LAAog/giphy.gif

Brian

