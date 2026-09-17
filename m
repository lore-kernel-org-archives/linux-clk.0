Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC873B634E
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 17:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789666594; cv=none; b=NstaXBCcsfoovAossFin6zkLoJgegbenjst7u8RC0WkGsFQPFbzstVyg9aIQpc50/iW+wtxXKdJKkkpuCZEXglnL1WNHHLIvJ6Ip7ifKkXG2yiLI7loomcNvKuxX8t2tANVZD3JcMpr1fwFrO8i/2ZTEczz0+VyM4CoMwzWsOuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789666594; c=relaxed/simple;
	bh=brPvAVuoXkLTRqscCDH//orHps/ShgXHlWwJteljMYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJjSIjtQPf+maVoFfTn+goqVWaXUQylYeXJsyNDzuPAz8+IikRXrAv+zlJ6kiGavP1t2j/up2Wj3nr2EUpQS+fq2g+5wvM2u2F32Kno0Drt/vQ1/k8PhaAT9oRe62dkhnhuooP93X0q43KTdZqna9oL466U+7iSLkm4dqnza5lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PjRz59Sa; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HYAUu3Lh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PjRz59Sa";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HYAUu3Lh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789666591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wrWvLH4IjkM2V8/F9alR2F7Hm+iUEvocnVY+jEcEev8=;
	b=PjRz59SaMW/vMxubo2jtlThbn0F9IMX8ijkzCg+RmePZBUYZ8+w1DibaFoslyNPtG1ktWF
	8wgTTZC8CaPGc/FylIS53bp2S2P2KpHaAdWfgCzy3wKELiGbysB3B0GYXJlDy06cTUNCdW
	zXz09H2zyTWSdcYgscVLdpwfO6T/TuU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-274yM6mlNq2-mMpBJIgoyA-1; Thu, 17 Sep 2026 13:36:30 -0400
X-MC-Unique: 274yM6mlNq2-mMpBJIgoyA-1
X-Mimecast-MFC-AGG-ID: 274yM6mlNq2-mMpBJIgoyA_1789666589
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9124b265371so19278666d6.0
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 10:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789666589; x=1790271389; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wrWvLH4IjkM2V8/F9alR2F7Hm+iUEvocnVY+jEcEev8=;
        b=HYAUu3LhE/TK+jpKsUy4TouVEP/FXytn6GBM8t+ZzK4LwAW7Hh5aCcVn/bDkQZ69bX
         R+JMQVYfzppR+RoK89A9zpkfrptEIuGvVALVfYVvKkixMncoWfoxVH2nsrxGcH/j0Bap
         LJOXKy8Tih+xnvwp3YthE/deH8ukyy/vdrszDa0lV6C6RAKJ/PBu5F+nPHkTtbWJ3Ogw
         wVbbuXci8vL4bEOyBH68mFVIvzBTJFoZCcExRu2pFq4O7OwKpc3EJtvcT+DuK9hLGU6I
         XpjfBTmBirCYekFh/dkLZPaKIo5ibtVknGH4JTua086EfCQgJiivv6GaMAg/hoG2iQ2I
         e/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789666589; x=1790271389;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wrWvLH4IjkM2V8/F9alR2F7Hm+iUEvocnVY+jEcEev8=;
        b=EMOF5pEfBPYJtW/goC2+AH6aBf8PFiCVUmUZOeybce5Q0ZHbDuBb4lzz3R1/eQe68U
         w5d48cf+kfSnV0hN7EdSWG0BpXAHQkC/317WwyEJAAuSQYRTsIiigRaf+pZuO2AnLszv
         QVhfp+6OGrjYyStA/lAndP043FdUcUWe2UO150ByyckyVEG+1wbUpI30oUmhq0XY1i89
         EqQfE5d0iqBlL/UUaiD+/ddPDSsCayhIZSWWBH56JX5LwMhwxJjLJjCtMU55TIINhPtJ
         SRfTUGgqeIlbwjRUhGOHV2b/0PXB5qD5vDBnAfYaSAd3AqUA+59jJNREkX8eNRyN0xni
         +s7g==
