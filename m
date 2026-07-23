Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335BD387588
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 05:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784784852; cv=none; b=YMFi2Jt3hQod7hfwEkBe7jiHNe81vNL2Tgw4KmR6Q4wFo0i/vZqq7ktCZiGZP/41J55LEpKfKW1LzqwOaIJ6iEhWajpONsIxB1v3uYvdOow/RCz1NBF0kPPuxHUIlnlS43YiYA3iG07j8GbpkxiDe+7tcEl8SopW/s9NOnURh08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784784852; c=relaxed/simple;
	bh=KhGPayP39s+pBuwUXBjo9oFBdNo8aw/ptiecAgKNax0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HJWOAGSphkaLy0AVUeckIDaLPVxiaUeykUjzcN58i+GzJxTmxQr4TapUhC8gp6kBNDAGLR60lXie2HFJXoNRQ+3isoBO9Q73hcIOdUshspjK6Mm3AtwTkEFfuuAjLyBg5WhM65dffzpE4zfnWeMfm3Nx5cxOoXalkpH+vEgj3eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net; spf=pass smtp.mailfrom=pardini.net; dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.b=VYPZZU+0; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pardini.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.b="VYPZZU+0"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-69c1220bd51so408826a12.3
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 22:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1784784849; x=1785389649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9Xvw9T6eAQSk6Ziei+kwmi6b3zyorGLKbWsnxvpWlc=;
        b=VYPZZU+0DD2n2XevpiN3kax2njHBTQJN23ijybvd4fwUlMlhLQHkU73RhcBfv+GrfA
         TSEeXc34Pqr9Vi+/hZmMSHsu4HoUHaaiVN5rtKIzVLj++kTZ86kpMqdNA6TJcNYIXYnX
         moV//j8VoQz98dVTwhFfwemLKrqsnR+Vsu2Gp+SHnlX8z9rxGPDCxINYvGtvhGsv0KBq
         eBMC5ALqxJoY2vgTUiG53ojeqYpAnM5vFGScSAo+1czx9T+/R9AMHQePzZ48n3SUemNV
         6jBc8uYWGbbTJtYH+SJdblpFgDlx+YOL5YDlRjpvnUmNGu1LwWds2KwHSyWdVl4frbrQ
         LSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784784849; x=1785389649;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9Xvw9T6eAQSk6Ziei+kwmi6b3zyorGLKbWsnxvpWlc=;
        b=BCFmXxB5JiJiZn2hjd4k6Ph3AsrjiXyNc0Chcmb7ym/dyEGcF2h8CW48/pIlrwx2sN
         dSccsskshJZHVV15yVY/Ni0yvyH8vbVsUnjGdkkPlVcGyB4vNNE7NoWe11Dthjoxd/KK
         j65WspohXEguZ6wPbOv7zq7bMk1wESpb1WMT4CBlIWtr9qVBJ84rOa3GSiaERm7s4au8
         NnabphiqD2cTYa/sTa77OQeVxaq1mCPJWqs6L8m/FFEpSpymTpEFNRycFsnlTBq/bZZB
         C2AiD645BQiTeJaQbImj2tRNZeqjEgvkDnJx644flLLPUVOibFa1Uc69g42e4IHo6ZWz
         lYHg==
X-Gm-Message-State: AOJu0YxZh3mRltJyGXwo4p0zGvgOuZC7TPU4brLsV1LyLfTpx86qs6UQ
	IdCDVhwEWF5seENE8AnPmHr4kkyvbr5pczmF6XSc3VvXeKJIqAlZW0QT4YSpI5gUMw==
X-Gm-Gg: AR+sD13VA3UCHFlCIZZq7G7nVNTUyiSbQ7pg5xphK7n9V6bCDx48UMgEvLawCIGRbpm
	ihcHKbAZ6uL7UnpmPfkXpQJrFCvWbg80svO9xKioCwg60RVcH8WvC5IMlipx1TSy/K03O9SjeJT
	OF2E/ksOWz0RkqsB6uQt+izr9mgPUHF2y3EKaSjp4B6oVlHjHag/IGkAqmtZp8hCksaM0/6VSGW
	mcKiFqH4Pp5x/CIzrIpNwbzZno2Fth+7iYwt1WEIDafiKdC/Ys2lX2CbIl+GtYN7Y66vQh46qnY
	eoHgue6IoreE8ap9aTlFdlVy7lspqQjFOKFw29WoauDZcrYyirU8CjYEeJfvpkP2OWZo8M0PTBk
	662HZcxKgesEpFromf074hle/gyJxL97NlMs1vqOnnzhapDzh5diStQOYZ2wRYg9dE0vEJx6z56
	xJGS9W7om0dqk8bQ/KW59pDlf1kvCymThXtL3jsKEEffKkDBAClwj1kqRkeywYERzoJaXePZwb9
	u0ySb+AGXm72QMc07/Aocs2SIAYX8g8HGRUQT03BICEC35uTdYymg==
X-Received: by 2002:a05:6402:4555:b0:698:99be:29d6 with SMTP id 4fb4d7f45d1cf-69f6c4ef29dmr358015a12.29.1784784848988;
        Wed, 22 Jul 2026 22:34:08 -0700 (PDT)
Received: from ?IPV6:2a02:a466:4d7a:0:30b7:a679:c7a7:7d05? (2a02-a466-4d7a-0-30b7-a679-c7a7-7d05.fixed6.kpn.net. [2a02:a466:4d7a:0:30b7:a679:c7a7:7d05])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f345b1b18sm1838609a12.2.2026.07.22.22.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 22:34:07 -0700 (PDT)
Message-ID: <6cc68287-ee87-4db6-8f40-531ec2d92fb2@pardini.net>
Date: Thu, 23 Jul 2026 07:34:05 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: rockchip: rk3588: don't disable unused I2S MCLK
 output gates
To: Heiko Stuebner <heiko@sntech.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniele Briguglio <hello@superkali.me>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Diederik de Haas <diederik@cknow-tech.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
References: <20260624123914.1767374-1-hello@superkali.me>
 <178267399833.3089434.5140309637329023610.b4-ty@sntech.de>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <178267399833.3089434.5140309637329023610.b4-ty@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/06/2026 21:13, Heiko Stuebner wrote:
> 
> On Wed, 24 Jun 2026 14:39:14 +0200, Daniele Briguglio wrote:
>> No in-tree board references these gates yet. Boards drive the codec
>> MCLK through the parent I2S*_8CH_MCLKOUT, and now that the gates are
>> managed clocks, clk_disable_unused() turns them off at boot. On a board
>> that relied on firmware leaving the output enabled, that cuts the MCLK
>> and analog audio stops working.
>>
>> Mark the four gates CLK_IGNORE_UNUSED so an unreferenced gate keeps the
>> state firmware left. A board that wants the kernel to own the gate can
>> reference I2S*_8CH_MCLKOUT_TO_IO from DT instead.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] clk: rockchip: rk3588: don't disable unused I2S MCLK output gates
>        commit: 946352b2f88fd2378f0341312e47dff1e8dc2fac
> 

Hi Heiko, Stephen,

sorry to pester, but do you think it's possible to include this in the 
next -fixes for Linus?
It's been in mmind v7.2-clk/fixes for a few weeks now, but I haven't 
seen it in -rc4.

Thanks,
Ricardo

