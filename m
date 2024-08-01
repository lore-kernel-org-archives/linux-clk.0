Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F2A1B3F0A
	for <linux-clk@vger.kernel.org>; Thu,  1 Aug 2024 17:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722533328; cv=none; b=pKsvBlAOrlbT9LfvrLQmOuZfILyYsjKVJD0kYG0WDvezQpjS2Njec27w+TEiHwaK/03T1hjdlpoDKrgNJg97kzafBgecWaJgPYO3DF+vQmk7zGQaKJLG8yMcF3VaS3L+Z0P7kWmA3KMimR25aPO3hXSLwCj14Zu4izKfvrNCqHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722533328; c=relaxed/simple;
	bh=xYp1qctPQ3XCpMinrXG+jW9arJfjc0jjCGgwQ6JAppA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PToweJz6jO0xvTdLRnmj4BsnCbQT1ppfmV0kBrKQYHX50HHeWJlkXq88pVJDvdDLeUEQZcqoL4gH3Kno7VsT0wo8SKS/Unm0mVF/mWa5rt2K2f3aicx8E1s+csHeG3GXPS/qBDdLXOSsIpfZELaCrwTOoByg4PXi9T9F4kpmAoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oh8vdwfk; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oh8vdwfk"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42816ca782dso46698945e9.2
        for <linux-clk@vger.kernel.org>; Thu, 01 Aug 2024 10:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1722533324; x=1723138124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XnwjnjetY7dv9eCyx710zpOpIL7zDgItoHiS/DQyjbw=;
        b=oh8vdwfk+W1mR2x14bS68ATlOQLJ6HZMU1zdufP5d7Rg6lIs+9UDYcgIvT9WdT7nNC
         OQp+OSJqTASdPbruP/YWNgNMJNjfJQLTQkOShdz3Z0n4St/2AKtNCdxJiW8ZYo6/DI/O
         efgyLeMxmgpZ5eT/Ob0s6nK6qRnl6MwEhqbEZ2X74KpwkSpy/Klks5vPzmmmCSDsnw1o
         zO44yDnWXi7SIW4Cs4s3mlthO+DKzuR9ixrs1cd3cIWFTvNyYiKlRJdLbdcOjx/SaYog
         8WCwhDtQTxsKzz6bWK59vjPHdEfNS60L0waatMGlOsVE2FYRgZkJm3uSeA6VHPwPNpAS
         Gigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722533324; x=1723138124;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XnwjnjetY7dv9eCyx710zpOpIL7zDgItoHiS/DQyjbw=;
        b=q3Mn2KoUiv4tIHErXjga5oG8rrclDQKcWs0Q+iShLp6z/Et85HqkbhxTsRDBYciaFe
         3jkjQEz5FPaydoNE1ZdvCrVpIWcPBy7sDN4vBK5UhO4K1g64Z56MhBzqldt5UzQDiGSx
         sO7gMuw3Gq2Jt7ORe2maHXWuKUZY1XVxh/qUiDIc4nHS3ML+TSj11gqb1rs/IyNUKQQ8
         18RPS7OM6xV2vEHjhffylZB6DLDfI4dGPR7ZKM86EGA1Cg4LjYQDaNom6mtPZPS6YuXq
         GQm96CGOMSYmCfh5FHgcMnosNN6WnMRFbYkYy4VBuAvI9TVUpHxx2SBia+sUNisWSgTK
         1JZA==
X-Forwarded-Encrypted: i=1; AJvYcCWi9L4P5rBK1ibXAwHpAWnH00ZQpJn7oPCBAfLtYZRfNaullHH8iwoiUKH+7hxIjKQToKjL/IPPR83muQsrpFtVOI1caE3dwf4U
X-Gm-Message-State: AOJu0YwkfH8JUV+D5mkjykhtA9C6/dSykwk+5lqRaJNyG3EOA/oWqPti
	oYPxLiJAEmv3wLWleKPqkS6931uNOi1EEUMhswwZMOvRnMGqdwVgMuIg43KPFD0=
X-Google-Smtp-Source: AGHT+IHS4knhHpTTc3R8fFT40aZdqgWtj3Bjf8KF8/wk14Wl+xIhW2xqBDu0DirWFImXVhfOp8H0SQ==
X-Received: by 2002:a05:600c:3b17:b0:426:58cb:8ca3 with SMTP id 5b1f17b1804b1-428e6b07c64mr5187045e9.21.1722533323640;
        Thu, 01 Aug 2024 10:28:43 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb6405csm65736205e9.34.2024.08.01.10.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 10:28:43 -0700 (PDT)
Message-ID: <80d56236-2499-4c89-8044-6a271e47515d@tuxon.dev>
Date: Thu, 1 Aug 2024 20:28:41 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] arm64: dts: renesas: r9a08g045: Update
 #power-domain-cells = <1>
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, magnus.damm@gmail.com, ulf.hansson@linaro.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240422105355.1622177-1-claudiu.beznea.uj@bp.renesas.com>
 <20240422105355.1622177-9-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWhRRdfoqg_o6bU7jjt5_Di0=z7MJ4fMh=MJ0m8=u4tgg@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdWhRRdfoqg_o6bU7jjt5_Di0=z7MJ4fMh=MJ0m8=u4tgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 01.08.2024 19:13, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Mon, Apr 22, 2024 at 12:54 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Update CPG #power-domain-cells = <1> and move all the IPs to be part of the
>> IP specific power domain as the driver has been modified to support
>> multiple power domains.
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Now the watchdog fixes are in v6.11-rc1, I will queue this in
> renesas-devel for v6.12.

Only the RZ/G3S support has been merged.

The watchdog fixes that allows us to use this patch were submitted as RFC
but got no input from Ulf, yet.

Thank you,
Claudiu Beznea

[1]
https://lore.kernel.org/all/20240619120920.2703605-1-claudiu.beznea.uj@bp.renesas.com/

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
