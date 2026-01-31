Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DC4318EC4
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 15:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769874689; cv=none; b=QTXdldMVoJKIFGFStZ5rtgW6CD18jvtXp7uFj07yOST/kGc+J0yVIN0Zgdd/2h1Bkpi5ulkIWKD09dypKqmzQ7vir3y8WpICMWioBkqG8f4uU+J9a61QGf0ETY4P1E958LiwbC9QF5W+FHRErFR/ssaHjARnKLXBhoY5UPO5mvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769874689; c=relaxed/simple;
	bh=TVk5ElutLIGUZzribaf5OoNHg/tQPy9b2l4SVewIvpA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=G7Vd9J/2eC+Y86xd6Pi7DnDs0t7k1cnBv52Be73KADxFv3R2ch0qTOaFJBZOe5HDg5GGtC9/1PFiF5UkrW7R+3+Bc1YrxR95YxW5CaWzTfdNHVtnUN6PmOGI9lyXkatMyehM66wALm9740mS+aePAXAvjSbhOCXoRUxVry5lVmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Xb1PpMHY; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Xb1PpMHY"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso27572275e9.1
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 07:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769874686; x=1770479486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dVDUraBCahPU+SZAz6Hk9ua2W/itIqCdoSUr1zPU1VM=;
        b=Xb1PpMHY8p9Kke8j9m3C5g2qQbVqC35/xXer67dvX1qRZgpLb3i1bLXNHXnNju6H3T
         ZKVe666vYLupD/WHZtbath4N6y3ZR3kYxwPZIHKLg+9nfaM++HXdKPy7em1ZBtRFpqVH
         thv8pkzExQjE9PlLdefkfm9xNhzL3keu+/keF3ZwmrNxp625xXtTliXs3342sPbJ/Nxe
         NEnIsFhBB/nMgcAvCwbvaQ5PEO3CwpVu1/UH4/lDk5Mkry6lyoAMjGsdbkUoI2ckYUR3
         PSLY8EyvZ9OpqbxIRyVTSry9DYbcsmyWeQFHX7GXZ5FlnpJSP3cpwPEBDSv4Ki4KuNuR
         bujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769874686; x=1770479486;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dVDUraBCahPU+SZAz6Hk9ua2W/itIqCdoSUr1zPU1VM=;
        b=k5J20G4Jwy9UyQrhzJ5ldjRsYzpJXnEnsCAF/cqte8JOEWQMyK1GtHhMKziH8+8O8B
         zK9dNrCCbQUXC9vxC4428MPBKHx4htwcCHj7RgLzQ1EdSFVY41xN9wzpFvgXLv+5R/4e
         TrzyoDjNU0R2DwowT0TRmYF1/R1loDATxyq5sxTZhEBoCia9sgF7qSwRVRokhvraVwiC
         uioPAzXMvuS8EdesrF6A1ieGcvrqyjS+uQdQ6vUdLYSgdZ7euHAs3tnKTNvZZh0JzxSM
         fMoUNz62ObFEfuRLyft0JBIUeZyZjfMmU9GWUobKv9zBopu2cSZUTl+6UDjXifqwvGTh
         S2dg==
X-Forwarded-Encrypted: i=1; AJvYcCWzmtfHO1y6yrQ1agGbb83mGNLBtoDblarPPHBGcRM0koUYNvqvmghwpvz0AmjVIs7yS1KB9AM2+jw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYF6IccCB9A/0zqMzM6JRXTurykp+poCa4TrazWqTxxh9NYSCG
	9YJFXbuAGGeOSU8jb5yLcnxEbs/TmAzzOPoZ5EWsmNyeMDUMM47OIWQlqOq2uT/qbkI=
