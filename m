Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591058F5A
	for <linux-clk@vger.kernel.org>; Mon, 19 Feb 2024 07:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708328378; cv=none; b=AyR0ToiSjDGWTBKbcdjC+e5KrUsdLe736QhZJ10CyoqF5/lbm5uwsVy83vDH0JIcBv/66U2khqPeOqWc7DMHqTGlvyCkTzy07ZJFYFNRpwXhgfYjfpvJ/AWgYChZyeYcf6PdTQrgSnhAl5mw619/CIuu0F3vZKeSCeY1wnGBR9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708328378; c=relaxed/simple;
	bh=TJbq3thR54sD0Wi77iVig095+YH5xo0jhAJ9BMhF3rU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Em98Ojbm1Zb4y8H/x0MRLEy9g8z/GaYtxB9REWuuWD0wyKtb5ZC4tG8PDxAu9HIfnXL7WIBLBO56Faqyl9k6HCe6NoXAlw526IQ6vdRWbELP4aLG3yYmsGcU2+f4oqmdNT22cgZA98OYgbU9ugLN7esRpBnjgxJbvpWV5XxZsjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QDMMKoUZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QDMMKoUZ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4125eabb8f4so12141525e9.3
        for <linux-clk@vger.kernel.org>; Sun, 18 Feb 2024 23:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708328376; x=1708933176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ztvukbsw2DpPqYv6GrnPegXCQAC9j1Oi6plVvewLB6I=;
        b=QDMMKoUZTVRK0dilXQCZcu+/FjOvoyjuTFVl0cqo4krhYmz+4zNEl+kXDY0QtwCKrw
         o0eQG4YLZcZ2/kbOf2LGjAfqH9GFb764//2dZeNd+sBGM4y6Q+dhbNIUbdtyGbYi7RD+
         YXACWNMoXqB40ERO74m0IKZ0PIRb18e5ezWgyN+EnDg5C+dk1UGCMFxsfe1/SQGL7fqT
         +ZjLKX3dARp/EAvTz1oPYdmi2ck+2X3HyD+zBvODEMnVHIqPDq0faUhF+QygVcMfrHnl
         o9XZjpmmuPMnjXUrMaAWKTS2H57XukCPPPS4pvj1e6VNj4TzoCB9t8OAQBE6MtMugRp1
         2THQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708328376; x=1708933176;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ztvukbsw2DpPqYv6GrnPegXCQAC9j1Oi6plVvewLB6I=;
        b=iDar8OfTrs6P7Gc3u2j6/u8pzZQXPaMn60BImr2TPq9ka+uWy0DKY/4cOZWznIfctJ
         TmXoqtRkvvgsBmoH9Gv005/w3V2t2zt3avkhTCgZtY0MoTb2TMjyPrJo+4BYkRK4DrSd
         HgnCVBHC3PkGSGx/yIQxNuLHI3tanSZHM33itIr0fZ2+7jzfZU1PnBhIh7/nJJFoY6/7
         A0IjsUVYzLwTdkpESwbfcDVANm1iHMLFI93iNOhIOwNtJTr3vB0mzMzMH1HUnj9qIWDM
         MLwLcHbp0d6AV4jccAOCqXIQB8CrxU5Sl8mgWPrajkVlnOGah9Yhx2UF2L0cxjkOB9tm
         ILdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgP53RLcKtUbV2bY3zpmPSjoVerpEej8Aw90zHpZySExi8RgujRqlpY8FC82FpRLTSMR7sKsn9sTm5fmvk4p0eSvl4P4kvnni1
X-Gm-Message-State: AOJu0YyT1U3xO64mCetvjmdcak/qegsSvWI+qYBiI60YJ8JPIYByud+3
	ednCn6rHkHrfDPFBfK7URnLLbLrEC4YOqBED8aEADCpdykr65qfQrQ8eGv1tYRA=
X-Google-Smtp-Source: AGHT+IHzTk4jAkU4Cb4x2j5R1eZYxapWDSX9BdPNE/TAg6w2jAWj8XsoaKg0OzZkL2HOPDbGsXDXjw==
X-Received: by 2002:a05:600c:354a:b0:412:5b86:2f2c with SMTP id i10-20020a05600c354a00b004125b862f2cmr3647927wmq.14.1708328375766;
        Sun, 18 Feb 2024 23:39:35 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id k35-20020a05600c1ca300b00412393ddac2sm10715749wms.6.2024.02.18.23.39.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 23:39:35 -0800 (PST)
Message-ID: <c6bea32e-5169-4181-ab42-a8f7f35594b2@tuxon.dev>
Date: Mon, 19 Feb 2024 09:39:33 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] dt-bindings: clock: r9a09g011-cpg: Add always-on
 power domain IDs
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 magnus.damm@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208124300.2740313-6-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVbCYfaM6Zi5AZhj+yc8vySFdCDFF3x1rgbV9Y5xh4LSA@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdVbCYfaM6Zi5AZhj+yc8vySFdCDFF3x1rgbV9Y5xh4LSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 16.02.2024 16:03, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, Feb 8, 2024 at 1:43 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add always-on power domain ID for RZ/V2M (R9A09G011) SoC.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/include/dt-bindings/clock/r9a09g011-cpg.h
>> +++ b/include/dt-bindings/clock/r9a09g011-cpg.h
>> @@ -349,4 +349,7 @@
>>  #define R9A09G011_DDI_RESET            93
>>  #define R9A09G011_DDI_RESETN_APB       94
>>
>> +/* Power domain IDs. */
>> +#define R9A09G011_PD_ALWAYS_ON         0
> 
> RZ/V2M has many more power domains, but they are not controlled through
> CPG_BUS_*_MSTOP registers, but by the Internal Power Domain Controller
> (PMC).

I wasn't aware of that. I'll be checking it.

> 
>> +
>>  #endif /* __DT_BINDINGS_CLOCK_R9A09G011_CPG_H__ */
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
