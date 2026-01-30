Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C1D30217A
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 07:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769756891; cv=none; b=BAxErbfTOoDWAFQPb6Vpz6Ng4389kIdzzEy6GT9+nFY+La070mlhmcMfxagE1QrRebD9V9qKq5/nTx0Ep+aTixZY7vJouFHUQdY6v2k44KZYEKvT1bnR0f+SarNfsYYxwQz/4J/4pjz2SWRQebwK6xywGzR9zJ/N6gqC7dY6Pz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769756891; c=relaxed/simple;
	bh=SJrzG0YhrBXBcz8Ty7Q1Wc/RjOk8YUOtNPj2GgzP224=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FT+NgPHQEhsN9HI9RwLxTwRRlB+ZSrzZerWVLCAc/qjplowxlNB21sicMaiHBFVBmtMJQYIldL7E4ASA/mdLL94RdDnruvinAlo89e5Y2Z61WbZbXM/9g0lb0G0VDe4JSKZQsKqhHDJDIXWRX8jYmNoJ0UwUVJCjCjTz+sHGPFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Hph2//lG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Hph2//lG"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so19892015e9.2
        for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 23:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769756888; x=1770361688; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9DIjHWeNH/g3qucwaMkrhvsbsbLff0rW4S4BIIu3q7Q=;
        b=Hph2//lG9JqNyL+ipNPmzCIGA5IBWDm+zpdvbpEqu//HzrNQo7rRpUK+3QQ33wcDBH
         MmjnwDEgG6VbgbVC86aKSCmJJjM7zq17BHUHl06MO1uwXuh0S+QNARRQA3cTMr8imixr
         flsRQswKnsez0LryhoRKvuO5FF7VLhx7kjPwhWwlOzu8km/pKM9iWgRPlR6uFPVDDR1k
         WgeifpgwZOKaGwIKSh9W5egtRgMAkPu1lM6y1KVb0ETmoyhN8jwarFoMKCc3fd9GPUyK
         gSEAaPopSs+INaIvIAexmD0S+VQEC+A08YejRHnWfXoWOaX3vW9mezUTvCT9PYA0Swnh
         +XIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769756888; x=1770361688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9DIjHWeNH/g3qucwaMkrhvsbsbLff0rW4S4BIIu3q7Q=;
        b=Ve1c8Rf/LNEFF4p8iLGRwszMqkSybLDW6RV7xj4uOZGjk1c8m/pgqgVx0yLlBaSJRt
         IziDmX2vi3alBzKcU0WWry7FnpwEmFB4aHcPFVzz1vX6xoGzANY2AZxhg51E+M/jzt8g
         k0KcqkZkS6JFickkZ1DofnXWFT6RouPhr2B8A6Do30Qt/8zQewdQfiP2oH3QtVLNCoz5
         96HqKrCqCfmWXoF2B++AgOxBFc9KUbUai3x+mBmudjv6fUnITbUXgLAsBkq/ji+ixRNP
         rrm0MigNmKuMRPmAZfeMes71CNKOEYH6RafH/6WANdXmzkgpqeDJjoo7Ry8FUsbWxnzC
         ooxw==
X-Forwarded-Encrypted: i=1; AJvYcCVKCEJxlfMAAAUqoCDzrw0XFU1BkGPTZbr6LErexFHKPTFYOnX/4c/61Mv4EQYvAAhcIvwIx58gOTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGh9xWDpSHuOYlrpktRjbM/frvOgRRrWhl62QFoIChBI36+R01
	KKxADxi5ZOz5GmImVb2QEi3JcUBx+/Xnmv1BWsGYoHcA4EHm0cBBfZZzdfRPJQYVTc8=
X-Gm-Gg: AZuq6aIMPW8GpsJaXuYKS8h5XJ6/PuGMeT0dQRkBlTpE1XTCcGCAJVdgxQ1uFEzHaAJ
	pLv8i+Xw1UVOmOrV9OTf/FyKRO5nuj+Fz0oUPhDhwW9QPdkdiIC8P69tHe7dN0fCWrAumanv/OY
	v+SGUNwESlGwUoTcAaoYgGfcKGctoRf0x+q3+rmzo3D/t9Qty0fUgEmpnE6F86mBc34x5SHgL1E
	sr9NeLphHaF8wDdI2hgeifchMXQcYaepmtXYhyqKb4e0AMqT3HvAx3ChA03K3c5IK6Mo3xftima
	BIwLLKVz49ACdFigEvR/znICzUIJdm8uHrmhDx32r0R1LpqOiTqkRzhZaH3uW8l+qoPdIX2LTha
	B7t6DZvQiyI6Gyy3yo7+op4zoUeDaeRv9hUKpKx8vhVMyoNqpJv9b5tRU70l8hNubM3stk2R7wy
	bfGAvxCnFIQ8vtKj4V1Q==
X-Received: by 2002:a05:600c:3b1d:b0:477:9cdb:e32e with SMTP id 5b1f17b1804b1-482db46014dmr20938165e9.9.1769756888362;
        Thu, 29 Jan 2026 23:08:08 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e04a082dsm7883645e9.3.2026.01.29.23.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 23:08:07 -0800 (PST)
Message-ID: <4d3e2027-21a6-428a-9986-83b8e41f1263@tuxon.dev>
Date: Fri, 30 Jan 2026 09:08:06 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/31] clk: at91: clk-system: use clk_parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <7537c90e81803116bbf440c08f883c4e0f30a28d.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <7537c90e81803116bbf440c08f883c4e0f30a28d.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of struct parent_hw as this leads
> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
> conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures.
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip: Update SAM9X75 clk-system to use parent_data.]
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>


Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
