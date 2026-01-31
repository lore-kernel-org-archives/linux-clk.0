Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630BB76026
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 15:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769874264; cv=none; b=A6yTf3ljrpyEATWNyDq5D519teLp2j0xf47hLwoyY+wEt6nFyVKTayKKngywZHqf8pI49Kv+W3sedIMI4BdBnvZ3h1jZRQEAjSOxm2PnevRa9fYK+RkbRe7GrFtOf6aKY4H4E41ib5D04I/txgDgrwDl8fXeG4CTxepyVgAk+es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769874264; c=relaxed/simple;
	bh=SyfW8MfAu+qgwEKVRAVAEQD5JoAVSJqxtBVfLR2gTS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qUEhFtg3RDX4QUoHYMvVAHdIB7CMNM6YS7AUTYBxHPQql4uRHYdU3QXi/nOWBvKd9yXToNFNzDZcxVtuRUCaPwLMt3jEejgD0UBZX0MhaLBtnAF6/UsOOkCBRtXYYXrmE8jLiQf2lAbQV0Cqve/QpRMbTcjF1wTL7zrfOO0iduA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=EBofFtti; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="EBofFtti"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so2620472f8f.3
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 07:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769874261; x=1770479061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cdW//g6dNqevqx03cSVi7ZIuci+YN4ji+K9ErT7sw40=;
        b=EBofFttipUt6nNo8e6f19KcidP/iKhcxdtyAXbaehB46tQ6iNg9gOMewPSUwI9UFwC
         LYqdJocUFeDCOxIuM7zLeMPUAu9ADfO8Jn4oMqL9QrPvQoY4uu0OtWG3QJxb3w82Z83H
         IS73oosNO+D9cGAjIo2gFtdw8/+EyqybQuDl7uI4aukes3ZFv2vJKIH6XVnaBOoGkGwl
         v2KZLT+9/Wuylpw1R70k0/XonBLW7zm2hmvP/0Lmx3d+czowN5huHDr78vxMs9biC5uM
         MsykmrMgQ/xVe1HaNRf+RFOJUoQ4FursPFWQt7ABt/on5nUrS1kPzwsZnArX8yyoWtN1
         Ur+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769874261; x=1770479061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdW//g6dNqevqx03cSVi7ZIuci+YN4ji+K9ErT7sw40=;
        b=b08ogbYVseTzScziWgVV7jNnXsRR1n4tj/oVk+a4k/Zfm4l7mhnm9f5GvNravFXHOk
         LJCCxmjHccY9T9yArrubkMBtAiqJO2Vb+8EB+8EHODtLZ2ry7sY6sh0JDRIicmrQCWnN
         k7dpsUS5138lAvPrlktbzyq/6OvRpl9wpAZPYIQuGYfzs9ncZEclvWxEny6pT968kwdd
         DWtypJc1+th6pk01mF6oOO6ZULwvSmhYx3RaN7BZDxdON/c/OxEVI4ncxe465yNuQTgv
         OPuLkowR+aigr9py0MtArEf8K1EOww/ZEBjuEXBG6OvF+mUcLSfSxvTeuguvGVKwWYtM
         Gz0w==
X-Forwarded-Encrypted: i=1; AJvYcCW5ZjRg+PXTzkIzKJd2m7aLd8+96AWz3apXnzsfGUmZ/vPpsl8IZZWAob/Ry/nkoWvN+eJRD5Jdp5A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+WZ3sAJMamzklAUoqdoBjwbyjWjqGaoy/D3nKGfnHIX2ODtBr
	C5GCPdp5cunTECkY5ERpD6fROWcNhMbHWMWKrD/IIhlt33D/pUHzoMU+rJrrj78TmQw=
X-Gm-Gg: AZuq6aIfI7a3QVwxilWsvaCQWFZ7i2RIwMqkYLf2y0rnVmzBI/oOGiECgwqo6FOmSBT
	26u8knO9IsVNmoBh0BkO9u0CEL+ThK+q/Mjl9eORzIaJXb067SbvavDekMhXB0RWFrTPLQDwB9d
	rNml7c7W/oatJBZkHoGkBBTe+pdPD5LtIKJIsjf1UvpQZ1juGZRIZSgjcyG7kUZpyfjuuqLdxnc
	kJXeZdcaaBT/YhfQk6/fY4evqZCWXjcMPtUmSPmLWUsAbV0TgQAGq3Pv56hB966guJjQLyXztpL
	R35nejMr5Qvi5YS9OWQa8lEzNy8UbtqSHGdzKWm+PzP+WWLu7eP0TKV52RIaRoUQ4Mbuymri4YL
	uq/wPYOkLVprefDGlW5SrfFRMEPJUVjgOlMYVeBW2DgjVEOECpnG1sO0sC9qGExFSxXAsJvCtxs
	//s74M2Ube3prDiozrag==
