Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330885;
	b=HFPH/lRyrkb4jvnuem4gx3RpOtGtzX7/0lI0vsX1ouyo7vwCxqgxknmXjnWA5H+jRc9D
	 xJMFd+EXyggQ86jJPPyt3yAbZRGbstSTE1gWU9Db5uMincJA9RKybfacW5J5hJh3ibooi
	 Rmcrm5E5m+MaywRjaJ+9k0Sw2Ha4hqpA7Vph5+rwwm2mbC7WMiPS+IkKHNg0VkOlBLkpy
	 PwnVfxUT0Pll1wgkxUkt5ZhBgKhT2IEJ4KEReUd3TSNstg9OtqMDBRag1tcJtyDNeEEPU
	 5Haf5KcsrcxM3VRj1k2+Gk7Jny77h3KdAlX02WEkYp0+CEQqR0ebW4effXDfrXG9cSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Oujdvcye93Xof0isVHmwpB1y2xPdgyYOn7LBWK9psyI=;
	b=J0Pb3L2LXmK0YjH2S0Ivv36ufP7+5DSyHaSHeyinmdFOgqJ22WKaU9S2NV2eMbC/0jX6
	 8zylLoBNG2hoteJjMcWMYfsSON4HZd8w1DtBmV6pQJJNtGr+8lGJ9YHcbwIa/6ZRaUF50
	 GCouSWfWKrIRzuMTwLpvFK24ZU/R5Y/h4QO7ay+axyQPdLIlg0OHXrMO8ZSvztglI4IOR
	 ntyQgdCo8hoS72Y5Ub5Vwker28uUZPPNYXZ8R6i5eg1RTA18iEYYxO0A0NJ0bfauNWqNF
	 7Njy+ShCIv8mraOxxjL0fID76yk+9oClrs++CSeX72xHF981Tmqn93xJV4HYvIGV4Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Isk1ca0I;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0523606A325
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 17:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0523606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Isk1ca0I
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53bb57f1310so24622871cf.2
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 09:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794330884; x=1794935684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oujdvcye93Xof0isVHmwpB1y2xPdgyYOn7LBWK9psyI=;
        b=Isk1ca0I30RMY+8oOixfoUtKFUb92r+JB+FTOYbGORvjFe+4pLoPI7uWL/tCbKyIwv
         g8Gue7qlz7uzKqJFZJZxmfyi4VVDrfyej0NqTTJbJkEeSEi2ahOGDInhkt1oy8//7Dvm
         Jlbxg0qJF97m4s5nQYSYsZpHILdgIQ35oT/T2aA0aBilW39XdEadvUkQf94wgYxxFJPj
         ZvkARhwpbsSpWkH3OBA1IGSqBBLxWOt+lgCanmJG2TL1sKUC0Zxf78nYDUwOBQryCIQ8
         h+ViZhY1z7aIqM8Em8vpLa9rsx6NxlNpkswBuchqitA+MMr2JjWoXh7iImMJvvP87We/
         1yFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794330884; x=1794935684;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oujdvcye93Xof0isVHmwpB1y2xPdgyYOn7LBWK9psyI=;
        b=z4Z/STpzr7QceX/FSzTY6zk3UGIVA1U6WG84TNH4iNBv654cHSo3gRrQOlcgksQQ2h
         /xM09ehB9BdhLQdE3kRnFM2RP5hU9DhZYdP7OS2nuR1G/QICLidDHHjMTWz9DzCkPTSB
         jQzkpQabHfaxEdPN0YWFpWxStqpNPa8Kji5r/6xxrjCjhpYIZgmuCfIW1oBgwBLAvv0v
         9jUrhf6DvqlpocFwnixyejqeUWFODgVCFT9alTYL6AzpoG42gOW/jFS4bfsCaEnwmDSq
         BFJQLtq9DMe9VVcBuTNZeWYuMC1XwMpaWJuQNTHW5spzf+FeaVMC6c+vcrG5cCZnfPyR
         EAMw==
X-Forwarded-Encrypted: i=1; AL+hErGW/wJmcbwTtlkbXPxOmG76Qycy+Pne9ROpla1v5JXwHD85/+TFcbTldvnL/LgvwlsRrrDjbEFOvpM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8So6PNjFl7cA5K6wGy+9qmTW6EJyKDXoz/qnwVyOBTInZ/McUy
	oZSQWQnI8r15wHV2lTkUIl5brxWL+byg28zgiN5xTc77kq1lXaDiEbzo
