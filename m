Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A651D0485
	for <linux-clk@vger.kernel.org>; Wed,  2 Oct 2024 13:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727875281; cv=none; b=fOZ80PmaOobtrM/pScmwFJagL1WXheEwtCR+gV/ykrMdJsqqypXR9NkX6S8OKLnVJEvpxofRvTkgV+S062BhnKLwcAwympKM479Ba3K1hH73Ag88ypTPnAXu1a+sdrUYaAOI6nID8szIheuegWs21hcwK+tLfMNBtMxN3pmAuks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727875281; c=relaxed/simple;
	bh=P9N3fFd3zgvIY3GrSgSJbElHLP5dus/hAJ2j9gU0fvs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jbCa5kPOTqlv9AGpBJewDqbd5uowUcn9lvXahDwRFCjlo2qnLFhVpzIC4aZY/dxiMwwxqzQY7xlzF3SJQkF55usorZD8tbC+dTZEgpL0klSgj4w8n2uAGHlRU2xnx0cJM3MRG1p6cgGMoz1idbmtCaUb+Y0uz5xs9P4/CkQtdFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IXmzOoCB; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IXmzOoCB"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37cea34cb57so2037946f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 02 Oct 2024 06:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727875277; x=1728480077; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lFcpWszJZ1PatGkbcS9TyyzC+Vcri7WA2fnl3Lvu/mU=;
        b=IXmzOoCBbsYAKKwb3VaNLcJBjPUCQaCDFVFP2UunfnWQWuZ7CQPDvBjm4ghrr96SNE
         5kVW/7Dl19ClWf9LejcSM4wDxYiIx6mziSQcLwS/hxybz2lzit9CNQ3Vk39aabJRDaaW
         OwRo/teAAvPl9i+/uReDfvrrqPLkhL9KvOyNuSKfthKYBV6GP8YAmOvLIpM0uLqhTBfe
         thYdgDhGCmVpJJ+EyflWpar4UoVbCXvXKN9UwkLbdNT1a1cbcKyDw2g0TGEJ7zXZnLoY
         p2KKXkOdsgIrd82G4ggmOtnEGETSBuuf3AYI3AQQ7BOmy7K8qdRi09BMUoEWvcWVuVpm
         Y4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727875277; x=1728480077;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFcpWszJZ1PatGkbcS9TyyzC+Vcri7WA2fnl3Lvu/mU=;
        b=MGix/kYbUIiLyfeM6w63Tw1rLaT3yYjBo6RhkhQN0eA18GF2Q98n6GRAYB3QN/B5wZ
         0HgQmvyEIZF0GF1h36qiWr5rBU0OJR1an6McmQoYKjaFnQk/IyYF5dv0Je4obd4jvng7
         TO39jUYsOi2rWjg9Fqm8bBvjIeNbLo3qlPp1Uck0HYRI30KSviUwkoVVU6EGQp3I68g5
         Bk58AjLq951rJeHzKqVwDSNNCJTWUbko9+F/o8V4l5EsLXqg6Sm5xWvDXzBX9TJmM2ZC
         NZSTwikFJd7SfyoZTQGjGr9LmoNF8y+hsIPgB8PArW2TRMUNTrDfrBJUrhQwjkZkRa5A
         M7vw==
X-Forwarded-Encrypted: i=1; AJvYcCUJDgd9bKi9XULcYrbWcemwnM4HRX78f67qbogdNcPcCCEuzxtbs4/1jgCnneBjt2x27aVgbKQMGjs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgi724bdvxIkA36JSr76v3n9+yhke18g/shRbhuNOg3Sfym3jj
	4knzGOBpD2EI+MDAFFl1kaTUeo03KKCUXSa97k5RHBcNBmM9nb/VpigSh9fMa9c=
X-Google-Smtp-Source: AGHT+IGtesUnwfGBBqJcevG7GXZS5uKes3Sg3LCKiml2f2atNex2ZhNMu7Ko3bo7Z2LB1PvLr1K3nw==
X-Received: by 2002:a05:6000:e4e:b0:37c:c9b5:5573 with SMTP id ffacd0b85a97d-37cfb8b57d6mr1834260f8f.17.1727875277309;
        Wed, 02 Oct 2024 06:21:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:eced:891a:c2b9:3db5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd575de73sm13842727f8f.115.2024.10.02.06.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:21:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Conor Dooley <conor@kernel.org>,  linux-kernel@vger.kernel.org,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  pierre-henry.moussay@microchip.com,
  valentina.fernandezalanis@microchip.com,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Jassi Brar
 <jassisinghbrar@gmail.com>,  Lee Jones <lee@kernel.org>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  linux-riscv@lists.infradead.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 08/11] clk: move meson clk-regmap implementation to
 common code
