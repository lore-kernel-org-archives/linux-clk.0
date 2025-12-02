Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D4C311964
	for <linux-clk@vger.kernel.org>; Tue,  2 Dec 2025 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764680850; cv=none; b=vAlYT6rXPlhrp/RKnXtVylWlx7YNQ8ACdadesvVsuEELpD59t70a6ifJetmTZUjkUtx1wRbUCDTDTgKFfqDMwe1MJ3gOxsBLwUXelbfK2mB7Sa9rEVjT6xYi1sMlhQa1mjkz+rx68473Q3Ti/m48TMoQl6fhG6H4fMgxYQSNVH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764680850; c=relaxed/simple;
	bh=tNOJoqOtu81sqKG/lr2dAsJI5dtfm6oZr1MbH4zUCGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YSTPX8cN8C2kc9QYGPN8yVgfTkCbQ4cvBEsTjvWsGDfwbelKBPI4okIGxONkX2uvwSw/FoR2qKMUT7BI9lYZ9jBn3iQ6gmCTf2MjYyDlLYOQTqa7beyYB8VUqY/M8BhKVt0MndpX/dNxAh95vgogCLOeNFzsORuYjzhHRv7KhuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iajKt5aG; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iajKt5aG"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so40626705e9.2
        for <linux-clk@vger.kernel.org>; Tue, 02 Dec 2025 05:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764680847; x=1765285647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TdmicvdI6LvDwBq4jGS/aF6+e7Y5AiYEqgDkbGF73h8=;
        b=iajKt5aGm3TI/IVfAy9Ud+GssaUXzl0wtDbZLJF8BaRP8xZxx5CAZWmV12o5ABxAB6
         uMOIx7tHzla1Nytov+7N1MzLbTG9uKvwRQ9y1JGe7qdb9Xm8Yw8gonVlAyI6SGUpp5nc
         YWv2UbklPn9/KbESZpsVrQdbt4PXvGO2vnv8D6AfhRxSVFD/qGq1Q8ikoe6bA7DtW+Gn
         tCnnx2k9VdX9aYjp3zRXoLsV9vaJWMwjW5E8hlC1Gh4k3cRP3sTjg6N5pEtBz7j7qx8o
         R7AMgOLePxto4yZvXw9Rli/BOzOe8Zbv6Q5pkSEcrorwQBIiEzLI/yVmEPa+6YgPkFOE
         7d0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764680847; x=1765285647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdmicvdI6LvDwBq4jGS/aF6+e7Y5AiYEqgDkbGF73h8=;
        b=GlgbaQPU1g20GUg/oXe0dZqlHHrGRCLd1plKT/SDI+AE7DeJPvSqfS9wxBVk8Dt/S4
         4UmMjATWClHzH5yaLWdU6/4p6JIBcYjthAobSeGaRrVw5m6CaVuTd2jcrf4xir0GWCJG
         y4X3n78Vyqb7kP6T5wH9zE+dwaZbULlJRafqARvJ951Rf42ZzOEFAALm9ngL7rGXgwca
         ZTS2vGajn4IRNBmRVDsCEgZY2tMbB8UbyaeC3v30Uo3CikQGH5pWLwEnnA1/Xc2hmdOA
         ZvRDABlh7l5vTtTGJZ+slizSjEPClNlqjoq5S+OP3NhEXMrED7FhIdg3vpA3CMjoN3Q1
         BKJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9ASHQuyEPyhnw5Z23q4q7IeccbsFb/OMi509xhK3tN65jm2zett3UF3Yl+NWxiierqoZEBXJyq30=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj9wPXTyhveWqkjpirJ07S1CnTf+C50RVH+bPj/UlBzVOux5Qw
	yXyK90XHv2PSJ+7MIQEzhsv+QAhtnULBoeFOh/UJseUSQZR/Sy+f5yPq
X-Gm-Gg: ASbGncs2BegrpMwLO+iLvLbZveEIrAdHYty1vcQLiUpGeSlZky+JhrlReMsOzPQdCPE
	b4Au6z+KmiXg49J9VhP2jPLKnvSMnVAkHGnl+Fzg1RJJjFiZCVUN3oLIMlOvfYao3121UH8hnGs
	IOd/ZKq25xSwHHb6wN7sSPQohF0vYU5d0h3cpxYXOVTzl5C9bMeCXiZyq7Ro8SRKfXLVF3yPHPn
	78zP/LSUOhtjCz9UmMuFfUh8js9Xe0WWllHZMY7ECM2T23xsafFhYHDbRj7OTnhLhJCtWmr7O06
	4toW0UZmp4G+RW0OFAEdAV9CVHIAA1lVkiH2iFhLHcYpdWfldOcVU4ec+OGLUOEwMHmiwRdMHE9
	jrAXbI9NXu4ZWu4Q1YQ+K7izFTvYMFL7+oO09Ftti2QJYw00jMNGJyB/C1jAjVbJEirlhgn0KLH
	aqchD2SkoPezwY4smumYwlkZup
X-Google-Smtp-Source: AGHT+IGJNM1K23jLf3CUzH7hm93uVavrY1rHzN3a4AlHQzRCzjrr4K4sOdr6bNk5SmO5hXzDZcV9+g==
X-Received: by 2002:a05:600c:354e:b0:470:fe3c:a3b7 with SMTP id 5b1f17b1804b1-47904ac4380mr280957655e9.5.1764680846874;
        Tue, 02 Dec 2025 05:07:26 -0800 (PST)
Received: from [192.168.0.7] ([86.124.200.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0cc186sm355959705e9.13.2025.12.02.05.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 05:07:26 -0800 (PST)
Message-ID: <83cbba4e-af8e-401f-9bc4-9799a3fec551@gmail.com>
Date: Tue, 2 Dec 2025 15:07:25 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add versaclock3 support for RZ/V2H EVK
To: geert+renesas@glider.be
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 biju.das.jz@bp.renesas.com, magnus.damm@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org, Ovidiu Panait <ovidiu.panait.rb@renesas.com>
References: <20251021175311.19611-1-ovidiu.panait.rb@renesas.com>
Content-Language: en-US
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
In-Reply-To: <20251021175311.19611-1-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Geert,

On 10/21/25 8:53 PM, Ovidiu Panait wrote:
> Hi,
> 
> This series extends the versaclock3 driver to support the internal
> freerunning 32.768 kHz clock, which is used on the RZ/V2H SoC as RTC
> counter clock. It also adds the dts node for the RZ/V2H EVK.
> 

I wanted to check whether you had a chance to look at this patchset.
Please let me know if you have any comments/feedback. Thanks!

Ovidiu

> Best regards,
> Ovidiu
> 
> Ovidiu Panait (4):
>   clk: versaclock3: Remove unused SE2 clock select macro
>   clk: versaclock3: Use clk_parent_data arrays for clk_mux
>   clk: versaclock3: Add freerunning 32.768kHz clock support
>   arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add versa3 clock
>     generator node
> 
>  .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  25 ++++
>  drivers/clk/clk-versaclock3.c                 | 126 +++++++++++++-----
>  2 files changed, 120 insertions(+), 31 deletions(-)
> 

