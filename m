Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCFE273D9B
	for <linux-clk@vger.kernel.org>; Fri,  8 Aug 2025 11:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754652499; cv=none; b=JMUWwaylzJW3ONTYK9nPcYC0dKR0auiY8AUCglAmCb1bDkeP0wVLx+sQi+dpf595AVVTovNAOHrWEmCwgqu5Btf6KgJx9uXP68cEv7uOWwhyI/6BOLce+eqy9HEYrmdlLxDYnOe8wbK4KhCOf1sA9j/RYzIxsq2sZJJsAUwNqK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754652499; c=relaxed/simple;
	bh=z5ZUekvUvpNnLWumH7i0r1l/KVlw1EnwwX2WWJ5MDqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K4+Kvc8W3/+VQ3aYF70g425vAzIaLvjTXXKMqbirPzYQEmBU4KIubYXQnPkQOm8e52nKjmM2L6OoTMO2WBX1nUMkrUuab8JewSU0aFQ6/sQeS59I545HqpzCv0M0tlUY2Bp3t7yacFEeMgfbSvCwuLNUy0wAOT9Vwvei4BrVIG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VbmPTxgG; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VbmPTxgG"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-459ddf83023so12759345e9.0
        for <linux-clk@vger.kernel.org>; Fri, 08 Aug 2025 04:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754652496; x=1755257296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wuJVZzZIQCTzLTzieTR01L1RJwkvyO7UMJraS2W9Ndo=;
        b=VbmPTxgG4Y61wXHUE1kifFFnwgMm0Mb7eYZrrlaWde/WnCbl2/XYjJj6+Lp7B+w0LL
         SvUsT8pWRZUzM+r2JIIVBQUXmOWBhytN05zObJhNHfcSAo6qXRynvpB45PNbQlim0WaV
         4LD9zyOWSl5fsj9t7s7FSEYmMryIuCvwYWhavvzUcJaRQx6J3Qeyj8k8TmULyJnvxiLV
         smOM9IJE/t/0i5X/NAZkENweSSpX/y9O8sxwYeVtttRjL6Qkwun8GuN1zyqzxW9bvZjD
         79t2XHBg4mpqOOzmzxeDozahqOlwqXNA3SFgx8ZMNrdBWyNbPmFLlbzjUxSaW6gWUv9q
         +lBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652496; x=1755257296;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wuJVZzZIQCTzLTzieTR01L1RJwkvyO7UMJraS2W9Ndo=;
        b=OSbQR9sQ3hUF2u15ESr6OGbvGSnwKUW+/WQaPJG6fHzFeoLZpGHXDE8USF/f85HZe5
         60zy9LaqPSN8aT8JFPoobk+S5y6YfDL2+EQc/CPm5BxU6dQSCOTyXx6nvM2o9CDmY9Lx
         5E9k/fJ0F1KGcIz2XJ8YFoaZA285Uxscma+DPpcD7ScwUGtLYa8oSrJu+8SxbeBhgb3O
         8eikwOt0mBdLQXnQL4EUfCzLwK0DN4g2OUtfz2k77ENTLlSo3MV/dAYZ6z1mioeQ2Ugl
         rlqwYLpnyo1tBq7tECw4Qa59z9IE5q0hgUBTaA9FPSojK3LYwsDuxTh3sVN75Rg5Qnrd
         RLpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2kB5ErfP4CF4zzVcigrlhOvUF4IEzaZ1KS7op2IEPyQz/41n1OqvTfkY4cyzyM5JHdNseCpDC44c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN2ky3nJ6JSy3GJW7qBu2qhfohSv4BXMYHmnr9MbxmlmoRck2R
	Co1NyfansEe5cSRUewxdfa5U9gul4LB/VOhPSOATD9bzTxjcml3d0BEfPQctRxPTHKk=
