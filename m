Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FA7374A0E;
	Mon, 10 Aug 2026 08:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786349026; cv=none; b=Hi23c6+NYbMlOS+kQwaVVgA9fcdDYuDuclZ3at1b8qftUXH8F4+AJre6VtJTZGJ1/474/T0tHLLNxAjYAtAPBfan4iswLAcKVA/aYvOXHoQ2YUrXXDmLnyZ6anSe+7QpIPcUMDtta3v1wiU3eLn9NgGOYE7fT7YFgBI1pD/cyJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786349026; c=relaxed/simple;
	bh=kK26dMFcdDrqTPOsFF/EYWTMukkyfNPmfIygQlkQE3A=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=c8tH2bpW5cjA6AWVTfMZ8vjG7xbX9etwPCVUV6j5asHE/7o/4dZ1Jf+7djfaCk0xwDZt2r/WFtPn/EOxP0C5/zupvVURSIFWbD/pr0CUn7nl2ieT9LPsBZDamqxCQ2YK6cZohGcET1PhaCAY+ghPrik32/k06wa+WcprhHvva4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=XAsTVO0a; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="XAsTVO0a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=mxIoSspLF0iEf/XAuOZWwFg5TEA2l+KLGc9zFjZUVoQ=;
  b=XAsTVO0aUiRleNy+NrPdJLC2IGioTLP2bFy+39WaFQDJKLnoLXQ9c34W
   SBaE9/8XI4RUWxDBsxAZB/umsQlN76Y3SnAkg/ihjKjl7/2CDVP6WM/M3
   2RWxJpLby2zhrt90+tbELlk+59eBD33xvI7pVNR1DylC3vHwBK9yg3EXl
   o=;
X-CSE-ConnectionGUID: d4iSUbhkRUu29EBrw0qVqQ==
X-CSE-MsgGUID: +glEG9i+QYexNMyMZvQrjA==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,215,1779141600"; 
   d="scan'208";a="153952796"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 10:03:42 +0200
Date: Mon, 10 Aug 2026 10:03:42 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Guru Das Srinagesh <linux@gurudas.dev>
cc: Nicolas Palix <nicolas.palix@imag.fr>, 
    Michael Turquette <mturquette@baylibre.com>, 
    Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
    cocci@inria.fr, Brian Masney <bmasney@redhat.com>, 
    linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] coccinelle: Detect clk_register() anti-pattern
In-Reply-To: <anlwF9n1KVaYcnH1@gurudas.dev>
Message-ID: <a5306584-b483-5ee-eada-e5efb8ea10a1@inria.fr>
References: <20260803-cocci-clk-register-v2-1-22e789f75f98@gurudas.dev> <b351e95-b3e5-b947-ccd3-64be2971e835@inria.fr> <anlwF9n1KVaYcnH1@gurudas.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

> > > +@depends on context@
> > > +expression clk;
> > > +identifier voidfn =~ "^(dev_err|dev_warn|pr_err|pr_warn)$";
> > > +@@
> > > +
> > > +clk = \(clk_register\|devm_clk_register\)(...);
> > > +if ( IS_ERR(clk) )
> > > +{
> > > +...
> > > +*voidfn(...);
> > > +...
> > > +}
> >
> > This will only match an if with a then branch, no else branch.  There is
> > actually one case in the kernel where there is a relevant if with an else
> > branch, so you may as well extend this to match that cas too.  If you just
> > add else S, where S is a statement metavariable that is not used
> > elsewhere, then it will match either the case with an else or the case
> > with a then branch only.
> >
> > Likewise for the other rules.
>
> Done, thank you for catching the edge case which I'm guessing is
> drivers/media/platform/microchip/microchip-isc-clk.c.

Yes, that's the one.

julia
