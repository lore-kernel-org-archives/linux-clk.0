Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919BD4FC35D
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 17:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789665829; cv=none; b=VcXGLkAf2Hve9ywWNf1gtxd/8z/BZSs6iaIw9ovRxawGcof5sqJuB8lxmMD1Ebr7dGyZhR+mbxLD/u5uJdEMh9UtUVfkkkaSflWWjlWxZWjp09CtQSuvi88siW3slXgu8QPK9lFmxZ2Bs5pz516sRSB9PJrQo4E5tY7tp7seNgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789665829; c=relaxed/simple;
	bh=oXoTRqbLG+ZXehMxHPxYnZEQhwc5IeGUwL/+oSe56iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZD7710h+7u8BLeQHCLXclEgHF1/05mMZwiVxIbzKmfMeXeKgWPfh/4ROPB+ANKwEvZSIvU9H9NDPPhsqFQsR3E5IQSnnbp6p14H557gas5BlIk4CvIUy0DLcfQOs7HlOfGoTHCyqafB5+6/ttZO5zzjeBb8uMDDbwyiJVFDfAVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TOU/h4l8; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TOU/h4l8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B7D194E407BD;
	Thu, 17 Sep 2026 17:23:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E1FC60580;
	Thu, 17 Sep 2026 17:23:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68E8311C7B060;
	Thu, 17 Sep 2026 19:23:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789665818; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=OYyidc9RlqADnK7Wpg8VWE5HZt5eTwbpJWLivwavjdA=;
	b=TOU/h4l8Y+iYT8ZTmSFElFcuzVDGLScpoYdYaQ5yvzcFY+IqRknAF5iedQOB37/e/k1rbZ
	VaqzbzIZGwtZmfr7zBnpjakTWzthjYzp/Ew/XnXdkEcJZMSM/JcNO8Ul+bV78x7Y/ddmvY
	zcq1kqnbEPl83Stn/hQzh2DvHCKRoeUbzXwHjz8mikzlIUFBWuoEBN3nwmCGyzLt3Ofr8z
	Pfqgo7jhD/O2iQWXlRCvLv2DaWiAk52guSIn0MMK4Mz94NPfsVe3lf5XqxCQz6q+MVveB5
	vcOF7pq6Nrib52dTxRB723GzY9F0HXzQ6bfppsuLQ7zWRKJZECGafy94JHmLfA==
Date: Thu, 17 Sep 2026 19:23:36 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: disable unused clocks registered after boot
Message-ID: <2026091717233613a5b6a3@mail.local>
References: <20260917144011.3014860-1-alexandre.belloni@bootlin.com>
 <aqwO5sAN9qbvK8LF@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqwO5sAN9qbvK8LF@redhat.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On 17/09/2026 12:01:42-0400, Brian Masney wrote:
> Hi Alexandre,
> 
> On Thu, Sep 17, 2026 at 04:40:10PM +0200, alexandre.belloni@bootlin.com wrote:
> > From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > 
> > clk_disable_unused() only runs once as a late_initcall, so clocks
> > registered afterwards by loading a module are never checked and may be left
> > running needlessly.
> > 
> > So record when clk_disable_unused has run and afterwards, schedule a
> > delayed work to run the scan when new clocks are registered.
> > 
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> We're actually in the process of redoing the way clk_disable_unused is
> handled. I posted a series to add sync_state support to the clk
> framework:
> 
> https://lore.kernel.org/linux-clk/20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com/
> 
> Will you be at Linux Plumbers in Prague in 2.5 weeks? If so, come to
> this talk where we will talk about the clk subsystem.
> 
>     Evolving support for sync_state to subsystems beyond genpd 
>     https://lpc.events/event/20/contributions/2504/
> 

I will be at plumbers and I'll try to attend, thanks!

For reference, this is the reason for the patch:
https://lore.kernel.org/all/2ce03d3b4cd9cce8e32fe1fe1ffbea5760bf9ef3.camel@siemens.com/

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