X-Forwarded-Encrypted: i=1; AKwUvByyG0hM7KDJA4UTlRyzgP/uogaPgx4drA2NXoiiIPhCcFII6e6wbjYXfjmHEbv3jPK9efLTquooC0A=@vger.kernel.org
X-Gm-Message-State: AFuF++kx0758FrIt7zapJn1PLXOlbI9vInvvc3FGpcfffxLeM6a41pvf
	eaB8pA7+hIQZ2RN60c6di8zTOiXEy2HIPqoO9ujXz10zwKTUEQz3x9Ym9ZfOpkcmP0iCLqlO6mc
	5xfsJy5UaN5miMUbF+85QTVIbe5lcRyvYUAOPKHa7UoofcCeUA9EMc9OjRs+Upg==
X-Gm-Gg: AYBFou1j24qAereJi3yLWWKeX6JlmGSOHi6ShN2pDgyZutPkDEsLQArGSnxLWNg5K7O
	dOzaxttBBufWfwojjPnsgLeW/P1VkCEVwPlunmAgiFgncj5dJ8dl9ydxQCU2HdhC+UTXfYHCXFg
	Zf8zEN4a1bvs6BYcjwLmx9J+iYM3vktq6NnM521CXJbYJDfobDhKaCZxQMs6Mm2wuV/W3bU6S0D
	Sx4s860iAzgTxHHVghdYoLgEON5DKAdU/0eyqB4AvhH1+j6W0KKICJ1/23fDaFVJfK5XaoN0ucz
	uwn57I5o0HCuAmBXdWYVUz6TlPZmU/rFiD3PqFeNQHfqsp+8FXlpkgVTl0o16uz95f3lye0aug7
	FJuUzEpWrWKp9VuQgtDemlEJGgaItBeOceSs=
X-Received: by 2002:a05:6214:5903:b0:90e:8be9:c384 with SMTP id 6a1803df08f44-9123d7b301dmr154578746d6.27.1789666589554;
        Thu, 17 Sep 2026 10:36:29 -0700 (PDT)
X-Received: by 2002:a05:6214:5903:b0:90e:8be9:c384 with SMTP id 6a1803df08f44-9123d7b301dmr154578186d6.27.1789666589171;
        Thu, 17 Sep 2026 10:36:29 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252c5bef1sm2950686d6.9.2026.09.17.10.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:36:28 -0700 (PDT)
Date: Thu, 17 Sep 2026 13:36:27 -0400
From: Brian Masney <bmasney@redhat.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: disable unused clocks registered after boot
Message-ID: <aqwlG3Rx3MScxNXx@redhat.com>
References: <20260917144011.3014860-1-alexandre.belloni@bootlin.com>
 <aqwO5sAN9qbvK8LF@redhat.com>
 <2026091717233613a5b6a3@mail.local>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026091717233613a5b6a3@mail.local>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Alexandre,

On Thu, Sep 17, 2026 at 07:23:36PM +0200, Alexandre Belloni wrote:
> On 17/09/2026 12:01:42-0400, Brian Masney wrote:
> > On Thu, Sep 17, 2026 at 04:40:10PM +0200, alexandre.belloni@bootlin.com wrote:
> > > From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > 
> > > clk_disable_unused() only runs once as a late_initcall, so clocks
> > > registered afterwards by loading a module are never checked and may be left
> > > running needlessly.
> > > 
> > > So record when clk_disable_unused has run and afterwards, schedule a
> > > delayed work to run the scan when new clocks are registered.
> > > 
> > > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > 
> > We're actually in the process of redoing the way clk_disable_unused is
> > handled. I posted a series to add sync_state support to the clk
> > framework:
> > 
> > https://lore.kernel.org/linux-clk/20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com/
> > 
> > Will you be at Linux Plumbers in Prague in 2.5 weeks? If so, come to
> > this talk where we will talk about the clk subsystem.
> > 
> >     Evolving support for sync_state to subsystems beyond genpd 
> >     https://lpc.events/event/20/contributions/2504/
> > 
> 
> I will be at plumbers and I'll try to attend, thanks!
> 
> For reference, this is the reason for the patch:
> https://lore.kernel.org/all/2ce03d3b4cd9cce8e32fe1fe1ffbea5760bf9ef3.camel@siemens.com/

Can you try running with my sync_state patch set before LPC and see if
it works as expected for you? Be sure to leave clk_ignore_unused off the
kernel command line.

https://lore.kernel.org/linux-clk/20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com/

Brian

