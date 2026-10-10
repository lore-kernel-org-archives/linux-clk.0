Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88423998A6;
	Sat, 10 Oct 2026 09:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791624632; cv=none; b=M9onbWj6vLA4abhnheA7H3lmzsN9J5Va6vVykrODHz7LueFPqDtZlP8Ax3Q2BQoEGfsJjfEPA8HGtVvXDARRIrd5TtsxjUMjMW8zHtUC7XjqSkw6tN8D4HMM8WPirFQytExM6aFqiqfVJLmBQT/1+wVtWu2kcLyS5Q+kZVRYrbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791624632; c=relaxed/simple;
	bh=FPWTtZnRa/XbFRcpNgUFJ2yRAoGZbSTq3vkG/aBIgAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IixlfEd6wwyUtx4EB/Bt27VFdp3w5KjiYTwNx9RlsGdbRfto3eKHQ3ce+g6+yY3J+f84Le7Rmbv3rwKM/1aKxvJfW2Z+IdnwcyzuUhRO4SBgr8DGfklO8rxXCvGTKYMMHxAjauXN5+bO95CmSSWOkleXRUHlA1mgBxS2+AGw5VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNEAqFUT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNEAqFUT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1165A1F00893;
	Sat, 10 Oct 2026 09:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791624631;
	bh=/+Vxq1o02mDWR1BNJWOLcsj18DVs283fdRVapx4nsXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VNEAqFUTMQek7CuGdGDawVNRARU5W+S89JEu9ORpuE2mrcglPIUbPwjcDAR7xcMHG
	 n+BtKu1qLFE1AgHte/9/5d/dRDT/4TSgxi4my5/zXbZ+GejYYFBMGJ8uLHBEC4r718
	 bDtGeUl9kPy4x+USV2utU2uUc6uMbLMAdYTy5W3pFJvakvlYiJHc3mcPllMm7ncRtW
	 NlRMjpB6p08omkcpG6MKU/Ns9Z84ipc5xWrbSvWZ3VIb7JlMKYWcggXnAproFt6f/u
	 Y/YhegpJoUKWxInNFDco0NINblZU1VA6lsEa0l5U3FerWclWJsnC4g8wSkFQPeE4y2
	 fF+D/NDfvO0jA==
Date: Sat, 10 Oct 2026 11:30:28 +0200
From: Vinod Koul <vkoul@kernel.org>
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Brian Masney <masneyb@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] clk: en7523: Add support for selecting SCU serdes
Message-ID: <asoFtO0sw6DnTJ6K@parshuram>
References: <20260915125226.20579-1-ansuelsmth@gmail.com>
 <179000484817.707534.5059164498545591038.b4-ty@b4>
 <CA+_ehUzrL9qHe92tE0CeaOMAD1LXGuK79t5mZGv+bp2sCas_sA@mail.gmail.com>
 <asZD79RRF4u5OJdn@x1g10>
 <askXRONt8Si264ve@x1g10>
 <CA+_ehUw7374O63trsUORkfMbhMJqiXn_WkC_KL+hTDnLAa2=Gg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+_ehUw7374O63trsUORkfMbhMJqiXn_WkC_KL+hTDnLAa2=Gg@mail.gmail.com>

On 09-10-26, 19:22, Christian Marangi (Ansuel) wrote:

> > > >
> > > > is it possible to have a stable branch/signed tag for phy subsystem?
> > > > Commit 11952173d8a180ac05641775f80bd6946327478f is needed
> > > > to permit correct compilation of a airoha usb phy driver.
> > >
> > > Yes. I'll have to rebase the clk-next tree but it's no big deal.
> > >
> > > I'm at Linux Plumbers right now and I'll send out an immutable tag in a
> > > day or two.
> >
> > I looked into creating an immutable branch, however as I mentioned it's
> > going to require rebasing clk-next (actually clk-pile). I'm willing to
> > do that, however I realized after I sent my last email that the laptop
> > I'm working on right now in Europe only has access to my kernel.org
> > account. So I'd have to rebase all of the prior commits and add my korg
> > Signed-off-by since it's going to change the committer on lots of
> > commits from my Red Hat to korg account.  I don't want to do that.
> >
> > Given that we're this close to the merge window, I'd like to avoid any
> > kind of risky operations on the tree this close to assembling a pull for
> > Linus. If I can be convinced this is particularly pressing for v7.4 I'm
> > willing to entertain the request, but I wouldn't be able to do it until
> > Monday when I'm back in the US.

I would be on same lines. Considering we are _very_ close to merge
windows, I would be very hesitant to rebase my tree
> >
> 
> Thanks a lot for the effort. No, no need to hurry on this.
> 
> It was ideal to have as it's currently blocking 2 other driver for
> submission but it's not worth to cause all these rebase and resign.
> 
> If minimal changes are possible, it's totally ok to wait for Monday.
> 
> If not possible, then rc1 it is.

Yes lets postpone this to rc1.

Also, in future it is strongly recommended that people request folks for
immutable tags when patches are picked (ideally mention in cover) so
that dependencies are taken care of.

Thanks
-- 
~Vinod
