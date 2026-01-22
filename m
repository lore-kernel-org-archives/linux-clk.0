Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317DB18A6A8
	for <linux-clk@vger.kernel.org>; Thu, 22 Jan 2026 00:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769042907; cv=none; b=b3dOySQq97Fy4O6F2g63FNaKRoT69qdsShlxDLy93BWLmlFAoMwcszow8hJdYqv2THTIEwknWjnVot5FZZJVAuViN9jmv8jwA2DYnx+OXH0RnKiV8/V/b6CfnGV/TLTDRh0/682PlQ8zzkRJc9D+c7PNPIQcIvedgvq7sYSZzMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769042907; c=relaxed/simple;
	bh=YgkbcXlmcga492MlvJ5hBRrRTRjG9AP55dNP5piMLys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RgBJwqkkWuLGWPibdf+3/mNk16OCU2yRxPH7vF92pHon7mcZ08ddrAHvisjrrNiWg1qSe9bAVi5NV3REY1kFqnb4MFWwuBc4XjwtHEhCZAzoOazUe8Gwz0SIzjezEDnIRHhAyPXafiB/UDq5Jn/zXUR4pFOZq3CYTzsyliuew7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eyYdJVOI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=maRV4rBx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eyYdJVOI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="maRV4rBx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769042904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XSYrCFJLTYE1vUJlazCK1VzEy0tKZI14lHyw9347PV8=;
	b=eyYdJVOI/3NTAzH8nZe/yLmg0gPpz05lSeX6pvIdPbp+atfWRC4WuaFlIkVvtidrUezFjA
	kZ7L67bbVOvQfOzF3IGjlRfYd8mJ45s2xUN/7SNvmrmqDdfBUkcfFkS4k/Jt+GS/2fK/jY
	Rk7HL/ZljZhY0g5HrosDSpPqev+6HHk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-gsm7Fd3kNweETSJLBeATmQ-1; Wed, 21 Jan 2026 19:48:22 -0500
X-MC-Unique: gsm7Fd3kNweETSJLBeATmQ-1
X-Mimecast-MFC-AGG-ID: gsm7Fd3kNweETSJLBeATmQ_1769042902
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89471079a13so22764666d6.0
        for <linux-clk@vger.kernel.org>; Wed, 21 Jan 2026 16:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769042902; x=1769647702; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSYrCFJLTYE1vUJlazCK1VzEy0tKZI14lHyw9347PV8=;
        b=maRV4rBx9RgbqM11Eb2El7HGK6ckBV9Q4NYPtBGGnLw7HDDf2KY6Frqr1aTOqSs5gn
         KT3b1qYkly5iz1F2218UKP522+0PFSPddPwO9JGI1CaMsVxa5XvUCIS6KbuU9OX0w1PY
         1vG22xKJoEeN8Tqr1GCLUWXOxSTE6E+R7gRZFtUPGFkawgRH59xH7wq3HrLLnIk+VBvp
         lrDpsQ9faTzHa7/NIu51KvzBUrShPmuJCJQh/10VYSerKWC6kfjhHTIKpnpzH08jxj3p
         0aDwBk35zM1VQ/fwJM6dwHV5B8dBLddlGcsrLA+oxGybeE2ktkk3gig6xERVvhNbCEOc
         zTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769042902; x=1769647702;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XSYrCFJLTYE1vUJlazCK1VzEy0tKZI14lHyw9347PV8=;
        b=EyAWosRqEOCDtGEmYXbqmxFSwPLh1/JOjlchPkMhvcMT/Wnja/uE2vaLjzxwFUsiZm
         QY03Se184wUtbCXyJQ+x4jFJ5+/ghuZkPmy5sPzuhZaQv/Bs0vVEKXHwzKMVhoZeSXw2
         pMpURgf4bWe+MAIvXZeCy6AFyGQYt2iPxHIfTnXHZvnwslO5KlDagp4JzIDhGKk/awue
         /UmnLCC2RU+dEXua7J4HWgeyHRrJgAEZv/ROve3pVXc5htcsn5dNt5Wr2UxsgBngK9Xa
         zzBdY9tablWPZok3PBuyeMB7FLjWc6M6jxGmr1tL/ugT3cxswQESFYoAOCZxPbRp7yAW
         N18Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgf26Rs8hJJhHEpMDE4o9oXwjsLVKsCPBh3w+/r2fbCJVLAr41iXLoMcApZdDkUeh97aWbFFgyHOs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl5QE5lDEtDl4Zu9UmM3+7ylXKrqPzxilbr+bcBPDbrIsJWNgC
	mqODeOlRlPn9DLtr7+vdjPNC4FtnlINjFNG9cNJP+92hF9/AUG2fM5si6ERecJeBUBsC4iPxI9q
	Xlc/zuvGMdAQ1BFopODrbkNS3+hwjLxHU7pxKG0PmIzFCriHOPLWk7AhkAh2cQKCMd/96jQ==
X-Gm-Gg: AZuq6aJUn3OG4VxFof3sAtDTcJwtTkiq88CqO1EN17m6VFNQtjPZIxi0zi0tHW2WVWK
	ImwxA4U+WaZbriSmXzmIfnJ9ofWgl+TmY1FVJ+HF4EB/V3i04DoHRI5HgeqIL0hP42APe9mGtLw
	PqR3daxKg/J8h+2EPt4IXguAS0DTPmf91A8X9t0iKBp1q337EiaiI1jPCu2kuRKiGEKI/YtmjC+
	bJP1AnDI6wjetuzvU4/4rRMoGKarxg59RQDWr43i9sGjY1UhqlZhGhg3VpquEzvhmp4cusLDHIk
	JxsWZqXny3Syh/AeotwqFBppLSqns9UeF3RiXDQqsRYaoE9EUytkV4ffWxOtfxVH8++Wb/b8Dtd
	0jYMc/NwFuBqxTp1sR+j8yBJopzttGBmFt7PE2w5xvnbm
