Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC54394792;
	Mon, 10 Aug 2026 08:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786348808; cv=none; b=Tieawlx3xjmixvjZ2032UkNBTN9lREVfvvUvWQwxZkJx/nYHrT0OQsu4PN9lpS5z1KfeK2AFEqm2l6Q810PkCe7CeViM2QRk8vMq9RdVTIzug/RDt4N6qNPdE6rnF6KaGOb6KkIdPHHvJO7Y5AowMJQLU5yw8FcSZ0cJUQSFAFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786348808; c=relaxed/simple;
	bh=YOxPdfTJ0fo517EwFGiPM2McSuVKon14l7zuVcACD+k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fzGJ3PI8z5h6tyuu1j+4iUvx1e1n8FTs2Sy52kou+Umzi0D06tAGDvX7KIhDL+8ZwF7st8oUklvHR++4dbUlE2klYrXOAeHuaDhm0TofDdccHSRYUwB1U4QWiC72wymaq4IciaUiko1QlwLoENnW0bKcDA6w14u5ESzxZxSqR5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=E4sktcPu; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="E4sktcPu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=lGQiOlrktcd3+jvljO8hOvH/MpA1xs1PGZ1hCsZ6/AU=;
  b=E4sktcPuWCetDG9a4Tsg6NfewRhUpkz/PKloLH1gcS0s7cUENT6e6NZN
   NLAqSAEczC62VZCx8uJ6oym+ilvUGt7yI7MQOnXdFE7yttxuS1S2UPlAc
   A4M0xp7yiNgsSQkg+jI4wxpNTUVAZfE877xIPR9Ybw/3+1nlKt/0+/Uob
   Q=;
X-CSE-ConnectionGUID: U0q5QonYQZ62sqsGtSW+AQ==
X-CSE-MsgGUID: rwUaGnIxQSC0XWgjWaMrwA==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,215,1779141600"; 
   d="scan'208";a="153952302"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 10:00:02 +0200
Date: Mon, 10 Aug 2026 10:00:01 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Guru Das Srinagesh <linux@gurudas.dev>
cc: Nicolas Palix <nicolas.palix@imag.fr>, 
    Michael Turquette <mturquette@baylibre.com>, 
    Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
    cocci@inria.fr, Brian Masney <bmasney@redhat.com>, 
    linux-clk@vger.kernel.org
Subject: Re: [PATCH v3] coccinelle: Detect clk_register() anti-pattern
In-Reply-To: <anl5_3932XfoJH9P@gurudas.dev>
Message-ID: <e2b8759e-aa80-df6-cf21-71fd1920ad8@inria.fr>
References: <20260809-cocci-clk-register-v3-1-60d036e13370@gurudas.dev> <b93bd4ac-d76b-2dfe-6945-7111ff20f41b@inria.fr> <anl5_3932XfoJH9P@gurudas.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-310945668-1786348801=:3693"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-310945668-1786348801=:3693
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Mon, 10 Aug 2026, Guru Das Srinagesh wrote:

> On Mon, Aug 10, 2026 at 08:53:35AM +0200, Julia Lawall wrote:
> >
> >
> > On Sun, 9 Aug 2026, Guru Das Srinagesh wrote:
> >
> > > Enforce commit 12a0fd23e870 ("clk: Print an error when clk registration
> > > fails"): clk_register(), clk_hw_register(), and their devm_/of_ variants
> > > log their own error on failure, so driver-side error prints after these
> > > calls are redundant.
> > >
> > > Two independent match families, one per return-value convention:
> > > pointer return checked via IS_ERR() (clk_register()/devm_clk_register()),
> > > and int return checked via a nonzero value (clk_hw_register()/
> > > devm_clk_hw_register()/of_clk_hw_register()). Both families match
> > > regardless of whether the redundant message's "if" also has a trailing
> > > "else", via an "else S" clause with S otherwise unused.
> > >
> > > In "patch" mode, removing the redundant message also collapses the
> > > enclosing braces when only one statement remains, and deletes the whole
> > > "if" when the message was already the only (braceless) statement.
> > >
> > > Assisted-by: Claude:claude-sonnet-5 coccinelle
> > > Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
> > > ---
> >
> > Hello,
> >
> > Thanks for the update, which I will look into shortly.
>
> Thank you for reviewing.
>
> >
> > But you are not structuring your patches in the right way.  The part above
> > the first --- is what will go into the git comit.  That looks fine.
> >
> > But I don't understand what is the big pile of text below the ---.  When
>
> That is the cover letter for the patch.
>
> I use the b4 tool [1] which is increasingly being used by kernel maintainers and
> contributors alike to work with LKML.

OK... I guess I have not been paying enough attention.

I think the conclusion would be that if the cover letter requires more
than say 2 lines of text there should be a real cover letter even if there
is only one patch?

But I would stilll think that the changes should come first.  That's what
the maintainer wants to see.

julia

>
> When there is only one patch in a patchset/series, b4 puts the cover letter under the
> first --- of the patch as described in [2]:
>
> 	When you only have a single patch, b4 should “mix-in” the contents of the cover
> 	letter into the “under-the-cut” portion of the patch itself, where it serves as a
> 	source of additional information for the reviewers, but never makes it into the
> 	actual commit.
>
> [1]: https://b4.docs.kernel.org/en/latest/index.html
> [2]: https://b4.docs.kernel.org/en/latest/contributor/prep.html#what-if-the-series-only-has-a-single-patch
>
> > there is a new version, I want to see what has changed as quickly as
> > possible.  So the changes in v3 should be the first thing that I see below
> > the ---, not the last thing.
>
> Sure thing - I will make sure to put the changelog right under the --- as you
> described for any future revisions.
>
> >
> > For the following information, I'm not sure it should be here at all.
> > Either it is important, in which case it should be above the --- so people
> > in the future can easily benefit from it, or it is not important, in which
> > case it should be dropped.
> >
> > julia
>
> For reviewers' convenience, the cover letter contains examples of the kind of
> transformations that this script will create when used which I think would be too
> verbose for inclusion in the commit message but useful for reviewing otherwise.
>
> If you feel it is not required/helpful, I could remove everything but the changelog
> from the cover letter for future revisions. Alternatively, I could put the changelog
> right at the top so that it appears right under the first --- with the examples and
> other stuff following that. Going with the former unless you say otherwise.
>
> Thank you.
>
> Guru Das.
>
--8323329-310945668-1786348801=:3693--
