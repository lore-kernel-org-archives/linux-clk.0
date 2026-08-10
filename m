Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C853A39A7E5;
	Mon, 10 Aug 2026 06:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786344822; cv=none; b=OEVHkiA2o/xQDn/4qALtNH07zPSjlPpbX5xb2SB9EIFbg84TShZBDZfnvRFFXEjRZPgzgHzzzkApbFWoGK2wM0PbVz91u4O5imMyuvBI+uywECGj4w8KT1mvytGFr+y0LNnc3NuVI4x+fhs/YMg8E6LhMx8W7WiyH/lYlSRkeq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786344822; c=relaxed/simple;
	bh=eRpC2wSKwmWwBIePGghUFkoti00q8vTs5+GApCdglVE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Jp6lV4KYAdpmiRTjzQ5PqrSMSrXXzX5gTydvhdk2zOxFQ/O3umm69b8D4pyau3QXuYTXPY97R7qlTJvNX//1iI3n3YTqehJx/OhxwdOCQhPpEtXRsS+lYB0H0OLALM1KRgWmkQRD70t7C5qGauDerIuiL5naQxDIHOkunx6SIM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=Lj1HoXbj; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="Lj1HoXbj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Jy1mXnOgzwP16J9PCcnnI5CZdWdJZHs+cXmX0d/fN1c=;
  b=Lj1HoXbja2kiLjCjKULFfF1rJUzaQ6tQGLrrrp9SklOaB4y8ZKAzi9Ew
   DrQHwusgOtscPefMQ3L32BvcaMWG8z+mDViOCSLCWUtQJ+lB27F2S76hY
   iMDD3cwK13r1jEg//+hzDok43SC4YxdgzGTDd3/cuHtp7hcLrtqAwSAY7
   o=;
X-CSE-ConnectionGUID: kZFkhPRgR+e+Gu/As7/hmg==
X-CSE-MsgGUID: 74nADR8WQQKMkAp4G55ISg==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,215,1779141600"; 
   d="scan'208";a="153948079"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien.home) ([88.188.149.159])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 08:53:37 +0200
Date: Mon, 10 Aug 2026 08:53:35 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Guru Das Srinagesh <linux@gurudas.dev>
cc: Nicolas Palix <nicolas.palix@imag.fr>, 
    Michael Turquette <mturquette@baylibre.com>, 
    Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
    cocci@inria.fr, Brian Masney <bmasney@redhat.com>, 
    linux-clk@vger.kernel.org
Subject: Re: [PATCH v3] coccinelle: Detect clk_register() anti-pattern
In-Reply-To: <20260809-cocci-clk-register-v3-1-60d036e13370@gurudas.dev>
Message-ID: <b93bd4ac-d76b-2dfe-6945-7111ff20f41b@inria.fr>
References: <20260809-cocci-clk-register-v3-1-60d036e13370@gurudas.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sun, 9 Aug 2026, Guru Das Srinagesh wrote:

