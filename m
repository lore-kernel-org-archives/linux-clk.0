Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC021C5D4B;
	Thu, 23 Jan 2025 20:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737664058; cv=none; b=dE1AzMaCb1tifmexHPnpa1iBfLNBX0upm46EhOO8YyZOELOk6HxZTIIvXLOD4Vmo9rG1zSkJ8TEFwLkkuDa0mJ8VtPv6+f212lAXLOxpd/PSWcnLbUfJyQ1HgIfOOKg38GIU9jwddY4gHE8UotVhwRfl1qdA8hkVCR/KfyVoSK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737664058; c=relaxed/simple;
	bh=XjYNMqbWZ4n/XbjzqN1/SpWN54nBY4NkBU2QqHtYu+U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pBnAaxvhbn51YeJ8kSusamy62elnaeUPSCnvu7JnPctzCOxYC7Ad/ucnKe/V506KkDEtgAji/y7ItoW7Vq4dWs1J0xF6yE+Edm08ysX/MhxMVYy27NG0g20mpTgZP0k3GNHzApGD/1if0pVkiCLstK8mUlPVMuBsnz6hzhP0UgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9FAFOxY; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9FAFOxY"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so9147955e9.1;
        Thu, 23 Jan 2025 12:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737664054; x=1738268854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00Jd7qfRLvc64aDOsfuy6UISvWMt9cQyEiI056IRJNA=;
        b=d9FAFOxYmpnDUoFdtN0323r296ddXvHDPbc7bjTBVvz2FjBbYgth90TZRvh0sWK1oB
         i6bq4UhgasyqOScH030iQGZ23gZROkTyZrZOCCfSYbnh4OmLWZArKVOYjjTSjtcNdj7Z
         yrKYcd9yW87IMa90XkISVMbtU2HbYo1z4MCAw8oTLMcLvHOO88EoZ19klFgFFv6j+1d8
         9/0ccJO4p3kHtqogyokyjWCKKIu40WDcdaB1lt73xMLEk9PFCgCvdQdbJ21ccMfSBUTJ
         PHoHHDOOXsHUN1oAwFcsYxBWisyhdJ/WFE6LDxO/m9ZQwGyPb4uYJT3FiMaRlnGLTd3v
         w3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737664054; x=1738268854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00Jd7qfRLvc64aDOsfuy6UISvWMt9cQyEiI056IRJNA=;
        b=TN891/4eXk7fWEkXdas2l1T6lFmDVWWSv0KTIl5t3qaqWo68tJafci5zHluuN0pUdQ
         S1pYrT9lflt4VHE9X6vqmUkvbAYuT5TvYNwxYLLY55mAJC4rkOsz1LZ7t2NGO2hHXs6A
         5UefCnVC4GYSRV5A0cUNFWgeWe0Hw5x8Y5IvGVtJrJ2jhK5PGhg+8O7phNis4oBjeDVs
         Q8xeJq/oSQeyR7U+mD9XH35QFzzI6MtmnMug4dtKOp7ID2LtbGzymOJbiWtTt7ltahig
         7IX2U9BYFedggYAh/xagrfwnPrN/9FBYm4j6hfZRw9Iyp6p8YAwrbleq2U4kl33SqJHN
         ZgAw==
X-Forwarded-Encrypted: i=1; AJvYcCVIVq3XjqXCavYMWeN+1RGUA65go2Kgc6tkYXGplG1+vYkAWrsU2gzzX9A/cFdRNAFAYaNTHOXh3Qg=@vger.kernel.org, AJvYcCX/grHsBEzmbDP2HiKiH0FFEkntub2dyTdKMKHmkDYHL7TLuboC1BNkVfkVBEnnPZ2JPpknE3NfvakAuh0n@vger.kernel.org
X-Gm-Message-State: AOJu0YzObHW0RwDvk8FnCFaf1qMIYk93yIhcgidpvmVEisykEzsGIss2
	9tJA8LSIi3DNXba3yGl2d04tMsEngzw0JvcZDoC5lF7aq7DYKzjr
X-Gm-Gg: ASbGncskhLffKy0lOxp1IexCZ9BzglRJPy3T/jihMRDyQ1lwz6yWcwS/cMvlRHjHPGO
	EsV3milzSEvjZxvsbaRli5c8ZuTUvd1GYI5HEjvVXBidiNUFW/qihKZYgnfm1WDe8BjFMWbD4c1
	mc7IGcfNzRzo4dsUhcuganR7V2IkxPqd7FiIQ1SI9iGMJpEAWCeat8A3ow5RESTWpbW74/EiGfK
	ajkYHlPqHKB6cWF/pXe/L9uCXmwQg4/0yCI/7ypiL5g34h7OtwZit36D+lM5j+++/7CrZByB6E/
	zlgEOUj3/ICS5w/ogCDKiQ8kSLnoGCx715dBggEpGQ4=
X-Google-Smtp-Source: AGHT+IELmIj4TMdtO6F0JzBvp13pItF/CqH7DVKu4Caf20C2VuLCa8NuLXlr21iKRQntmJ/EV7Urrw==
X-Received: by 2002:a05:600c:3c82:b0:434:f623:9fe3 with SMTP id 5b1f17b1804b1-438913e024emr291117265e9.16.1737664053774;
        Thu, 23 Jan 2025 12:27:33 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd507e0csm2624815e9.20.2025.01.23.12.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 12:27:33 -0800 (PST)
