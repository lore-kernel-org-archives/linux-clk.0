Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741254204E
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 09:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837793; cv=none; b=tjtUiWba6ghwRKdQpAhbh3+t7HJA+MbkytMSTB4Xi1V3pYcpekOjnT0/PGCiaIyH9lfpYjtk16P2cWFml/pBhJ8c3Ner/rrCk/tDSG5NRBQHNbXlLHXqxzgIsGqYZXzrsxipFI22tMtZAIhubSCoFdCoB3yWWYKZu6+ODWtAd68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837793; c=relaxed/simple;
	bh=kxAGgEbNXxLQOFOmbC7ySP9p1D5+5YRBpmKhZ4u+jwM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U8MbxddEkkKjOvF8becFI5wjLeX8mSfv8eaJkPeDx3G2L7jbSBKs1+apL4vk67IAIoffM9cHtDvte/dTgBWHHdDKSIGIiNZnYSX7xU/IjTBU0obNMXaWckrPpIoz3i6CgHaFAOt+xw6LFZS49FfiegZPF7FcuNhCNzA7rC7OIUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRPVT+VF; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRPVT+VF"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43590777e22so2432030f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 01:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771837791; x=1772442591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEhj7AzC7a/2xVvqluW4cNVOxqE28FtRlYzG4Y48TjA=;
        b=CRPVT+VF/VO0orF13tvKRyePO0emk5Ln1fmkAhG5sjnGKek2Z+jR2i/eIZcbc7m7eO
         eSsEa5IO5MGiS5gmdkP9dDPMZeZ8JFOlVr45MQ4WxvD43KU0X/lE0gHe+UCUPU3bXlCf
         UfNmwrxg0laD7pNkbDINrIazrqmOVy4o2DB1Y51TD7wkfuLMb72KOtQmKylu7WzLi861
         nHx9cZDogdB1ZJAoHVyNybgPkNSr1+mnhZgvFPj2IEmkLQx1YbT8HN6MLm++Ac1ljVKk
         ifTC8BqkV+CGKgMZXmzmNEcXxnwmnJ5hl5zKrkd3Bcask2BBvuAG1ItT8nn2vw/+2ftA
         7ZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837791; x=1772442591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fEhj7AzC7a/2xVvqluW4cNVOxqE28FtRlYzG4Y48TjA=;
        b=u6vZ9eFYQV/ZPI3xHP85dkYHclm/AND4zdvRTBMYJKJ2mPmwqPcp/geSNoPLsVscr3
         jyhPb24hakLdp9QTQisdcVKeYoOInSoxrgMmCh0xpDjJ5seqxEqZbZ7wfyUrB8qoxD1I
         WlR+LxOpHlC2tBRGJ6iYKcSEQj9+TGMCy98V0V7hfEslWmJ3Ww2heJeGUCDR467C6idP
         WCcrdGq3Mk5bumepyEVXSEaJHO67ODRY89GByxUt6rlaAaK/b3e+dpMCRkmEsa41WFTe
         hZ7i3Gk/XH28VltVUho8Ntrm5Zbz3lOXiPgLJDq3MvzEk86pWmT+kVxe8N+9hwEBau86
         nM7A==
X-Forwarded-Encrypted: i=1; AJvYcCWZd9svs4eWAV0AsYRCO0u/4wUyNbY+oAvtudKuEO6p1FpoNsZt/rWFlJgJooGGxZKxfOVWxXH5dQo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCTjtdxasGnVB38icc64zV7K5HjguVF4IDuVaDGpVZrw+lCm+n
	OwjFQ44yxS6rSkuzhtMazhF/SwvXSFS0eNSi08dAWTGvwBUFEsIjnC8r
X-Gm-Gg: ATEYQzxcNpVmfmx3QBs06dnCuz6bA8JpIoDMGrbPPK+J7rO7tzyrsR0c4sHz7UswOhw
	a6kZxEcDFlteCxn1xplz0xq9kWhf1rSQ5O86PSTLW17Zk/r0xyqf6nDCM2DXYyQ2VKDBefyI/IU
	MVHOTWc/UaU2NPcUy2oG6IX7u9fHqw8ua2jm7r1zN60dZSeRhV596upg+OkVhpNUjsT+Lq3M9xa
	zY/K4QGwtKwJ52f1ZUKJ1nAQGt5fi1k1+vvjKcxANbuC/0fpwsgjmxj2uPxzG2FsraXsSeDJZct
	h5AoyU+/IUWSIuCfzzmSAhw1jisWJjISqnbNrf7ddOS1fqL8JhsV8w/3KPX8XJdlfLLl4xtqE7E
	QkzD6EOSiIX0FUpGmD9/vHx6QtvN+72hZsoRm+vbIvGOeHD8q2RZwoYJXPUwx4YbO9TSl3R6BKB
	/UrdgbSTTRVfzOOHTXb7VLRMgC093+gSuBUKHsMUBzbHiVBK34IKihNUiSuVY046tz
X-Received: by 2002:a05:6000:2583:b0:437:68d5:f167 with SMTP id ffacd0b85a97d-4396f18275emr13549700f8f.44.1771837790461;
        Mon, 23 Feb 2026 01:09:50 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00d0csm18437848f8f.11.2026.02.23.01.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:09:50 -0800 (PST)
Date: Mon, 23 Feb 2026 09:09:48 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/3] clk: microchip: core: update to use div64_ul()
 instead of do_div()
Message-ID: <20260223090948.7970ca87@pumpkin>
In-Reply-To: <20260222-clk-microchip-pic32-v1-1-ceacbcd515d1@redhat.com>
References: <20260222-clk-microchip-pic32-v1-0-ceacbcd515d1@redhat.com>
	<20260222-clk-microchip-pic32-v1-1-ceacbcd515d1@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 22 Feb 2026 18:51:04 -0500
Brian Masney <bmasney@redhat.com> wrote:

> This driver is currently only compiled on 32-bit MIPS systems. When
> compiling on 64-bit systems, the build fails with:
> 
>     WARNING: do_div() does a 64-by-32 division, please consider using
>     div64_ul instead.
> 
> Let's update this to use div64_ul() in preparation for allowing this
> driver to be compiled on all architectures.

There are a log of 'long' in that code that hold clock frequencies.
I suspect they should be u32 (I think someone was scared that int might be 16bit).

> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601160758.bpkN4546-lkp@intel.com/
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/microchip/clk-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
> index 692152b5094e00bf5acb19a67cf41e6c86b11f35..2e86ad846a66cd5487f5412c09ab0ad25ebe3f79 100644
> --- a/drivers/clk/microchip/clk-core.c
> +++ b/drivers/clk/microchip/clk-core.c
> @@ -341,7 +341,7 @@ static void roclk_calc_div_trim(unsigned long rate,
>  		div = parent_rate / (rate << 1);
>  		frac = parent_rate;
>  		frac <<= 8;
> -		do_div(frac, rate);
> +		frac = div64_ul(frac, rate);
>  		frac -= (u64)(div << 9);

Is that cast in the right place?
I suspect 'div' can't be large enough to need it, but it's presence makes
my wonder ...

	David

>  
>  		rodiv = (div > REFO_DIV_MASK) ? REFO_DIV_MASK : div;
> 

