Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B46E26A0D0
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 19:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760987847; cv=none; b=qmgkSLNnFNXyHlUKPgzUC9sP/t+N6Udxkk03RJK64xI8xves5sV6Zmtf+ONs0LRT4qP5uDwoTlEt6WmjKpdlGnllnnGXUZWNI7o8N2S00CaskvaG0b8RdAOl2c7+v4P2DFhnjWZ0hJb4Mel1Xrl7nVnsi7UNP3tlqRIquXkhkwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760987847; c=relaxed/simple;
	bh=8xDpo92mB5twoWrjolGZwTuSzwa3UBDnu8dKD9TvmDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h6ni43u6J5rHhh7mzH6wRv9rG3QBPbogfBoghmne+YzdBiJy55pqlvqJ3qArbZlBYHKVQ0saDAJCpgsh8zdo2RWzz0G5QxQmcMbnvh28jhMtlVevyvweYT+soRwNhTywXuJRgYnzu2bP1v+0XXBAEGFfk4WSio8OkIVTj+xbhj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=hx1O/UHh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="hx1O/UHh"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47114a40161so3870035e9.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 12:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760987843; x=1761592643; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gNuJNEa8H6a1Hi9ZFQNvUrGKVUMBUcGXXY/Ad9QcmGg=;
        b=hx1O/UHhdHaCqyHnoPF0vrM3A+jdbmEVTPp+J+n1k3E2CLh0Vpvb2Wof1dk5OsZFIX
         rWDIyThyzIF0Acbkrn+R2M1ztnmzF6cETiV4aueNhxrUdh0twyjMNymZ/Cc4/8hzs7VK
         Ix5G6RwBJa1JeKMU55CG4qLLmQBx6Wftkn1GZyfAGzCX/14zdkczle0wxpTbIbbCVOah
         Lmm6saWGdmomPdwd/uuifP5hUUvqqkQLEi7fatptfNYkk3DiGJIz4erg/Yq7GjLKbto6
         uohf5ArRS1qvufeDgipgfcyA6aP2XhD8tR3ecf/HEtgH3aJKW4JgFyT+HSNSubmJePTY
         FZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987843; x=1761592643;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gNuJNEa8H6a1Hi9ZFQNvUrGKVUMBUcGXXY/Ad9QcmGg=;
        b=i4YgLmE5nM4SyjHdfatlGrfeRoe3/BttGQycJqlVUC1Ote8WfWbW3FuQwlXrd3Pb6w
         wEnhmTG7u15E3f0eykewQBN2UygbmHts+JmZoVAWU09+YFteBqNCzMhuY9VeiiQc/gZ5
         tG6bqkgG5rjC8L/xVzpsrDsxP1JNFg4VIk5UcuiyFfS/Srdxpj713sV3mFBahqXjeAXM
         FeRBcPswLdHe0D6wZriXQ3PIlOouImlnGy+8ESHDHXuMJq6mdXqiqE+jzVMiRSUeDJAd
         ZWdWu2VeX7wG1veehJerUCvaIfNBQ3NP30a57bg/bNrn7jj7g5MYzh8oXVm0E6Q4B8A1
         eGJg==
X-Gm-Message-State: AOJu0Yx2t+yBA12n0w3Dvr+dJrA70gw5tc5uD96wdRGFko3p9eREioW8
	fZUyKGB5p2emHAXnpAz4Tcn99BNCyG6eC3JfGTs69HaHW+Vu0nBObswd8ULxSwyIGy0=
X-Gm-Gg: ASbGncvdac0+f0aCIvW40qqC3pQTsg7tqoBAVfPh/kiuiCk8ChqaNClMqmK95heeh2d
	YRYJE1GqpEYzp3xbXfHvXjy6RlDvEetzOnG4IFfnO/SCLawNav3fhNip1ErI/oVJvPPCHZaDjoi
	pR4T2Q3sVz0PeT+hs+peq3dQIR1peY5Fd3L79bCc36u+xefPERM5GbLyuozIJw4K7bpaMAwt+dS
	9KcJlfoPLiIdiKN8FtmUio+7S1nyDceomf0AI68P7InNT6cRG1u0Oet+3aGnN199puf1OuPnfkJ
	Md5M8BFUysVSuLNFK9+mJWz3G59fh1vPUNiuDxHJTKkea6lMcZz3/reL7XqY6HA9YRE/YlhJq2A
	yBkM55CHhmO0XmugOgRXePe+Fiw2lTAy8risPhSYxFrNiHS3/HnYE2DJt77+zxLfZthWCMeyCU+
	NUhKrJvmm0a0BZDR1Qp4Q=
X-Google-Smtp-Source: AGHT+IESk1yhEUcjFDijdAA3soTez4joNNS0ROTIat4Ft5zVYJZ3e548G/BmPG8k76dQyy5/TyttJA==
X-Received: by 2002:a05:600c:470d:b0:471:12c2:2025 with SMTP id 5b1f17b1804b1-471179140abmr122949465e9.32.1760987843277;
        Mon, 20 Oct 2025 12:17:23 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47152959b55sm163583265e9.6.2025.10.20.12.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:17:22 -0700 (PDT)
Message-ID: <27aab227-01e3-4074-8aab-38623b4d9808@tuxon.dev>
Date: Mon, 20 Oct 2025 22:17:21 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/31] clk: at91: clk-usb: add support for
 clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <6979b3734462c97381159f3968a3f22b6193e04d.1758226719.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <6979b3734462c97381159f3968a3f22b6193e04d.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Add support for clk_parent_data in usb clock driver.
> 
> All the SoC based drivers that rely on clk-usb were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Remove the use of __clk_get_hw() for the slow clocks.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip: Add SAMA7D65 and SAM9X75 SoCs to the changes.
> Change how the main_xtal and slcks are initialized so they match the
> parent_data API]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/at91rm9200.c  |  2 +-
>  drivers/clk/at91/at91sam9260.c |  2 +-
>  drivers/clk/at91/at91sam9g45.c |  2 +-
>  drivers/clk/at91/at91sam9n12.c |  2 +-
>  drivers/clk/at91/at91sam9x5.c  |  2 +-
>  drivers/clk/at91/clk-usb.c     | 41 ++++++++++++++++++++++------------
>  drivers/clk/at91/dt-compat.c   |  6 ++---
>  drivers/clk/at91/pmc.h         | 11 +++++----
>  drivers/clk/at91/sam9x60.c     |  2 +-
>  drivers/clk/at91/sam9x7.c      | 21 +++++++++--------
>  drivers/clk/at91/sama5d2.c     |  2 +-
>  drivers/clk/at91/sama5d3.c     |  2 +-
>  drivers/clk/at91/sama5d4.c     |  2 +-
>  drivers/clk/at91/sama7d65.c    | 24 +++++++++++---------
>  14 files changed, 72 insertions(+), 49 deletions(-)
> 

[ ... ]

> @@ -882,10 +885,10 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>  
>  	sam9x7_pmc->chws[PMC_MCK] = hw;
>  
> -	parent_names[0] = "plla_divpmcck";
> -	parent_names[1] = "upll_divpmcck";
> -	parent_names[2] = "main_osc";
> -	usbck_hw = sam9x60_clk_register_usb(regmap, "usbck", parent_names, 3);
> +	parent_data[0] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw);
> +	parent_data[1] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw);
> +	parent_data[2] = AT91_CLK_PD_HW(main_osc_hw);
> +	usbck_hw = sam9x60_clk_register_usb(regmap, "usbck", NULL, parent_data, 3);

sam9x60_clk_register_usb() could be converted to use parent_hws member of
struct clk_init_data instead of parent_data.