Date: Thu, 23 Jan 2025 20:27:32 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Anastasia Belova <abelova@astralinux.ru>, Emilio =?UTF-8?B?TMOzcGV6?=
 <emilio@elopez.com.ar>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: Re: [PATCH] clk: sunxi: add explicit casting to prevent overflow
Message-ID: <20250123202732.5f7eb52b@pumpkin>
In-Reply-To: <20250123005556.57b2331d@minigeek.lan>
References: <20250120084719.63116-1-abelova@astralinux.ru>
	<20250122225805.2ba6a062@pumpkin>
	<20250123005556.57b2331d@minigeek.lan>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Jan 2025 00:55:56 +0000
Andre Przywara <andre.przywara@arm.com> wrote:

> On Wed, 22 Jan 2025 22:58:05 +0000
> David Laight <david.laight.linux@gmail.com> wrote:
> 
> Hi,
> 
> please note that this is all practically irrelevant:
> - PLL4 is PLL_PERIPH0, which is meant to be fixed to 960MHz. Linux
>   would not change this frequency.
> - the Allwinner A80 is both old and quite rare/obscure: the most
>   prominent board (Cubieboard4) was broken for a while and nobody
>   noticed
> - this "allwinner,sun9i-a80-pll4-clk" clock is not used by any DT
>   in the kernel, so it's effectively dead code
> 
> But just for sports:

Doesn't surprise me ...

> 
> > On Mon, 20 Jan 2025 11:47:16 +0300
> > Anastasia Belova <abelova@astralinux.ru> wrote:
> >   
> > > If n = 255, the result of multiplication of n and 24000000
> > > may not fit int type. Add explicit casting to prevent overflow.
> > > 
> > > Found by Linux Verification Center (linuxtesting.org) with SVACE.    
> > 
> > You need to read and understand the code before writing any patches.
> > The '>> p' and '/ (m + 1)' are both just conditional 'divide by 2'.
> > So can be done before the multiply.  
> 
> Well, normally you would try to multiply first, then divide, to avoid
> losing precision. In this case it's fine, since it's just dividing by 2
> or 4, and 24E6 is dividable by both, so no loss. But the formula in the
> data sheet is written as "24MHz*N/(Input_div+1)/(Output_div+1)", which
> matches the code (somewhat).

That PLL can generate all sorts of frequencies due to the multiply
and divide (as well as the shift).
The code was clearly sub-optimal for arbitrary frequencies :-)
 
> So I think it's indeed better to divide first here, to avoid using
> heavy library based 64-bit mul/div algorithms, just for this one corner
> case, but it would need a comment, to point to the problem and avoid
> people "fixing it back".
> 
> > Since req->rate is 'signed long' and the value is a frequency it is  
> 
> struct factors_request.rate is "unsigned long"
> 
> > only just possible that it exceeds 31 bits (and will be wrong on 32bit
> > builds - but sun-9 might be 64bit only?)  
> 
> The A80 has Cortex-A7 cores, so it's 32-bit only. The SoC can address
> more than 4GB, but that's not relevant here.

I couldn't decide whether the code was for 32bit or not.
Using 'long' is pretty dubious almost everywhere.
I'm sure it is a hangover from people worried about int being 16bit.
But that has never been true for linux (or pretty much any unix since
the early 1980s).

>  
> > In any case it would be sensible to force an unsigned divide.
> > So perhaps:
> > 	unsigned int n = DIV_ROUND_UP(req->rate, 6000000ul);
> > 	...
> > 	req->rate = ((24000000ul >> p) / (m + 1)) * n;  
> 
> Yeah, I don't think we need the "long" qualifier, but this looks like
> indeed the best solution, just with an added comment.

Maybe just mention it only need to generate 96MHz.

> And we probably
> want to change the type of "p" and "m" to u8 on the way, to match the
> struct and make them unsigned as well.

Make them unsigned, but not u8.
The u8 would get promoted to signed int before any arithmetic.

	David

> 
> Cheers,
> Andre
>  
> 
> > 
> > David
> >   
> > > 
> > > Fixes: 6424e0aeebc4 ("clk: sunxi: rewrite sun9i_a80_get_pll4_factors()")
> > > Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> > > ---
> > >  drivers/clk/sunxi/clk-sun9i-core.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/clk/sunxi/clk-sun9i-core.c b/drivers/clk/sunxi/clk-sun9i-core.c
> > > index d93c7a53c6c0..70fbd7390d96 100644
> > > --- a/drivers/clk/sunxi/clk-sun9i-core.c
> > > +++ b/drivers/clk/sunxi/clk-sun9i-core.c
> > > @@ -50,7 +50,7 @@ static void sun9i_a80_get_pll4_factors(struct factors_request *req)
> > >  	else if (n < 12)
> > >  		n = 12;
> > >  
> > > -	req->rate = ((24000000 * n) >> p) / (m + 1);
> > > +	req->rate = ((24000000ULL * n) >> p) / (m + 1);
> > >  	req->n = n;
> > >  	req->m = m;
> > >  	req->p = p;    
> > 
> >   
> 

