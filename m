Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E662129CF6
	for <linux-clk@vger.kernel.org>; Thu, 10 Oct 2024 01:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728523417; cv=none; b=NYrnphHSd8/fxE6LClcuu11BsXvPEA1Wi2AiCN7EqRBD12pCSjoQIuNAJwHqRs9f9omsWbtpt2Z9ocppIXAgL329jzHZ+3RIj/7Y0ngOAYeYj2HCvfqEpTtVNNSTv+GK4+/iUCSGCcodNoxqUJG/xWMXaYZwOic2Dbd7SiZWhOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728523417; c=relaxed/simple;
	bh=LsGF/3OhA4SJecA1tWtBo7IU2YMXTepieP3OWtS1cVQ=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=JAt9Zk+sYd4VZgjMGVA2dH9SeCqrybqkeR7Qyu9ue2cXGPFD/VD1x88IovobaAocDAY9e5W40Vslwx7ErWM+x+vcUl0hrElfUPlgw+ecQHWGHV/heFzbFVRhRGX/VPHXkgsRfslxdTXp1ZwGAUcxIvFFF57yljduLtlUeTjin7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OfSvZYiu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OfSvZYiu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47904C4CEC3;
	Thu, 10 Oct 2024 01:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728523416;
	bh=LsGF/3OhA4SJecA1tWtBo7IU2YMXTepieP3OWtS1cVQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OfSvZYiuTIWH8BG4GEmsATjeHzprsf88MZin87llr5mCHRpN719uRbqUSaplrpPms
	 3jPtyiZKuYneUkxGhgzd0CB/9sJ7pTY3DJYOzP523G4c/s5846SrliQD/toPC2iv6k
	 GvG7oTSwSSKD75BGPnoSr+g3z7BuDrLV0SekBRGrYa/R7YdVKQboqOBJTghGvIpzn8
	 Vjn5s8p9QpFNLrPysBDQLodzN8DAYoCXY9TGNOAFQtKEYriINaQk91v1uzgsIP5nT2
	 3/wCW8yut2CSk/jrQmIlRJlrESz1y//HH01Zogyg5EGw+aCds3l3FhRtgJtmCthJXx
	 w4LhpxeXh+i/g==
Message-ID: <70e7e94dbead76bea42b4d5704d4ef08.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZwcmrWgoClYI2nUq@gallifrey>
References: <ZwXUQOr-afniO-2u@gallifrey> <27ac7ba804d260ca9e1397a17b9e8696.sboyd@kernel.org> <ZwcmrWgoClYI2nUq@gallifrey>
Subject: Re: Of clk_hw_unregister_fractional_divider
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org
To: Dr. David Alan Gilbert <linux@treblig.org>
Date: Wed, 09 Oct 2024 18:23:33 -0700
User-Agent: alot/0.10

Quoting Dr. David Alan Gilbert (2024-10-09 17:58:21)
> * Stephen Boyd (sboyd@kernel.org) wrote:
> > Quoting Dr. David Alan Gilbert (2024-10-08 17:54:24)
> > > Hi,
> > >   One of my scripts noticed that clk_hw_unregister_fractional_divider
> > > was unused and I was thinking of dead coding it, but thought it worth
> > > asking whether it's actually a missing call to it.
> > >=20
> > >   It was added in 2016 by:
> > >=20
> > > commit 39b44cff4ad4af6d7abd9dd2acb288b005c26503
> > > Author: Stephen Boyd <sboyd@codeaurora.org>
> > > Date:   Sun Feb 7 00:15:09 2016 -0800
> > >=20
> > >     clk: fractional-divider: Add hw based registration APIs
> > >    =20
> > > and I can see clk_hw_register_fractional_divider is called from
> > > clk_register_fractional_divider.
> > >=20
> > > Is that just consequence of them being system devices that never
> > > get unregistered or something else?
> > >=20
> >=20
> > I don't know what you mean by system devices.
>=20
> I mean something that can't get unplugged/removed.

Ok.

>=20
> > The clk_hw prefixed functions and clk_hw based APIs should be used
> > instead of struct clk APIs for clk providers in general. I'd accept a
> > patch that migrates the two calls to clk_register_fractional_divider()
> > with a call to clk_hw_register_fractional_divider() instead. If that's
> > done we can remove clk_register_fractional_divider(), which is the
> > overall plan but nobody got around to it so far.
>=20
> Oh hmm, that doesn't look too hard for those two - although I'm not sure
> I have a way of testing it?

Sure. I don't think anything really changes if that's done so probably a
compile test is all that's needed.

>=20
> However, my question was about the clk_hw_*un*register_fractional_divider
> - I can see the clk_register_fractional_divider can be replaced by
> clk_hw_register_fractional_divider - but would there need to be
> a call to the unregister somewhere? (Which is what my script noticed
> there's no callers of).
>=20

Yes they would call clk_hw_unregister_fractional_divider() as well after
changing to use clk_hw pointers for the registration path.
