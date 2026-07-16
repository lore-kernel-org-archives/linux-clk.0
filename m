Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C936842F6E1
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 17:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784224164; cv=none; b=HebwfRb4P+IZEzC4Q9kWo8ENabo8YaTgcAhhpXkm6+qVcje0AJ28/wjqDgDBa9rXshPJYruKJuZBiFHWm0fyg1i5XZ8aJM7t2JqhxVkmUAgmVlJkcmjVbL7Gten4zxL536yUYAYqS/4I7BQyKEegVVu9YF+InUsXhjZCjL6y1pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784224164; c=relaxed/simple;
	bh=bKRolBV3xBMMsK40FcrEsNOw9RXevHwtK+o1ICFtrTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lPxHNfrl+dEjOX6JsTD9fIimopSLHqkaMZPKMf6jUEeLMUaRZGHvnGLMhR2YA2XqL1S3cH3TnpmuwUDgKR63zTokAutF2EvgM5dytPv+M95V7krrnHgWUSI2/844aQC8RX5hXTQwAgvcHig1hwDOgRLWK/YE+DIwstrJRrfcZdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HY9S8eGn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sh3bCVBx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HY9S8eGn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sh3bCVBx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784224161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WQ2dOwd34yp2o4e4FFneZgLJ122AV+T21G+gB1LuX2U=;
	b=HY9S8eGnm8bcYaMHurm7+K2aAY1W4c0qK44dSj/cE9nVvT3YEmk6P7Ni8gyH8VeT67Y+Sk
	0jRea0Er4uRl8r3BhJ6mLeP6aGtahgOVKIn0g0t5FZ1I7yVwtBUoxsileP6RoCnCthub2X
	3SDD4mrMPRLu+qif4tcjMd5Atn6FY/I=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-XP4nWz6OOza5ZryPX35R8g-1; Thu, 16 Jul 2026 13:49:20 -0400
X-MC-Unique: XP4nWz6OOza5ZryPX35R8g-1
X-Mimecast-MFC-AGG-ID: XP4nWz6OOza5ZryPX35R8g_1784224160
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ec91dc265so348515285a.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 10:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784224160; x=1784828960; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WQ2dOwd34yp2o4e4FFneZgLJ122AV+T21G+gB1LuX2U=;
        b=Sh3bCVBxrq+yvlcUd1lfDMHxTfBAV2DclRnyxoEim3RUjG8ELZ8oFljbvRhSyHGF5m
         rDGI2PuacImVxy2qPjU9qC54ahvEtEJuXSPLdDnUYBXRiWfClBQFi6TNxe/jNmg0DtqV
         6wPgYyAGL5rct2FFcmh8ZtkId2wwyKJcUn4aapdiHdUQ8SCmF9bYxnYZ72Xo+3+6tjJP
         uc/jqrqo7Ef821QP34RZp5t9r9DgQUuFPjEnfjMOCE4be8xKEONojlGaVl4rIHo4Zlav
         XpEZbravEZeFKqC99oATzBDf+efTduMrsmJYb9i0ru4Vm1TW/Xuc3ycqbrUJGZTX+E5u
         zY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784224160; x=1784828960;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQ2dOwd34yp2o4e4FFneZgLJ122AV+T21G+gB1LuX2U=;
        b=LBmbWahiQa5XVwmS+cnC1A+TCNGbqc2MDMXGyykIan7+QJZsax3a4NW3cxaieMHlc+
         wKzAjWZ7Jqd+o67EHQ0fw6LUWzoSuXK81ZHBDArsSgI3Y0Jpgwel8yEPUYJNyhOpfgnD
         uUNAeTH7rceazXArfyNtl3A8bZ6XmSOOVLzSOt75ete5o7k50FRQoGfgTO08OhV+7K+4
         5+g4OgxoadtRjXJdkY+7GSrOimj6xAjuXn+gfg5b1qBtQYHPKihhFpoYEspCCUK1xgUY
         EEE0hidzWm6WVoKZ23iWmehSr77LqKugdoeh6fWNZXXTBQ6TIJt7NKtDpblLJCGMRImj
         ChWw==
