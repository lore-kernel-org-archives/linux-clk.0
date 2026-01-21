Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EF932720E
	for <linux-clk@vger.kernel.org>; Wed, 21 Jan 2026 12:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997600; cv=none; b=dWOk3G7ovmLsHL5H/+kLcUt5hxguvUGGVTebjLVKKatZMzzWV012NJqiYyE+nB91LyaQ52tzBq+kcwSOOWwTWlPxi3c68bDeKXllzEQPWHr7TgrlmyivGKkj5t8eDcy3rRzQsa2rKLDlgxqq7aJEhXmmaicCfOKiovmZhiqD3fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997600; c=relaxed/simple;
	bh=qDFiPsQd7u1wnrVS3oazet16Ydulh8g1v7jumUh6+Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQWOSoyECLsrpA1IJ0Z2ssMZ/OIAQmHlviD1rDOqLzmdb9zfKfvzdNUCXPCLxjqARAcmmom8scZqfmfyobOQtnEnef796tny3dLvV+etDM1jCaA6lSnbE9T1qWFNg1+1PXCVROVYpQutdUpVPsj/tFoUAp5RAWbxBbtNl289Kqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UTI88+is; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=s8lMIiSC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UTI88+is";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="s8lMIiSC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768997597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pR1+T8ar2wUy/+ZR9alOHlg05/eYLbiG2l/Es9gVEDs=;
	b=UTI88+isirTMk2r8imUMZpOm+6uR1Gzdy+DSVXuZOUt7dpI0GwmWe4ix8MpWLcGdpXP0MA
	1wN/mnp5xcLsbTpOEMc2ryu44CrOlvXbc6EVgwz+A0ja0AUNPTUnBtlyEhD1UR6NomvJiM
	5KeilWZOhbykPpTGGU4QlusQVf9JuM8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-qbKENxiaOliH34XywNouTg-1; Wed, 21 Jan 2026 07:13:16 -0500
X-MC-Unique: qbKENxiaOliH34XywNouTg-1
X-Mimecast-MFC-AGG-ID: qbKENxiaOliH34XywNouTg_1768997595
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-890586c53e0so173769436d6.2
        for <linux-clk@vger.kernel.org>; Wed, 21 Jan 2026 04:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768997595; x=1769602395; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pR1+T8ar2wUy/+ZR9alOHlg05/eYLbiG2l/Es9gVEDs=;
        b=s8lMIiSCqEVd/RivFftjKTGaB4ikH2hLtYg0d5g8/L2hwDV6q5/ipGQOPC+NwStojf
         MzRfZAur/RFkRotOR1UIvIEh4kvnYZh17NG9dloGpsMo7Zro62YD8yBN0l6h96NFeXO8
         50tcHDbdWwEBEjeuhuR4svWemIGZ6UshOjDZfK7HqStnyCbAiXmIXC3TI8LbIUvmC7DB
         iaj+sTyClqocF7ctuFzJXvkNfFSAtcu3se1HXddarBQpO5iYOBnFdFBRXU9FHTykTGbO
         yOoZw1zIAO4zdADigbejMT0holBesBdD8vVIOy2SmrUu+0CP8Kl8PYf/nQORT7ZVNEI+
         85tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768997595; x=1769602395;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pR1+T8ar2wUy/+ZR9alOHlg05/eYLbiG2l/Es9gVEDs=;
        b=nazUFMncaRU2OAFasSy//eDZhQ3Ynu8vjTlOV3Lb3DGVsHxRoTA+dy3AM5q05WhOgk
         bRZhYgyoNWdPBc/AbAwITfJ/2S8NYGYyvnHqa4UtOeMsZ4acnFn3Fv6qv+7KNVzSG8Nn
         yoJEG4IBD/D5EKeNjPHnwg1ibw+DF4v5Rt3OBeP7ZYLiuiki3N7wgNQLN6HUaWDeRgkB
         3qGcXrmjpshi+IBIrsdaNBXnLEs15unRr8lZslvVub05OLOV7y0Ny3pTXL9nCzj2RbQE
         qkfoVP3DISTcUeaCIgacZtfxdzzVHH3OyrtiNxXesy36A+qa9C/oTzyEw0POv9ptH7xW
         in1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUP9xKp+gnCG9SROziZPTWl9VKJMDUoKGdj1CaGVMIPe5TlTWTwkROtr1VNN4dyvw9CFb04+q2KsXY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD9vnkHpRY2ycMTl0UFcQQOCCB+TI2PMUxO+t4IaOc/b+UszNn
	y9AiHEsa0AFaYF9q6yRtsQNC2ibSlYkoobWRiNisjtCTsin6P/Zp9c7p5o+n2f3m0OR8mtm7P99
	XfgKlYSCxzBSQnjlA82d6eWKggF0d/oijIoDth6HRRR1g5PoHGCppvN3DVjD6+Q==
