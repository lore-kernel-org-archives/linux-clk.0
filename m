Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FA61CF9C
	for <linux-clk@vger.kernel.org>; Thu,  4 Apr 2024 06:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712212458; cv=none; b=In3VqAZbLH2PgoETnj6ssdKWlE/SpN4LOVS+o/01S6F+X1vmPPvJsiOFY29wpiljR+XIDpOOvODfg4XXt2vBubf/rz9GsDdcfQk5UOwmH9HZ8BBEr8ptaJvnO/Tj3BZbj1YHllijRBM68FqNlZZV9ufGSUWQEkG7wXOU8Keal4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712212458; c=relaxed/simple;
	bh=BTYeJOUKtjiPMDXZczAfTqsrxlPjGuCMwC22A9iWoq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDWX4RaaUzB5l2ESW9mHR8XUEoz1YcLwrehqRIpo4h7WFdqugPT18Azx9veKiucpcgvoDsxGS0QbArHTKxbUtgcpaihyeCpg1yKMfRuL4SuxXCf308BaGWPyOr6EGqU8rBySNEkDGU4qbvZzRI5+JrOyMvQmNsslvjom/C8WRJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B20i/5Qi; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B20i/5Qi"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516c403cc46so1014789e87.3
        for <linux-clk@vger.kernel.org>; Wed, 03 Apr 2024 23:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712212455; x=1712817255; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pXxPGEJDIb+ns+ZarG/yOP2pf144tdvQi2hFIPyNPiU=;
        b=B20i/5QiK84oEyNDNlm23BY/jW+PeRM3Y2kiO2PtZ/SMYg1CKYceSg2IUACLxPe9jw
         5kbQmwcnzMBhvbNDQGO0+KisSUeNLxIlz3YEOCUwq6OVmWGGouxPXpkEBgZkCA7phxYs
         YiuWSQGHCxCnwYtQttq/Aqy/ookWuqisFPLqrDpFA2kQAkmC3cjUvdj/m9+hyQqyTnqR
         3RrihJSe8cUzFlefZ6/EoEXGoJasy4WRM1VwCQFvlRes5twpf5GW0wzi7fmdWC3FgJd9
         wGWFwVpyFuDluyDya+nYeqBfXFbzt6OCyjcaXK2QLI6S55w/j2kVB4u0YRl9+p2gvuri
         c2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712212455; x=1712817255;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXxPGEJDIb+ns+ZarG/yOP2pf144tdvQi2hFIPyNPiU=;
        b=lj2eT+qXqCIym+CWo8qrbK5zSHTAjhJkCVI54CR9kewrRIm8O6hajtsxSREdu75Hf5
         Db1owQWoQWEQvuBbCbAMPTPeWtxvjmdVREMhvAIYjBUca12Z3kAXfW3sEU0eL4MOPcmC
         +XZY6uH67sb3E3hSEWmmh68/LBYd3of2M3liAlv8n2cm6NXtj04IXufWJJoa6+2dr4HI
         i0x/wPQhaG8KemMZJFTU664rRr5/PiaqgMBkMTFamzZw5HSE0M4ED8cotmL8Vl+sqrtD
         0PfP3rf896PJJ7Otiub0fC7LA2l3gcbhN+gXV4tzNhN0J7oIm/D0RqYkCvBzGcyQqSFO
         PyUw==
X-Forwarded-Encrypted: i=1; AJvYcCWcGMBKZv9FOL5wKM2R3lStpezDTe4FSncFT5OyrXJG+ilsulFjHxZv9rR5rx13AzTnDfTUQCPye4dEXZ3jR5NKIvP+rRF+AG4+
X-Gm-Message-State: AOJu0YzVtAwATuFnSAM8jhETUGNZsLjcERI0k3KOVrMOGUwe4g0Udt6O
	Gfzj3/IHYPqKWkw4MP3RnveFVrf8IUUsKnl1Otgkh/iFDM16EXdJAGk8ceaUjQ4=
X-Google-Smtp-Source: AGHT+IHiNNOWUeZEnE9jyGK9yAVW1LivooJ+qXp8Mp8SiKZ/63Lll+dXgqnNHlbOJ0eEEaANa5L/6g==
X-Received: by 2002:a05:6512:36d2:b0:515:a9d5:aab6 with SMTP id e18-20020a05651236d200b00515a9d5aab6mr1196646lfs.18.1712212454932;
        Wed, 03 Apr 2024 23:34:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id 27-20020a170906311b00b00a4ea1167a52sm1650947ejx.25.2024.04.03.23.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 23:34:14 -0700 (PDT)
Message-ID: <65e7617a-9e7b-4dea-a98c-31502222543a@linaro.org>
Date: Thu, 4 Apr 2024 08:34:12 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: airoha: add EN7581 binding
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, nbd@nbd.name,
 john@phrozen.org, devicetree@vger.kernel.org, dd@embedd.com,
 catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com,
 lorenzo.bianconi83@gmail.com, angelogioacchino.delregno@collabora.com
References: <cover.1712160869.git.lorenzo@kernel.org>
 <1988a4460ed327bea7841f6a0f3a756dd7cec4bb.1712160869.git.lorenzo@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <1988a4460ed327bea7841f6a0f3a756dd7cec4bb.1712160869.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/04/2024 18:20, Lorenzo Bianconi wrote:
> Introduce Airoha EN7581 entry in Airoha EN7523 clock binding
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../bindings/clock/airoha,en7523-scu.yaml     | 26 +++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> index 79b0752faa91..cf893d4c74cd 100644
> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> @@ -29,10 +29,13 @@ description: |
>  properties:
>    compatible:
>      items:
> -      - const: airoha,en7523-scu
> +      - enum:
> +          - airoha,en7523-scu
> +          - airoha,en7581-scu
>  
>    reg:
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3
>  
>    "#clock-cells":
>      description:
> @@ -45,6 +48,25 @@ required:
>    - reg
>    - '#clock-cells'
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: airoha,en7523-scu
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 2
> +
> +  - if:
> +      properties:
> +        compatible:
> +          const: airoha,en7581-scu
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 3

Original code had here issue - lack of description of the items. You are
now growing it. Please instead list the items (items: - description: foo
bar .....).

Best regards,
Krzysztof

