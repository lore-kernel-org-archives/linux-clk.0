Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF471317164
	for <linux-clk@vger.kernel.org>; Wed,  1 Jul 2026 10:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900096; cv=none; b=HWksP/zJXqoExW9K6XT7lratj7BF7ghy+unHC51UdSBngswa9+63eq1zC/+6QTcYIOK/OoSje0+xKfTmttMu6fb6SFdl91b5Q68EsETwkPkKHNOxJNwnFLNRaZM2FoZ/JYK/3HBQb4+99zV9werhMooHB4tUDcz8BWFVDUDLAe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900096; c=relaxed/simple;
	bh=Wr7k6ms8w5cf7YX6QyMsz1ACCB5ddoRBekCXGDNdT8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmERkpAuKO6APU5u1tqX/r5WK3Nwrqj3Vpvyjl7++hPv4LfOv/jbo0nFzqT3tutmHzmMYlrO04lR0Y73n56Ma8BuXo91LCkjZPytMawWjQxdojES9ut1DRc2pLEGSswoDTktt1lvnCVzgSvVsBExFzEyoGriYB/abB9kJIPUYVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7znZD+Y; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7znZD+Y"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e9bc8dd61fso442404a34.1
        for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 03:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782900095; x=1783504895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0mNQ3A3467geVX/IW6n7aAdW3fUUPOZsOtAnCuwuGrQ=;
        b=Z7znZD+YWTbZ6L9t5lYpv+TGZirrgWRV46H8GSVHr9rBT2cw5E2sccANpfb28kUPSt
         kLKIzrM1Qv5jWveSyLfloEW/r2qnjYxk85Rr2FavkLSrKIT4dYybv0gwZURRaOyRVi0Q
         3dM5BNeXAit2VLKE/G1w9UAuBj7R0cTh/MbtU/DJZsr/a6Wd1zwWRZyI3EnLRoTxsD6P
         Bq36zGp8xMv6JZjtI4BZ1fYcKot8Li26nXqbIUAwpw8pBQUCPyvQaeFDk1lVe6fUgnPf
         DMUmH5CUhUIRAGPmF8fgtJLovjkN/WC6mscQzOySm6OHbDG7CeIaVqatSixgF4P64BXc
         NIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782900095; x=1783504895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mNQ3A3467geVX/IW6n7aAdW3fUUPOZsOtAnCuwuGrQ=;
        b=RYA9pV45QOAqVJMj0pZho9Btr5sfqDGKYlOYEx1IxBBrlyHJAgUp/fATb0Nb+i3Di7
         rTTR1voh/0IJJp3x8BREejqKypfzxn6vIg8mUeMt1ri4cZCaLFU+6og722tNptUgbI1c
         48YfLQM3NDy24DEZtyvDZZ6/9NB0TrN4BCtYgiXVhjG972RszzAgB9pCyIun5VmX2cSw
         C/4/EKJ0svRfjSCtzwBJbdbOIUlEf+NX94TXA2HiVzjfvPrvNgp8mMwmzIk/MvoiKHF+
         BN+u78lLSFCQ79MaLgcM9CY7y+kJzAQZz6Y01Od9aJ0SOAxRojqAoO5DdAh8z0bShza9
         bnRg==
X-Forwarded-Encrypted: i=1; AFNElJ/jGi0pMTJYNRHxLQI5+K4W+/PaSSp+CmhikH99I4MO8Jxe5k0XhxXii8hCZp4JjXPU5nI7WrT213c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+bMVrbDd/PjUlpfUWcKotwaB8lHcz8JckXgN8qxW9AUcjsYDi
	/NVWng4J0qIa+nSMZ/KUlZCZK7Mx9ZB/vZB4KQLJHpQ8ix3m+u6X7fla
X-Gm-Gg: AfdE7clM+2tNymoIQwoOaqjHtnUqNP/BdQlXh6MfE3hxlswqOyPJMKrAVb0lVA/JLA+
	T+JkqZyamH9eFtBC3DjCyqiuEwXez1KGRsMnnM0Gq5y8Sugq0m1tY8mItVEVS59KKLRCj5R/eaX
	pxAxee+NNNFDa9xosf2eN2HaiepJXFBtt/V+WUY1ZceTVF1qVbEdWygrh+YGIwQpZzerziyLsZw
	YIb1DysZzyH7b9OFWkMr4n5T4QtSOgaESU142/2LI/p9JW8te1S+1LRD0fT2tHyE0EoCok2AIJv
	h0ivWyOmzTW0cSJNt8LA5dWLRqx8a4plRXsqQjztnorEISn4j7QVa3o29YdQ3Hh6N/8gqqeAP9w
	68ga2tDmujDRJfQaABQygI2dajdZXcG4b2JclXX61OgFH3rjKmDOS504RpBmq7c/oB3lwYXthkr
	PYp2SU
X-Received: by 2002:a05:6830:8291:b0:7e9:ebfe:a0a7 with SMTP id 46e09a7af769-7eb5056d2c0mr91138a34.29.1782900094634;
        Wed, 01 Jul 2026 03:01:34 -0700 (PDT)
Received: from localhost ([74.80.182.83])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ebfec7easm4541881a34.12.2026.07.01.03.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:01:33 -0700 (PDT)
Date: Wed, 1 Jul 2026 13:01:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vz@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Return expected ENOMEM error on dynamic
 allocation failure
Message-ID: <akTldJur7GEgSkDD@stanley.mountain>
References: <20260629162127.3910603-1-vz@kernel.org>
 <39032914-3a66-43d9-885f-55f5d60da047@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39032914-3a66-43d9-885f-55f5d60da047@oss.qualcomm.com>

On Tue, Jun 30, 2026 at 10:50:13AM +0200, Konrad Dybcio wrote:
> On 6/29/26 6:21 PM, Vladimir Zapolskiy wrote:
> > If a dynamic memory allocation fails, the returned error code in clock
> > controller driver probe functions on a few legacy platforms should be
> > set to -ENOMEM instead of -EINVAL.
> > 
> > Fixes: ee15faffef11 ("clk: qcom: common: Add API to register board clocks backwards compatibly")
> > Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> > ---
> 
> Hm, I'dve assumed that static checkers would be able to find this pattern
> 
> +Dan do you still work on smatch nowadays? It doesn't seem to
> catch this one, but I think it'd be valuable to look for this pattern
> - AFAICS it only flags returning -1 instead of -ENOMEM but I can't
> seem to trigger it with a manual edit to this file and the following
> args:
> 
> -p=kernel --pedantic --two-passes --assume-loops
> 
> 
> For the patch
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I'm re-working a bunch of Smatch internals right now.  I've
fixed the -1 vs -ENOMEM warning, but it's affected by the re-work
so it's going to be a while before it hits mainline.

I can create a warning for returning -EINVAL or other error
codes instead of -ENOMEM.

regards,
dan carpenter

