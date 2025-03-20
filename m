Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD7F3D994
	for <linux-clk@vger.kernel.org>; Thu, 20 Mar 2025 22:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742510358; cv=none; b=BIq+4HVGfgdpYf2HgwzmYqdBzuhiyreWPXAudxK2aKBt0NZUe2aWgcnHg4kaV98wOXLAfEkTgxEquiPb87pNKLmeayHChAyS8iD8lKsDiaA+rTu1/Dg0RaT/nbVZyh+s3sDCteT/3tdPVn124CDhPpVn8bkf9iTakn2AIycnqS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742510358; c=relaxed/simple;
	bh=j8hDLkAQI9+JmAMX0TJqZyvjUEbu1kKiPGbRw7hGyE8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=rUR7vVz4UJAt+XiW/lQ+a2q7C31gFO7S9ZCU+MW/5sM5qNWGBqi9yRgN6yEkq5K5UcAM9hfRdCvXtwYJEjM3hhxJarBwww07Kamm9e3s0beULsdjfDi5Vaa4t2e5XPFrb3I7+7u8rJbe/XPJFDKazE7EZJYbCjbHfrpZKf/QYRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=U8axf0W3; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="U8axf0W3"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72bbd3a3928so827135a34.2
        for <linux-clk@vger.kernel.org>; Thu, 20 Mar 2025 15:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742510356; x=1743115156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0fpBn8OJHb2DipzRLEI+UAj/Fv1bNkdtkXE17lBcc20=;
        b=U8axf0W3geH9bU0a8/oNck3oKiFq3/mi9h4L6FVu3iX0GulN9b98p2y3p4zai39R4G
         6aawtdLGCsgHBHBwLVhR7K5AMJ29n5ZXpwCycSy2qKI4Dk2QlFKpJ3ULB6Krlz6yQXfK
         BeEadLGFvPZ7btl9qgD5RPkBPs005+eF0C1Zh6frnG8dBvEQ84GkW/O0oRQBLPKJp/tw
         7OkANh/QZ0J3J8FPYO/4rMF/Kcy1zO7iy7QbP6sitooh4t9okKre/PeBTz24kzNgx9om
         tpnL+xPDCR3a+aR0RvySvXX3K7Sp74z4Xrqbb7B83U6WuNEpXj925/kOos8A7TTM5Oao
         FUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742510356; x=1743115156;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0fpBn8OJHb2DipzRLEI+UAj/Fv1bNkdtkXE17lBcc20=;
        b=qBEIvYEbcEOg+vJY2dmLTzioZQEBBJZYSNEIy//qG9bPeUI6c/Iea8gCqJAQrk45ZR
         CjlLRySRWg2f9YKFZVJrNoF30JDWuhmSjPywkNCzibnqo0InnjUw2jSCUPJ6iFinrDbD
         JuuSz3XlQUR5ERduden7Ad/seQU2HbIy0QVOlGjIIKjuei2QKifNoKBv8e4KCpzytBVo
         bVXQB9jUH0eiX+T796vuMh/j/fxtnrTPJxVccY63is4XOhB51VCgD4cWwADcDNGcOSzB
         IFQwvgkjA+7MBCLOFwAnTTzbXQcS+qHH5tcuxvKocy3Cy2NeVYGOGCahtfqgJXVFoJts
         FVWA==
X-Forwarded-Encrypted: i=1; AJvYcCV7M2mUrV8hCW8HfiXxyGQlNej44DgGWptSf/dKy7oQ0s+lTV3KsZCbFJuS7pgBMIjauqYT6SmUcpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjAsCllLR5c4/4NOrRKr/bdFnTPyew46Gu3P3wITqEp774Gp3q
	w7TbkQD148KpU98P/kDtcD5k6zSdCY1EnheLjUlC7lBNktxu875K7ZPaVX4w2v4=
X-Gm-Gg: ASbGnctEkEPWdDE66gVMOrwc/pxvXaBKoedVHY9h0Wf3O4t3gfwNiAKfavIGELC35y6
	9V1WR277hX7maAIj2bmdZumKhLEyor97e0KSErXSmoFn3EO7zSawUYFCrBrizKD10pzSJCPzVmh
	a2JFCoMDwd8fEcvgcYO7NNSCXisbuzbvZVWFxuMvFPbw9OL8TwGWvRvNmjeicS+ZkbHryGu7PFh
	mtQSoMZv4BUgkvDq2jqSOCjqZxCyAa+Pa/IsF/dAayXg5ubs08sYb3odUabdGcA5pJrVpGyoTqJ
	CtIHeA8zWigN8fJe/5cemtvWAyERerwv7PAcie/aR5d9Iw80mnHZfxmuVHA4LOjgA54I259tbuJ
	HIrX6kL1Cvy4lqDH7jQ==
