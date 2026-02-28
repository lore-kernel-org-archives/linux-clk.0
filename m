Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AB3371048
	for <linux-clk@vger.kernel.org>; Sat, 28 Feb 2026 14:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772288546; cv=none; b=YPamPFoRcR0vle9Z05/wnZ2RJL3RT8WgGJeEpPQXwTy8BZTuLv1XhOuGhUu29lOWV8Wt/ajPJRAzmeflo66Km0b3+CRhMUAmqUtWLuHzk3kFvg7Gi9UipgyzHcrqFkKb8K/3jdE10JEX3gZ+Fq2vwCQpUfyNw2sSh0h9GrsQIAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772288546; c=relaxed/simple;
	bh=cdMeSBcwMEAfIQGzdu8kqieWYjvBMRGrwvzxRNQyUck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sS4f+foewMEw+v1+SP4/n+6Y0qOrqMU9zRJyERYFrVka5r8K0XGtgPT8hnF//QkSAgWHCPNclHTaYLzBxaeRxCv4GyjTMlO8IoJS+yb3eH2SCkSlzoWp5Oqcy5fcrkmnAFgGEFDu2pQaFhJkBU4VbNTQOtOqnm5s70evPXnN/Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=IA2/qqfN; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="IA2/qqfN"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so34603045e9.1
        for <linux-clk@vger.kernel.org>; Sat, 28 Feb 2026 06:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772288543; x=1772893343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vtW+TvDVbM5bVPkT5f4veuf3YOot6jvs+xND9WyGWvg=;
        b=IA2/qqfNf34lDP8pHByF28263YQ4Z6xRN5eQAXx49WmB9Iz9nSdt7dVcm5llJfHK7o
         Mmwj9XfBREp9JEnc7ihbGEhEw7+3gMo65ncWULZofDlknlEPZws2c+PkelB3rRuFCRdl
         qKfM0sRp/VG3+3FINgOjybBoTpQGIgdw3Mkw9r8AAmTDFiNavfVANphxpHNA6MkZPaIy
         2R+FbXoablV6wK2uX5E1lUogoecHV0zh7BOaevIkBWbrShS0sD0fk/8v/zBB/+taQv0B
         QS0nU6d8LBaWC8Q4UKhR2fPYiFvMGoKcWoVbfYArpgCMOwn/qGGXIr7uDJt8Mv24cLgx
         XmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772288543; x=1772893343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtW+TvDVbM5bVPkT5f4veuf3YOot6jvs+xND9WyGWvg=;
        b=llB7N6/dpUzlFZIkE2WKvzIXW0KhmhmTRANMenKI0nsQNngUM45xIw94ev0ikJE8Wv
         1R7vHHnaUnbcDgRsB/NMlEdYf9rF3J24aJPiK9X7Dt3stiXy52/VCCdeReFRULVhDFDO
         /RC05ExPj/zN+jpw0TwxQo6tm9lEGcdbaeCE5F3O0WxarZy9Z8ZjTJG+XIu9P2075eAy
         QO2peOJS+VwshAsiu7RGe84vq1vuRRfH/CLYLmKRAV2uSYZoiapn66B8bC6TXGl/K9zM
         57blWHcN/YltBcn7m3FYltFdRqCce8so1/wd1RooKRWTT/sCEf1oXPsAxYHYnoMDLpCd
         +QxQ==
X-Gm-Message-State: AOJu0YxCD+Cc1CXChDBZUiq7wJhVuv6rTYXeNjgHGbyma2OBeMSucFDh
	AwwQqBkiIK3da5+XDJXKZZv/H7tbjXfeUjD5SVahRxiTFJiW7PkyN3HTWFbW+THB880=
X-Gm-Gg: ATEYQzyOiiOimJXYcyzH+hrbgyqxYQLn2ZWU+DlCtr9abVxvVxGFCGSeMxc0uE2lAzj
	RK+El/Uq/04E4izr/WtOgwZK4KK5ekHPGGho8bbsNOvZlV5ASjjZxS4WpYTZG12kxdIyZFCdaXR
	zdklLc1l9bO8n7LKjRVKMULsqLyVBjtPlfUDTW7fvlnOIrDNc3a8opqqMMaO2dSKN54FUlbJMGy
	J+SjDeufOWURtBM3ggMuNBjM8OsOW9WCrUR6bOV1SUTYSZFfn+7y+3qBfoYBideOBNaEyoDzXVB
	RVRnpuUcnsB65xHq7FkqoDvOFekuJMZhOpWCwVNDHWtGX/lKGUIhIjtf1NNNnXySuXoZT42wygD
	2G7t8icaY5f4YHG6xHAY1QoUVxp6lerZRqcrqEeZ1sIiCGT/I+VnXzPmPTsjmOryrbfSXtO907j
	x1Aronvku0BXYZHoB8phZ2X114aU8eXg==
X-Received: by 2002:a05:600c:154b:b0:477:5af7:6fa with SMTP id 5b1f17b1804b1-483c9c2059bmr90939375e9.32.1772288543254;
        Sat, 28 Feb 2026 06:22:23 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcb4f8bsm212800145e9.4.2026.02.28.06.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 06:22:22 -0800 (PST)
Message-ID: <9965d2fb-e1ee-4103-a5d3-01cb94468db0@tuxon.dev>
Date: Sat, 28 Feb 2026 16:22:21 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] clk: at91: sam9x7: Remove gmac peripheral and
 generic clock entries with ID 67
To: Mihai Sain <mihai.sain@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, varshini.rajendran@microchip.com,
 cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 ryan.wanner@microchip.com
References: <20260212100147.5007-1-mihai.sain@microchip.com>
 <20260212100147.5007-2-mihai.sain@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260212100147.5007-2-mihai.sain@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Mihai,

On 2/12/26 12:01, Mihai Sain wrote:
> According with datasheet table 12.1 the instance ID 67 is reserved.

Could you please mention the datasheet revision ID?

> This change drops the gmactsu_clk and gmac_gclk entries from
> the SAM9X7 clock description tables.
> 
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
> ---
>   drivers/clk/at91/sam9x7.c | 10 ----------
>   1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index 89868a0aeaba..d9603f1124d0 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -420,7 +420,6 @@ static const struct {
>   	{ .n = "lvdsc_clk",	.id = 56, },
>   	{ .n = "pit64b1_clk",	.id = 58, },
>   	{ .n = "puf_clk",	.id = 59, },
> -	{ .n = "gmactsu_clk",	.id = 67, },

Could you please keep this in a separate patch?

>   };
>   
>   /*
> @@ -702,15 +701,6 @@ static const struct {
>   		.pp_count = 1,
>   		.pp_chg_id = INT_MIN,
>   	},
> -
> -	{
> -		.n = "gmac_gclk",
> -		.id = 67,
> -		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
> -		.pp_mux_table = { 6, 8, },
> -		.pp_count = 2,
> -		.pp_chg_id = INT_MIN,
> -	},

And squash this changes with patch 3/4 "clk: at91: sam9x7: Add gmac generic 
clock entry with ID 24" and also provide a fixes tag for it?

Thank you,
Claudiu
