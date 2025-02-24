Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524E8262803
	for <linux-clk@vger.kernel.org>; Mon, 24 Feb 2025 16:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740414013; cv=none; b=l9HBzmu++Ks3tiPplVsRWe1aC7mjFOV5pPUP3uvCI/1LP/65TQ3LYuBJxn44yDhSWUNq5R4B031p174oTYrkCjZwLqY+UTRPtcarhuHaQAgHuL2vvGZBALylFe3/vI4UmpITnv7zqYzVm8Lr7q44NcuHAKjIWzP+5who7HVf0aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740414013; c=relaxed/simple;
	bh=FheqO8KzYo1Xtd5I7TGsNuaxE22xi/JqG2iXSfyifPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AFDNygfrC8EBb1ShzV1ljhFX0VF+5i9/xRZxTZm0YKfq9jVl0bWCbHgHZ8frJ1/IFW/622bYZDcELmfLAgMgfODZPajh80QjOYDBwN+7u8aqKmm0ygSoT4ydppVqTdAtMJOB14lmeZwnswrRVk1gP/lWh4MErsnVn0P2I43Id3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=QhQA4IUr; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="QhQA4IUr"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7273b0d4409so1163007a34.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Feb 2025 08:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1740414010; x=1741018810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ggNVg1i8dPseY+YzGhRPP522mFrqRdnWvnVFy7OGPU=;
        b=QhQA4IUrtC7dCYDUz49vFIPClkv5bmEOX24NUS44hpxNTTJcezZjEntbQx0lsptC9y
         FXZ23k2RhVYTrcoG3LOnNnwCp3zpyTHbU96QXIv1yonncD+sK4TJh5YGngrHV81E0HhS
         ii3H++lXKGR4RloNovFVdrmO+1isGu3sRLpl6qBqEc+9HSaA7wVxaGXqBcAon156k9l7
         YD5XLVAv5zN7gVIotZPupPTgbG3ITLZfhtIzhoz/P1d+aakZ9+zEFJr3FaLNsxM+Yc2h
         EfmXszLgJuoAQtd2vWmPGggm/VxsfH770GmoXy/q45Ussz+dOMBmswptCVowdQBPFmnx
         ki3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740414010; x=1741018810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ggNVg1i8dPseY+YzGhRPP522mFrqRdnWvnVFy7OGPU=;
        b=dp5px0NHiIOWesmC+ZOFa/8G6neKIZFx3MBtT3s1viSOnAY1Tc2nBtYfP+a5Fa79bL
         srZyw5rK9a7qzRqZErfj8U6SiOwHRkxzEppiEAQ7bK57LaC+F4QSjY2CIUIi8ZmoUNVq
         9IP8d+eZhRkijdGNOcDhdkev3ocYwadbrFfTHEZaz3lhcyXugzfyjjiImyma23RVySG0
         yRmah2QHKSnqet2wKQlzhfxJJtfuIv8yduXaNd8F5rBoVnlbZtjf0nPHuxgEyBQJ4gln
         C6g9nPrR+KLhnlhsFFNA6D/4BK4FZMWWpllvQO+A3Nx3GW/rckOv9cVk2chyIL6GuIDu
         mDXg==
X-Forwarded-Encrypted: i=1; AJvYcCUYbd3EYG2YlfJr08MwWBXYcT9L5u9/y72nb51QLdjJvlgtAUoEWsteBACV4vE4YlP8n8z0S1MGHuE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcy0fXbcILXmcTYz34GMIjUVPYMWjCmW/Q0PgK1aZNfgdmdMLk
	hMfILgMAo5FOmZtSFcm8C+bQLrAD89OS8yQQYuhGwAHfL2cJxEFLxGGOeuul7o0=
X-Gm-Gg: ASbGncvS01Qn/0WYSCXErVzslCVVasRmu2N5c4V545cO6dpbp4CC/GpJFDemDqtBbrL
	uj14iEIQ/4bndg3UOkdyFR4cT6QNHr3F+4XyhkchhBuRWN1J34P8PwPV4iVsumQ1xn6aOvuctgu
	/cvTL+7JdF7qXwaPPmCFEwd3uM8KzE+ituesUVqRyA9TbP75gmlMaw/lBRxR0/31EZPRKW90idS
	OVFEgtQrUGoSpFZUew0yw9v8oLYJFJ1TzTFlNTu3ZqYQR1fDc6sKOoaxGH6VdMIWi1zFisqi8pg
	s3bfTHtME75aMDLF+pwjxZfxLTUP0mhzZugay38cLzM844BhGGMHgaK9t18Xfktw9g==
