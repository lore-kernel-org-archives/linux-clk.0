Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930BB44330D
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 10:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784111966; cv=none; b=SZbou2o401ulNmjJZmz8zTt1IPcW+snoo1qSJlql/ofhm8Ho0lESX7FCO2UfFtFoVk4MtgMrsRyWL3MIzg9pxcdQzH9i61jv+SXgfYDLcoMUypSkkPPaRrvExXYl1DMj/XDQVqhbD/L84R8rA7DTpAPfELCZRLVrUR80H9P/gWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784111966; c=relaxed/simple;
	bh=pyy8Wvft0PtHEMdBZYasTvd6yuUn0vslzW1iGDS5zQQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cVQRaDm5dUDjI2rHcXtDE+h2xmgbVUWbl7gTN/FzvJp2eI17n1c02BaFHMSlLphcd3TeOCCyFvGpNSwbU/cYpMOJIIP80U56GgC/twt3zkomSZqyXpQeYFQDsJuSb+6Tpiyx9JIXzgObVGg9Ukv5DEWlXrct2jraxVSbMGLW1I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrOWi2cp; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrOWi2cp"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c733f15aso47458065e9.0
        for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 03:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784111963; x=1784716763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GWEo/wm9mgv9xJNzAlLuz4CqrYAt+ypm6bm4tma5o7g=;
        b=FrOWi2cpV5C2Qp3E1lpvuo++2r93UIIuaFvvARTuObnnJR20RnUoC2FGciMmRCDMpb
         4meukRuT/nL3bxaXD/XwoHXraWU2xscqrb0/CIUTxcfmtCzvpY+3lXhbUcuQGOTTvR4K
         aoNR1it+/bfFJGebw2npGUTrh7s+hzemvc4P+MVjBEe6GbZgFZAelMMp/iBTtQDvn/IF
         aRrxjKx/C9411+muYLwtrK+JoJU8IGaGCNGwly85jJYE1zauWyKq5qo2wqeqfWllp1oH
         eJNSdqJrdWIvqm5SspIMz6fHpmCeKz0929IalVhqUs4UoBzhUJXIHEDBA0jtAd5FAjWO
         EvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111963; x=1784716763;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWEo/wm9mgv9xJNzAlLuz4CqrYAt+ypm6bm4tma5o7g=;
        b=hvfsOLj7aPbU3yVJUhR/KO7WBR6IHNcVGVSml4bQWDFnRBlN2hzGd/37RpHY98P6zB
         DFhsS1RFSaXVw1FvqVerXETki11U3Yi2cNlolOO9ciVmrVdV/JM4clDEWdjl55M3Xzt/
         7K0/TEtMhVWdq7to4vUQJxndRuVAAlwVnhBf3p6to5B2Aoyc0y2Cp60lCQ2c59ARF2A7
         biSuPRgUGj32WVzZJkmzUnw51Dskj815a7m1qZpcPpX2El8J7/cF79EIWpWNN7pvI14w
         GZ7NJbZp+dPlwE/YllMk0SzcTvGf4JDXRPPSXgeRvv2uEUU+5rDBeEok5VKw7y15rqZ1
         ylMw==
X-Forwarded-Encrypted: i=1; AHgh+RqgVbhkB0SBY2nUHD59qY7PlNK+CzLh9iX1PGwbdYPgY7dOPK1YF877ZYlDWzBWqpARAwQwqHlC25I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoSycwqZz7m+Twq4ZNEhJCrGPQh6/L+dVMgmqMj1XGbtNn/DK3
	WN3bAfYBXexBBFNzXH34E5zKH8SoGscG+A2sCImcCKH80N5qpiEgWYt1
X-Gm-Gg: AfdE7cn0/SrmW/4aZzxp2JZVsBfvLNJCE5HzFaSZv+R2singADB53tF8lmoQjk7o8l9
	KqgqNpMHjw4sAOHZsi96LelkDW5vmmqO9oSYSFZKh777uO9uG8SUda190lgGkM1NPNNYuo50Kjc
	i3znyJuZLCjfwSh6iv4Gn/zWq6vRR5I5ZliyvWeMw9fQDRkUnxYKVMGJbgzUyb0Nr2RVwshQFaA
	gR6ku+bvb6vx9RGb0GufHRecciGxpU9l156m2DkERTgnZbVTpojKi1IR1Wb3IEuxUkvEJUsKZ7p
	tY/RhmWdAY4V72X/dwKdKBAlpkXDicLt4IyTJ4QLCWayty4oGuvKX8tsOThvYkUFTNrfGXRi8oY
	MDBeyn9uUuOc8f6+/W6+Lj/vaJQW9ZXQNPkJaN8TjwmimkH9UUO1FPqVRpOlgbq/IlFhTQeGX0M
	3weUDbaZ9gg8ki12StgUsuMj3s9g==
X-Received: by 2002:a05:600c:a00b:b0:493:f261:d295 with SMTP id 5b1f17b1804b1-4953f1552bfmr8301795e9.4.1784111962582;
        Wed, 15 Jul 2026 03:39:22 -0700 (PDT)
Received: from [192.168.0.7] ([86.124.200.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm208295205e9.12.2026.07.15.03.39.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:39:22 -0700 (PDT)
Message-ID: <262424cd-a5b9-49f2-84af-f9449d49f732@gmail.com>
Date: Wed, 15 Jul 2026 13:39:20 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: Re: [PATCH v4 0/7] Add versaclock3 support for RZ/V2H
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, geert+renesas@glider.be,
 magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260302165441.4457-1-ovidiu.panait.rb@renesas.com>
Content-Language: en-US
In-Reply-To: <20260302165441.4457-1-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/2/26 6:54 PM, Ovidiu Panait wrote:
> 
> Ovidiu Panait (7):
>   clk: versaclock3: Fix NULL pointer dereference in error path
>   clk: versaclock3: Remove unused SE2 clock select macro
>   clk: versaclock3: Reference parent clocks by type and index
>   clk: versaclock3: Add per-device clock data structure
>   clk: versaclock3: Prefix clock names with device name
>   clk: versaclock3: Add freerunning 32.768kHz clock support
>   arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add versa3 clock
>     generator node
> 

I wanted to follow up on this series from a few months ago. The dts
patch has been applied through the Renesas tree, but the driver patches
are still pending.

Please let me know if there is anything further I need to address for
the clock patches.

Thanks!
Ovidiu

>  .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  25 +
>  drivers/clk/clk-versaclock3.c                 | 618 +++++++++++++-----
>  2 files changed, 481 insertions(+), 162 deletions(-)
> 

