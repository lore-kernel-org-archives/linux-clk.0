Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4C272627
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 14:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769868270; cv=none; b=ORevyOKKH/wuR7evAynqABrRx9b+XuEKCzvdbgdnad/NSoAGw6ji0ISjHKDyr2PfIo6b7Xmms7ZdWCsPa1IrIYDgcsV5D6c/SqNwXYnVvOVjycYcugrFtZ8ZMONJM4tkyzqp38VXEWtkpGgzfXk7AkQXKEvYUmVinDCTwQ+2wcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769868270; c=relaxed/simple;
	bh=tAHKHXqsnkZlWEgGFp/sREOTzbW171AvQ8UwCb5twPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m88UKQ7PWZrB97lEffhID6TTBYjQxxfeajbYzyszf58rbL5QfYcNXlPxidsjfZ0OlZy5Gj6y9IttyMw1elW1f4CCn4kTDeh6+tVYTgF+uU/ZJzbprASBTxJHXTg38p7uLq/VqC38FmTQl+2GXJNKPyE6l3A6rqvzlCOctm8rHz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GJJBLL0M; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GJJBLL0M"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fb2314f52so1792705f8f.0
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 06:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769868265; x=1770473065; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=910J1UI5RUu55yEnGPJEmz7p8s1QIpf16qA4HfR2YUU=;
        b=GJJBLL0Mhn7VgcL+RoLkpDp0BWIVhynPf+azdDckYgIj0FjPlTqVHoOnLFdYMOy/E/
         MnOChDfI7mRy6QEEyTt3vX5RjajS/sxb8VzyO4wdRnxT6M748nqT1CCDyzl4t7XjR83L
         X0xnieJP43Y9BynLAD22Mdfk8U/8w1tyi5yWgfbkrsJR7XXcDXTmGwU38BVcNYeNjMJP
         XUTXs1WrzEjL5p5JO5zIrbYKQtUn3w6L5rq1E7IYZ+TLn1b3zsA63sv463AyTvzywKlb
         fe3f9aTrpTc5nL8H62N0vtT8MB698q8SXCeJCb3Ta6MyVUpg6DM7XGJbbdFm00+NFJnT
         L1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769868265; x=1770473065;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=910J1UI5RUu55yEnGPJEmz7p8s1QIpf16qA4HfR2YUU=;
        b=lwLYND9Iytv4OpigB0EB021zqzPDaxHWUZT5d/XFMLrDNcpig2nLYSmFmhAN0pUBj0
         CT/NaWtaqZOIryP9hwJE/dRVgy1/qDNL6if7Xn5CWHw8cMz6+OPUSl5AJQg0JbI2fUwn
         gqt066G66qvT+bdOIB+hrKvulXXBROr12Hwot6MpudVoenC8eyq0ks+9T6vTVRkJgFTv
         Lfjg3QydC5yYYBYnolGmW6+ArklK1foUDPLMNNjLK7j5H4zfTQz0TQGVPZOR2vohkVaF
         M/tQlPpRZqxm2/7hWqlXiZxBwszybLYMA4iLLSxJNoaummvNe+34JI85pAMSPoskzjmT
         FZ5w==
X-Forwarded-Encrypted: i=1; AJvYcCV3XKdJo4YfQ/TaYwVosVUBFkAKTJ8jETytvudg1jw0Lk23sOKT08omVJOEmAIBJjYqnARM5xG2EiY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmL6nHl0xZ1I6cv7X/NLRbWR1e8qfHfpdne26QaAERUIG/BRzz
	PuXYLoxH+ZFQrjrcbemD+rPSvQibEOctGEQgXPVBW3V4Ct92ggd9eQgdwjHqVyWYVVI=
X-Gm-Gg: AZuq6aI1Nj6p6cwRROH0iKo0UWL2w0i3WNP1lIhKGw5CXev0lJa7EM/6auHPY7Kxq6K
	uSae8JFQZoQB+OrfbrrrKAA18IYGvkr7AqUNhO8D0DZhAX/JxqF6Elyu88mntPQ5LD83WLCY4fe
	ze7EH4UFj0eN3c14TZtSdP0cv9ab4RMpou7syF6U0ypav33nEgx/vyr+keCFRn+q+WCWJB0SR7L
	DysWGT6g1vc1GblHpKyhYWKKtyaglrxOnxAUhRYi6GrWkqPnTg2IEmdAwvW76HVXjSUNucPcmqy
	2Vim70rRp8U9yyqi5MyJr8TuQ91TjGWA4KEyBEtgJLR3ICoURQxSxKZYBFwE2QihtzXCDyuYzux
	d7cA7BmkeqRDi80skXv3mWgAJdE9z2JCR7e1R72lG7DjKCYpnR0Tp1Wp2JLARBwPX9DVZrJH1FO
	9xCTa2lDtFU5bIW9ovtw==
X-Received: by 2002:a05:6000:18a8:b0:435:dba0:736c with SMTP id ffacd0b85a97d-435f3ab9ae7mr9545982f8f.56.1769868265119;
        Sat, 31 Jan 2026 06:04:25 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1354205sm30073518f8f.41.2026.01.31.06.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 06:04:24 -0800 (PST)
Message-ID: <16cfbc63-ab19-40fb-a885-6726f829d7d3@tuxon.dev>
Date: Sat, 31 Jan 2026 16:04:22 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 26/31] clk: at91: at91sam9x5: switch to parent_data and
 parent_hw
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <ad3636006cb67acca4f7dd1a6c54c6f58f0bd873.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <ad3636006cb67acca4f7dd1a6c54c6f58f0bd873.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Switch AT91SAM9X5 clocks to use parent_data and parent_hw where possible.
> Having parent_data instead of parent names improves to clock registration
> speed and re-parenting. Update clock registration functions to use
> clk_hw.

Same here as in patch 24/31.

> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

With that addressed:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
