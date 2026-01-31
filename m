Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8520831ED9D
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 15:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769874808; cv=none; b=PqAD64UPsn7UyFKGX53iLzma6dKFOFdVZ0mgpAZYWkfgHqUcwlMIiddA5pgMMxpWGiYmgG+jm/46iYn8UDEfumjcFZHhzzbIRdP5xEZJ51ZcyhCjgl7GQY1atisPmtrxIRoJRsVqCO15NnOdHQp+Cm8B5U9bvTUuPM7OreXSL9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769874808; c=relaxed/simple;
	bh=UYAieOC/Sd+Ax/qh7bv2PygLHfhC007jTLqyzImPAxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=skVZf81izZT6/t9kK/brvMCTWKDyqaRMRRbKsM9A9zI9nmNAG4rn3CPh0mmmlyn0xLvQHfOUonBlSsLC5Xgx51ll3vp2YqS0fiRaoYTK0k4ZmGFsoodsjLDKQvKcWLdtszuQZa3/3+3els373I2kkxC1cOcUcwkm34uvL1Yxurc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qqVN4ap1; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qqVN4ap1"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so24777355e9.1
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 07:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769874806; x=1770479606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4/rhOR4DhfaQj1RK0nVCHUbeV/3vvEtnoUlZ/Uv+pIQ=;
        b=qqVN4ap1OHFkS9p2337iHHfOn4akGihduvLje5ZQ7tuTIIpRjZcuSjaMh5MYhTa25s
         nCXzU+5webRi19YluMMogCCvCJecjrzkJ9RLLJaTKfUCq/CXU80oDBV9XxHA9B+okRoQ
         T3POhgy1QPq6nfEXPsdFqme4w8mHNL4+zaZpT/QqbbBoMFXqKZA7oncJn/j2NTJL8xQE
         WZWcsatOJJrn9PWGs37t5AYd7HesH1s4bpXzQRGOMinFFYZjCAq5VThODApw5Liu3gta
         3hwveckonyM02jt3tb69EoyHCfBxNauYfteXPhdmjDhf7J1kTTU/Mqwv02V3F5Cj2ZPC
         m9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769874806; x=1770479606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/rhOR4DhfaQj1RK0nVCHUbeV/3vvEtnoUlZ/Uv+pIQ=;
        b=IJ7N17ljm05h/WGHOmmM9HkTazkFNHAY7rRAcwLqBrExVUF9ogVdM5zofDCSXZVFtI
         aT32IKzWIwW7cHJxZxt4oCCzFVm0vo+6iDmV8gUIWJFWcOiQ5eAbsl9COGBPzcXEVtHr
         C3F4Kq9FcsUtjbKwiradaI+EK4ijI+skQD3NaF49/SkXOjS2eKJIe9z1C4XgJDVdWZJO
         /blYfWddbXtgTkgLZHOhyplmCrl79f/3ILO2OuV8jM5lJdpZOtW1u8dO+eKoxJewxhCQ
         9qsl+iiVP+Uyj1XuackbwPGR2FmTfVsMsD5NmpQhql2Tf3xK1uIHnzW+65Nho2+oQ6CI
         ZX7g==
X-Forwarded-Encrypted: i=1; AJvYcCXMAIws1mMxaKfn4veX+E+YPsiDud+JXGyudqDbJMHHcfBFPHk4iZQdijGhzkdzonUNfkzfGi3Du6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKWG5OI3DIkJXWNlYXYQsNZy+2iYeIadnM6/DNt1RGsNEcg2eX
	2M12+n13CIlWET6kNoQndFc7Gwg9sdte0tLj20ZChTmdMlOxe3CQiuxZesIQZvJzmqk=
X-Gm-Gg: AZuq6aLQZEzdafnJG4KvBjXtnOYkzDpSrXZJKK74ULWsYa+o9myXoui2Ys7sZkzcPMQ
	42L6wLvkGWBa0/MwzjiOGK3a/3p8MXSwOiIPupFCPyrHhDMtXSJ/thVEyrt+fTUNCeG5ZgPZ2kr
	bVcUdaZv1VnXW2euGZ3x1Xc7x4agFuGRbDMwGO4jz86gDTlOEGmPFVCCrySS0hzk6GRMRg5ojT9
	gJgmhQ611xvomHCXWpm9ky4UIdsXi3Ny6uLh32QKG0dd8UyMth6JU7xJ1HmnpVPpzbI8wOHCu9z
	iq/m3Sf8fHl85QYI1WSzYSmvHjq+SjsvEujlyIG28xUFMsvea0ETzniy56z5ndx3PWgxIDAsKLK
	ujmcyhU/LmPr2OCY546dYrcGrMub75Q7d3EZ0KtslVyHzghGpkbRJ4Oa4cdiUVQHP+d2huMixOO
	ltzyiZpgMHsV7dnsgn9ecaOjXnovjO
X-Received: by 2002:a05:600c:a08c:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-482db491ef7mr85082515e9.22.1769874806018;
        Sat, 31 Jan 2026 07:53:26 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e256482esm41222055e9.12.2026.01.31.07.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 07:53:25 -0800 (PST)
Message-ID: <920da850-7caf-4385-b4b5-10fe6a828066@tuxon.dev>
Date: Sat, 31 Jan 2026 17:53:24 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/19] nvmem: microchip-otpc: Add SAM9X60 support
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-6-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260120154502.1280938-6-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/20/26 17:44, Alexander Dahl wrote:
> Register layout is almost identical to SAMA7G5 OTPC.  SAMA7G5 has some

Can't you just use a fallback to sama7g5 for sam9x60 and drop this patch?

> additional bits in common registers, and some additional registers all
> related to custom packages in secure world.  None of these are currently
> used by the driver.
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>      v3:
>      - no changes
>      
>      v2:
>      - Reword commit message (additional information about SoC differences)
> 
>   drivers/nvmem/microchip-otpc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
> index bf7e5167152cb..d39f2d57e5f5e 100644
> --- a/drivers/nvmem/microchip-otpc.c
> +++ b/drivers/nvmem/microchip-otpc.c
> @@ -269,6 +269,7 @@ static int mchp_otpc_probe(struct platform_device *pdev)
>   
>   static const struct of_device_id __maybe_unused mchp_otpc_ids[] = {
>   	{ .compatible = "microchip,sama7g5-otpc", },
> +	{ .compatible = "microchip,sam9x60-otpc", },
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(of, mchp_otpc_ids);

