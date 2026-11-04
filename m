Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833858;
	b=dK9gEGQN0Is/32NSyes0dL+RtTpwAQw6JR6rsN/IrzZtZQN8Y4IpyBG4zpNU+OnTDd/x
	 GHN76EXSyyn+Xb5g2tln++/EHlj46Dn2jEm06gZ0BIImRTMoGLVhkKikRj1MGqjD0Ztv4
	 Gp1VWX51yl+D6ejbdnDJWSDypDBbq/hlzslp5KII6A8nkchP64bN1rBGrLmH9dN15CnTh
	 gGbXe6gBEEQtggj1wCBvg+wlEONHk9Ee2isx9S+7wsqrqgzmnok1AUG7R1fAGagoXhz77
	 4hITfBmzDqWDyX7cv8HHNr5vUq+A0TNBxeqSR1Tu9J6xGTQBATnClA9bjy0tgl6QKFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=L2ngttll2ZfRB1yOGTWYBs11RUTV7CaPsssPY7ZPsJ0=;
	b=2AfuUmUNxmUQnjfH2vATlbHykymjP1xd0ItQOhHIabvBPiL0wlV1ZrvyB0dSIya7Bm5E
	 m/Xwr5xVgQ46kEURcxXq8eaauxLLBhrqRPBePIiXWdPC8t6ple/GW71fojwo5yJ5jjgsW
	 lRY0NgPdOj1gQF/Nk7M9Y5dciUr4Y067TwvzApMIN/D+AKMLJUiQ4Nz6P7FnOQ9ngqgcF
	 SrItAtyMuu3siCsA7svkGdsaS4GyDtSKkcH+t71TB6Ert2K8zbU+8hi+jwkZvoSWiMF4W
	 iWcmPdvzFYkZhXiy+4nYrF5XT1GOI6XM2LXcqnPNAbdbJH/pSGIAER6yt7yWQk2nQcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VPeUnHJl;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD9F606A31B
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 23:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FD9F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VPeUnHJl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d05d51553so7911165e9.2
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 15:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793833856; x=1794438656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L2ngttll2ZfRB1yOGTWYBs11RUTV7CaPsssPY7ZPsJ0=;
        b=VPeUnHJlodJgGXyskeDaB33g6nEXrva2NNxzBrVb74wXzoWpbrsh0hEGsT/kwrqejQ
         6eHU/VuQiSGjbyOWeTqPwzONyTJ0PKY2osaawEYceMnGwIXR70+pCXzfPabUFyjSs+2r
         taK6DmEZBKjtMrerLreARwg8HcsX59JZmGTTM6R5EePr4ox2rY7biFcbtx7LMjroKt4+
         UDjPoPT1ISvSajE++5bQKm8/nkehBoLNUx/CCCpPxbQUs/TXC9w3gWgI34LAS1VG0W2T
         gtvdv/L6Puy8FinqAZkRFGCBW1axWjoHSt8WVhQfBTQ9AJwYhaccoXeMiKj2mhVBmnhe
         9HUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833856; x=1794438656;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2ngttll2ZfRB1yOGTWYBs11RUTV7CaPsssPY7ZPsJ0=;
        b=Zy/q+OWQpGUBQPBsyK/sbaYLuCvcNixxceHeJEATUrKSp/HDYNZlzg3p3mdbkv+y1k
         Bw41zhNdLZE4PG/lIv32wME4to4+/SiXQ3N6UI/jdn2E3UAUH27N9YTnTnh1JWKKAXad
         RPV4SAc6tuZgCzNP6tezwzBg4InaDtkzCqLG/d/k/e+VhKdS8fdnCMctqD+8VBuoUWJk
         qVA43Q/B03ysam5P1E7JWAhPTd7w+SJaJXqaRjzozHMogWm5b53Xr6hMua8nTINFuyoL
         pFgicOayMrT1xaU50ipdOOucKn57bCaS3RpFYm8170JuEzLHybwNkQ9PQNdGHIir6i+K
         JJHg==
X-Forwarded-Encrypted: i=1; AKwUvBzfRQ/aL7S5dfJSH6goIhJjSm44eexBS6uBg0XDSWBgajHYckN9SYZlcUyYxBrpyvAO+FHk3iu1O9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sjBvZ3PIn9i+JCF3P64LXbeeAR2rjGxYkm5p7UWAnqZnud1x9
	x3Q/pVzxxedPG+NrdXSdqabq0tL1t3oxEu5ysU3Fx3NkP3MesYoX4nZy
