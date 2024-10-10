Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAD4FC08
	for <linux-clk@vger.kernel.org>; Thu, 10 Oct 2024 00:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728521912; cv=none; b=sHA401Hhecp9gcKYl161+QESDFRsGPs4tEzNrXryg4WL2rGwlvBcrDSZ0WgJIwemXN7EQluRIi+ECWIzCPMlj7e2Om44S5vNy3ToMNHAW740JK/30RzlkbBrI1KPYQ/CKt0F1LTMv7rfkbMkWq2g70P9UiP3Ld1j6x0yICSA4L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728521912; c=relaxed/simple;
	bh=Wn/pEVHe4v8IGyn2iG+dr3HXEQnPSRPvVcS7axQ/lRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S4FMM9ZNg0hH0P6gytclBmTECALmgjLVWynnJw6YhwpkgMEKtuxVrP6CQSd5Vu5MAVkz+5S4xBsf0vXhtEni9zBdvOma7DWlu3aYi/tgETehdxZHAQPZPZ8ZD4fwCrNXgr4iOi57cT45a2TTTY/mGjWBcwQUcGBZdzmwkHMbNcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=BAf7Damf; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="BAf7Damf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=vhjWfio38+1QEIPlWi+RBsOK3++oFFSBnn6FKjYSTUE=; b=BAf7Damfox1+0e7o
	GCo/fCaIMj1hb/tF/l+8cVmTS259Yz77VAt8hP+UfgmtdTQsyLg8dmqrsAPUA6pjfIo9UNiVkZ981
	hVmVlKcguLHYv54mG3GFjNfAqP6wjVzhH/CkjQtk3yjh20fNKHMf0eSfA6jRfcuivJ6LjY2tHD45n
	p3DtseZPqaf4qOt/Mn2GnJ/AJ/vZSSNOgRgCVAp+sg2xX/b2VXDFqt5jxJJqLC32QQB8h2Y5bDpbU
	bwd6DFYfGKG+35uY89uHyIQccriVAifDHspBW3AQGrz32uD1y6/TgO6PjIlG3vIX4oNq177Qumh/S
	Fz3QH7yG0wOKmK8eyw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1syhVV-00A6wf-0p;
	Thu, 10 Oct 2024 00:58:21 +0000
Date: Thu, 10 Oct 2024 00:58:21 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org
Subject: Re: Of clk_hw_unregister_fractional_divider
Message-ID: <ZwcmrWgoClYI2nUq@gallifrey>
References: <ZwXUQOr-afniO-2u@gallifrey>
 <27ac7ba804d260ca9e1397a17b9e8696.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <27ac7ba804d260ca9e1397a17b9e8696.sboyd@kernel.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 00:52:01 up 154 days, 12:06,  1 user,  load average: 0.08, 0.04,
 0.01
User-Agent: Mutt/2.2.12 (2023-09-09)

* Stephen Boyd (sboyd@kernel.org) wrote:
> Quoting Dr. David Alan Gilbert (2024-10-08 17:54:24)
> > Hi,
> >   One of my scripts noticed that clk_hw_unregister_fractional_divider
> > was unused and I was thinking of dead coding it, but thought it worth
> > asking whether it's actually a missing call to it.
> > 
> >   It was added in 2016 by:
> > 
> > commit 39b44cff4ad4af6d7abd9dd2acb288b005c26503
> > Author: Stephen Boyd <sboyd@codeaurora.org>
> > Date:   Sun Feb 7 00:15:09 2016 -0800
> > 
> >     clk: fractional-divider: Add hw based registration APIs
> >     
> > and I can see clk_hw_register_fractional_divider is called from
> > clk_register_fractional_divider.
> > 
> > Is that just consequence of them being system devices that never
> > get unregistered or something else?
> > 
> 
> I don't know what you mean by system devices.

I mean something that can't get unplugged/removed.

> The clk_hw prefixed functions and clk_hw based APIs should be used
> instead of struct clk APIs for clk providers in general. I'd accept a
> patch that migrates the two calls to clk_register_fractional_divider()
> with a call to clk_hw_register_fractional_divider() instead. If that's
> done we can remove clk_register_fractional_divider(), which is the
> overall plan but nobody got around to it so far.

Oh hmm, that doesn't look too hard for those two - although I'm not sure
I have a way of testing it?

However, my question was about the clk_hw_*un*register_fractional_divider
- I can see the clk_register_fractional_divider can be replaced by
clk_hw_register_fractional_divider - but would there need to be
a call to the unregister somewhere? (Which is what my script noticed
there's no callers of).

Dave

-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
