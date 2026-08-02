Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD48738D3F9;
	Sun,  2 Aug 2026 09:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785661283; cv=none; b=UhoPSaxCH4elI0kpkzzvvS7wgKlm/0G0DziA86HwcYmPvX8rDMljKwyRCgD1T5nkB0Uc7Z963cZuk2/45nkys0vMC+0UDlk52RFLY4RzZV5kPWGADaWAxt4tFjLWoq3X1M37JWNul4j7fr2s1YT/w/5C8PgSoeLRBUx0ZC6wrX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785661283; c=relaxed/simple;
	bh=RWgcww6wizfQ/xAJ8XbOgWiyy6xwP88WyY5sp6c+teg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VhQAC9pOoY4XL2z0zs0RwHETJNA70MPk4royriBnYgQwIdeVenOPw68WV9++eKrpmxw5zMwHVe/zDs5z96XC8JvW2ViycUijbn4b2lqVgZEWDrc3EdOnnzfVKGs364zcsLbhf68D5rVLJgC8dKNY30q5nUVYSm8CO5EC3jP1A4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=D1r4unvh; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="D1r4unvh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=OTDMmdQ9nSkXkvKAmvVj7B94ty8/1D//TSF3Roeaubo=;
  b=D1r4unvhj2ZDWdyHATwkdPyUPYMf3kqmz2h8MTMAuAO2VrDUhlU1QrVR
   HVJNZLrtcEdGZRuZ7SpzVtlI9xT2Vssns3ki3dHltO5jTp+YhIOgEer9y
   mZccyQALSEXEKNh4knEx83zTqmADm9c21ApY6y3VmvYZf1GlLabuawX4M
   4=;
X-CSE-ConnectionGUID: DB0M6TzFQNeNBG9Ncc2G9A==
X-CSE-MsgGUID: mRV1q1ldRjK0LuukN0icsQ==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,200,1779141600"; 
   d="scan'208";a="153461403"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien.home) ([88.188.149.159])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 11:01:08 +0200
Date: Sun, 2 Aug 2026 11:01:08 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Guru Das Srinagesh <linux@gurudas.dev>
cc: Nicolas Palix <nicolas.palix@imag.fr>, 
    Michael Turquette <mturquette@baylibre.com>, 
    Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
    cocci@inria.fr, Brian Masney <bmasney@redhat.com>, 
    linux-clk@vger.kernel.org
Subject: Re: [PATCH] coccinelle: Detect clk_register() anti-pattern
In-Reply-To: <20260802-cocci-clk-register-v1-1-df68afcb1eef@gurudas.dev>
Message-ID: <31eb2139-eb3c-912b-9f61-4aa77df7a5ee@inria.fr>
References: <20260802-cocci-clk-register-v1-1-df68afcb1eef@gurudas.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sun, 2 Aug 2026, Guru Das Srinagesh wrote:

> Enforce commit 12a0fd23e870 ("clk: Print an error when clk registration
> fails"): clk_register(), clk_hw_register(), and their devm_/of_ variants
> log their own error on failure, so driver-side error prints after these
> calls are redundant.
>
> Two independent match families, one per return-value convention:
> pointer return checked via IS_ERR() (clk_register()/devm_clk_register()),
> and int return checked via a nonzero value (clk_hw_register()/
> devm_clk_hw_register()/of_clk_hw_register()).
>
> Assisted-by: Claude:claude-sonnet-5 coccinelle
> Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
> ---
> Add a Coccinelle semantic patch enforcing commit 12a0fd23e870 ("clk:
> Print an error when clk registration fails"): flags, and in "patch"
> mode removes, driver-side error prints that are now redundant after
> clk_register()/clk_hw_register() and their devm_/of_ variants.
>
> Two independent match families, one per return-value convention.
>
> Pointer return, IS_ERR()-checked (clk_register()/devm_clk_register()),
> e.g. drivers/clk/clk-xgene.c:152-157:
>
>     clk = clk_register(dev, &apmclk->hw);
>     if (IS_ERR(clk)) {
> -       pr_err("%s: could not register clk %s\n", __func__, name);
>         kfree(apmclk);
>         return NULL;
>     }
>
> Int return, nonzero-checked (clk_hw_register()/devm_clk_hw_register()/
> of_clk_hw_register()), e.g. drivers/clk/meson/meson-clkc-utils.c:49-54:
>
>     ret = devm_clk_hw_register(dev, hw);
>     if (ret) {
> -       dev_err(dev, "registering %s clock failed\n",
> -               hw->init->name);
>         return ret;
>     }
>
> Testing:
> - Baseline: coccinelle 1.3.1, the Torvalds tree at v7.2-rc5.
> - "make coccicheck COCCI=<path> MODE=report M=drivers/clk" produced 73
>   hits and verified to have zero false positives.
> - "MODE=patch" verified separately on scratch copies of affected files
>   to confirm minimal, correct diffs.
>
> checkpatch flagged that this new file needs a MAINTAINERS entry, and I'd

I don't have an opinion about this.  If you want to be responsible for it
that's fine with me.

> like to maintain it, so this adds a standalone entry rather than leaving
> the file uncovered. There's no direct precedent for an individual .cocci
> file getting its own entry - the only other named .cocci file in
> MAINTAINERS, scripts/coccinelle/api/string_choices.cocci, was added to
> the existing GENERIC STRING LIBRARY entry by that subsystem's
> maintainer, not as a new one. Happy to fold this into COMMON CLK
> FRAMEWORK or drop it entirely depending on what the maintainers prefer.
> ---
>  MAINTAINERS                               |   5 ++
>  scripts/coccinelle/api/clk_register.cocci | 125 ++++++++++++++++++++++++++++++
>  2 files changed, 130 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 716acfc3d7c1..26788ccbf98c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6363,6 +6363,11 @@ L:	linux-clk@vger.kernel.org
>  S:	Maintained
>  F:	include/linux/clk.h
>
> +CLK_REGISTER() COCCINELLE CHECK
> +M:	Guru Das Srinagesh <linux@gurudas.dev>
> +S:	Maintained
> +F:	scripts/coccinelle/api/clk_register.cocci
> +
>  CLOCKSOURCE, CLOCKEVENT DRIVERS
>  M:	Daniel Lezcano <daniel.lezcano@kernel.org>
>  M:	Thomas Gleixner <tglx@kernel.org>
> diff --git a/scripts/coccinelle/api/clk_register.cocci b/scripts/coccinelle/api/clk_register.cocci
> new file mode 100644
> index 000000000000..fe5bcd4b00d4
> --- /dev/null
> +++ b/scripts/coccinelle/api/clk_register.cocci
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/// Remove error messages after clk registration failures, because
> +/// clk_register(), clk_hw_register(), and their variants already log
> +/// an error when they fail. See commit 12a0fd23e870 ("clk: Print an
> +/// error when clk registration fails").
> +//
> +// Confidence: Medium
> +// Options: --include-headers
> +
> +virtual patch
> +virtual context
> +virtual org
> +virtual report
> +
> +@depends on context@
> +expression clk;
> +identifier reg =~ "^(devm_)?clk_register$";
> +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> +@@
> +
> +clk = reg(...);

From a performance point of view, it would be desirable to put instead
\(devm_clk_register\|clk_register\).  This will trigger some
optimizations that won't be triggered by a regular expression.


> +if ( \( IS_ERR(clk) \| IS_ERR(clk) == 1 \) )
> +{
> +...
> +*voidfn(...);
> +...
> +}
> +
> +@depends on patch@
> +expression clk;
> +identifier reg =~ "^(devm_)?clk_register$";
> +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> +@@
> +
> +clk = reg(...);
> +if ( \( IS_ERR(clk) \| IS_ERR(clk) == 1 \) )
> +{
> +...
> +-voidfn(...);
> +...
> +}
> +
> +@r1 depends on org || report@
> +position p1;
> +expression clk;
> +identifier reg =~ "^(devm_)?clk_register$";
> +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> +@@
> +
> +clk = reg(...);
> +if ( \( IS_ERR(clk) \| IS_ERR(clk) == 1 \) )
> +{
> +...
> +voidfn@p1(...);
> +...
> +}
> +
> +@depends on context@
> +expression ret;
> +identifier reg =~ "^(devm_)?(of_)?clk_hw_register$";
> +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> +@@
> +
> +ret = reg(...);
> +if ( \( ret \| ret != 0 \| ret < 0 \) )
> +{
> +...
> +*voidfn(...);
> +...
> +}
> +
> +@depends on patch@
> +expression ret;
> +identifier reg =~ "^(devm_)?(of_)?clk_hw_register$";
> +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> +@@
> +
> +ret = reg(...);
> +if ( \( ret \| ret != 0 \| ret < 0 \) )
> +{
> +...
> +-voidfn(...);
> +...
> +}

I think yourpatch rule should have an extra case for where there are
currently only two statements in the if branch.  In that case the {}
should be removed.

julia

> +
> +@r2 depends on org || report@
> +position p2;
> +expression ret;
> +identifier reg =~ "^(devm_)?(of_)?clk_hw_register$";
> +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> +@@
> +
> +ret = reg(...);
> +if ( \( ret \| ret != 0 \| ret < 0 \) )
> +{
> +...
> +voidfn@p2(...);
> +...
> +}
> +
> +@script:python depends on org@
> +p1 << r1.p1;
> +@@
> +
> +cocci.print_main(p1)
> +
> +@script:python depends on report@
> +p1 << r1.p1;
> +@@
> +
> +msg = "line %s is redundant because clk_register() already prints an error on failure" % (p1[0].line)
> +coccilib.report.print_report(p1[0], msg)
> +
> +@script:python depends on org@
> +p2 << r2.p2;
> +@@
> +
> +cocci.print_main(p2)
> +
> +@script:python depends on report@
> +p2 << r2.p2;
> +@@
> +
> +msg = "line %s is redundant because clk_hw_register() already prints an error on failure" % (p2[0].line)
> +coccilib.report.print_report(p2[0], msg)
>
> ---
> base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
> change-id: 20260802-cocci-clk-register-951d94251af4
>
> Best regards,
> --
> Guru Das Srinagesh <linux@gurudas.dev>
>
>
