Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C731A9F97
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 14:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769869504; cv=none; b=K5mG3HE76g0HV4+H2zCpfgmUr8NwFrEH8u2PeqJnPpn/kHg/NQTRJW9LtAbZD+6c4UajPWNVPP2THk2+QCARbIqTcNzVUED9BFbbSOR0uyNQ9ZcnX13CFpHd7WgmgzCIl/kY5loAh0uYG4X/xKX0vGZA43pV3+far5xANEzF2wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769869504; c=relaxed/simple;
	bh=AfqdkNmY5as/gf74oqu9KJGc73djMrYwfisd0klAVzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DAp1jfL/XDjW+d7KuXRdN7H+jur8SkLjqwIPaMlPyggJGE+3F2Cs4Xpc1zO0EC1MxbWsfE64OPM92YjTqx1ppkGGiO8+3E8PgQsf0cPhxeMfDGhdnMxlAFAHRndqo9u0W7uV5g12srvZf946b9jw6stGu5GwD+GHY6iRN8BSGaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Yc8NIs0F; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Yc8NIs0F"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4358fb60802so1873887f8f.1
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 06:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769869502; x=1770474302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qc3eedRalwu3ot9spaNpjRwC5f0S028YjliYaYwkd7Y=;
        b=Yc8NIs0FAL3SySuvLE0FBogpy1unHJ0y4rLwCxH1zArxddiYW2cL/ok9b0L53FzDGW
         NenlCt/phecYRBQqK/CZ8eOVuSyzEBllmjWZBKisw6NbzdszQJMvu5Q6/QgirZypo1VH
         Gr93TPsUfp8szurK8B/A4hN22z6lT/7FkgkzsWHkhqbd1fUSW3YzXbkuhkvIWTRy6p9o
         TUkFCrDoScIrCRZkttUadsR+I88Sluy04gg5/3CQVG22MGQ1YSeQoRRhM9tOfjGuoQ3x
         UznveVtf9u9j72tXkRDY97za6vEPKCD4SGAYu+C6QYU209D6jDaoysZLVXWTYnUtKzQ6
         govA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769869502; x=1770474302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qc3eedRalwu3ot9spaNpjRwC5f0S028YjliYaYwkd7Y=;
        b=WjfDmMfqVEn4jhOX+2CBuAQzBdSsLyJgJmZVglTPIskcVORcccCjJBpoS2K9IkFHWG
         Vw2f3JcsTp3RLM5GfD73pcNCcyGVTFo2q3/RlLWo5HtRCY/UANneDTxHcgt8o8E09UBZ
         sj36PaZxZqOk7bKegyu8ypZg8hAj5YPQqT5FSJvWycfgZEZ3NzkJ/a6Djn5ECAlUDm6e
         qgHDqDB1VWpIok+zTqDBcoYPqBTVV8pOCgAbnLjQdskkTqOlUIKTJYumkdLSAM0ye+Yz
         4nQbHaS5PTeP2QR3PkBKrGBvxA4sCr1vEtj/PNAxWqYYRpe4nK2eYT9NFbvMyA2cSBnf
         sUDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfh1iqFW674Rd0N2CV+ncZbapxFSfBYyrVXxrrZrZ4YbBRvEb6zTHwiSZYKU8qyil9guxy7X08pmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZkmE435rk40d03mP7ZBYx+jQYtbCYkTKmFwD0QhSmzGREWzuh
	NO7mi7vp+H7WzaAw8yFVwK7o0gptSmT1okyQmWxkHEwRewGq2OdBsS8H6Y+p+J1986Y=
X-Gm-Gg: AZuq6aIIi6ij3A6vUnGM6YNKtKm187IUd7XWLeZo8SRGnYS41GPzjA7Byn0GrR5IrG1
	vstwzWweZfDIc8eMIZXZ06Nan43xPT+M9tmLSk10xJ+jFfEdOMaFQrt1eLLIRuImBXWU3MepFJJ
	HBDePZPGh3CUto8zqUahZiGB0HJFernbZjzR63iW4y7zbM4edqaOBdN8LAsaZQ07csdCWAzs9rm
	1MSFaiyLKWjzm51wQj1bITDXPSqiUnW5/8cJBryQrNijbHuPbYPQLXLbstm/u2lZKYggv+/2Qsl
	YvjlovZoMZkeahY2k2Hf41T6y0LRCaZWvU77Qbc5jhijaWtHs3/Cnlxgn0aJj+W88RuHpMMMyVQ
	WUqdYDv1N9O/WO/sd+6QG0D3wo8J7tV5nsCJ4/fqGJ1/e7PGXFmWrBwD2VBg/KVr+A9kaqBmQls
	KdDyb4OIZOW/n7rEuVhA==
X-Received: by 2002:a05:6000:2585:b0:435:9e32:2b85 with SMTP id ffacd0b85a97d-435ea2209b0mr15783726f8f.29.1769869501605;
        Sat, 31 Jan 2026 06:25:01 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edf62sm32649421f8f.13.2026.01.31.06.25.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 06:25:01 -0800 (PST)
Message-ID: <b5020405-c860-46c3-84d6-152de117e6ab@tuxon.dev>
Date: Sat, 31 Jan 2026 16:24:59 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 31/31] clk: at91: at91sam9rl: switch to clk_parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <2eece965466a91c95b0a958e7396cb16f60e0ba4.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <2eece965466a91c95b0a958e7396cb16f60e0ba4.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Switch AT91SAM9RL clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration
> speed and re-parenting.

Please drop parent_hw from from the description as well.

> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

With those addressed:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
