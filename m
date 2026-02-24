Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AA53A7F68
	for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 16:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771952170; cv=none; b=UEnRWMPvXWXPW4EE6lqbDflG8v5E9p/v8L5nclWBgBJLybQbRUmT+r4GBftm9OU++g9WObi5N7WbjiqxG4st3JRHMpvLueUxry49z/EIC1ikZDS9y5IszGSHVizQlqOzYKpWpDsWuk1slOZOrXEpzjYvnCVSzHwfSw+616IfKAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771952170; c=relaxed/simple;
	bh=SXXdxYog2Rl25Gc9IYtvoQ+xwSoZdPRWrNOKzsG9oqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dl8Epjnz7ZzckhY9ThysmDl4ydpK0w1/cebLoE/NYVJEbHE16ACbJ7f0FiaMYSYTOsi43HwRBosh8JrW9BBqhU43HBczHcrn7Z7WDvtXVViqMVps845WZT9Fnxp2F/ChmCHG72dOKyq+bGJVFbgNVp3XvMnjBvAFgMoLnaOzq4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NiWISabA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DttHknyn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NiWISabA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DttHknyn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771952167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FleR1f16PYtnUZApWMSnFMFVSHRjzLDJojaW/qHZYcQ=;
	b=NiWISabAK7Q8D32xutCfyGP/uci8np3vRMbSz0fCww+IP5L1+wJ6Z1Taj0GwFTimsW7S73
	kFfGdoPDbpA0tOty2hEuEwUa38S6DLOdWd4VKwEsdwnwVFQL08Gjft1P/1ppSzmjLJMNv0
	y0nLZkz/s66K/H+uQCsDxFDxlgAy+Fs=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-n-pQMG9UMbCKCJ1RoXp44Q-1; Tue, 24 Feb 2026 11:56:06 -0500
X-MC-Unique: n-pQMG9UMbCKCJ1RoXp44Q-1
X-Mimecast-MFC-AGG-ID: n-pQMG9UMbCKCJ1RoXp44Q_1771952166
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50333a8184aso78009391cf.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 08:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771952166; x=1772556966; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FleR1f16PYtnUZApWMSnFMFVSHRjzLDJojaW/qHZYcQ=;
        b=DttHknynXjAoRnxWw6Xdp9o0ufOuMJoFHmlcoi8P+1w3pv0TNNaXNgGk6swFmEGZcu
         mvUsfUqzo1je0UEUffcfRl1OqZpTI7OTR9H8vGQAUxT1aDP7np7cToQ42rGWBXx7qK9q
         MP3dychAvw7EG/0O/HQ8Z4bgxvPi2QCjMZoe36pZ8iGdgZzTbINnU989O3Lq42cpVxOw
         +ioVG9b039f6g7RuhsnKAeRYVH5D4sVr872MSivqRVFi+KfYIknfBhW7v/Cz/tVnLTHr
         QWP7ti42xb91zpZz+TopnFUewIZRSHQf5mlTeGQC5SlR50e2rQxFkFfzhoH+RILrXBGh
         UgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771952166; x=1772556966;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FleR1f16PYtnUZApWMSnFMFVSHRjzLDJojaW/qHZYcQ=;
        b=Nj1sR4BesMd4tmB7Lhedk60zDExgmXdxUnu/bmcgCLE42qjDCl0PbakO+N+WipdOC8
         gr/Z18iL8cbET6N6RTrU7VXB1O0+0kKz6xTiob5liy3hQiiFrHzdaGT7RzivPJpQR6yi
         J/dk6884kvX3oM+oGdkmIFIQi1vCFW8KkiUDObRyQz/D8fzdYN0AdZHauXXaQW+h8qHu
         GgONd8T+g6JSlusBZJoLj9WqVLqWOinPKVL7ELI1179f5Oy1krzaTfzbUnIRJbcwtMlm
         9zuB7U7+tGkVOoMDiYHJa2HtPY26nydV4MNJWukyOCj3fxFTjAf0XC9p5sZIqX4B52KI
         /vGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPqtzupJ4DuZnNM7GNDD3uWGLxXnO+2DiYeWAH+S8TNziQf9jZzKFAU7f8OjHbPY/oZ/PkHq8iMGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUPFD2PURCymZM7QIsM9ucuR/PCXHvceVfQ5n69Odm7CSZQU8f
	nUevXUh+aaAKrqkSLb8mBGoLXd2DYgpLLNv1m/hO9Cj95THPEKB5o/iaxEXjhhJeiujaEh5a1hv
	vkgOA5rnCt6lL0uKfpIhuq3ssGX/W8Lz8X/W7yAySkDBXdK/SaOTH6E4LSkkz9mWDFY7UBw==
