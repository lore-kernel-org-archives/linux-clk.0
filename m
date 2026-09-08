Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA092E4257
	for <linux-clk@vger.kernel.org>; Tue,  8 Sep 2026 18:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788891565; cv=none; b=n4cF2VJTifMvrhniVt/pjyKsFKo1Nx9/4673KZOoTMvWW46cOkaYV5/wDaqN9XaYLkypcUBfjV0FCqhBejvT20SlK+lIc+rD1GSbLAMWLcsAhmV7KXj+w1fuDoEjJMdTa8fS+3RVz+JLerbLzVI3Phg8hhBINRSVgCeeL/Jp+NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788891565; c=relaxed/simple;
	bh=8AIIo5BF6f71UMl4Yiei2wFPXM8xiGDQCRZjF2KYnKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ep2lJIFb+nB6yPS9He3CYWHou45Y6W5Y7ufKw/0TCpTQy8IW+T0DSlBGOwLpjhRPHNPsJS7H2JRbbDVu7Y4uLvooUw8mlwQnpEyfKX3Svo4NpUQqJYAT7jpwGFVV6Yn+qEfYD5ZnfVaZJBIOzRddBKP2kdAuikUvjwmzF6gQgqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dUQ0/UZ3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hr72Wcjl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dUQ0/UZ3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hr72Wcjl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788891563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Q5G5cxGRzsImEzZzW/QdJtB63ZsfwIeX55psBcS1K4=;
	b=dUQ0/UZ323sfkgeLAexHUqMqvMRZfhhCawVBnwlGeceH5fXeHUQEwSfG46M2Gs7V9t2Gh/
	FmzmNDv85g5eZIj4Htr0u5HrxvXqYRJBS6NPOgmB6aQNFoU9msOACXIgZprhSSTKB935eu
	Zfl1QOIuHMr00Dg2vE7U2gdD7UOvaRY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-5aK0iqYJPYS6kwPeguOO7A-1; Tue, 08 Sep 2026 14:19:21 -0400
X-MC-Unique: 5aK0iqYJPYS6kwPeguOO7A-1
X-Mimecast-MFC-AGG-ID: 5aK0iqYJPYS6kwPeguOO7A_1788891561
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91030f96c70so61442026d6.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Sep 2026 11:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788891561; x=1789496361; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2Q5G5cxGRzsImEzZzW/QdJtB63ZsfwIeX55psBcS1K4=;
        b=Hr72WcjlMzo4B5B5YW85aIMyfLaz6XDBbtU3aOujl/VxpOKLoZx1Y8gM5sIrFgS5+I
         cFtE9t0hU2SZb9D1v/dbTnimq2FeuS0mCldpzxXTurrxmjdN2Ex9QhmjFyKOam87yIS+
         uR0zeKCpQP9Y4JFSEAR0HYHrs33VolZvdQe736s03+XVCom283OiJKj/poNMIi3tDc84
         4FScUfes9Ru2lred3uoHSlgp+hpCxv9PXcWjEeWiB2flZFq/UuvIRHYDyLY3gG6w2AHv
         CSzvH198YldfFMuN4u50yStwDcjCn874pj4Z/tH+RdAStjjs46ZlHRC0VVSxji3isbsx
         2x+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788891561; x=1789496361;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Q5G5cxGRzsImEzZzW/QdJtB63ZsfwIeX55psBcS1K4=;
        b=s6RLe1dL6NyBHN2OiAiQ1zyTkliuNhRfYERQqWBGKuuBQRiU/9PdJfqtbm7i+x7W+L
         mo4iI1Bz2ZbajN2gGdq16wDW6oyN5pZa/aJfIRPJ+fDKCaS67SMPLYaS4/EpiuraCNzx
         lymLMsr193hi9BlYq1ThJo5sv21Besxxwp4/OmB08GbQzCRknMdWZ5Ehm1QQ3N4iYXWb
         TQ4Pp2kex+RehizjlcYXBNIES/mSsRHL2rkADrPL+ENr47khYrQLiieBXyOPMsvI09gw
         nXX3AOBp7jnPM6wYHOA4Efz4w69o5xMq+RAnDqz/+gnm27uF+3ypHhf3o2tci0b9007J
         Dt2A==
X-Forwarded-Encrypted: i=1; AKwUvByzTerdvHmCgAQBoswoiUD+SnpCLUlh6byzst0xpz464REG0qkKCevKOQLWgAi77qOZCGoRFIQQulo=@vger.kernel.org
X-Gm-Message-State: AFuF++l/Zu82lDoWqST4TOIHtOuVEu7sa2nPm/aygafajCF4mg4y2d1/
	nwKXb0EOLwGphfm3109iUUIr5u9hxO4Atx7JxzfDAlm/6Hek/9p9FDj5luFCN8AkK5mim3t0FhN
	wI5tmjPEhliix69uUloBTBG0EU0J6kDE7gd9lBqwDs40OydoyErDaghp+ouY4lQ==
