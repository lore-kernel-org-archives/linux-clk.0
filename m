Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606763;
	b=DBr5iu5VW9w0kBpu6OA7HaC7ctW+FGL1tr13BGde3wb1s40W4ACuZ0IFMuEBLHmnDP72
	 OOMrecbPx9YIQ+424dei7KI625y/arrL1lYEXrSZKFc/oJKkI2H/tvx21Sa8KkICH/2Il
	 0fIsR3AV+hGQs3xEPmJeXw6s7YTSBlSeY4eDTh8NfCMQDltrsHa/peGOz35c2vSQmDoYw
	 WtkBuBMbBVoZLslG+6UEhGHNbsA0ClmfF977TBPbci36ILs/FFj3TQHeUFVMz/hC0gq3x
	 c4izfkjA9PuK2jdkexIp77k6qqh86+OCcJv3sY5wJkh12KrFzpcO1bHaROrq6s01oAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4aTwoA3JVNFzNecITbnhpCA3ymHcrWrY5aiKQKruUmg=;
	b=yp+zGaKfRi5yklRuLO26vyUTc57yL+LuEwh3BVgWnnHWOxaG2Ka6/Mky8Lnh+zw/YAUS
	 Jj1As2KjaQLa8hYA+XrmWPDgirJJSpTDXoYjvJyoxy5Z1DImepigJ92lu1YEoCPE6oaPw
	 Vz3ubPY9TmwFgjT8vnf8QejEE1EXDc9WrddLRGJcT1rwV84X7/7XdcgJNRaMz7yvGPqUN
	 LlArEpaVhgrbKv1bbfS/PYAcsTKEGZu1+P77PQD2fA9sKgxuxUyw4O4tBf2c5Iia2OiiW
	 qP9avY6sV124A/7qUJGQuhsqB4bReKoUf5Ioc+SQQuQ6l46CAAWcxY1xHM7pNbmKESg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRzdrfDm;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61786606A334
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 21:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61786606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRzdrfDm
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so4269817eec.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 13:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794606762; x=1795211562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4aTwoA3JVNFzNecITbnhpCA3ymHcrWrY5aiKQKruUmg=;
        b=NRzdrfDmke6+7URTy6cA/bYqVIwAsHCBYZRdEPsPoxiZBgtPoIol4ds1aDg5PEBrCZ
         0N2UA/seMm7ZsPAE/DvaOwbrtMdUAzFlxbt2vO/G3sDDiQhU2ruhK6Sl63qghZ//1Rdf
         RO+JRPW/RIc4fyTFq2uXz6lwysk9jP9nkLhAGyJxxf0BAmWs4osKNnHJq1b7WUUVKJMQ
         PTFgy9LU2XoQNOY5YhQ9dfXAEfHK2mKs09I7owAbB0ydXmGzL+pWbpFmvga7LAMGPMz9
         mG7U6Odb5qOvTA2xLi8Bh/ZAq8DqjFswbVI08K0cba/B1A8rQ1ULSDqRj4+OdiTS2u4t
         Qwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606762; x=1795211562;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4aTwoA3JVNFzNecITbnhpCA3ymHcrWrY5aiKQKruUmg=;
        b=omqcq/JoarjVDN888CgEnIK8rg/GOZec4zf9qwCmoa4gj+uM8h6cBPJmQjvlcijx5V
         fP4MVVQuBgqckWGKTA5WILAjiskzjs7Lk0I6VDaTmxj7yQpykc8zHDOpYWmSpcdPN1CS
         HtkXqyvX31YQT9MKJpl03hUb8O1nCm6310faf7c/veFbZJl6SMcJweoGZ0gl1exw5AtW
         Q7WLcZvixBKoRaGKuVB95d7T0wjkV8QPIleynFDGYT+v4MXgnOb8JoFU/MsJebTgNY6o
         n+ffhmALZOTtlseeLxbu8EoHgPybHY0yLEejAxaYPXVu7GpVHfo6l4Nb+kev5V5fEvzW
         8VsQ==
X-Forwarded-Encrypted: i=1; AL+hErGgrJu2qHKb1PcjSqjiCfKBh8vPyVMCm3/SCw3O9iSkXf6E+1D4cDPbmcIjoPVyQOsy/RiuRg/k7PM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1d4ZAX+SA0XTQ6xr0n2En+ZYr+o9Rhr+I0DidnOt97ja/vs7X
	vrYVoUuIBBTetTlWHuWhPwjvDijBCpv1b8hDnIXqMREb/+ZaG+eJqlNF
X-Gm-Gg: AYBFou3FdfIM84VHeQrQLmWwEa2HM8GmVuKjYr/rswz3dWgWCFZb1unroC1nAZBsb4j
	vhyE19Ynz2zdRC0vc82SaMudNRXi//Nt6ewKiS4abfCW0IlNj7BoRnsO0aiPRcwuObdR0giTdHg
	BlfIQWvr0oueDBtsEj2PmezqUSQefgHG7p5nlYn9+3ehBAPmWxjNM/PGXlaPzF6u5O/TDwWXhuj
	grjQ2YFZk13voua9YuD++XNcqmotAACSYei8go0wBOYJjd+j0qoP0XzqEcSG0zn7RAETzGqiXQ5
	mzGNshNC3MHmmi3xzu1WYkSkc68vhDbanA1abg/UH3hgpsnSxhG5XY1D5kkwnPZVvAzvb30QLJi
	i4BaYoACGxYW84ARxEMlCjhsNP14CBSuqXN/0dSYRhBW1oAi5UtaQYLv+AJG96BKu6OQAuArY/d
	h1mNF66kOKeDsSjVZqE1ex5lKZTiNq2HnW5NNKj+qv+Yb1Ei5Qwhcg2fyaITEHNjRxxgd40sn4f
	OgvjMiIZXwYDaS99jD86mBLlSVKiTvivFf8Z76MCmjpKXiyPZrA1mq0UVrEQd5MKEpUIX24HiRO
	RIi6F6PChDP41yXZO0o2/zaBMupeWHXMVqJlsyHk7TRAYtds9Cl/1RYj
X-Received: by 2002:a05:693c:6384:20b0:36a:1709:458 with SMTP id 5a478bee46e88-379675fc98cmr3524667eec.27.1794606762096;
        Fri, 13 Nov 2026 13:52:42 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm11022781eec.28.2026.11.13.13.52.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 13:52:41 -0800 (PST)
Message-ID: <bf28da39-23ae-4d17-af17-fe46177d8c80@gmail.com>
Date: Fri, 13 Nov 2026 13:52:40 -0800
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
Subject: Re: (subset) [PATCH v6 0/4] MIPS: CI20: Enable SMP with two CPUs
To: Brian Masney <masneyb@kernel.org>, linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, hns@goldelico.com, paul@boddie.org.uk
References: <20261113190836.470937-1-f.fainelli@gmail.com>
 <179460306211.1364508.5876481329838567672.b4-ty@b4>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179460306211.1364508.5876481329838567672.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 12:51, Brian Masney wrote:
> 
> On Fri, 13 Nov 2026 11:08:32 -0800, Florian Fainelli wrote:
>> MIPS: CI20: Enable SMP with two CPUs
>>
>> This patch series resurrects SMP support for the CI20 board. This was
>> submitted back in 2020 by Zhou Yanjie.
>>
>> Changes in v6:
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/4] clk: ingenic: Poll JZ4780 CPU1 power status atomically
>        https://git.kernel.org/clk/linux/c/2c45b7e1e2f7
> 
> Best regards,

Thanks Brian, I will remove that patch from future submissions.
-- 
Florian
