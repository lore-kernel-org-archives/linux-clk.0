Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16D427FB3A
	for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 08:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768378629; cv=none; b=bMgO6GrAdgLzxTmFIF03sZu6CAAcLRoQPn26mDSPPk8bVhi9jyhMsDLaOiQUmR92D8jiA6QwjN0JXCIn3+VuyXUgOhYqXz1XzW1TCcjEiNB60iZrkeaZRxTLbeGznlQ9MvQWoAPBz6w80C9llJbG3PnuS3v+eT8Td2nX3WOJvmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768378629; c=relaxed/simple;
	bh=o5URozGNlcTJCoUm4Mq2kJtCRIFDHpPaYBHu8P+apsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D01KJXHAibXqeNUW+96WV776R15rmnQuojlF6SONpepT8HgTS4gnX8yrIcvYlaQJEw881zsj5joOCtJIgYj5XJcgbe6qUmB1hki5+WhBk9YDYBAVHmWE+mZDeGdYlibU/8QYj9mdjSimHHz/feflXJSwFKYJanEK5gpTFoNVh4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HHNZyi4h; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HHNZyi4h"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso34093505e9.2
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 00:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768378620; x=1768983420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rdiAvhIBSkRBz7twMnAqXfiNrByqG73RL/D6sMKeEGU=;
        b=HHNZyi4hc9y+JApGqSROX7Y8aOukpnS9ItxVBFyIelltRrhL8lW5X5isxwPuJCgUGP
         xMClHs7uLwJ75kuZx2y1gsUxqDb4wTKs7vdOL0SjKQZQ28072mtp4POSEewP3adJT1ai
         QXWwVipsjcS044mepsn3IVkqPxfOuFAEduH9aBrqy4lrasIPPLGqNkXHEOsJhUwPI1Hs
         C1gL6EnXXdzTPw3zRsUUj54hhMxgS4yKegebMbZOI4GzoE0o8/jPEZZrjvDFU5oHdS0k
         3+qMVowdouDOvz+syicD5FBrVNrsk8npGrqCfpbsZ1e2rajTSJ50EkcWUj3rI4fEYDkm
         PEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768378620; x=1768983420;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rdiAvhIBSkRBz7twMnAqXfiNrByqG73RL/D6sMKeEGU=;
        b=gZOrDD6KQMl0VcOC7npqFaNPO/VRCQMZcdGp+//pXGg/KEVIdrptmN5uQIV5UdYsET
         srKpc/FxSmdj+QmGajhMXxu24lR1X1JcBKW4YQShaV3Uh4zg4J3lhshTNTJujrhV5aUe
         aHg37vma1EOI44hkQNZ4xQrCghAWx+Qfypc/KeJc793aJm9vSYi0HlhNeV7q8ZAUcBt3
         aClUZ1f49S3QLBvM8w0Gnu2Fl88b2PeY59ORAYNx4i8iurUgtLd10vm6i0tFTLeE2RLh
         RL5j2uVrfBTfrCug9UN01XHJ42vltgHscyeL6NgtjaLKnbiQQq6A8mQ4aAgKS6+Ygisa
         AkaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrvudfkQ94bdezgTH4jX/VYoTqpQndijm5YJBqlbsYq105WJgqrN+r9o5H1BNJh7zVnwpT8VBl1CU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNKaxbSzcP7Q6JCvl2m5H6Sg/RwQGz+LnaSU91I8INobkX8FWA
	1mzF7wUOTLVk7qzoPkN+uNiFVszVzgfHrFqoZBXDkUq38P65Bd1YgITl
X-Gm-Gg: AY/fxX7AqR/AxEbt2SMOxnUk6iJQg0/jisu923XvBwy44tM3oRp9GueuHXocXrTEQ+w
	lppG+RpuVqvy0uVn0vsgv5EKd1Kg+BLN+dFJ02Fb7tWtNptGBBSLtkkdirqgRKFBQEp+y7T1Djc
	uO7WFvpFOHZU4BQSsHCKx4ZsFJ1TcejRBQI9jHJ1R6hn0EGa9naEl48d30ntJW/TPHf6cTujsd9
	FczfMSTIZTFn3uw+xiCew1WgmwfM5ncql68tegqU9P1vT6T0ovrB0J/NrCSfdBbhl2JHd6VpecI
	gVoruUu2qA8ZtePOUq3q6d2AIssaXpsI2a8T8yiH6QQK70kNCzZgtXA4jfeGi+5B5VzlhIKoaT/
	8kAcs19gRgY+f4RudgtmCbSe0EiAgU/RorUYz+V3WIi+tOVOH+eKzwTY3y7JSTe0hibbYBsdYep
	JVl3jsGUGlZ6h8PsPcDtivGICT+9EZz3MiuFtS5KjT6SesNpT9DgcsiHSKEdYL1rwFd1Y=
X-Received: by 2002:a05:600c:c0d0:b0:47e:e78a:c831 with SMTP id 5b1f17b1804b1-47ee78ac9e2mr3070835e9.36.1768378620011;
        Wed, 14 Jan 2026 00:17:00 -0800 (PST)
Received: from [192.168.1.27] (84.121.134.198.dyn.user.ono.com. [84.121.134.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee578d37esm15572945e9.1.2026.01.14.00.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 00:16:59 -0800 (PST)
Message-ID: <0eb5086c-39f1-4cf3-aa71-440036930052@gmail.com>
Date: Wed, 14 Jan 2026 09:16:58 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: clock: mediatek,mt7622-pciesys: Remove
 syscon compatible
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
 ulf.hansson@linaro.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 kernel@collabora.com
References: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
 <20260113110012.36984-2-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20260113110012.36984-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/1/26 12:00, AngeloGioacchino Del Regno wrote:
> The PCIESYS register space contains a pure clock controller, which
> has no system controller register, so this definitely doesn't need
> any "syscon" compatible.
> 
> As a side note, luckily no devicetree ever added the syscon string
> to PCIESYS clock controller node compatibles, so this also resolves
> a dtbs_check warning for mt7622.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../bindings/clock/mediatek,mt7622-pciesys.yaml        | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
> index 9c3913f9092c..c77111d10f90 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
> @@ -14,11 +14,9 @@ maintainers:
>   
>   properties:
>     compatible:
> -    oneOf:
> -      - items:
> -          - const: mediatek,mt7622-pciesys
> -          - const: syscon
> -      - const: mediatek,mt7629-pciesys
> +    enum:
> +      - mediatek,mt7622-pciesys
> +      - mediatek,mt7629-pciesys
>   
>     reg:
>       maxItems: 1
> @@ -40,7 +38,7 @@ additionalProperties: false
>   examples:
>     - |
>       clock-controller@1a100800 {
> -        compatible = "mediatek,mt7622-pciesys", "syscon";
> +        compatible = "mediatek,mt7622-pciesys";
>           reg = <0x1a100800 0x1000>;
>           #clock-cells = <1>;
>           #reset-cells = <1>;