X-Gm-Gg: AYBFou0lHT2iGSxtPhK/dKucw0oRlm6yTH9ypxWAG3dDKvrjKg14LV/M/o1LUk26njV
	5ZGHrM0+EsA5SksHwjoTE8E1AyXg5c2Jaf1o01GK8Guy4gf7YEBHaWmkTSG1L6qvTvXCIrQjfgo
	lKqL2vtGI+sW2x2csjE1MN6yORh3qBW54Lhsh30PTWm3oVYiqCkosWQYK06/D1zSsF2yTqbDRJX
	9fkaKjsQT4t4XkO7TR3Nt3H7DXUMSWXEBM0xGooyK/E0DZrlREeT2rxE6hIqTPsdzSfO7781awJ
	P9fBoFwR4NoEHG1cJWcxz487AXmXy+hL+SsOWcdwoLy1Go1I1Mpl1ITMCzYLDFGAvAEapir8iDM
	aoN5ERpj3jnu5VksHGzylCVOrUHBk9eRVetA=
X-Received: by 2002:a05:6214:dcb:b0:90c:e3bd:dfe4 with SMTP id 6a1803df08f44-9103ef88b76mr371340676d6.21.1788891561018;
        Tue, 08 Sep 2026 11:19:21 -0700 (PDT)
X-Received: by 2002:a05:6214:dcb:b0:90c:e3bd:dfe4 with SMTP id 6a1803df08f44-9103ef88b76mr371340136d6.21.1788891560377;
        Tue, 08 Sep 2026 11:19:20 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104059559dsm123327336d6.1.2026.09.08.11.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:19:19 -0700 (PDT)
Date: Tue, 8 Sep 2026 14:19:18 -0400
From: Brian Masney <bmasney@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: wsa+renesas@sang-engineering.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/4] driver: core: add subsys_driver() macro
Message-ID: <aqBRpviTCjwo3weo@redhat.com>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
 <20260908175845.A6A4D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908175845.A6A4D1F00A3A@smtp.kernel.org>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Tue, Sep 08, 2026 at 05:58:45PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing semicolons after macro invocations in `subsys_driver`.
> --
> 
> commit cdf3179a9f2205efd1b552f70b7522e1db5ee888
> Author: Brian Masney <bmasney@redhat.com>
> 
> driver: core: add subsys_driver() macro
> 
> Add a new macro subsys_driver() to eliminate some boilerplate code in
> drivers that need to register earlier in the boot at the subsys_initcall
> level.
> 
> > diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
> > index 768a1334c0a1d..29fbc01ef06fc 100644
> > --- a/include/linux/device/driver.h
> > +++ b/include/linux/device/driver.h
> > @@ -297,4 +297,35 @@ static int __init __driver##_init(void) \
> >  } \
> >  device_initcall(__driver##_init);
> >  
> > +/**
> > + * subsys_driver() - Helper macro for drivers that don't do anything special
> 
> [ ... ]
> 
> > + */
> > +#define subsys_driver(__driver, __register, __unregister, ...) \
> > +static int __init __driver##_init(void) \
> > +{ \
> > +	return __register(&(__driver), ##__VA_ARGS__); \
> > +} \
> > +subsys_initcall(__driver##_init) \
> 
> [Severity: Low]
> Are we missing a semicolon at the end of this line? This relies on underlying
> macros providing a trailing semicolon in their expansions. While it compiles
> today, it makes the macro brittle. If the initcall infrastructure is ever
> refactored to not include an internal trailing semicolon, drivers using
> subsys_driver could fail to compile.

The other code in this file (like module_driver + friends) has a semicolon
however checkpatch.pl complains if the semicolon is there. I didn't know
if the semicolon was legacy. I ended up going with the approach to
satisfy checkpatch.pl.

I have no opinion either way about this.

> 
> > +static void __exit __driver##_exit(void) \
> > +{ \
> > +	__unregister(&(__driver), ##__VA_ARGS__); \
> > +} \
> > +module_exit(__driver##_exit)
> 
> [Severity: Low]
> Could we also add a semicolon at the end of the macro definition? Omitting it
> is inconsistent with similar kernel macros like module_driver and relies entirely
> on how the user invokes the macro.

Same comment as above applies here as well.

Brian