X-Gm-Gg: AZuq6aK0LbTxx31S1woZYX6DyWSNXmJlRzZMbm79I6UdVHtFpSjW6M/MjOPX4w0ljNC
	FNl4cXJ7uYQiYpIiu3G2tsymFKc3eYdN9Cw61M/SQPk9XTgB4xJ53lxSQclErIVBoxAHTx6iFlp
	h75ncKxQzHVLbGsN4n8u0NE7VmkTM6ubJTu2PVgV6NzZBpKZezC0r7Ia9iLDqbvMdAcDxJjX7+X
	ehMLlUg0jh7nFMDvUnXeX135lNex2YwbgCycKm3xchWYHj/zpy3cwzgyR9xY409mHoE7t7gabd4
	1CYnI9c/PYIjad05HHh/YfsNEolYJtD6qpMvnEPdL4woPYu1f+gZBVHhfufjqHefBZ8Tq7R2bHh
	kgv5dKZCwhA2Xfvm8Gxe25V3auzquNeMA9Xef+xz+4MgLzuieKrTCTKJLJkWpx9VMAa6oDuaQmA
	p92ODIsB8pz6dRKkVsDQ==
X-Received: by 2002:a05:600c:3b85:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-482db49b0b4mr84546485e9.16.1769874686453;
        Sat, 31 Jan 2026 07:51:26 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dbd3953esm56113895e9.4.2026.01.31.07.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 07:51:25 -0800 (PST)
Message-ID: <b9de4cf4-c4b8-4f5e-9cd7-16991bda439b@tuxon.dev>
Date: Sat, 31 Jan 2026 17:51:24 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/19] dt-bindings: nvmem: microchip-otpc: Add required
 clocks
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-3-ada@thorsis.com>
 <f406abde-c7d1-4ed6-b7dd-5336956bc795@tuxon.dev>
Content-Language: en-US
In-Reply-To: <f406abde-c7d1-4ed6-b7dd-5336956bc795@tuxon.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/31/26 17:47, Claudiu Beznea wrote:
> 
> 
> On 1/20/26 17:44, Alexander Dahl wrote:
>> The OTPC requires both the peripheral clock through PMC and the main RC
>> oscillator.  Seemed to work without explicitly enabling those clocks on
>> sama7g5 before, but did not on sam9x60.
>>
>> Older datasheets were not clear and explicit about this, but recent are,
>> e.g. SAMA7G5 series datasheet (DS60001765B),
>> section 30.4.1 Power Management:
>>
>>> The OTPC is clocked through the Power Management Controller (PMC).
>>> The user must power on the main RC oscillator and enable the
>>> peripheral clock of the OTPC prior to reading or writing the OTP
>>> memory.
> 
> As this was not mentioned in the previous datasheet versions, the current driver 
> don't handle those clocks, and it probably worked as the clocks were enabled by 
> bootloaders, I think the clocks should be marked as required and this patch to 
> be propagated as a fix along with fixes on driver and device trees.

Ah, wait, you can't propagate it as a fix as you don't have the necessary clocks 
exported in device tree in the older kernels. And you are just handling it in 
this series.

> 
> I'll let DT binding maintainers for the final decision on this.
> 
>>
>> Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a- 
>> b5d8-6e2fd5e08c28@microchip.com/T/#u
> 
> Why this link here?
> 
>> Signed-off-by: Alexander Dahl <ada@thorsis.com>
>> ---
>>
>> Notes:
>>      v3:
>>      - Removed clock-names (led to confusion, and not used by the driver anyways)
>>      - Removed redundant example
>>      v2:
>>      - new patch, not present in v1
>>
>>   .../devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5- 
>> otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
>> index 9a7aaf64eef32..847dfb67c6b72 100644
>> --- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
>> +++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
>> @@ -29,6 +29,11 @@ properties:
>>     reg:
>>       maxItems: 1
>> +  clocks:
>> +    items:
>> +      - description: main rc oscillator
>> +      - description: otpc peripheral clock
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -37,6 +42,8 @@ unevaluatedProperties: false
>>   examples:
>>     - |
>> +    #include <dt-bindings/clock/at91.h>
>> +    #include <dt-bindings/clock/microchip,sama7g5-pmc.h>
>>       #include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
>>       otpc: efuse@e8c00000 {
>> @@ -44,6 +51,7 @@ examples:
>>           reg = <0xe8c00000 0xec>;
>>           #address-cells = <1>;
>>           #size-cells = <1>;
>> +        clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MAIN_RC>, <&pmc 
>> PMC_TYPE_PERIPHERAL 67>;
>>           temperature_calib: calib@1 {
>>               reg = <OTP_PKT(1) 76>;
> 