X-Received: by 2002:a05:6214:4001:b0:894:68f7:40f2 with SMTP id 6a1803df08f44-89468f7424cmr104557936d6.2.1769042901993;
        Wed, 21 Jan 2026 16:48:21 -0800 (PST)
X-Received: by 2002:a05:6214:4001:b0:894:68f7:40f2 with SMTP id 6a1803df08f44-89468f7424cmr104557706d6.2.1769042901567;
        Wed, 21 Jan 2026 16:48:21 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89468d65eebsm40483976d6.30.2026.01.21.16.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 16:48:21 -0800 (PST)
Date: Wed, 21 Jan 2026 19:48:19 -0500
From: Brian Masney <bmasney@redhat.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 03/27] rtc: ac100: convert from divider_round_rate() to
 divider_determine_rate()
Message-ID: <aXFz05Tnm8MmQbBD@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-3-535a3ed73bf3@redhat.com>
 <202601220026092a75a45e@mail.local>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601220026092a75a45e@mail.local>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Alexandre,

On Thu, Jan 22, 2026 at 01:26:09AM +0100, Alexandre Belloni wrote:
> On 08/01/2026 16:16:21-0500, Brian Masney wrote:
> > The divider_round_rate() function is now deprecated, so let's migrate
> > to divider_determine_rate() instead so that this deprecated API can be
> > removed.
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > 
> > ---
> > To: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Cc: linux-rtc@vger.kernel.org
> > ---
> >  drivers/rtc/rtc-ac100.c | 75 +++++++++++++++++++++++++------------------------
> >  1 file changed, 38 insertions(+), 37 deletions(-)
> > 
> > diff --git a/drivers/rtc/rtc-ac100.c b/drivers/rtc/rtc-ac100.c
> > index 33626311fa781b5ce90dcc472f948dc933bbc897..16aca4431da8c029e6195d8a3c9fe75fa95d0bc0 100644
> > --- a/drivers/rtc/rtc-ac100.c
> > +++ b/drivers/rtc/rtc-ac100.c
> > @@ -140,42 +140,16 @@ static unsigned long ac100_clkout_recalc_rate(struct clk_hw *hw,
> >  				   AC100_CLKOUT_DIV_WIDTH);
> >  }
> >  
> > -static long ac100_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
> > -				    unsigned long prate)
> > -{
> > -	unsigned long best_rate = 0, tmp_rate, tmp_prate;
> > -	int i;
> > -
> > -	if (prate == AC100_RTC_32K_RATE)
> > -		return divider_round_rate(hw, rate, &prate, NULL,
> > -					  AC100_CLKOUT_DIV_WIDTH,
> > -					  CLK_DIVIDER_POWER_OF_TWO);
> > -
> > -	for (i = 0; ac100_clkout_prediv[i].div; i++) {
> > -		tmp_prate = DIV_ROUND_UP(prate, ac100_clkout_prediv[i].val);
> > -		tmp_rate = divider_round_rate(hw, rate, &tmp_prate, NULL,
> > -					      AC100_CLKOUT_DIV_WIDTH,
> > -					      CLK_DIVIDER_POWER_OF_TWO);
> > -
> > -		if (tmp_rate > rate)
> > -			continue;
> > -		if (rate - tmp_rate < best_rate - tmp_rate)
> > -			best_rate = tmp_rate;
> > -	}
> > -
> > -	return best_rate;
> > -}
> > -
> >  static int ac100_clkout_determine_rate(struct clk_hw *hw,
> >  				       struct clk_rate_request *req)
> >  {
> > -	struct clk_hw *best_parent;
> > +	int i, ret, num_parents = clk_hw_get_num_parents(hw);
> > +	struct clk_hw *best_parent = NULL;
> >  	unsigned long best = 0;
> > -	int i, num_parents = clk_hw_get_num_parents(hw);
> >  
> >  	for (i = 0; i < num_parents; i++) {
> >  		struct clk_hw *parent = clk_hw_get_parent_by_index(hw, i);
> > -		unsigned long tmp, prate;
> > +		unsigned long prate;
> >  
> >  		/*
> >  		 * The clock has two parents, one is a fixed clock which is
> > @@ -199,13 +173,40 @@ static int ac100_clkout_determine_rate(struct clk_hw *hw,
> >  
> >  		prate = clk_hw_get_rate(parent);
> >  
> > -		tmp = ac100_clkout_round_rate(hw, req->rate, prate);
> > -
> > -		if (tmp > req->rate)
> > -			continue;
> > -		if (req->rate - tmp < req->rate - best) {
> > -			best = tmp;
> > -			best_parent = parent;
> > +		if (prate == AC100_RTC_32K_RATE) {
> > +			struct clk_rate_request div_req = *req;
> > +
> > +			div_req.best_parent_rate = prate;
> > +
> > +			ret = divider_determine_rate(hw, &div_req, NULL,
> > +						     AC100_CLKOUT_DIV_WIDTH,
> > +						     CLK_DIVIDER_POWER_OF_TWO);
> > +			if (ret != 0 || div_req.rate > req->rate)
> > +				continue;
> 
> This leaves a braces inbalance

To be clear, you also want the braces around the if like this:

if (ret != 0 || div_req.rate > req->rate) {
	continue;
} else if (req->rate - div_req.rate < req->rate - best) {
	best = div_req.rate;
	best_parent = parent;
}

Brian