In-Reply-To: <2b49c4df-a34a-42c5-8d44-9e47da630fe8@linaro.org> (Neil
	Armstrong's message of "Wed, 2 Oct 2024 13:20:44 +0200")
References: <20241002-private-unequal-33cfa6101338@spud>
	<20241002-hula-unwashed-1c4ddbadbec2@spud>
	<2b49c4df-a34a-42c5-8d44-9e47da630fe8@linaro.org>
Date: Wed, 02 Oct 2024 15:21:16 +0200
Message-ID: <1jwmiqsks3.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 02 Oct 2024 at 13:20, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> On 02/10/2024 12:48, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>> I like this one better than qualcomms and wish to use it for the
>> PolarFire SoC clock drivers.
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   drivers/clk/Kconfig                           |  4 ++
>>   drivers/clk/Makefile                          |  1 +
>>   drivers/clk/{meson => }/clk-regmap.c          |  2 +-
>>   drivers/clk/meson/Kconfig                     | 46 +++++++++----------
>>   drivers/clk/meson/Makefile                    |  1 -
>>   drivers/clk/meson/a1-peripherals.c            |  2 +-
>>   drivers/clk/meson/a1-pll.c                    |  2 +-
>>   drivers/clk/meson/axg-aoclk.c                 |  2 +-
>>   drivers/clk/meson/axg-audio.c                 |  2 +-
>>   drivers/clk/meson/axg.c                       |  2 +-
>>   drivers/clk/meson/c3-peripherals.c            |  2 +-
>>   drivers/clk/meson/c3-pll.c                    |  2 +-
>>   drivers/clk/meson/clk-cpu-dyndiv.c            |  2 +-
>>   drivers/clk/meson/clk-dualdiv.c               |  2 +-
>>   drivers/clk/meson/clk-mpll.c                  |  2 +-
>>   drivers/clk/meson/clk-phase.c                 |  2 +-
>>   drivers/clk/meson/clk-pll.c                   |  2 +-
>>   drivers/clk/meson/g12a-aoclk.c                |  2 +-
>>   drivers/clk/meson/g12a.c                      |  2 +-
>>   drivers/clk/meson/gxbb-aoclk.c                |  2 +-
>>   drivers/clk/meson/gxbb.c                      |  2 +-
>>   drivers/clk/meson/meson-aoclk.h               |  2 +-
>>   drivers/clk/meson/meson-eeclk.c               |  2 +-
>>   drivers/clk/meson/meson-eeclk.h               |  2 +-
>>   drivers/clk/meson/meson8-ddr.c                |  2 +-
>>   drivers/clk/meson/meson8b.c                   |  2 +-
>>   drivers/clk/meson/s4-peripherals.c            |  2 +-
>>   drivers/clk/meson/s4-pll.c                    |  2 +-
>>   drivers/clk/meson/sclk-div.c                  |  2 +-
>>   drivers/clk/meson/vclk.h                      |  2 +-
>>   drivers/clk/meson/vid-pll-div.c               |  2 +-
>>   .../meson => include/linux/clk}/clk-regmap.h  |  0
>>   32 files changed, 53 insertions(+), 53 deletions(-)
>>   rename drivers/clk/{meson => }/clk-regmap.c (99%)
>>   rename {drivers/clk/meson => include/linux/clk}/clk-regmap.h (100%)
>> 
> <snip>
>
> I don't have objections, but I think Stephen didn't like the idea
> a few years ago, but perhaps it has changed...
>
> Anyway, take my:
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

We had a similar discussion 3y ago indeed:
https://lore.kernel.org/linux-clk/162734682512.2368309.12015873010777083014@swboyd.mtv.corp.google.com/

There are needs for a common regmap backed clocks indeed, but allowing
meson flavored regmap clocks to spread in the kernel was not really the
prefered way to do it. 

IIRC, Stephen's idea was more the bring regmap support in clk-gate.c,
clk-mux, etc ... I'm not quite sure how make iomem and regmap co-exist
in a manageable/maintainable way within those drivers (without adding yet
another level of abstraction I mean) ? Silently creating a regmap maybe
? but that's probably a bit heavy. I did not really had time to dig more
on this, I guess no one did.

I don't really have a preference one way or the other but if it is going
to be exposed in 'include/linux', we need to be sure that's how we want
to do it. With clocks poping in many driver subsystems, it will
difficult to change afterward. 

>
> Thanks,
> Neil

-- 
Jerome
