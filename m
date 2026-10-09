Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5431D4EFFDA;
	Fri,  9 Oct 2026 16:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791563597; cv=none; b=PrZRoXSoRFMymNG8gbyZPEdSADZChV5nCDJszgIP13JcsDh5GYZZ7u8ll40T9MgHecbkiwXlOfkzLniJoIqjDsMW0p4EVfHW0+/XnUAFptW9jcTqF09BQU5RJ3jMJtk/hO/lH/9Ylz+qsU8Xk05U+KR9nCPc4ydeX/733V46j2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791563597; c=relaxed/simple;
	bh=F6AyFgzv16cqGbXFJ2cxxeaCtvR7M1nQ6viGm1YMP0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCdjxHeJb8uHw3AZtzVZ/dXvyjGwXYhvqUwBzOp9XzRapf9u5ad0hGytFbRCzPaT8GDcrNQLpDRsvKzfzAOQLnaezP2Q8zuPgWFWRunjiVAwcPODRWSedof7umQX1Pt95dTpXBkooLkTrL1owdG5wsZzfzZ2T+aClfhm9wypm78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmGWrWLU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmGWrWLU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C89A1F0089A;
	Fri,  9 Oct 2026 16:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791563594;
	bh=/Bszsd3iUrw0nt6uD6LUCDula8MPPcWL6b4iIIrrHD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kmGWrWLUURe+wS5+lnhtDahN0CpEWQCi+ZD9emfKqd9YB8i+j7hMpB6WIwWCbgdno
	 WxzUbFmjvfiCvd7PeRAm6EBAU8lGdEBwyFOXtpEw2qL8SEEFQokPpm4w2cUC8NeUS7
	 eHw5wrAU29DLoJoMLg8ggHKJ4deExL0IHWNjhaYFbVfcwYHrTh3UtQ8I95CXd1H35p
	 i9wUUELCfZbA2q4AZlolhedEYNWlku3/sK4scHWzVsWpp83edhlrer2VJ2wG5H6uUj
	 CXocyne3N9V/e/9UFEmVw7DuQPf2T8Ep7XS1oY+/hbkCR4OWg7lCu2MKe3bYNwXTCh
	 x/IUMdg9BUKiQ==
Date: Fri, 9 Oct 2026 18:33:08 +0200
From: Brian Masney <masneyb@kernel.org>
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 0/2] clk: en7523: Add support for selecting SCU serdes
Message-ID: <askXRONt8Si264ve@x1g10>
References: <20260915125226.20579-1-ansuelsmth@gmail.com>
 <179000484817.707534.5059164498545591038.b4-ty@b4>
 <CA+_ehUzrL9qHe92tE0CeaOMAD1LXGuK79t5mZGv+bp2sCas_sA@mail.gmail.com>
 <asZD79RRF4u5OJdn@x1g10>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asZD79RRF4u5OJdn@x1g10>
User-Agent: Mutt/2.4.2 (2026-08-30)

Hi Christian and Vinod,

On Wed, Oct 07, 2026 at 03:06:55PM +0200, Brian Masney wrote:
> On Tue, Oct 06, 2026 at 01:23:36PM +0200, Christian Marangi (Ansuel) wrote:
> > Il giorno lun 21 set 2026 alle ore 17:34 Brian Masney
> > <bmasney@redhat.com> ha scritto:
> > >
> > >
> > > On Tue, 15 Sep 2026 14:52:22 +0200, Christian Marangi wrote:
> > > > clk: en7523: Add support for selecting SCU serdes
> > > >
> > > > This small series is a split from the Airoha AN7581 USB PHY series [1].
> > > >
> > > > [1] https://lore.kernel.org/all/20260702093812.15918-1-ansuelsmth@gmail.com/
> > > >
> > > > Changes v2:
> > > > - Rebase on top of linux-next
> > > > - Add review tag for Documentation patch
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [1/2] dt-bindings: clock: airoha: Add PHY binding for Serdes port
> > >       commit: 11952173d8a180ac05641775f80bd6946327478f
> > > [2/2] clk: en7523: Add support for selecting the Serdes port in SCU
> > >       commit: 4e39820b601221997cb2220edc830f92367cdfc2
> > >
> > 
> > is it possible to have a stable branch/signed tag for phy subsystem?
> > Commit 11952173d8a180ac05641775f80bd6946327478f is needed
> > to permit correct compilation of a airoha usb phy driver.
> 
> Yes. I'll have to rebase the clk-next tree but it's no big deal.
> 
> I'm at Linux Plumbers right now and I'll send out an immutable tag in a
> day or two.

I looked into creating an immutable branch, however as I mentioned it's
going to require rebasing clk-next (actually clk-pile). I'm willing to
do that, however I realized after I sent my last email that the laptop
I'm working on right now in Europe only has access to my kernel.org
account. So I'd have to rebase all of the prior commits and add my korg
Signed-off-by since it's going to change the committer on lots of
commits from my Red Hat to korg account.  I don't want to do that.

Given that we're this close to the merge window, I'd like to avoid any
kind of risky operations on the tree this close to assembling a pull for
Linus. If I can be convinced this is particularly pressing for v7.4 I'm
willing to entertain the request, but I wouldn't be able to do it until
Monday when I'm back in the US.

Brian