X-Gm-Gg: AZuq6aI3jWrF1e3C5JyKeMJjSr2wyIDVAzgfk3wBuP0gZFy3x1KdSkhyfR+u3TVzlfF
	0Lc4rxsauKt/rG3Ss/jqF1n4avxdYZqnoMDziZyoiS4mJARU/ZCXqw1osoc7dd1E5g+/+2FmhRI
	ijr9m0S2SMkYyvJ3ATY0NFV3UC3UrcreqKfgCW1vYhPv7ntp5E7+Kzkg5w7N/C25aPdR6eaiGr1
	APBdkO4PApvtY4qs3T3BsqHhCnpHK7w7CRcVijL4oxRmJofpxFJRft6C3gR26h4jCQgUU/rXFfh
	mKTw7muzf+ey9pQkJmHJoOQ/Be93KJVIDUKuofNXs8nLwxsTNaTTXkOq0UAPMQ0iztI4tI6V4xn
	IPKYkxSqK8xuuhP//H3bODqJX05WxpvUxQlRB5IWvmGpnaDrldNYgKrHe
X-Received: by 2002:ac8:5816:0:b0:501:3e5e:b027 with SMTP id d75a77b69052e-5070bbe5d95mr164466111cf.19.1771952165678;
        Tue, 24 Feb 2026 08:56:05 -0800 (PST)
X-Received: by 2002:ac8:5816:0:b0:501:3e5e:b027 with SMTP id d75a77b69052e-5070bbe5d95mr164465431cf.19.1771952164906;
        Tue, 24 Feb 2026 08:56:04 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5070d550785sm124299171cf.11.2026.02.24.08.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 08:56:04 -0800 (PST)
Date: Tue, 24 Feb 2026 11:56:03 -0500
From: Brian Masney <bmasney@redhat.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/3] clk: microchip: core: update to use div64_ul()
 instead of do_div()
Message-ID: <aZ3YI2eyyYLWl-dy@redhat.com>
References: <20260222-clk-microchip-pic32-v1-0-ceacbcd515d1@redhat.com>
 <20260222-clk-microchip-pic32-v1-1-ceacbcd515d1@redhat.com>
 <20260223090948.7970ca87@pumpkin>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223090948.7970ca87@pumpkin>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi David,

On Mon, Feb 23, 2026 at 09:09:48AM +0000, David Laight wrote:
> On Sun, 22 Feb 2026 18:51:04 -0500
> Brian Masney <bmasney@redhat.com> wrote:
> 
> > This driver is currently only compiled on 32-bit MIPS systems. When
> > compiling on 64-bit systems, the build fails with:
> > 
> >     WARNING: do_div() does a 64-by-32 division, please consider using
> >     div64_ul instead.
> > 
> > Let's update this to use div64_ul() in preparation for allowing this
> > driver to be compiled on all architectures.
> 
> There are a log of 'long' in that code that hold clock frequencies.
> I suspect they should be u32 (I think someone was scared that int might be 16bit).

Instead of calling:

    do_div(frac, rate);

Where frac is a u64, and rate is an unsigned long, I could just cast the
rate to a u32 like this:

    do_div(frac, (u32) rate);

Thoughts?

Brian


> 
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202601160758.bpkN4546-lkp@intel.com/
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > ---
> >  drivers/clk/microchip/clk-core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
> > index 692152b5094e00bf5acb19a67cf41e6c86b11f35..2e86ad846a66cd5487f5412c09ab0ad25ebe3f79 100644
> > --- a/drivers/clk/microchip/clk-core.c
> > +++ b/drivers/clk/microchip/clk-core.c
> > @@ -341,7 +341,7 @@ static void roclk_calc_div_trim(unsigned long rate,
> >  		div = parent_rate / (rate << 1);
> >  		frac = parent_rate;
> >  		frac <<= 8;
> > -		do_div(frac, rate);
> > +		frac = div64_ul(frac, rate);
> >  		frac -= (u64)(div << 9);
> 
> Is that cast in the right place?
> I suspect 'div' can't be large enough to need it, but it's presence makes
> my wonder ...
> 
> 	David
> 
> >  
> >  		rodiv = (div > REFO_DIV_MASK) ? REFO_DIV_MASK : div;
> > 
> 

