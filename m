Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC75328B56
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 15:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769874431; cv=none; b=tJMTTT4zMG5+hUpO8DIqBuW+w1kwhfPguRjkX0lBCIjXf6CUGOvOtufQw4XcXfqvrgNwyKLDRQoYnIPIf/nA+henswnu+1EmbHWUuRYXWXQd5yK1lJGseTAOCI1XjZF7qXFTWnC5HuNtVJVGMrX9BGYhL448zGyKnBz8E3NqhJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769874431; c=relaxed/simple;
	bh=w/+oaKLap8ukpggiur3CZXqekXweHxIJ+9YUIZvq/mU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qy8/RTEfaPswmG6cjO7dy7LGTo/PDkuGldMYljDcCMwqjUN4/Tm5R4qXF56O1ysk0cP4s8zKhgKBVc2eZEhUvneiHd0+QwQOwS+39GBg29Ovl5p1Cqr5PXM2IS2NlKdneDTBqodvpd35EGG3FwyFa5aBO+OCwFBSKr7+rbgMSeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ZY3gSt4e; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ZY3gSt4e"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee07570deso25698645e9.1
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 07:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769874428; x=1770479228; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bL7VWRVbzv/1ns3vcMzexf+AEseL3f6DgUbURN/e+QA=;
        b=ZY3gSt4et7nB5A2Psty+5QXZnZlyTD9/mrVuCr0S7+jNXz6G5LdeExnr7fL4/8LKQG
         Fw9nifH2M8MP8zTxX9CY5pS8NRUB53VGrH1yM691gr9u24HA4IX5HJCIsorz16mhTDCI
         EWh8jTzd/+yCr7I5SPT0ojutIgCZloV9NLB2coyKta7jIT+tW5BAgfFSEtuFW7+RLG0E
         ehkBwtJFCxspmukrewQjfGblxjlRBqhtXpzT1R+SY+7GAdHqeVbAXPGp5A+2twvhACpZ
         HV80wG3sY2+c3hrX5d7XBIB6H+ore/olfWOS4cZ6c4Z32f3iMCbBEm8Sz07fTBAh3JNg
         Gf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769874428; x=1770479228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bL7VWRVbzv/1ns3vcMzexf+AEseL3f6DgUbURN/e+QA=;
        b=Lj3MpcRXUcfvJhZd3JTgcVQ3aS6xAcJaVVMW+vfA/B4dHv4OEu0eC/4Ro9C2w51Hdf
         JmyjIqb91GG12xrTEBaRIOyi4VQDx1PmEaMN1c3FWKF2wutT2w4ig6usqAEQnMR3VsaH
         y6UM0HlsQhGYtzR3WUFtEvs3sM7n5s6LF4eHQt6tosU/Sqhh4z6UJpKLfaLPbzGlqtz6
         jj6YgRe+9YaBg7GwsClEY2lzLmsRg7VoHyRymyIDiAcnC04xcruWU1LcD++5yqGqA3Zv
         QcpEjMW/1Ekfd1HLI5LYlcDWNBQpbbeP16GxbnjQGZGCSK0P+awibLb+N9/u60CNHgiR
         IWHg==
X-Forwarded-Encrypted: i=1; AJvYcCUna2+csKSr7A1195fdBSlbXB7oLbxcWZykZFo7Eb1HHuUMNPYAtpojra5GKOz8LM1R+4nYh+tLZvk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4YtCe3dLEQU200VkKbCctJdPHxB10tcgMlP6RAcMiC67RxH7a
	05UbnBvgdPp2pudW++CkpBzK5nxEuO5q5sxVGknZQtVI+LtcXUTNyH3LLR5Ds7oLgw0=
X-Gm-Gg: AZuq6aIaiYyrwPedLkt06rFe3UAuY58J3dI+6aMRfpK7ChFpw3qwIJJqHN0tsVJ0C07
	CwziPgBvZTqm8REauYRe+YAmPJFgqoGspsXUDWKj+6XXhzFFGRO58uXjbm0+O2N3OwYMFv2p0FD
	gyEZjQJEc02f+dvgcwSgK4IyR+APFlMR5Zv1Qt9pO51QU+3JA8vQBaLr5OShat32lbQXKKbMF2J
	VD7CKUXQo+uhrT/fQLnLglQ9sxje/1gwVx2vBtIygtYgKdpt2qzvWR2mxVKxZbn0Pxb9hrDknBv
	HxsIqsGIMuM7iQLOHCR0qoORlQ8RDxeLwNpzYrOixI55eY9KUvuEUeycupB09rtuW9U+bsbFa5u
	aZGxnXeC3WpReknQ/KagtS0CGiVAOfob2epKyOmuoJHr+k8t2xVyXOcKOUdvmrvvZiXbN9/2313
	vAqblvszOna3uTp6vbnA==
X-Received: by 2002:a05:600c:4443:b0:475:dd8d:2f52 with SMTP id 5b1f17b1804b1-482db4a317bmr78541975e9.32.1769874428509;
        Sat, 31 Jan 2026 07:47:08 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e2973d57sm40798865e9.18.2026.01.31.07.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 07:47:07 -0800 (PST)
Message-ID: <f406abde-c7d1-4ed6-b7dd-5336956bc795@tuxon.dev>
Date: Sat, 31 Jan 2026 17:47:05 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/19] dt-bindings: nvmem: microchip-otpc: Add required
 clocks
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
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260120154502.1280938-3-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/20/26 17:44, Alexander Dahl wrote:
> The OTPC requires both the peripheral clock through PMC and the main RC
> oscillator.  Seemed to work without explicitly enabling those clocks on
> sama7g5 before, but did not on sam9x60.
> 
> Older datasheets were not clear and explicit about this, but recent are,
> e.g. SAMA7G5 series datasheet (DS60001765B),
> section 30.4.1 Power Management:
> 
>> The OTPC is clocked through the Power Management Controller (PMC).
>> The user must power on the main RC oscillator and enable the
>> peripheral clock of the OTPC prior to reading or writing the OTP
>> memory.

As this was not mentioned in the previous datasheet versions, the current driver 
don't handle those clocks, and it probably worked as the clocks were enabled by 
bootloaders, I think the clocks should be marked as required and this patch to 
be propagated as a fix along with fixes on driver and device trees.

I'll let DT binding maintainers for the final decision on this.

> 
> Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u

Why this link here?

> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>      v3:
>      - Removed clock-names (led to confusion, and not used by the driver anyways)
>      - Removed redundant example
>      
>      v2:
>      - new patch, not present in v1
> 
>   .../devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> index 9a7aaf64eef32..847dfb67c6b72 100644
> --- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> @@ -29,6 +29,11 @@ properties:
>     reg:
>       maxItems: 1
>   
> +  clocks:
> +    items:
> +      - description: main rc oscillator
> +      - description: otpc peripheral clock
> +
>   required:
>     - compatible
>     - reg
> @@ -37,6 +42,8 @@ unevaluatedProperties: false
>   
>   examples:
>     - |
> +    #include <dt-bindings/clock/at91.h>
> +    #include <dt-bindings/clock/microchip,sama7g5-pmc.h>
>       #include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
>   
>       otpc: efuse@e8c00000 {
> @@ -44,6 +51,7 @@ examples:
>           reg = <0xe8c00000 0xec>;
>           #address-cells = <1>;
>           #size-cells = <1>;
> +        clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 67>;
>   
>           temperature_calib: calib@1 {
>               reg = <OTP_PKT(1) 76>;

