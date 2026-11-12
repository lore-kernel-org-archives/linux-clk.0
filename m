Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794477040;
	b=03o4Nd1Lsk8aU+o69FY0iyyfazDjAcA7y9IrEhnbl5MzPbg+AP5McBqSAcKArkOvw34/
	 haCFpt5epCgC14ZONlqqXU8rBk0RaRkAQtSR8+2RAhzZH6uugD7zYrbcW9W5yu0Lqj+ak
	 hEi9+E4dxQZJbBCZVSMxE8jpkob+FO8Ttbiw2E/hc/AL8qGgAUaOH9drm4Bi2nRhp820f
	 3oAiVT75mLvyMXIUjY+6eFje/6m+tyTWlmZHt/SN05F7ENQNmzH4Xv+j0cBu9u55HW3Qj
	 /lkUHRCJWQqi8oBCrNEuYBz8hplLm8k+AtvQucKf6OXIOoKCyAjqTxISULk4oxWTE2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794477040;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HMNGGYuioNirshm6SHU2flY32c5/fdYBjO7AF+mOo8U=;
	b=dJ/x98R/bK+r2/qA7VKRIMH7J4dgOhEBZRzBvHibR30DjFyjVQce0l7yktjRR4rwTQ9F
	 gv/MXbpTmoeBHNz6+IVMxaDpLNhlzSGhFxjRKvAfFdyniqhx0jfv/z+IevxrHXPJYl12D
	 Amo9SkugAY4XiQFCMrVVT3yLXrZ/NWb8WIPLqOKbfQ9mmAuzGghv2JZB8BqJYVD2hHcrf
	 g0hL/loVIdmQTJJCTWRyt6iUwJMN6PtQ0Wit97v3osVDsrdxypbQeCpuWMtigu5dcyBtq
	 2qVvBIWPgZywK8BcUXX37HRe9eLzcnGJjcJh0VjkFQKxMzFt7b4fNZdzZgkzE/kYkNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bxSBl4kM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D62606A321
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 09:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bxSBl4kM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F521F00A05;
	Thu, 12 Nov 2026 09:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794477039;
	bh=HMNGGYuioNirshm6SHU2flY32c5/fdYBjO7AF+mOo8U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bxSBl4kMGtNzDZXQflAzQlUN12cn4ZSVfUcp8DrlnBuET6dmnCNQD5I0TtfDjmHKg
	 WSRM5rkeru8z5h6cj/wcVwXupX1HK/wMVwkgNvAIqPmWPkIFoIDjC46W58V82IzF54
	 nxo+1Qta+mBOXzxxPbx4SPAHIB//Q7c+RM2LO3A942ahro9aS5O9yn1WmD9slPNUn+
	 GBttXe0+ByfJjLJAMYKQ/fEHVywiHtZ+ccVmeMlmda91U7foBGuxaLX3hIk1Xymky1
	 KTGNHcrkFsOE5fS33dF5jy69lLog+Jgv20RXEtNXmxHU24fVUVldihCSdAOz1hBiQ9
	 6LMhPFs9299yA==
Message-ID: <sashiko-outbox-210906@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] clk: divider: test: Add tests for rates above
 4.29 GHz
Reply-To: sashiko-reviews@lists.linux.dev
To: "Carlo Caione" <ccaione@baylibre.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261112-upstream-clk-divider-large-rates-v2-3-18f3bb888b0c@baylibre.com>
References: <20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com>
 <20261112-upstream-clk-divider-large-rates-v2-3-18f3bb888b0c@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 09:50:39 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] clk: divider: test: unlocked clk_hw_round_rate() calls trigger
  lockdep warning
--

commit 25eaef0a68df414370fdc908fa118bc3dbfa005e
Author: Carlo Caione <ccaione@baylibre.com>

clk: divider: test: Add tests for rates above 4.29 GHz

This commit adds KUnit test suites for clk dividers covering rates above
4.29 GHz on 64-bit platforms and round-closest dividers requested above
their parent rate.

> diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_tes=
t.c
> index 8ee1614128d09..734cbdad55ddf 100644
> --- a/drivers/clk/clk-divider_test.c
> +++ b/drivers/clk/clk-divider_test.c

[ ... ]

> +static void clk_divider_large_rate_round_up(struct kunit *test)
> +{
> +	struct clk_hw *div_hw;
> +	u32 *fake_reg;
> +
> +	fake_reg =3D kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
> +
> +	div_hw =3D clk_divider_large_rate_init(test, fake_reg, PARENT_RATE_6GHZ,
> +					     0, 0);
> +
> +	KUNIT_EXPECT_EQ(test, clk_hw_round_rate(div_hw, PARENT_RATE_6GHZ),
> +			PARENT_RATE_6GHZ);
> +}

[Severity: Low]
Does calling clk_hw_round_rate() here (and in the other rounding test
cases below) trigger a lockdep warning when CONFIG_LOCKDEP is enabled?

clk_hw_round_rate() is a provider helper that expects prepare_lock to be
held and calls clk_core_init_rate_req() and clk_core_round_rate_nolock(),
which assert lockdep_assert_held(&prepare_lock).  Obtaining a struct clk
via clk_hw_get_clk_kunit() and calling clk_round_rate() instead would
acquire prepare_lock properly.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-upstream-c=
lk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com?part=3D3
