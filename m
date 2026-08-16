Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CEC330676;
	Sun, 16 Aug 2026 08:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786867727; cv=none; b=esPjiarknI2bkuZ9jwUEHmGCMQlrX+zP9XAcYUZx9thKr7oENA14buanULOt/MCnLiH5E4j1n1adYwRIiufZdHo1NEXx7ga4b3Lg7hsLpXeTvU4omJCmymTH0ffT6622MaA0QKwz7ofeAnywBXMGfFE17Hb+9nJo+Ll8sXwRw0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786867727; c=relaxed/simple;
	bh=nOiX6qqnv+3vw0jkv/6+zWia5MuMlJohNRdS36FF07c=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LY3cCS8FupbQ/aS35GNmhQoo2aBa1YDt2bH0Sqcw8qfBni5n/DUUWh8Sj3HER9xMB/tzbOgqDmh31iD4kUuUZUw3mqg5i1Eg6FhPHW7n3/v8871JjK+T/YAuqRr4EDcqd5ZbCiGILzZBfO/P6jYWpqRi44Qqxx8Fo5HV/skvyLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=WsKwzinW; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="WsKwzinW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=FY5aYwGF/nysJHvjVWkP/+mqsqcXSRqBExIQ99oxZk8=;
  b=WsKwzinWWqsEufajhI783h/1LB0CsI+DVNf6mAFTb3eNLHSbyaZFx9J5
   y7P5Qz5FwJHozyiG3/hCe8FVLVpGAG+vsYR+BlEkT+Yx/f4TgkniwW/cn
   rBjWzTg/s+hAG1pffqr34JLjOITuKDR2sY2YbbhOmDAQYLXKeMmFj6DBk
   s=;
X-CSE-ConnectionGUID: prJY2vJkRbus23zqETGmRw==
X-CSE-MsgGUID: fRGXddh9Sd2kjEdNPR4aqw==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,226,1779141600"; 
   d="scan'208";a="290275006"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien.home) ([88.188.149.159])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 10:08:41 +0200
Date: Sun, 16 Aug 2026 10:08:40 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Guru Das Srinagesh <linux@gurudas.dev>
cc: Nicolas Palix <nicolas.palix@imag.fr>, 
    Michael Turquette <mturquette@baylibre.com>, 
    Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
    cocci@inria.fr, Brian Masney <bmasney@redhat.com>, 
    linux-clk@vger.kernel.org
Subject: Re: [PATCH v3] coccinelle: Detect clk_register() anti-pattern
In-Reply-To: <bbc7fb40-7650-c81-6e19-f7baba188e86@inria.fr>
Message-ID: <188bba40-bee-fb85-93c-fb59487dc861@inria.fr>
References: <20260809-cocci-clk-register-v3-1-60d036e13370@gurudas.dev> <bbc7fb40-7650-c81-6e19-f7baba188e86@inria.fr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sun, 16 Aug 2026, Julia Lawall wrote:

>
>
> On Sun, 9 Aug 2026, Guru Das Srinagesh wrote:
>
> > Enforce commit 12a0fd23e870 ("clk: Print an error when clk registration
> > fails"): clk_register(), clk_hw_register(), and their devm_/of_ variants
> > log their own error on failure, so driver-side error prints after these
> > calls are redundant.
>
> Hello,
>
> This neglects a few cases found in current code: pr_crit, printk, and
> DRM_DEV_ERROR
>
> A more extreme solution would be to not name the printing functions
> explicitly, but have it be any function that is not returning a value
> and that is taking a string as an argument.
>
> You can match a string with a metavariable like this:
>
> constant char [] c;
>
> and then the call site would be:
>
> *voidfn(...,c,...);
>
> another issue is that in one case, removing the error message leaves:
>
> ret = PTR_ERR(inno->phyclk);
> return ret;
>
> This could be cleaned up to just return PTR_ERR(inno->phyclk)

Note that there are lots of occurrences of

ret = e;
return ret;

for some expression ret and e, and 99.99% of them are fine as is.  But in
this specific case of error handling code, perhaps it is not useful to
introduce more of them.

julia

>
> julia
>
>
> >
> > Two independent match families, one per return-value convention:
> > pointer return checked via IS_ERR() (clk_register()/devm_clk_register()),
> > and int return checked via a nonzero value (clk_hw_register()/
> > devm_clk_hw_register()/of_clk_hw_register()). Both families match
> > regardless of whether the redundant message's "if" also has a trailing
> > "else", via an "else S" clause with S otherwise unused.
> >
> > In "patch" mode, removing the redundant message also collapses the
> > enclosing braces when only one statement remains, and deletes the whole
> > "if" when the message was already the only (braceless) statement.
> >
> > Assisted-by: Claude:claude-sonnet-5 coccinelle
> > Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
> > ---
> > Add a Coccinelle semantic patch enforcing commit 12a0fd23e870 ("clk:
> > Print an error when clk registration fails"): flags, and in "patch"
> > mode removes, driver-side error prints that are now redundant after
> > clk_register()/clk_hw_register() and their devm_/of_ variants.
> >
> > Two independent match families, one per return-value convention.
> >
> > Pointer return, IS_ERR()-checked (clk_register()/devm_clk_register()),
> > e.g. drivers/clk/clk-xgene.c:152-157:
> >
> >     clk = clk_register(dev, &apmclk->hw);
> >     if (IS_ERR(clk)) {
> > -       pr_err("%s: could not register clk %s\n", __func__, name);
> >         kfree(apmclk);
> >         return NULL;
> >     }
> >
> > Int return, nonzero-checked (clk_hw_register()/devm_clk_hw_register()/
> > of_clk_hw_register()), e.g. drivers/clk/meson/meson-clkc-utils.c:49-54:
> >
> >     ret = devm_clk_hw_register(dev, hw);
> > -   if (ret) {
> > -           dev_err(dev, "registering %s clock failed\n",
> > -                   hw->init->name);
> > +   if (ret)
> >         return ret;
> > -   }
> >
> > Already-braceless single-statement case: the whole "if" is deleted
> > instead of just the message, e.g. drivers/clk/ux500/clk-sysctrl.c:171-175:
> >
> >     clk_reg = devm_clk_register(clk->dev, &clk->hw);
> > -   if (IS_ERR(clk_reg))
> > -           dev_err(dev, "clk_sysctrl: clk_register failed\n");
> >
> >     return clk_reg;
> >
> > Matches regardless of whether the "if" also has a trailing "else", via
> > an "else S" clause with S otherwise unused, e.g.
> > drivers/media/platform/microchip/microchip-isc-clk.c:269-275:
> >
> >     isc_clk->clk = clk_register(isc->dev, &isc_clk->hw);
> > -   if (IS_ERR(isc_clk->clk)) {
> > -           dev_err(isc->dev, "%s: clock register fail\n", clk_name);
> > +   if (IS_ERR(isc_clk->clk))
> >         return PTR_ERR(isc_clk->clk);
> > -   } else if (id == ISC_MCK) {
> > +   else if (id == ISC_MCK) {
> >         of_clk_add_provider(np, of_clk_src_simple_get, isc_clk->clk);
> >     }
> >
> > Testing:
> > - Baseline: coccinelle 1.3.1, the Torvalds tree at v7.2-rc5.
> > - "make coccicheck COCCI=<path> MODE=report M=drivers/clk" produced 73
> >   hits, unchanged after this revision, and verified to have zero false
> >   positives.
> > - All four modes (report/context/patch/org) verified via "make
> >   coccicheck COCCI=<path> MODE=<mode> [M=<path>]" against the
> >   drivers/clk baseline and the new else-branch case above.
> > - "make coccicheck COCCI=<path> MODE=report" (whole tree, no M=) finds
> >   94 hits; the 21 outside drivers/clk are not part of this series.
> > ---
> > Changes in v3 (Julia):
> > - Match an "if" regardless of a trailing "else" (else S, S unused),
> >   across context/patch/report/org rules for both families. Found via
> >   this to be a real, previously-invisible case in
> >   drivers/media/platform/microchip/microchip-isc-clk.c.
> > - Fix the org-mode script rules: cocci.print_main() takes (message,
> >   position), not just a position; the previous calls omitted the
> >   message entirely.
> > - Drop the MAINTAINERS addition from v2 per Julia's comment that a
> >   specific maintainer isn't needed for this file.
> > - Link to v2: https://patch.msgid.link/20260803-cocci-clk-register-v2-1-22e789f75f98@gurudas.dev
> >
> > Changes in v2 (Julia):
> > - Use a literal function-name disjunction instead of a regex identifier,
> >   enabling spatch's file pre-filter optimization.
> > - In "patch" mode, drop braces when only one statement remains, and
> >   delete the whole "if" when the message was the only (braceless)
> >   statement.
> > - Drop two never-observed condition variants (IS_ERR(clk) == 1, ret !=
> >   0); keep the one with real precedent (ret < 0).
> > - Link to v1: https://patch.msgid.link/20260802-cocci-clk-register-v1-1-df68afcb1eef@gurudas.dev
> > ---
> >  scripts/coccinelle/api/clk_register.cocci | 165 ++++++++++++++++++++++++++++++
> >  1 file changed, 165 insertions(+)
> >
> > diff --git a/scripts/coccinelle/api/clk_register.cocci b/scripts/coccinelle/api/clk_register.cocci
> > new file mode 100644
> > index 000000000000..150279827bf4
> > --- /dev/null
> > +++ b/scripts/coccinelle/api/clk_register.cocci
> > @@ -0,0 +1,165 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/// Remove error messages after clk registration failures, because
> > +/// clk_register(), clk_hw_register(), and their variants already log
> > +/// an error when they fail. See commit 12a0fd23e870 ("clk: Print an
> > +/// error when clk registration fails").
> > +//
> > +// Confidence: Medium
> > +// Options: --include-headers
> > +
> > +virtual patch
> > +virtual context
> > +virtual org
> > +virtual report
> > +
> > +@depends on context@
> > +expression clk;
> > +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> > +statement S;
> > +@@
> > +
> > +clk = \(clk_register\|devm_clk_register\)(...);
> > +if ( IS_ERR(clk) )
> > +{
> > +...
> > +*voidfn(...);
> > +...
> > +}
> > +else S
> > +
> > +@depends on patch@
> > +expression clk;
> > +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> > +@@
> > +
> > +clk = \(clk_register\|devm_clk_register\)(...);
> > +-if ( IS_ERR(clk) )
> > +-voidfn(...);
> > +
> > +@depends on patch@
> > +expression clk;
> > +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> > +statement S, S_else;
> > +@@
> > +
> > +clk = \(clk_register\|devm_clk_register\)(...);
> > +if ( IS_ERR(clk) )
> > +(
> > +-{
> > +-voidfn(...);
> > +S
> > +-}
> > +|
> > +{
> > +...
> > +-voidfn(...);
> > +...
> > +}
> > +)
> > +else S_else
> > +
> > +@r1 depends on org || report@
> > +position p1;
> > +expression clk;
> > +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> > +statement S;
> > +@@
> > +
> > +clk = \(clk_register\|devm_clk_register\)(...);
> > +if ( IS_ERR(clk) )
> > +{
> > +...
> > +voidfn@p1(...);
> > +...
> > +}
> > +else S
> > +
> > +@depends on context@
> > +expression ret;
> > +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> > +statement S;
> > +@@
> > +
> > +ret = \(clk_hw_register\|devm_clk_hw_register\|of_clk_hw_register\)(...);
> > +if ( \( ret \| ret < 0 \) )
> > +{
> > +...
> > +*voidfn(...);
> > +...
> > +}
> > +else S
> > +
> > +@depends on patch@
> > +expression ret;
> > +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> > +@@
> > +
> > +ret = \(clk_hw_register\|devm_clk_hw_register\|of_clk_hw_register\)(...);
> > +-if ( \( ret \| ret < 0 \) )
> > +-voidfn(...);
> > +
> > +@depends on patch@
> > +expression ret;
> > +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> > +statement S, S_else;
> > +@@
> > +
> > +ret = \(clk_hw_register\|devm_clk_hw_register\|of_clk_hw_register\)(...);
> > +if ( \( ret \| ret < 0 \) )
> > +(
> > +-{
> > +-voidfn(...);
> > +S
> > +-}
> > +|
> > +{
> > +...
> > +-voidfn(...);
> > +...
> > +}
> > +)
> > +else S_else
> > +
> > +@r2 depends on org || report@
> > +position p2;
> > +expression ret;
> > +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> > +statement S;
> > +@@
> > +
> > +ret = \(clk_hw_register\|devm_clk_hw_register\|of_clk_hw_register\)(...);
> > +if ( \( ret \| ret < 0 \) )
> > +{
> > +...
> > +voidfn@p2(...);
> > +...
> > +}
> > +else S
> > +
> > +@script:python depends on org@
> > +p1 << r1.p1;
> > +@@
> > +
> > +msg = "line %s is redundant because clk_register() already prints an error on failure" % (p1[0].line)
> > +cocci.print_main(msg, p1)
> > +
> > +@script:python depends on report@
> > +p1 << r1.p1;
> > +@@
> > +
> > +msg = "line %s is redundant because clk_register() already prints an error on failure" % (p1[0].line)
> > +coccilib.report.print_report(p1[0], msg)
> > +
> > +@script:python depends on org@
> > +p2 << r2.p2;
> > +@@
> > +
> > +msg = "line %s is redundant because clk_hw_register() already prints an error on failure" % (p2[0].line)
> > +cocci.print_main(msg, p2)
> > +
> > +@script:python depends on report@
> > +p2 << r2.p2;
> > +@@
> > +
> > +msg = "line %s is redundant because clk_hw_register() already prints an error on failure" % (p2[0].line)
> > +coccilib.report.print_report(p2[0], msg)
> >
> > ---
> > base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
> > change-id: 20260802-cocci-clk-register-951d94251af4
> >
> > Best regards,
> > --
> > Guru Das Srinagesh <linux@gurudas.dev>
> >
> >
>
