Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850773;
	b=nfhmNQhjsoZW6Y2Qa2tydjWuz7Obs3bNZoG8+utNeLsWCJu8bK2XmKGtImIoBD3PLvKw
	 brmBeBAl+WRaGlsAQmR2chTJcpXizAaXX5Fdt6Cm6e8T6FA46dD4dn+fC1WIwySYWVU6S
	 6YgSZA0RGFGx2DnCAEkzmZbQgNzEXt6coSBofghcUerHwiKgA+u3zNZ0owMQz+V0OPL2+
	 vG8A7gzpI04tDCF291MonfkXKkuhXB0TzFg2yuP35HpPFyGZS0Vz1DcjI+Zp/ixd8LQd7
	 lRJXFPJzB038X7WeB7CSuB0fT0SSVpQKYrOZjMN7qAuqltmvnDRBIwPl9azvoW9Da+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QMSpt+sY72i1M2L44KdgeulnfD/aRihzzJUadrpWjOI=;
	b=vAxpCcKUuY8v7J/jtoqhtUIE+fPkUmI8WFrFJiAFqQb2Spo68kFWYpcjlHBgFU/a2rif
	 rFaJNsdkeoKj9V1NTTWUJXSqgef5eBDDRq8DMmDwdgA9mjvP3hQwyA0T8PaI0H1gXLwKo
	 vno69jeBt8gRPcsfRlseA3AEHpEbweE3wBv7zj3FEK3rKGMlbpsWIt4txfBmM0zXcCa2Q
	 gCLIvZX+6TyfCicJaNBEeFdpbuk2rqCX+4nyP5HyhA/HVx0fDfOxN4VS99ZBE9tU3VCoc
	 7mG85pbUc76aWzlt9WQZ7LwXhKdN9ueQIfnBUN7JKNNRjuHMRt63dqfAECfu+hicDlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=txMlmASh;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C34606A32A
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 17:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41C34606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=txMlmASh
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a05b210703so1599279b3a.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 09:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794850772; x=1795455572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMSpt+sY72i1M2L44KdgeulnfD/aRihzzJUadrpWjOI=;
        b=txMlmAShpsuPhoJ/7M+0e78MAWKLvh4/QsrbUYFSF1VCz+gFDDAcDwamsObcovXaFs
         VgpNyUsYnBMHulTgRUwpDg6F8ZRZJJ67LWhNGJg068/HcE2PzukhV1HbBcjs0W0qgQ8d
         x99n2h1iF10HBDa7d53PhPQFFiCgoDschMCey2NVBbxpFVn3thHs5lOArB3q7k31Vnpe
         7sZaqskDDaMVi5CAxlZJyuAukg3Nr+p08iJ61Nx/Xxq1GM3E8ButNcb857y/WxPE1nSH
         DKgiJ3xCB87jLB3Lso97g0Ix52VwmRajzGdfCKY9cj3miKs4hgyPCU4mmpUaPypIw8pz
         QjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850772; x=1795455572;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QMSpt+sY72i1M2L44KdgeulnfD/aRihzzJUadrpWjOI=;
        b=omw6N/q44o2wj6uemwvyk8URiXZ1JeWvtGLGSoG4XXqTrSwN4Xy6YXNTq6/3PRgpP/
         kI/c1YPpLFXS7A+zHx5hs1Jv9vUSrg09K+qgYzp/NBLmRPOKMEwj6Y7IJ1fbA4zA4JzL
         lxW+7iw2eqLS6U++8Rz3GunAgqzBX3m/Sih54BjrF2xvaaXZVVgidCNhN4ZrFYa1XMX2
         QdIDTJC4hLVfZhqpTPcRDpK444jIXYBurXZB0l2daTIPnHGKH41hYE2mhAYES3n53h1n
         I01tSDARBWWX3A46aX8jerov6z2yiz5TP0QEmTZn12E++SQWahsG0eeFB2s3fXqeLrGI
         O7Ug==
X-Forwarded-Encrypted: i=1; AL+hErGdtjiEEsL7laZ21T3LL+oIEg94JfzQV0gRgkCGMUKBaQLeRbhRu/J3qspOc9QBFTl8Wx9nBDoo6M0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+l6RR2PYBi5zCxva7BE3Mjplz2bwtWxhuyka0cLNpb5HzKP7i
	YH34Jc31gzRuJULxthHEQPYSQMyPa1CWscmss0dg/KzSaGH7nOmHlQyk