X-Gm-Gg: AYBFou2UE9NpBUfHfNN8bdtI65ye7ofvAB1udKTC8pQDF3EYYYijAPU/1RB+KZ1RD69
	Mbwe/zMkkQ1oOpMyypstj6RiADTCFMDkizeRZDbRAcI4mseLbDn8RtPfNZKhilDf+ES46U55iSG
	V2bRdC4jOubTMzuwWI69rBr+RZkAKuRFhsKBVpQANaXNbH00EZUnCBSCMe7yg3FW3GhbdnANsjH
	YHJ47fO2cSD+y0emiDtaG0uOuNaO5nQ2EcPoU9iY/mwgVuV5zek+Qp48R6ig3+CWt2Jur7alz1A
	zuHyURErk9E6qt1DwHYTCLp0kfRtYO5VQ+DwxTXye/DHVnOblEUtvRyUdaTAaNkjofUWYDvQX6O
	W2mzCDOjkzJza6xPh3KEvfk+ye3CyQ3mI6D3Pst1WStJ+KmLJGQbqQD526lMFT4Lws6AqzewXpR
	teYjY5xHUTwII42KOeyeXuqoyw6xgddCyUPRXymWbBVbVGK3zMlMYLYTE9BrgBbooU5dst3rOnQ
	620ar22AUaEmyV44Ocb+e5q2eBzLv8hLn9v4hyPKOau57skSNhgGWUw+jIWk52B7JFkDybDlCDC
	jre8pFTGEJ5nOepsdkMT6eocHq+4buZENRTOT4Psejn6s4wJOlBasZfKagtcwC5c
X-Received: by 2002:a05:600c:524c:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4ac17470f97mr396694935e9.10.1793833856460;
        Wed, 04 Nov 2026 15:10:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8748sm6355951f8f.16.2026.11.04.15.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 15:10:56 -0800 (PST)
Date: Wed, 4 Nov 2026 23:10:55 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Brian Masney <masneyb@kernel.org>
Cc: Carlo Caione <ccaione@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Brian Norris <computersforpeace@gmail.com>,
 Brian Norris <briannorris@chromium.org>, Sebastian Reichel
 <sebastian.reichel@collabora.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/2] clk: divider: Fix the divisor for rates above 4.29
 GHz
Message-ID: <20261104231055.5b566adb@pumpkin>
In-Reply-To: <179382912410.620422.14715602424648962218.b4-review@b4>
References: <20261102-upstream-clk-divider-large-rates-v1-0-eb17035bfad2@baylibre.com>
	<20261102-upstream-clk-divider-large-rates-v1-1-eb17035bfad2@baylibre.com>
	<179382912410.620422.14715602424648962218.b4-review@b4>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 04 Nov 2026 16:52:04 -0500
Brian Masney <masneyb@kernel.org> wrote:

> > DIV_ROUND_UP_ULL() takes a 32-bit divisor, so on 64-bit platforms a
> > requested rate above 4.29 GHz is truncated. A divider fed by a 5.94 GHz
> > PLL then computes a divisor of 7, not 1, for 5.94 GHz.
> > 
> > Use DIV64_U64_ROUND_UP(), which takes a 64-bit divisor.
> > 
> > Fixes: 9556f9dad8f5 ("clk: divider: handle integer overflow when dividing large clock rates")
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Carlo Caione <ccaione@baylibre.com>  
> 
> Reviewed-by: Brian Masney <masneyb@kernel.org>
> 
> Since this is a core change to the framework, I'd also like to see what
> Jerome thinks before we merge this.

I've wondered about whether using 'unsigned long' for clock frequencies
was ever right.
Clearly the type should be the same size for 32 bit and 64 bit, and I'm
pretty sure the choice of long predates 64bit (I guess someone was worried
'int' might only be 16 bits?).

But if frequencies can be over 4GHz (which no one would have imagined a few
years back) they can be that high on 32 bit systems as well as 64bit ones.
So there is a big 'bag of worms' being opened.

Changing the type to 64 bits is hard to check (unless you manage to build
a kernel with the value embedded in a structure using accessor functions)
and will be a lot of bloat for most uses on 32 bit.
Alternatively you enforce a different api for clocks that might exceed 4GHz.

David

> 
> Brian
> 

