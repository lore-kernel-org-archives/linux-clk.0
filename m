Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92472DB788
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 11:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769857514; cv=none; b=GMW1yWZ6vTPKKWTFMzZF7xIrXujLOHJwlvCJJVHGK28iWZH5qP2Z6zdd8vbWzN7Dpftjrv9pMz2X8+OUJurRSpzWzFZRmsBsgl1rLYNrRiq8JAYv2Zm+slY2UNgjH+mVeCiap9YHqZmNapsL/ve/nr3QGLVruDLRHb4RWc559UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769857514; c=relaxed/simple;
	bh=Z5lfoGAPb1anCBufLVNrFhRC0WRSqE4KJfRSe7VswGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Emv013Uq1DZNVjYqSpmoAkn5bRoivz4GGwYHrtU6rdskW1/qkLVUPhWrdKHf33FXCQPMn2fZv9e2uC6/0Kj2cENvY0kwVNuJUNRL7RaQcLMbwZBQJKkuQE42USYJlHAATckBYriHq+9nOLy11HBs7DCAoQZjI8VddoiScrQPyzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=CaFdlBjq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="CaFdlBjq"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso24613125e9.0
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 03:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769857511; x=1770462311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YHy8sBbrgSuASWG7wDRYrM3C5K2VMsxnu8LkrgXJIHs=;
        b=CaFdlBjqaphEdUiA7McNPdMpYZTK1f7yy9QvMpUHuOJn5ND3t4Bn4XF+ns/jj/QfqQ
         V8Q/zcB49N20JutAMmZTqXoEF6xb7IsyTuyvKR7ToVSLj2OTm/e4t/WcXtYkjQy4SteB
         cvCycZwgz1ge8Ekux78Czr0ZR6/xHee7UGjGjcafUpoxX2rr1W/uc6TBPHCo5zpPxh1h
         o0aFGiPlQDkrsq4WoQpdkOLiLcgarGMPO1LrGNViIxe2ZLsnQQHYyvxgM8N4poZVlriB
         6Zk7xTeCtXjjK8DB3DosQO/HjLgtCoPsI+0T0aWYnrFQS+Hhye20/PrBckFA9W1UrEWs
         pfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769857511; x=1770462311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHy8sBbrgSuASWG7wDRYrM3C5K2VMsxnu8LkrgXJIHs=;
        b=UvVZ+uUBNzdHI5smAw/P46Q5Y1xZRYZMyBJ4M9JGbafguV5wGbqQB7amsl7pLiRtil
         nFbHfrQuGneyCn+VFGnyP+mdasVPX/mOqdcXKLlf5NLllljqn952yefyUzKAyqMdom8F
         zRyz1PKnY6XxJ50ScO/ApyD9ssZ3jAPRNrvN2CvFAPaPtodZQ9tRa23RUazo5owy3d7f
         wne6itPV2dwkoINAgyi04Crv76FLGCyg3hGHtee8UTw2/q5lSWCmaHjcY8aUkyVCWjje
         PsnOtrsETulWzO7Il3UkS/R4968EMr5/EgIl6sZBpWXGap+5pXg9q75JmkCuM95EMWX8
         jzNg==
X-Forwarded-Encrypted: i=1; AJvYcCWaMUk1d/0C/DEqSdup9KH+dzDbMvwjjYn9oDe9quiMLwLkNLfLAUrK0BZ6UHXOa79iFwzNyndgwiI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr5Eor6qhMQmCu+lVeMu00u3Z2HtMPtdnc81HRbhRfSEvIaSi4
	on3wjufiPdfJLSwLRe/iKvxj/XvBODdBU49jHYacPV9+iJUQT7olCv9a74XRPrf4jmI=
X-Gm-Gg: AZuq6aKB5y/4ukjMOfxTlHuOYY2kkrFvB4sRV1833ekgKgZKHP/EEWwt/UgcRO+JDOh
	lJdmHUdPg3CYjiTuEzP7TNuAB2bRrYzQbfxLdu+IU7F2JFM+CfEZNMnTsL2aFqGMTPAA78QSnNP
	c/hTPbwr1I1/aM4Q1gWXeeUg0r8ubFVi+P7WT7sqwWwNpR2it3oXBe/4p2eIApYogZ0FJjbqdDH
	LFhMTo4Yt3r17UX4OUEndTgVxNdSOD9VX+2yWIGv7QYqoNbdZMcfGW/Wdc6mp+sL3X96MBES79O
	bBZrHi7rug1FpLe3E9tUwEtq2WUxCzXqpm/GENBYCeD6tv5C8L6fxpiKt5Xhhv1YaOiXhQMVGz/
	pNLC/pFjp05KBpGglnkonvgOmoxD88UJfN6aZYlS76b3npKb6Xx42YNqJBPegHpkyYcCq1rtxok
	cIJUChP+LtAUPz8U+euNT5ImSl
X-Received: by 2002:a05:600c:818f:b0:47b:deb9:f8a with SMTP id 5b1f17b1804b1-482db491bfbmr69347115e9.30.1769857511182;
        Sat, 31 Jan 2026 03:05:11 -0800 (PST)
Received: from [10.100.159.246] ([213.233.108.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482da91a227sm54666685e9.2.2026.01.31.03.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 03:05:10 -0800 (PST)
Message-ID: <40975e22-8381-4696-86e2-f153dd306da9@tuxon.dev>
Date: Sat, 31 Jan 2026 13:05:07 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 22/31] clk: at91: sam9x60: switch to parent_hw and
 parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <562cb1e4a6890dd846720ecf68e0505ec32a450b.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <562cb1e4a6890dd846720ecf68e0505ec32a450b.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Switch SAM9X60 clocks to use modern parent_hw and parent_data.
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>


Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