X-Google-Smtp-Source: AGHT+IGazuW7zMOIIFe93a/pSjwb+ABWXp4kDIdJjL+/LiLiDiWbJ1EYQxh1QRi47IqHdMLVTvHmPg==
X-Received: by 2002:a05:6830:7302:b0:72a:1626:21e9 with SMTP id 46e09a7af769-72c0ae6a1f9mr908678a34.10.1742510355967;
        Thu, 20 Mar 2025 15:39:15 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72c0abac23esm140838a34.7.2025.03.20.15.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 15:39:15 -0700 (PDT)
Message-ID: <84232793-9cba-4148-9875-d996e85b81be@riscstar.com>
Date: Thu, 20 Mar 2025 17:39:13 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] clk: spacemit: Add clock support for Spacemit K1
 SoC
From: Alex Elder <elder@riscstar.com>
To: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Guodong Xu <guodong@riscstar.com>
References: <20250306175750.22480-2-heylenay@4d2.org>
 <20250306175750.22480-5-heylenay@4d2.org>
 <d625c473-789c-42f9-918c-8a649d058513@riscstar.com>
Content-Language: en-US
In-Reply-To: <d625c473-789c-42f9-918c-8a649d058513@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/11/25 6:19 PM, Alex Elder wrote:
> On 3/6/25 11:57 AM, Haylen Chu wrote:
>> The clock tree of K1 SoC contains three main types of clock hardware
>> (PLL/DDN/MIX) and has control registers split into several multifunction
>> devices: APBS (PLLs), MPMU, APBC and APMU.
>>
>> All register operations are done through regmap to ensure atomiciy
>> between concurrent operations of clock driver and reset,
>> power-domain driver that will be introduced in the future.
>>
>> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> 
> I'm very glad you have the DT issues resolved now.
> 
> I again have lots of comments on the code, and I think I've
> identified a few bugs.  Most of my comments, however, are
> suggesting minor changes for consistency and readability.
> 
> I'm going to skip over a lot of "ccu-k1.c" because most of what I
> say applies to the definitions in the header files.

FYI I encountered a problem I mentioned below.

. . .

>> +/* frequency unit Mhz, return pll vco freq */
>> +static unsigned long ccu_pll_get_vco_freq(struct clk_hw *hw)
>> +{
>> +    const struct ccu_pll_rate_tbl *pll_rate_table;
>> +    struct ccu_pll *p = hw_to_ccu_pll(hw);
>> +    struct ccu_common *common = &p->common;
>> +    u32 swcr1, swcr3, size;
>> +    int i;
>> +
>> +    ccu_read(swcr1, common, &swcr1);
>> +    ccu_read(swcr3, common, &swcr3);
> 
> You are masking off the EN bit, but you should really be
> using a mask defining which bits are valid instead.  As
> I said earlier:
> 
> #define SPACEMIT_PLL_SWCR3_MASK    ~(SPACEMIT_PLL_SWCR3_EN)
> 
>> +    swcr3 &= ~PLL_SWCR3_EN;
> 
>      swcr3 &= SPACEMIT_PLL_SWCR3_MASK;
>> +
>> +    pll_rate_table = p->pll.rate_tbl;
>> +    size = p->pll.tbl_size;
>> +
>> +    for (i = 0; i < size; i++) {
>> +        if (pll_rate_table[i].swcr1 == swcr1 &&
>> +            pll_rate_table[i].swcr3 == swcr3)
>> +            return pll_rate_table[i].rate;
>> +    }
>> +
> 
> I have a general question here.  Once you set one of these
> clock rates, it will always use one of the rates defined
> in the table.
> 
> But what about initially?  Could the hardware start in a
> state that is not defined by this code?  Do you *set* the
> rate initially?  Should you (at least the first time the
> clock is prepared/enabled)?

When doing some testing today I found that the WARN_ON_ONCE()
got called.  I added some information and learned that the
values in hardware of the swcr1 and swcr3 registers were:
   swcr1:  0x0050cd61
   swcr3:  0x3fe00000
I'm not sure which PLL was being used.

So clearly this can happen.  Somehow you need to find a way
to ensure that these registers are initialized to a sane
state (meaning one defined within pll_rate_table[]).

					-Alex

>> +    WARN_ON_ONCE(1);
> 
> Maybe WARN_ONCE(true, "msg");. . .
