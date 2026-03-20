Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454753C4577;
	Fri, 20 Mar 2026 18:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774029605; cv=none; b=B9fMiFqHuaX53gyTOKUnSzFhLIXq2SSyVK97bDlGU25f1Wakm2YQ0FLBwIXmhVq8/8Z94UpkN7JAwwK8VYF07zx+B5GVfsrLk4koC7H1fUf9hGoaBI8kLHZ7amIOPxxvdsacb5HxA2sli5kWlpTDspFwtJqmFwB9w62Q3B6sfE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774029605; c=relaxed/simple;
	bh=oSK9eBxGRYo7Ubgjl2y1Akb6y6Z/U1s/FPr3J4Lok/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNkVyJZtnyySlISlw0X/SkR00F/M7AHpWlys7ONsPoXu5Fu0DivXaNOi1Uo0RVUtqzOJhrEQHwJcbRr5dFuUf+qFWRzTcnosgZglgxouoMacgTsTVAtCPBgjaw6PDIzXEN/ag0clhZaHXxpRlsY3SXZaU+Q76SvDID+UN4fKV7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jws9gu4F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jws9gu4F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3EE7C4CEF7;
	Fri, 20 Mar 2026 18:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774029604;
	bh=oSK9eBxGRYo7Ubgjl2y1Akb6y6Z/U1s/FPr3J4Lok/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jws9gu4FXYyjQ8LgS83Kr8LRfGaP+5xn6b7v8vz/6XvvAqN8HQBLOUMskAZn7oHtC
	 XLli3stIcYox7QwTt9nSK5EjxrqO6o0KYNz4fwd3ArpWntlraJNywLLjXgA1GhVk95
	 1KtLv+WLwaJp0e2T6xu3TB9MivCU29W+g/fgIizeE9x7Vf5/hIkLp/ijthtbTC2lpO
	 vfWhlmWRBEw+fgRCY8cUe1gKBOCn49FXjMrO9zvtP89RcVb5FVi+vGssYfYn12JWnL
	 HpUz4uKNgjZmpYQuYevP0fgRV16M/znB0zDcGPoHy2yy/TdZ8gLhvmvQd14HACiz9d
	 AWUxuyXx/Shkw==
Date: Fri, 20 Mar 2026 11:00:04 -0700
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Scott Wood <scottwood@freescale.com>, Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] clk: qoriq: avoid formwat string warning
Message-ID: <202603201059.1DA0210B@keescook>
References: <20260320151854.3465248-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320151854.3465248-1-arnd@kernel.org>

Nit: $subject typo "formwat" -> "format", but otherwise looks good.

On Fri, Mar 20, 2026 at 04:18:49PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang-22 warns about the use of non-variadic format arguments passed into
> snprintf():
> 
> drivers/clk/clk-qoriq.c:925:39: error: diagnostic behavior may be improved by adding the
>       'format(printf, 7, 8)' attribute to the declaration of 'create_mux_common' [-Werror,-Wmissing-format-attribute]
>   910 | static struct clk * __init create_mux_common(struct clockgen *cg,
>       | __attribute__((format(printf, 7, 8)))
>   911 |                                              struct mux_hwclock *hwc,
>   912 |                                              const struct clk_ops *ops,
>   913 |                                              unsigned long min_rate,
>   914 |                                              unsigned long max_rate,
>   915 |                                              unsigned long pct80_rate,
>   916 |                                              const char *fmt, int idx)
>   917 | {
>   918 |         struct clk_init_data init = {};
>   919 |         struct clk *clk;
>   920 |         const struct clockgen_pll_div *div;
>   921 |         const char *parent_names[NUM_MUX_PARENTS];
>   922 |         char name[32];
>   923 |         int i, j;
>   924 |
>   925 |         snprintf(name, sizeof(name), fmt, idx);
>       |                                              ^
> drivers/clk/clk-qoriq.c:910:28: note: 'create_mux_common' declared here
>   910 | static struct clk * __init create_mux_common(struct clockgen *cg,
> 
> Rework this to pass the 'int idx' as a varargs argument, allowing the
> format string to be verified at the caller location.
> 
> Fixes: 0dfc86b3173f ("clk: qoriq: Move chip-specific knowledge into driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