X-Gm-Gg: AYBFou30p1ae9EYsUm99K5IniOdRhFQFoP6bi4JyTQBzmbk1vBNd1FHP3j/4azBLOtv
	0s0JfJIYpGQVxP0WdSmh2PY2tpDF90xLvTswq3C2Fu3YhAaGupsY04AaKQR+UOsiJyl3Zor5d9O
	iMAtCg9Sm0XDqCxpvrUzNpwVBpy6dBoEj+f+iAo3yMl/pRyVHdu5CLLL9iEjPl7Qz365UpFCIAt
	Ptg7bI77i4p3in/6IxVmDy1t29sDaAjpxToMT6JnVOhgi/0LpSyEKfTutzYUnL0O55SXcw4gdQM
	AE3ikUMR0ZEePAb+4+aeTVvsp6P3ErLl5Ud+T/I2L8zs5/Xi8EiNe9pTzdcv05orZJTGQo/s9kv
	iwGdaZSdujuNpaYxkQa74Oysawo+NgTnWVJyf36S7eKop2JZmN/lqIoURSJUCE/LcrxgC9R2oZU
	+u8tLuMjT9+3V9kUssqM4rvKHFYVQQlQvmImq2bxiQAgKRRnMIU7hCvhi/tINKw1/CADW0xsXnL
	zL43YecwpN46S3pa7W92lkw1Ovnj/DRrb8+I3yt1o5fTPXIb4RzfVPWEXhxG9JVRnTAMpFlFvbY
	4xUABvm+gpPGAda3Pq8fJGdH9ahhtPaC6AKkJlzewL1kthH1LhKvdpGF
X-Received: by 2002:a05:622a:1911:b0:54d:a34f:c736 with SMTP id d75a77b69052e-555271342c7mr48254351cf.17.1794330883512;
        Tue, 10 Nov 2026 09:14:43 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04d8397sm25744446d6.18.2026.11.10.09.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:14:42 -0800 (PST)
Message-ID: <135a8f3d-9eb4-43e7-a20d-056362a29c14@gmail.com>
Date: Tue, 10 Nov 2026 09:14:40 -0800
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
Subject: Re: [PATCH v2 0/3] MIPS: CI20: Enable SMP with two CPUs
To: Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 hns@goldelico.com, paul@boddie.org.uk
References: <20261110043131.1985993-1-f.fainelli@gmail.com>
 <d40bcc5d7742025db9a67af5c77796745e284e45.camel@crapouillou.net>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <d40bcc5d7742025db9a67af5c77796745e284e45.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/10/26 07:44, Paul Cercueil wrote:
> Hi Florian,
> 
> Le lundi 09 novembre 2026 à 20:31 -0800, Florian Fainelli a écrit :
>> This patch series resurrects SMP support for the CI20 board. This was
>> submitted back in 2020 by Zhou Yanjie.
>>
>> Changes in v2:
>>
>> • Moved SMP sources to arch/mips/ingenic/ and the header to
>> arch/mips/include/asm/
>> • Removed CONFIG_MIPS_INGENIC_SMP, using CONFIG_MACH_JZ4780 and CONFIG_SMP
>> directly
>> • Renamed JZ4780-specific SMP symbols to XBurst names
>> • Changed CPU enumeration to assign consecutive logical IDs and removed the
>> explicit two-core limit
>> • Changed mailbox IRQ allocation failure from panic to logging and returning
>> • Shortened commit descriptions, removed Codex attribution, and adjusted
>> source credits and sign-offs
>> • Kept the clock polling patch and CI20 defconfig changes unchanged,
>>    added Paul's R-b for patch #1
>> • Updated the kernel baseline to include additional upstream fixes
> 
> You should also have a changelog per-patch, in each patch's header.

This seems to vary on per-subsystem basis, for netdev where I contribute 
the vast majority of the time, putting the changelog in the cover letter 
works, but I will do it on a per-patch basis next time.

> 
> Your patch [1/3] has a Fixes: tag but does not Cc stable@vger.kernel.org, so
> you'll have to send a v3.
> 
> I reviewed [2/3] and it looks good to me, but I'm a bit concerned about
> Nikolaus' reported issue.
> 
> Thomas, if you can wait a few days, I can test it on my CI20 and if it works
> report back with a Tested-by: tag.

Thanks Paul, yes please do test it because I could not reproduce what 
Nikolaus reported, that makes me think there must be additional 
configuration options and/or patches being carried that could be 
responsible.
-- 
Florian