> Enforce commit 12a0fd23e870 ("clk: Print an error when clk registration
> fails"): clk_register(), clk_hw_register(), and their devm_/of_ variants
> log their own error on failure, so driver-side error prints after these
> calls are redundant.
>
> Two independent match families, one per return-value convention:
> pointer return checked via IS_ERR() (clk_register()/devm_clk_register()),
> and int return checked via a nonzero value (clk_hw_register()/
> devm_clk_hw_register()/of_clk_hw_register()). Both families match
> regardless of whether the redundant message's "if" also has a trailing
> "else", via an "else S" clause with S otherwise unused.
>
> In "patch" mode, removing the redundant message also collapses the
> enclosing braces when only one statement remains, and deletes the whole
> "if" when the message was already the only (braceless) statement.
>
> Assisted-by: Claude:claude-sonnet-5 coccinelle
> Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
> ---

Hello,

Thanks for the update, which I will look into shortly.

But you are not structuring your patches in the right way.  The part above
the first --- is what will go into the git comit.  That looks fine.

But I don't understand what is the big pile of text below the ---.  When
there is a new version, I want to see what has changed as quickly as
possible.  So the changes in v3 should be the first thing that I see below
the ---, not the last thing.

For the following information, I'm not sure it should be here at all.
Either it is important, in which case it should be above the --- so people
in the future can easily benefit from it, or it is not important, in which
case it should be dropped.

julia


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
> -   if (ret) {
> -           dev_err(dev, "registering %s clock failed\n",
> -                   hw->init->name);
> +   if (ret)
>         return ret;
> -   }
>
> Already-braceless single-statement case: the whole "if" is deleted
> instead of just the message, e.g. drivers/clk/ux500/clk-sysctrl.c:171-175:
>
>     clk_reg = devm_clk_register(clk->dev, &clk->hw);
> -   if (IS_ERR(clk_reg))
> -           dev_err(dev, "clk_sysctrl: clk_register failed\n");
>
>     return clk_reg;
>
> Matches regardless of whether the "if" also has a trailing "else", via
> an "else S" clause with S otherwise unused, e.g.
> drivers/media/platform/microchip/microchip-isc-clk.c:269-275:
>
>     isc_clk->clk = clk_register(isc->dev, &isc_clk->hw);
> -   if (IS_ERR(isc_clk->clk)) {
> -           dev_err(isc->dev, "%s: clock register fail\n", clk_name);
> +   if (IS_ERR(isc_clk->clk))
>         return PTR_ERR(isc_clk->clk);
> -   } else if (id == ISC_MCK) {
> +   else if (id == ISC_MCK) {
>         of_clk_add_provider(np, of_clk_src_simple_get, isc_clk->clk);
>     }
>
> Testing:
> - Baseline: coccinelle 1.3.1, the Torvalds tree at v7.2-rc5.
> - "make coccicheck COCCI=<path> MODE=report M=drivers/clk" produced 73
>   hits, unchanged after this revision, and verified to have zero false
>   positives.
> - All four modes (report/context/patch/org) verified via "make
>   coccicheck COCCI=<path> MODE=<mode> [M=<path>]" against the
>   drivers/clk baseline and the new else-branch case above.
> - "make coccicheck COCCI=<path> MODE=report" (whole tree, no M=) finds
>   94 hits; the 21 outside drivers/clk are not part of this series.
> ---
> Changes in v3 (Julia):
> - Match an "if" regardless of a trailing "else" (else S, S unused),
>   across context/patch/report/org rules for both families. Found via
>   this to be a real, previously-invisible case in
>   drivers/media/platform/microchip/microchip-isc-clk.c.
> - Fix the org-mode script rules: cocci.print_main() takes (message,
>   position), not just a position; the previous calls omitted the
>   message entirely.
> - Drop the MAINTAINERS addition from v2 per Julia's comment that a
>   specific maintainer isn't needed for this file.
> - Link to v2: https://patch.msgid.link/20260803-cocci-clk-register-v2-1-22e789f75f98@gurudas.dev
>
> Changes in v2 (Julia):
> - Use a literal function-name disjunction instead of a regex identifier,
>   enabling spatch's file pre-filter optimization.
> - In "patch" mode, drop braces when only one statement remains, and
>   delete the whole "if" when the message was the only (braceless)
>   statement.
> - Drop two never-observed condition variants (IS_ERR(clk) == 1, ret !=
>   0); keep the one with real precedent (ret < 0).
> - Link to v1: https://patch.msgid.link/20260802-cocci-clk-register-v1-1-df68afcb1eef@gurudas.dev
> ---
>  scripts/coccinelle/api/clk_register.cocci | 165 ++++++++++++++++++++++++++++++
>  1 file changed, 165 insertions(+)
>
> diff --git a/scripts/coccinelle/api/clk_register.cocci b/scripts/coccinelle/api/clk_register.cocci
> new file mode 100644
> index 000000000000..150279827bf4
> --- /dev/null
> +++ b/scripts/coccinelle/api/clk_register.cocci
> @@ -0,0 +1,165 @@
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
> +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> +statement S;
> +@@
> +
> +clk = \(clk_register\|devm_clk_register\)(...);
> +if ( IS_ERR(clk) )
> +{
> +...
> +*voidfn(...);
> +...
> +}
> +else S
> +
> +@depends on patch@
> +expression clk;
> +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> +@@
> +
> +clk = \(clk_register\|devm_clk_register\)(...);
> +-if ( IS_ERR(clk) )
> +-voidfn(...);
> +
> +@depends on patch@
> +expression clk;
> +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> +statement S, S_else;
> +@@
> +
> +clk = \(clk_register\|devm_clk_register\)(...);
> +if ( IS_ERR(clk) )
> +(
> +-{
> +-voidfn(...);
> +S
> +-}
> +|
> +{
> +...
> +-voidfn(...);
> +...
> +}
> +)
> +else S_else
> +
> +@r1 depends on org || report@
> +position p1;
> +expression clk;
> +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> +statement S;
> +@@
> +
> +clk = \(clk_register\|devm_clk_register\)(...);
> +if ( IS_ERR(clk) )
> +{
> +...
> +voidfn@p1(...);
> +...
> +}
> +else S
> +
> +@depends on context@
> +expression ret;
> +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> +statement S;
> +@@
> +
> +ret = \(clk_hw_register\|devm_clk_hw_register\|of_clk_hw_register\)(...);
> +if ( \( ret \| ret < 0 \) )
> +{
> +...
> +*voidfn(...);
> +...
> +}
> +else S
> +
> +@depends on patch@
> +expression ret;
> +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> +@@
> +
> +ret = \(clk_hw_register\|devm_clk_hw_register\|of_clk_hw_register\)(...);
> +-if ( \( ret \| ret < 0 \) )
> +-voidfn(...);
> +
> +@depends on patch@
> +expression ret;
> +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> +statement S, S_else;
> +@@
> +
> +ret = \(clk_hw_register\|devm_clk_hw_register\|of_clk_hw_register\)(...);
> +if ( \( ret \| ret < 0 \) )
> +(
> +-{
> +-voidfn(...);
> +S
> +-}
> +|
> +{
> +...
> +-voidfn(...);
> +...
> +}
> +)
> +else S_else
> +
> +@r2 depends on org || report@
> +position p2;
> +expression ret;
> +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> +statement S;
> +@@
> +
> +ret = \(clk_hw_register\|devm_clk_hw_register\|of_clk_hw_register\)(...);
> +if ( \( ret \| ret < 0 \) )
> +{
> +...
> +voidfn@p2(...);
> +...
> +}
> +else S
> +
> +@script:python depends on org@
> +p1 << r1.p1;
> +@@
> +
> +msg = "line %s is redundant because clk_register() already prints an error on failure" % (p1[0].line)
> +cocci.print_main(msg, p1)
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
> +msg = "line %s is redundant because clk_hw_register() already prints an error on failure" % (p2[0].line)
> +cocci.print_main(msg, p2)
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
