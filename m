Received: from out-93wp-a20.jellyfish.systems (out-93wp-a20.jellyfish.systems [104.207.68.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC81C374E5A
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 06:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.207.68.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343473; cv=none; b=ErGwQgb49kiuZAf+h/6IZmO1d71k5CYC9fZcmRjxyxxdHX9LIGQ+qC3/M2Gjv0GVwuOcogNTg8ufmJpFwdDC9ODJUsjfV4XSWO1UI1KGDtsMV3kEJATPiNdQSdbKOtA4mMJMgE57eRSHSUMBMWx0qfKEDBM8XQhOFEErGFdEsUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343473; c=relaxed/simple;
	bh=/w3rph0/W6mL7jRgYKWT2yNMwe7Y6DsTjmj62JExSho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TN8gj/IPRVkL/iaFpYyKTfEFgiSRNiPnf1oaptjc9JKKDr6fOSaERmVhUYNg+zjcx81dKsAWjLM5EZck0s7vslpWtZhEpjbQAZDnWq/pKBJ8WmSCvfCAr/JKIgRVSpjkoZwKV6XLLBdqkyj/uJoPrV6pqng8z3luR7Ityn09Wdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev; spf=pass smtp.mailfrom=gurudas.dev; dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b=h0P3G270; arc=none smtp.client-ip=104.207.68.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b="h0P3G270"
Received: from gurudas.dev (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hJPyh74zcz2x9F;
	Mon, 10 Aug 2026 06:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1786343453;
	bh=Z4IFTisua/RegQxEP1MskZjCmSMfAF370cvKdqSQxLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h0P3G27025Hb6DvmOr4Epzhh+Gw31fcRnnfWgUUSeHW6Cs9mMmHJGD3LS/pmqLiiK
	 4D/G5apordlIxQZY2Cz8jccVALYU0YucrRKCo5PI5hWh3hYx28kyQ95GOJab5aW20n
	 dsxVO7yEYPpRaPs0KXtBrxpoqrn01V70hcILbx5dMN8S7wrbYCRKvnteTEbEDobx5h
	 tvwUZgICnWX7r1W8Lde60CIVZ+jo18wUWgr6i3HH1YfVSg3y3G83lTZCGn9cfLVOTX
	 NjFpw4/cPKmwY5RE+cDkHc8zVhmsmbW5bD72gs2V9cUsRPfLilrTpiDkDMWPkrzSZO
	 D0QOOlxaPppaA==
Date: Sun, 9 Aug 2026 23:30:47 -0700
From: Guru Das Srinagesh <linux@gurudas.dev>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Nicolas Palix <nicolas.palix@imag.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	cocci@inria.fr, Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] coccinelle: Detect clk_register() anti-pattern
Message-ID: <anlwF9n1KVaYcnH1@gurudas.dev>
Mail-Followup-To: Julia Lawall <julia.lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	cocci@inria.fr, Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org
References: <20260803-cocci-clk-register-v2-1-22e789f75f98@gurudas.dev>
 <b351e95-b3e5-b947-ccd3-64be2971e835@inria.fr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b351e95-b3e5-b947-ccd3-64be2971e835@inria.fr>
X-Envelope-From: linux@gurudas.dev

On Sun, Aug 09, 2026 at 10:00:22PM +0200, Julia Lawall wrote:
> 
> 
> On Mon, 3 Aug 2026, Guru Das Srinagesh wrote:
> 
> > Enforce commit 12a0fd23e870 ("clk: Print an error when clk registration
> > fails"): clk_register(), clk_hw_register(), and their devm_/of_ variants
> > log their own error on failure, so driver-side error prints after these
> > calls are redundant.
> >
> > Two independent match families, one per return-value convention:
> > pointer return checked via IS_ERR() (clk_register()/devm_clk_register()),
> > and int return checked via a nonzero value (clk_hw_register()/
> > devm_clk_hw_register()/of_clk_hw_register()).
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
> > Testing:
> > - Baseline: coccinelle 1.3.1, the Torvalds tree at v7.2-rc5.
> > - "make coccicheck COCCI=<path> MODE=report M=drivers/clk" produced 73
> >   hits and verified to have zero false positives.
> > - "MODE=patch" verified separately on scratch copies of affected files
> >   to confirm minimal, correct diffs.
> >
> > checkpatch flagged that this new file needs a MAINTAINERS entry, and I'd
> > like to maintain it, so this adds a standalone entry rather than leaving
> > the file uncovered. There's no direct precedent for an individual .cocci
> > file getting its own entry - the only other named .cocci file in
> > MAINTAINERS, scripts/coccinelle/api/string_choices.cocci, was added to
> > the existing GENERIC STRING LIBRARY entry by that subsystem's
> > maintainer, not as a new one. Happy to fold this into COMMON CLK
> > FRAMEWORK or drop it entirely depending on what the maintainers prefer.
> > ---
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
> >  MAINTAINERS                               |   5 +
> >  scripts/coccinelle/api/clk_register.cocci | 153 ++++++++++++++++++++++++++++++
> >  2 files changed, 158 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 716acfc3d7c1..26788ccbf98c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6363,6 +6363,11 @@ L:	linux-clk@vger.kernel.org
> >  S:	Maintained
> >  F:	include/linux/clk.h
> >
> > +CLK_REGISTER() COCCINELLE CHECK
> > +M:	Guru Das Srinagesh <linux@gurudas.dev>
> > +S:	Maintained
> > +F:	scripts/coccinelle/api/clk_register.cocci
> > +
> 
> I don't think there needs to be a specific maintainer for this file.

Removed.

> 
> >  CLOCKSOURCE, CLOCKEVENT DRIVERS
> >  M:	Daniel Lezcano <daniel.lezcano@kernel.org>
> >  M:	Thomas Gleixner <tglx@kernel.org>
> > diff --git a/scripts/coccinelle/api/clk_register.cocci b/scripts/coccinelle/api/clk_register.cocci
> > new file mode 100644
> > index 000000000000..86a8be92f2a2
> > --- /dev/null
> > +++ b/scripts/coccinelle/api/clk_register.cocci
> > @@ -0,0 +1,153 @@
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
> > +@@
> > +
> > +clk = \(clk_register\|devm_clk_register\)(...);
> > +if ( IS_ERR(clk) )
> > +{
> > +...
> > +*voidfn(...);
> > +...
> > +}
> 
> This will only match an if with a then branch, no else branch.  There is
> actually one case in the kernel where there is a relevant if with an else
> branch, so you may as well extend this to match that cas too.  If you just
> add else S, where S is a statement metavariable that is not used
> elsewhere, then it will match either the case with an else or the case
> with a then branch only.
> 
> Likewise for the other rules.

Done, thank you for catching the edge case which I'm guessing is
drivers/media/platform/microchip/microchip-isc-clk.c.

> 
> [...]
> 
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
> > +cocci.print_main(p2)
> 
> This code is not correct. print_main seens a string as the first argument
> and a position (which you have) as the second argument.  You can make a
> string in the same was as in the report rules.
> 
> The same is true for the other org mode rule.  If you don't have org mode,
> you can still check that the code works by testing the semantic patch with
> -D org.  It's just a text format.

Done, sorry for the oversight.

> 
> julia
> 
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