X-Gm-Gg: AYBFou2RYpYxKrTd6O/ADgeALpjUBJL6A9idpHrlpvZVbkyKTfkdG4wdxDqvARe8Qdo
	TabzjZ0DfUj1y9YQ+AGHOFcC1v+OgJgEgqRuQ64oxto0QnLLI7IwHI+SMc39vadNNmOh+IszGqb
	6N2pFO6BUdyIqBjN/DOTMnaLHpmbaJrVSNKSjxV+9YF/oHxuL7AYUxLZQTtobiaacbczEb/FEc1
	moqZhatWTAubRUaOhhlhxreSDLnIZOCoV3SLxR0LbWLoPBYKrUMzCZjRBeAQe2v6xco6M9a1g77
	32Xb6mmHJbp9NOdU3QFYAQyXpZs6DJAe/0ccSM032jRF/CQ0wHFEsSySZrbZpwENXTZOvpEMiMr
	vE0KMv8QTKEzi0ccxP3p85UwB29Tt+UeomWGExzMVRnETRtyE0YE3uGU4bexDcn3X1dmJmsNHqu
	uxs0VW981G/umjvrwlPhYd8fjYFdZ/KM0AEEPbS7t6VpYqhOgpJzlsXSlOmPHR1TjmCAIh0/Isn
	zR8c3bFRYzxddl04x9HgKwp4RFv8KTIWls/jMuVtPh0BM0Z5VRhaIJnpTDjnmBH4YjzGZVeHpJj
	mwDvJedAhF5mdwfXoKL24WA+I2XI/XGcfkxBmJbtGcvSgD5/hfeGe4jU
X-Received: by 2002:a05:6a00:1989:b0:89e:33ba:54ce with SMTP id d2e1a72fcca58-8beb753d177mr10045044b3a.46.1794850772361;
        Mon, 16 Nov 2026 09:39:32 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed263b354sm3920789b3a.47.2026.11.16.09.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 09:39:31 -0800 (PST)
Message-ID: <382e993f-cd76-4f47-a7ef-33c2fa00d1e3@gmail.com>
Date: Mon, 16 Nov 2026 09:39:30 -0800
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
Subject: Re: [PATCH v6 3/4] MIPS: Ingenic: Add XBurst SMP support
To: Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
Cc: =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 hns@goldelico.com, paul@boddie.org.uk
References: <20261113190836.470937-1-f.fainelli@gmail.com>
 <20261113190836.470937-4-f.fainelli@gmail.com>
 <d4bfcda4545330a687edc350326264a031336109.camel@crapouillou.net>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <d4bfcda4545330a687edc350326264a031336109.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/16/26 08:07, Paul Cercueil wrote:
> Le vendredi 13 novembre 2026 à 11:08 -0800, Florian Fainelli a écrit :
>> From: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>>
>> Add support for the second XBurst core on the JZ4780, based on Zhou
>> Yanjie's 2020 series and Paul Burton's original CI20 SMP implementation.
>> Use the CP0 mailboxes for inter-processor interrupts. Initialize CPU
>> presence and core IDs explicitly for generic kernels, and reject CPU
>> offlining until CPU teardown and restart are implemented.
>>
>> XBurst stops its private cache clock when executing WAIT. Write back
>> the data cache before entering idle so that the other core can access
>> data belonging to the sleeping core. Select this wait handler only when
>> multiple CPUs are possible, and check pending work after the cache flush.
>>
>> Enable the secondary clock outside the raw SMP lock. Use the CKSEG
>> aliases and pointer-sized assembly helpers for generic 64-bit builds.
>> Development and build/CI20 boot validation used Codex assistance; Sashiko
>> AI review identified the locking, topology and generic-kernel issues.
>>
>> Link: https://lkml.iu.edu/hypermail/linux/kernel/2005.2/03488.html
>> Link: https://lists.openwall.net/linux-kernel/2020/05/13/1482
>> Link: https://lists.openwall.net/linux-kernel/2020/05/19/1099
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> [florian: forward ported to latest version]
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Paul Cercueil <paul@crapouillou.net>
> 
> Good job cleaning that up.

Thanks Paul, Sashiko still had some feedback so there might be a v7, 
looking at the comments to decide.
-- 
Florian