X-Forwarded-Encrypted: i=1; AHgh+RrExcoKaELepSyXsz+uhKIsN2PLFoPCTWhOeDNxSZYBNJjHLHl5K+CKIXJdI79VqxQB1tuh/gQ1+HY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAOUPFcR2I3pAChOJhnMw5Jq/E8iAcLnyWFT+iKH+AmYTSG/pu
	RkIuo3S552ttxaPiweskzWRJKq/q2hCIopSqUxLgE64nSf4Fwc3v6laZqc5QiVsAtEg47162+cP
	VQ+jpU1UH5C2vnVl6BsoDwhjYacs+QfeIF4FzBRp1iX2PsTiPV52yBbEwaWpmPA==
X-Gm-Gg: AfdE7cmVAdlXz4RejwjLs+74OQCVIOuU7hDaDVS4XqHdVHE8+98xmIImpfyQxFDekiS
	ztCezgFJvyYarylt4cTAI3yoZghpNjF5YsahN8/jo8Hr7aB3rE/k7m5ZWYZhiSYtUBcL008drmV
	6m8W3UNjg8uqdXzrgUOcFGD75TlkaElVGOM8HErXZmh3HzKm7Ui07QP57So3bL2eeNfyEHmJSWf
	erpsAJuWAltmIiMPoeL2QpYYnrUmSajCuL5Os51146A6YPppxiQeqZ3UM4LNMddZIt4wZirO26N
	sXaWz5qtuflbJZ+gn6FrKUACnO157Bhd3ADAz+fCnnTduWnKQ5WnIS0mJ90NpWdySg6nUt8Juzc
	cyH3DbYgVeywHQKfHNJqU71i3mkOC2ddqDec=
X-Received: by 2002:a05:620a:6cca:b0:92e:764a:a5b0 with SMTP id af79cd13be357-930b0763009mr52092985a.14.1784224160013;
        Thu, 16 Jul 2026 10:49:20 -0700 (PDT)
X-Received: by 2002:a05:620a:6cca:b0:92e:764a:a5b0 with SMTP id af79cd13be357-930b0763009mr52088985a.14.1784224159551;
        Thu, 16 Jul 2026 10:49:19 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5cf78a5sm2166683485a.31.2026.07.16.10.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:49:18 -0700 (PDT)
Date: Thu, 16 Jul 2026 13:49:15 -0400
From: Brian Masney <bmasney@redhat.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: ti: mux: resolve parent clocks by DT index, not by
 name
Message-ID: <alkZmw-XmnCOZfOD@redhat.com>
References: <20260715-mathieu-wdt-clock-theo-v1-1-da65bba1828b@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-mathieu-wdt-clock-theo-v1-1-da65bba1828b@bootlin.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Mathieu,

On Wed, Jul 15, 2026 at 05:09:56PM +0200, Mathieu Dubois-Briand wrote:
> Resolve parent clocks by their index into the device tree "clocks"
> property rather than matching names as strings. Name-based matching is
> fragile because a clock's "clock-output-names" value in its provider
> node can differ from the name used to reference it in a consumer node,
> and because names must be globally unique across all clock providers.
> 
> On AM335x, this caused broken clock trees where some clocks failed to
> enable because their parents could not be found.
> 
> Replace of_clk_parent_fill() with a clk_parent_data array that sets
> .index to the array position.
> 
> Fixes: ec7aa25fa483 ("ARM: dts: Use clock-output-names for am3")
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

So this only updates of_mux_clk_setup(). of_ti_composite_mux_clk_setup()
calls ti_clk_add_component(), which does a name based matching as well.
It would be nice to have this consistent within the same driver. I know
this is going to require a larger refactor.

Otherwise your fix looks correct to me.

Brian