X-Gm-Gg: ASbGncub2GlySLPTX9mvpNd2f12QMgjCPzy64PZCbtALtdcf+DAlYrPTIbWFgFm11mz
	GoNHpoXaR6Z7PPknw2ojPXEVWsJiIt10rzb5ueXvOObG/Mp2xjHX+CF1FRHzCPaCeunBtMyaivG
	IMtgDfg4YPhAgLMBf5Ryi1B3Fyb2STUfuDfWKnUofgFSdwA8uatWRDQ4UoPmith4EAU+ztTYagR
	DtsnuMkQ1iYhngcagPcz90FpOhlCEskUWTG/61x4pxTngV8lR816dYNZSBxCXuRBIO5HbAd2RB5
	8Q98qY+zUHPeL3S5zNFSJqumcWJUn4nPq0b+XmWfw/XTSiCa8cB3qCR94IkgFob66rbAXxabRaS
	fS6S/kF4xHAYwrCaf2yffIadZACg4Egg=
X-Google-Smtp-Source: AGHT+IEaRRICyrF0MfupXKJ2sBoN8+NsjzhBxiQBkAqrwCfw85T5RHBvLEqeXF14peiWqYwm1M7yag==
X-Received: by 2002:a05:600c:3b1f:b0:456:27a4:50ad with SMTP id 5b1f17b1804b1-459f4f3e226mr21968055e9.33.1754652495747;
        Fri, 08 Aug 2025 04:28:15 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458f713eb44sm249864835e9.14.2025.08.08.04.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 04:28:15 -0700 (PDT)
Message-ID: <fa0da331-273a-414b-b0d8-229c6772692d@tuxon.dev>
Date: Fri, 8 Aug 2025 14:28:13 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update
 dma-ranges for PCIe
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
 "mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "lizhi.hou@amd.com" <lizhi.hou@amd.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704161410.3931884-8-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB113464920ECAC2C3CB89DE2D5864FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <7c8c7a25-c373-452a-9fe8-8b2d92ddd885@tuxon.dev>
 <TY3PR01MB113467C09DF7D3D0D7833A6598649A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <TY3PR01MB113467C09DF7D3D0D7833A6598649A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 09.07.2025 08:05, Biju Das wrote:
> Hi Claudiu Beznea,
> 
>> -----Original Message-----
>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> Sent: 08 July 2025 11:10
>> Subject: Re: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update dma-ranges for PCIe
>>
>> Hi, Biju,
>>
>> On 07.07.2025 11:18, Biju Das wrote:
>>> Hi Claudiu,
>>>
>>>> -----Original Message-----
>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
>>>> Sent: 04 July 2025 17:14
>>>> Subject: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update
>>>> dma-ranges for PCIe
>>>>
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> The first 128MB of memory is reserved on this board for secure area.
>>>> Update the PCIe dma-ranges property to reflect this.
>>>
>>> I see R-Car PCIe dma-ranges[1] and [2] maps all possible DDR area supported by the SoC?
>>> Do we need to make board specific as well there?
>>
>> I'm not familiar with R-Car, but if there are ranges reserved for other purposes, I think we should
>> reflect it in board specific device trees.
> 
> 
> Already Linux has this DDR info[1]. Linux provides DMA memory only from this region.

What we provide though dma-ranges DT property is setup in the PCI
controller register corresponding to the AXI windows. It is the same in
case of R-Car (as of my investigation on driver).

> 
> In your testing, have you faced any issue like system allocated DMA region other than [1]
> and you don't want to use it, then the changes are ok??

I haven't currently encounter any issues.

As the values passed though the dma-ranges DT property are setup in the
controller register for AXI windows, and the DMA endpoints can act as bus
masters, to avoid any issue where the DMA endpoints may corrupt memory
specific to the secure area, I chose to update the "dma-ranges" though
board specific bindings (to reflect the presence of the secure area and
tell the PCIe controller to not use it).

> 
> Not sure, PCIe can work on internal memory such as SRAM?

Inbound window is RAM, outbound window is a PCIe specific memory described
though "ranges" DT property.

Thank you for your review,
Claudiu

> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi?h=next-20250708#n31
> 
> Cheers,
> Biju

