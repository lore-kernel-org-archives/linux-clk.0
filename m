Received: from out-93wp-a49.jellyfish.systems (out-93wp-a49.jellyfish.systems [104.207.68.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1334C39D6F2
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 07:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.207.68.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786346322; cv=none; b=oVrkTL9vyGLlnNNSIbUYfFVF3yonFsMbVMLDLe3tRjyrFX89IUz/AuPPBtEVmhhvClPbUf91HVwnzLQcmjT6GkdfkgdZ/00T36vaPcUzv6ZsqOauCfPWdeYNpSHmwM3cGezQl+OVwONwNY9iz0xY94Ef4ghnyLcsj4EAilNbvK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786346322; c=relaxed/simple;
	bh=p8Z29qgHYfNDseHQTSQTMub7Kokq0EMvcJvrNS+wEk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvBKO4IzrHrFltnB2ba7bgQ59WY9ECpJQBeAwiClkvQIHDNtY20vyoY3Kw5BBpLsdM3/DRkVQI1dyBY8rfmUnnmPsp+x62FGEe9evy2zbbbNeWX8LrE8f/EyBHpKzWSdJXwG/S4GRVh+Tjd18cvAogVu5iI6HEtLyL3AzaPREoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev; spf=pass smtp.mailfrom=gurudas.dev; dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b=Hx3MEvOw; arc=none smtp.client-ip=104.207.68.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b="Hx3MEvOw"
Received: from gurudas.dev (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hJQvP45D5z2xBB;
	Mon, 10 Aug 2026 07:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1786345985;
	bh=u7n5nk1Q6WJ0NpVun5yyD9tXGMGsft6OO/yOgrv960I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hx3MEvOw0KG8hM0RyALfZi0eCB02L/UCiKF8Aiw5Ln3RMUJTbxy2+M81OyJqvA3q9
	 9ugZRhAn7gIElHKiNOcmlXoipgihjx9V8xnpZhsIvq1/907DMV7Ynq2HGEjndeyZpg
	 FaQaRbzgKF19kKQe7Cs3AbMinwTorIhzXH+JACEgi49S8eb21ge++Q7Xrote4xrbji
	 2lltqkrFxzzZ3IzBgI89zR/StGJDSlgcRS03eq8IC/vD4zwCUq2Er7faw5MNnzzTdi
	 59aa7yRq4cekvMFuK6Db6sUbJl8Zh93LL3MkWVIB3LgKF0oQJy8hESMR0DukabdXCF
	 b2HuqXBFprecg==
Date: Mon, 10 Aug 2026 00:13:03 -0700
From: Guru Das Srinagesh <linux@gurudas.dev>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Nicolas Palix <nicolas.palix@imag.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	cocci@inria.fr, Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3] coccinelle: Detect clk_register() anti-pattern
Message-ID: <anl5_3932XfoJH9P@gurudas.dev>
Mail-Followup-To: Julia Lawall <julia.lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	cocci@inria.fr, Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org
References: <20260809-cocci-clk-register-v3-1-60d036e13370@gurudas.dev>
 <b93bd4ac-d76b-2dfe-6945-7111ff20f41b@inria.fr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b93bd4ac-d76b-2dfe-6945-7111ff20f41b@inria.fr>
X-Envelope-From: linux@gurudas.dev

On Mon, Aug 10, 2026 at 08:53:35AM +0200, Julia Lawall wrote:
> 
> 
> On Sun, 9 Aug 2026, Guru Das Srinagesh wrote:
> 
> > Enforce commit 12a0fd23e870 ("clk: Print an error when clk registration
> > fails"): clk_register(), clk_hw_register(), and their devm_/of_ variants
> > log their own error on failure, so driver-side error prints after these
> > calls are redundant.
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
> 
> Hello,
> 
> Thanks for the update, which I will look into shortly.

Thank you for reviewing.

> 
> But you are not structuring your patches in the right way.  The part above
> the first --- is what will go into the git comit.  That looks fine.
> 
> But I don't understand what is the big pile of text below the ---.  When

That is the cover letter for the patch.

I use the b4 tool [1] which is increasingly being used by kernel maintainers and
contributors alike to work with LKML.

When there is only one patch in a patchset/series, b4 puts the cover letter under the
first --- of the patch as described in [2]:

	When you only have a single patch, b4 should “mix-in” the contents of the cover
	letter into the “under-the-cut” portion of the patch itself, where it serves as a
	source of additional information for the reviewers, but never makes it into the
	actual commit.

[1]: https://b4.docs.kernel.org/en/latest/index.html 
[2]: https://b4.docs.kernel.org/en/latest/contributor/prep.html#what-if-the-series-only-has-a-single-patch

> there is a new version, I want to see what has changed as quickly as
> possible.  So the changes in v3 should be the first thing that I see below
> the ---, not the last thing.

Sure thing - I will make sure to put the changelog right under the --- as you
described for any future revisions.

> 
> For the following information, I'm not sure it should be here at all.
> Either it is important, in which case it should be above the --- so people
> in the future can easily benefit from it, or it is not important, in which
> case it should be dropped.
> 
> julia

For reviewers' convenience, the cover letter contains examples of the kind of
transformations that this script will create when used which I think would be too
verbose for inclusion in the commit message but useful for reviewing otherwise.

If you feel it is not required/helpful, I could remove everything but the changelog
from the cover letter for future revisions. Alternatively, I could put the changelog
right at the top so that it appears right under the first --- with the examples and
other stuff following that. Going with the former unless you say otherwise.

Thank you.

Guru Das.
