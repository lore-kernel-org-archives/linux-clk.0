Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459675;
	b=XdpPAu2rZA1ZYtXjF0xeYLZzl+pEfFMw3NDvHiClhI32k/cpLnudft3X6bGI4azTuchz
	 E1pRPmJzI+1Vhbn6u1r+qKRcXSyLF4lnUU1SCzMuuI7xWcT8/HKs3R3AodinT5teC18Jn
	 gf4IEIUpqBN8x0lpISqTwP1zBLUIWm1axDptb9POVO5hwanLZUUw03KWix2/9Wxns5mrj
	 1bu1nQBf9VyLxrcDt96JuD3HrbQTCj8DD8aGpVnHTB+YXL9bh7YFi9+GPMO7w4tq5UJJk
	 EdDH4Q/P3rB1AcTGtR4ZzkQ8nTvo905nSQjyCxPkBU50rDQqtdBlzUulozykWQRuqow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=XOtS0jZSJLnbuCUHqHGLiVmcLs9rLHyD3/gIICXW7CQ=;
	b=rRKfoZKDeLFksy6+a9mdjM42ZRsdc3BZGStZItLuP0Ojem/1odrPEsVgi1PasLwJgW/o
	 WQVLNvN5oFEl2x9jgIvKNNdbUcRV8j2fj5af5h65Rs/n7VSWoiSsiIfr2+TY2n71AOXox
	 /SC1t81eYK5QdNnqMYixmPWq+1hxSktRENUeWHlXHjr0zHs1nvI5hMvXSlp/E/1n6GOIP
	 GWYj1PQOLf5JB46GdKTncm17epffQOxmY8jhMcAaER9WrNzKbn4EyaQSG5EZkoW8IrBoX
	 QGyan/J0wJxyYcc5OHMOLixZCL20TQ/9cF71jt1g5j4s7hFag4vOMBonBiTFO/anmjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mSPzFsAP;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D533606A324
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 05:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D533606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mSPzFsAP
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-5642e0910a3so1623865b6e.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 21:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459673; x=1795064473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XOtS0jZSJLnbuCUHqHGLiVmcLs9rLHyD3/gIICXW7CQ=;
        b=mSPzFsAPaT9tym6cizOY3groV50kh2tvVRiY5Aos5AwFH91/B/LfpKc9wRotRxoK3A
         lux/SjtbyrknH8jgKwOYE8eoEevdS3OUBb469kaGVzAcWLChw2NUe8gJnMngt1X/szW/
         pTq2FiiIH3RRLnW5sT0lrdAC3gx3hXyKMZKgjkYqmCmUrjd8FzwJL1Mq4htzuzDWeBet
         Nz28SXlGj6QjdnLSlQx3b6fUCr61dREGOS+9PlxfXN8LkbDXJ8y0pbjhv8/K9qQLOaC1
         xtvPT0tbhqOloKMb9LNjNKV/N4FOO09b5IxggtakChrL/Lf8Rgd9zA+Qatc5G2hxAGgm
         zubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459673; x=1795064473;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XOtS0jZSJLnbuCUHqHGLiVmcLs9rLHyD3/gIICXW7CQ=;
        b=P5ZJGQltSVcplIdLssGL9gB3QPALjLwG0ARwb+R33sH77FgAqwVApP7U/Dj85kJaTM
         tcWo8eO4sgh129xbCEtMaV0Y38+2HKAmA897XWkLquNEnF6/yRvSCRyBqd74yhDj4y/F
         UtYi/Tn7m901bNgTcvRus95/NrsdS7r14hmwjePnEOezrUKmifj9/tqLnh4OkUEeHRo2
         BSeBxyDeVaz0wyN1y7t5hoSQFMj/IgL7BwfvjDmCTbeAwPuO6lqaJH3Pju24cW3F3rqM
         pUDYtjg0e5u9p8NZht/WpzX6DlcKx9xjoQvGShSl2Zugjt6XVrrOCeHh7jjNFH9H7uQk
         7oHA==