X-Gm-Gg: AZuq6aJSSlir/xqw3W8LwVwtN7ChE2radp3YDLrGdOKcia9kDGCGbSlW1GWXb8y8xUf
	BEaNT7KwgFx1iehZntRZtyQXnlESl3/iOb/1tdvDcB/XGiQRNQRnzJEUOScvq1XS+Tgc/rc9mlz
	QPceeTL2+ozv+e+KADq+RNU9+CbbVEsdZ5venMcMLPKwxE+PEQED8wYNrQ4eah0Q2Ex1vYa1R5m
	N5InT3E6sYgVhKTCcMR1WaihdPuT+9BPzas2OkjLp1mkoe5JmdAbmSZ/qF5sRY9RNAr892B7n/G
	lMmayGfyMw35LGWZ/Jk01T/O02MExmhIALKdt7e+4JC96eri71IaaUEaw9WFCnlqX2v6TeXW4LN
	RmNuM6wA0sfzGFpz+uyOQ4yQC2ne4lUmpOHcfxoTCQt2T
X-Received: by 2002:a05:6214:5181:b0:888:4938:49e5 with SMTP id 6a1803df08f44-89463ec1bbcmr67876496d6.69.1768997595563;
        Wed, 21 Jan 2026 04:13:15 -0800 (PST)
X-Received: by 2002:a05:6214:5181:b0:888:4938:49e5 with SMTP id 6a1803df08f44-89463ec1bbcmr67876096d6.69.1768997595126;
        Wed, 21 Jan 2026 04:13:15 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e60428dsm133105716d6.22.2026.01.21.04.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 04:13:14 -0800 (PST)
Date: Wed, 21 Jan 2026 07:13:13 -0500
From: Brian Masney <bmasney@redhat.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 25/27] phy: ti: phy-j721e-wiz: convert from
 divider_round_rate() to divider_determine_rate()
Message-ID: <aXDC2ZVzLU6nUbPb@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-25-535a3ed73bf3@redhat.com>
 <aWelbtaZjS4SZGQO@vaman>
 <aWj3LPq37Dr9OLU6@redhat.com>
 <aXCGlW4lgIImN8Eb@vaman>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXCGlW4lgIImN8Eb@vaman>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Wed, Jan 21, 2026 at 01:26:05PM +0530, Vinod Koul wrote:
> On 15-01-26, 09:18, Brian Masney wrote:
> > Hi Vinod,
> > 
> > On Wed, Jan 14, 2026 at 07:47:18PM +0530, Vinod Koul wrote:
> > > On 08-01-26, 16:16, Brian Masney wrote:
> > > > The divider_round_rate() function is now deprecated, so let's migrate
> > > > to divider_determine_rate() instead so that this deprecated API can be
> > > > removed.
> > > > 
> > > > Note that when the main function itself was migrated to use
> > > > determine_rate, this was mistakenly converted to:
> > > > 
> > > >     req->rate = divider_round_rate(...)
> > > > 
> > > > This is invalid in the case when an error occurs since it can set the
> > > > rate to a negative value.
> > > 
> > > Acked-by: Vinod Koul <vkoul@kernel.org>
> > 
> > Thanks for the Acked-by.
> > 
> > However, this patch depends on this other series of mine that's merged
> > into your phy tree:
> 
> Should I pick this one then..? If there are no other dependencies...

Yes, this patch stands on it's own, and it would be great if you could
pick up this patch in your tree this dev cycle.

Thanks,

Brian


> > https://lore.kernel.org/linux-clk/176661322399.4169.14248756511703978007@lazor/
> > 
> > Stephen asked for an Acked-by for that series or an immutable branch.
> > 
> > This will allow us to remove round_rate from the clk core.
> > 
> > I also have a small series to post that's dependent on all of this that
> > lets us get rid of the noop determine_rate implementations that only
> > 'return 0'. I haven't posted that because of the dependencies.
> > 
> > Brian
> 
> -- 
> ~Vinod
> 