X-Received: by 2002:a05:6000:240c:b0:42f:b707:56dd with SMTP id ffacd0b85a97d-435f3aa79d9mr9246341f8f.33.1769874260757;
        Sat, 31 Jan 2026 07:44:20 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1323770sm30730507f8f.32.2026.01.31.07.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 07:44:20 -0800 (PST)
Message-ID: <b932cdfb-9197-462b-abb8-e7b4c7ecab6f@tuxon.dev>
Date: Sat, 31 Jan 2026 17:44:18 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/19] dt-bindings: clock: at91: Allow referencing main
 rc oscillator in DT
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120143759.904013-4-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260120143759.904013-4-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Alexander,

On 1/20/26 16:37, Alexander Dahl wrote:
> The main rc oscillator will be needed for the OTPC to work properly.
> 
> The new index introduced here was not used on the four affected SoC
> clock drivers before, but for sama5d2 only (PMC_I2S1_MUX).
> 
> Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>      v3:
>      - adapt to different base changes, added lines are the same
>      
>      v2:
>      - new patch, not present in v1
> 
>   include/dt-bindings/clock/microchip,sam9x60-pmc.h  | 1 +
>   include/dt-bindings/clock/microchip,sam9x7-pmc.h   | 1 +
>   include/dt-bindings/clock/microchip,sama7d65-pmc.h | 1 +
>   include/dt-bindings/clock/microchip,sama7g5-pmc.h  | 1 +
>   4 files changed, 4 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> index 91f8f863ea076..1f6bb51780d09 100644
> --- a/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> +++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> @@ -10,6 +10,7 @@
>   #define SAM9X60_PMC_MCK		1
>   #define SAM9X60_PMC_UTMI	2
>   #define SAM9X60_PMC_MAIN	3
> +#define SAM9X60_PMC_MAIN_RC	6

Why 6 and not another index? In theory, now, you should be able to define here 
all the core clocks IDs (as these are known from the manuals) and prepare the 
driver to allocate memory for all of them such that the driver will have to be 
able to work with old and new device trees w/o further changes.

>   #define SAM9X60_PMC_PLLACK	7
>   
>   #endif
> diff --git a/include/dt-bindings/clock/microchip,sam9x7-pmc.h b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> index e1dd41fe75046..657f32ce10071 100644
> --- a/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> +++ b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> @@ -10,6 +10,7 @@
>   #define SAM9X7_PMC_MCK		1
>   #define SAM9X7_PMC_UTMI		2
>   #define SAM9X7_PMC_MAIN		3
> +#define SAM9X7_PMC_MAIN_RC	6
>   #define SAM9X7_PMC_PLLACK	7
>   #define SAM9X7_PMC_AUDIOPMCPLL	9
>   #define SAM9X7_PMC_AUDIOIOPLL	10
> diff --git a/include/dt-bindings/clock/microchip,sama7d65-pmc.h b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> index 09d152da6db44..ddcb236718978 100644
> --- a/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> +++ b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> @@ -12,6 +12,7 @@
>   #define SAMA7D65_PMC_MAIN		3
>   #define SAMA7D65_PMC_CPUPLL		4
>   #define SAMA7D65_PMC_SYSPLL		5
> +#define SAMA7D65_PMC_MAIN_RC		6

E.g. 6 was previously reserved for DDR and IMG PLLs.

>   #define SAMA7D65_PMC_BAUDPLL		8
>   #define SAMA7D65_PMC_AUDIOPMCPLL	9
>   #define SAMA7D65_PMC_AUDIOIOPLL		10
> diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> index 0303cae56f849..e891715a35173 100644
> --- a/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> +++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> @@ -12,6 +12,7 @@
>   #define SAMA7G5_PMC_MAIN	3
>   #define SAMA7G5_PMC_CPUPLL	4
>   #define SAMA7G5_PMC_SYSPLL	5
> +#define SAMA7G5_PMC_MAIN_RC	6
>   #define SAMA7G5_PMC_AUDIOPMCPLL	9
>   #define SAMA7G5_PMC_AUDIOIOPLL	10
>   #define SAMA7G5_PMC_MCK1	13