X-Forwarded-Encrypted: i=1; AL+hErHvj3DIAMChKx6Shz9Ucq9w4tPauYVGNdPVYTDAPFtcp+grQ16ufChxoc5S93/8aENCnQL8aF1tn+w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BrMjHzv8WyrLwrW7o7SuOOaBD4WYZ4XdMn6wtIrcXQj9aqKNE
	0Hl2nlLFuYgVKE69+SQjVimdUf/UZMcFQHDPO9juUh++Kx7E8WNwnqaE
X-Gm-Gg: AYBFou131Zc/9a+Qbhe60TiYUx6MNSNQL1i0d/M5NV1I9GXLen+D7AXWN9gQqQLYaGf
	1Isj4aRPL6SeNlXWZYBtBNTzcfkY7hlVn9ZU8k3xy1EKvzZTfmc6G7NmysXI7RXZTzX+86ELZNO
	kMB90pIHAcZhamr0EO+cdPs30PiikMbV0i8fbbc3Z5YX8/gGKrzR77a+Pn9frHOUa3AhL16b1ra
	lD8vSNjg6BquRf0Z6xEuESNzD3hx/U4/wsqAqPBLG8QSHl86VfrrgxdvEUNwdAy1T3sG8GtRoH8
	DGhbzO6fglteUOT1AsV4/J3NmAvUuZBxGxGdXQh716OJ66U/e1f6+OBJ+urzcx4Y6nMeJYVgNZH
	BKfs4YzmCeSz3FJUtwNleCCKJFveszNG5EGa1A9mndKQ1sCX4SJVlWnwGh8C//CWRU5zTU4WeRu
	rBn8bRDNTfOUnwEhrJKy09z0OuyhxBSghbKlIDFtQbJpYJqbCjphEb56LrIuEMa8zii0wXinbdB
	WA2VG9WBSj8y0nyFKMkZ/NldeJIwZVPAR9NNTYNaRIof0kWKgQWQ2t8U2t0kjh4OHImzg0e7Mri
	qhYhaqH1VUErjJOwurceYOZA2XbDVGjGs9NxR+nqc0FNPBht1GTzaorioDY3GkpX/K+n33omikM
	T
X-Received: by 2002:a05:6808:1a02:b0:564:22ae:a68c with SMTP id 5614622812f47-56b968c7f46mr4463769b6e.13.1794459673581;
        Wed, 11 Nov 2026 21:01:13 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56906036028sm7779876b6e.11.2026.11.11.21.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 21:00:59 -0800 (PST)
Message-ID: <e158710e-bf16-4010-8bf1-b8ee0ff2347b@gmail.com>
Date: Wed, 11 Nov 2026 21:00:47 -0800
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] MIPS: CI20: Enable SMP with two CPUs
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 hns@goldelico.com, paul@boddie.org.uk
References: <20261112041422.2997275-1-f.fainelli@gmail.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261112041422.2997275-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/11/2026 8:14 PM, Florian Fainelli wrote:
> This patch series resurrects SMP support for the CI20 board. This was
> submitted back in 2020 by Zhou Yanjie.
> 
> Changes in v3:
> 
> • Align the second line of the readl_poll_timeout_atomic() per Brian's
>    feedback
> • Collected Paul's R-b and T-b tags
> 
> Changes in v2:
> 
> • Moved SMP sources to arch/mips/ingenic/ and the header to arch/mips/include/asm/
> • Removed CONFIG_MIPS_INGENIC_SMP, using CONFIG_MACH_JZ4780 and CONFIG_SMP directly
> • Renamed JZ4780-specific SMP symbols to XBurst names
> • Changed CPU enumeration to assign consecutive logical IDs and removed the explicit two-core limit
> • Changed mailbox IRQ allocation failure from panic to logging and returning
> • Shortened commit descriptions, removed Codex attribution, and adjusted source credits and sign-offs
> • Kept the clock polling patch and CI20 defconfig changes unchanged,
>    added Paul's R-b for patch #1
> • Updated the kernel baseline to include additional upstream fixes

Looks like Sashiko found some issues to address, I will do that, re-test 
and re-spin.
-- 
Florian

