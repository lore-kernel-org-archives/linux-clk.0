Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8233C1A5BA2
	for <linux-clk@vger.kernel.org>; Mon, 17 Feb 2025 09:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739783457; cv=none; b=lr0JZL9+2Anc9sYyIYhQhp5qpvAyvM1vTKTCrw4qV20W9Q5Z9UFYbdtVLnH901ZXnvTo+601LQ+ARImsUBQKJthLiGH4wWKrUeR+mIcTbHV9946RSYUfZRf/DSy03UML5oN/TEfBpJoUZ17owV1svJLI4+TG1jND3oZeASVhxvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739783457; c=relaxed/simple;
	bh=HLjdC5s5Tz3v7HXZmU/fyqh/2tO8WiXwKjIVXQyQMEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YXaXpLSzApBZVaHrwlXikDT3uIqZlsFic6vCoWBbv57EJ1IzLXRESWO4JSZ1HYDMHtKPQ+0TkuZvVEO+6e1dyRtVOc20QrIFPoovxPMgT8/g/ll5lD+rPpBm2zy7Hw6aYCQbu8wpKGhXIuHLyBwEkhAHmSrPM3Vp8aHjnau9MsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cc0x7NLC; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cc0x7NLC"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abb94e3b49bso149812966b.3
        for <linux-clk@vger.kernel.org>; Mon, 17 Feb 2025 01:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739783454; x=1740388254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bpE+gU66/VtFFZtfaCY3+dZAi/5PEF5XEsIVpkUzL/0=;
        b=cc0x7NLCeyUrJ3ZPFz09bmCY9UJ2GyPyRNhGnp5EJxYbjToglqrXCGmvicSe2u2qnx
         4BH/8DYEEBK77IYRGqfy98paheT6unp1hfoacn/B5bgAgAg8dxy4N3qqiJqnS57L++LK
         tovBQChaXC/g4ZivJVSOM0CF8Ixc4k+X83sLT8At0u6lqZPGAqiRHczKY0HTVUNou/Yk
         zqat050lE+hY5ooWCR1fSIy5hHufheG8qTUD/mLUPhBqeAAP4q7vS7fJDCzyZKnw0BGh
         X6v6sN9OfzfUB1/gg3o3zdck6lPBD4v6a5CSZjFPUkFtOFGncdBGpeFvT7ZfQa7dObDs
         fR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739783454; x=1740388254;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bpE+gU66/VtFFZtfaCY3+dZAi/5PEF5XEsIVpkUzL/0=;
        b=Il8MUx46JVDsNfvsjrTW0LaIR/vTc4ucRdVM+TlOdAi7ytUPtZAEUx5SJyErO+PmTO
         GhOGDIN7Mh+smIwhqUwHFIj0y52Gg9guhfeVmco+/yLYQKOh1e2TP0OiRQ2El7Vh9UPs
         iFNrmB7oreR1gSVGKwl0JH9AcT7u9UNY4wuXmU6CfI9kUNxqjJ6mAA2blAREQhWBT+xA
         /GLLc5EUoI88DVeH/NlzytcCTGQmxO4nu4C7dgVj0r310BsLrzjqN+2GbMrmiI/QdmuY
         ELHiQWENkTSxH8LvEy81KtWJX8mEbGnfZF0bWDDxLn4Yke8xfpMJ0zh1YasnoMw5k8Kk
         2GYw==
X-Forwarded-Encrypted: i=1; AJvYcCWp3fXtmGBtibBHc0nawIT8pWtt+b5iNjLWfNHSUWL3jYSfWQNgJFC9xl57enHNKpt6sMapgFlQCeU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlqIE1yOQrZZ+Z0f50ehyI3A11ZJ40wSxwDlyXLfKOzmeTlH5G
	4TtmK9xkfG8CBae5oFTQlRmfOmJc1Rx8Nx5jEJcBtx88EkMlYGXLA91y7wwGfQY=
X-Gm-Gg: ASbGncsbDaiCSMQMjfH0MfC/Ujb28jkMWVd9wee+sqcjL9pZuPgiJ9v/ZONTHPAz/GP
	8JF2YicKkuDxdhPUxQJD4sWNorbiNOrRVMcgmIDljs4I7QuKpS9Ta9QsvcSyTYxEA3yEOqs5LYP
	9VLFHSwtuE8hhwsF15SMrTp3J2JrxifkqJrFUljTnrz1dywDiyd4Ha3BfMIeWTDRcPzGzUr7114
	Ts6zJrImGnWbjscMprVk54Ir/l1w9crDBSW8wyBiOGWjHGxP40Vrd5Il9hanKU8wNMXc9jEmq1C
	YPYCsH7iG/eLis/FCM0KBwA=
X-Google-Smtp-Source: AGHT+IGdA34WvOQoa211cMFIH/mjnYm202WDbH4ck0vbSETl/ktewNG48mcP+GJedsZFj1k9+lMhBQ==
X-Received: by 2002:a17:907:1c21:b0:ab7:f36a:2563 with SMTP id a640c23a62f3a-abb70d3cfa1mr834993966b.21.1739783453770;
        Mon, 17 Feb 2025 01:10:53 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba3d765acsm91405266b.130.2025.02.17.01.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 01:10:53 -0800 (PST)
Message-ID: <1784e8d6-c754-4e7f-ad48-611b9c392eb8@tuxon.dev>
Date: Mon, 17 Feb 2025 11:10:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/16] nvmem: microchip-otpc: Avoid reading a
 write-only register
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250210165050.496486-1-ada@thorsis.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250210165050.496486-1-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10.02.2025 18:50, Alexander Dahl wrote:
> The OTPC Control Register (OTPC_CR) has just write-only members.
> Reading from that register leads to a warning in OTPC Write Protection
> Status Register (OTPC_WPSR) in field Software Error Type (SWETYP) of
> type READ_WO (A write-only register has been read (warning).)
> 
> Just create the register write content from scratch is sufficient here.
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> Fixes: 98830350d3fc ("nvmem: microchip-otpc: add support")

Fixes tag goes above your SoB.

> ---
> 
> Notes:
>     v2:
>     - Add Fixes tag
>     - Remove temporary variable usage
>     - Reword misleading subject (s/writing/reading/)
> 
>  drivers/nvmem/microchip-otpc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
> index df979e8549fdb..e2851c63cc0b4 100644
> --- a/drivers/nvmem/microchip-otpc.c
> +++ b/drivers/nvmem/microchip-otpc.c
> @@ -82,9 +82,7 @@ static int mchp_otpc_prepare_read(struct mchp_otpc *otpc,
>  	writel_relaxed(tmp, otpc->base + MCHP_OTPC_MR);
>  
>  	/* Set read. */
> -	tmp = readl_relaxed(otpc->base + MCHP_OTPC_CR);
> -	tmp |= MCHP_OTPC_CR_READ;
> -	writel_relaxed(tmp, otpc->base + MCHP_OTPC_CR);
> +	writel_relaxed(MCHP_OTPC_CR_READ, otpc->base + MCHP_OTPC_CR);
>  
>  	/* Wait for packet to be transferred into temporary buffers. */
>  	return read_poll_timeout(readl_relaxed, tmp, !(tmp & MCHP_OTPC_SR_READ),