X-Google-Smtp-Source: AGHT+IFCWs+0CCuJamgGPiQVcYx+xUj/OyX9/a5EIgOce/keywE1eBKMEV5gEit7BDGyEshCJIcKAw==
X-Received: by 2002:a05:6830:700a:b0:727:3a2e:2132 with SMTP id 46e09a7af769-7274c24724bmr15027042a34.21.1740414010164;
        Mon, 24 Feb 2025 08:20:10 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-727378237e4sm2656892a34.47.2025.02.24.08.20.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 08:20:09 -0800 (PST)
Message-ID: <96a72cc3-5c89-48ca-b535-8a9a5cfb52c4@riscstar.com>
Date: Mon, 24 Feb 2025 10:20:07 -0600
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] clk: bcm: kona: Add bus clock support and
 prerequisite clocks
To: Artur Weber <aweber.kernel@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, Stanislav Jakubek
 <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250216-kona-bus-clock-v1-0-e8779d77a6f2@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250216-kona-bus-clock-v1-0-e8779d77a6f2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/16/25 10:12 AM, Artur Weber wrote:
> This patchset does the following:
> 
> - Introduce support for bus clocks. These are fairly similar to
>    peripheral clocks, but only implement policy, gate and hyst.
> 
> - Introduce support for prerequisite clocks; this way we can
>    make peripheral clocks automatically enable their corresponding
>    bus clocks.
> 
> - Add matching bus clocks for BCM21664 peripheral clocks and update
>    device tree bindings to match.
> 
> The prerequisite clock portion of this patchset is adapted from an
> older attempt to add bus clocks[1], submitted by Alex Elder. I've
> retained his authorship on that commit.

That was a long time ago!

> Notably, Alex's patchset moved clock initialization to the prepare
> function. This seems to be incorrect; the prepare function gets called
> before the enable function, but not before "set rate"/"set parent"
> functions; thus, while clocks enabled fine, any configuration done
> before they were first enabled was broken. I ignored that part of
> the patchset and only kept the prerequisite clocks.

I think you're right.

> I would appreciate feedback on the prerequisite clock patch, hence
> why this patchset is marked as RFC.
> 
> I wasn't able to find any other driver that does something like this,
> so I'm not sure if it's correct (especially since I had to switch from
> non-locking __clk_prepare and __clk_enable to the regular locking
> versions, as the non-locking versions are no longer public - they
> appear to have been replaced by clk_core counterparts, but those
> functions are not exported anywhere AFAICT).
> 
> An alternative way to do this dependency would be to wrap every
> component with a relevant bus clock in a "simple-pm-bus" node
> with the bus clock in DT, but this seems rather unwieldy.

Yes I had the same thought, and ask about this on patch 3.  I
can't comment on whether this notion of a prerequisite (that
is not its parent) makes sense though.

I didn't look at patch 1 or patch 5.

					-Alex

> 
> [1] https://lore.kernel.org/lkml/1402926007-4436-1-git-send-email-elder@linaro.org/
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Alex Elder (1):
>        clk: bcm281xx: implement prerequisite clocks
> 
> Artur Weber (4):
>        dt-bindings: clock: brcm,kona-ccu: Add BCM21664 bus clocks
>        clk: bcm: kona: Add support for bus clocks
>        clk: bcm21664: Add matching bus clocks for peripheral clocks
>        ARM: dts: bcm2166x-common: Add matching bus clocks for peripheral clocks
> 
>   .../devicetree/bindings/clock/brcm,kona-ccu.yaml   |  18 ++-
>   arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi    |  28 +++--
>   drivers/clk/bcm/clk-bcm21664.c                     | 107 ++++++++++++++++--
>   drivers/clk/bcm/clk-kona-setup.c                   | 116 +++++++++++++++++++
>   drivers/clk/bcm/clk-kona.c                         | 124 ++++++++++++++++++++-
>   drivers/clk/bcm/clk-kona.h                         |  30 ++++-
>   include/dt-bindings/clock/bcm21664.h               |  19 +++-
>   7 files changed, 411 insertions(+), 31 deletions(-)
> ---
> base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> change-id: 20250212-kona-bus-clock-4297eefae940
> 
> Best regards,

