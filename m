Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F6534EF0C
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 06:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768546442; cv=none; b=EG+UXls2oqRIk5DVz6d20Vzo6MF48raSEQwaiyp+sxBaChDRZbS09genysxC+DJEM2dQWo1O1Y+5RyzNhE8DU6KG1L4P1zrjdhyB3YpuiYJotZ3Z2Nf/RNWxfoTAJ5SFeT4AdWkTdPC2Jq/PYFZdhiHyhob7EU19YSkN/z1gb+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768546442; c=relaxed/simple;
	bh=5GF4e5BmVnyhOpc8HNFg+XjZiiGpnVltdOuIeaBKAbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sv+3TDAM7s7T0jsZoWgAMxU5repqNNlh0uMp9f+nkblS6RktzdE5Ff4+OnQg2AxPcaTyQutPNcJ6ZRhs/y5INk8c656xvnTcNHFPbyWEuDzgVP4o5uonOZ6mKh+3/7HVXaV+f1AJvR8QPnfGeXyl0MwsC4+jhulKAAjZ8dsj79E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=EeYSwEl3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="EeYSwEl3"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so8091875e9.2
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 22:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768546438; x=1769151238; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=slZGbouLqbJpfaVGGnHBou19vIILt1Y3clst8iE34bA=;
        b=EeYSwEl3cFJxr4GGrB/GEL2kbi3Md6qLFxgWOTjooDhp1M8AgysTu2x70uMHn05tos
         2ydYmmtKRKKzy6UfEkNDPYpf9O4Uwqwwd1CxUWStTHX53pPuATTxS6jMO0AA6eBTopRY
         3oJtFvJzTTIibkTwblm7TlPcuBhoZGUQBo4fC9myj/xkRslJ1YgppRvENsH7hg7FAGJY
         oqP+QnVA05Las/4OOG+rrtioTermVHEQOKTECJMNdClMN+LU2hQ5QHaLjaHb2JoO36c8
         MesbnSGO5oZadQwWILLa/DhvQzIzPF8IaYlSjJhnZ3IqTIq+GViWYNmKj1DzZELUAKei
         qOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768546438; x=1769151238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slZGbouLqbJpfaVGGnHBou19vIILt1Y3clst8iE34bA=;
        b=QcHtvz9mwwl+sdF6U0Fm9kbRG1OaekQWns1+X3jc28uDRly3Dh5muqAYnUWcj6WHX9
         C98DWmWs55jPI24ULzOghmVswCS+jPMak2rk0swXoomdcnP3TJr0LKXYCONIgE9Ant0+
         5tk4hjFMKv6DCGhTzGGXWriHsoaDVZdXpeUY4ozojZN2PJHRDEKrdsSbyZlqjDBW94Pr
         u/gvZW6KWX6Y3kFLRRwAwn+MzXTbb8MkNix6gKWRo18yFkni+T36qs5ejexROHCkIK49
         gW0WyCeFbmGmUlCbRWIpdouQDTdU+DHUYbB6L32tEtHvAY84qCLIKGTfbtjIoqifnLp4
         Ff5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsAYEtGBhorK75H6sgRJH+ElqIOxHIazCd3T6VRz+WdK0LCHaQ61bZxy6qMTUOdeUHY6vAojy1ayc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyiFJwMUaQIA9X12sCZ+7ppVrMC0SZgksymEVMMVSlvTd81HMM
	R6g03ZYmGBqsASlm7WjCEWCMmJad7U+ow+Z35XI90aJDbPgWnqNGMElHDwzMDVuwl54=
X-Gm-Gg: AY/fxX5fpiNSCOfqx359j3Nadjlc+/jy0sDXw6axjwuhoaw9FJ829ca+YLeS5GITY08
	+3hiNeuvBaZvKy7GN69sYDunsTmbldBGzKz+i/M7sbNUr4OCp3SyzsHGN00SrEzG7u0o6BCp2PT
	B54YZlAnRO1Nnpy2vuWpZrKUF1G1jIeCPQzbb4qU0CicCknD/aj+M1xf8ZSXud6UM87B5q5Zonf
	7+en0cmLHk4wIk3XrgwqaSJP44Je+bRiW69wONZWI3UZnUUpeJzNC1CLGXBdQhD4ql00vkGJ5OG
	mMVViNgdQINRaCdlruy2jYcgK3n71euOWdSsr96pl0ElGcZK7YbBTfIl1hKTc0P9SqmwNOvs1Mn
	6l9J0uSNWh/D5Z/eFfL0QoIAL6Ztrtjp7H/TBIRiSZgBJFFb7uoK9bUHZPRC6+tapP5+8CSKsWv
	4uvv8hvbGy+maHj/8XZw==
X-Received: by 2002:a05:600c:3ba8:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-4801e34651dmr21491475e9.30.1768546438260;
        Thu, 15 Jan 2026 22:53:58 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356992201csm3448860f8f.2.2026.01.15.22.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 22:53:57 -0800 (PST)
Message-ID: <a35f22bb-efaf-42c1-9e14-1f9ba32a3a7b@tuxon.dev>
Date: Fri, 16 Jan 2026 08:53:55 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] pic64gx clk kconfig/binding changes
To: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20260113-snagged-blemish-52af3d00d88e@spud>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260113-snagged-blemish-52af3d00d88e@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/14/26 00:11, Conor Dooley wrote:
> Conor Dooley (1):
>    clk: microchip: drop POLARFIRE from ARCH_MICROCHIP_POLARFIRE
> 
> Pierre-Henry Moussay (2):
>    dt-bindings: clock: mpfs-ccc: Add pic64gx compatibility
>    dt-bindings: clock: mpfs-clkcfg: Add pic64gx compatibility

Applied to clk-microchip, thanks!
