Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ACA166308;
	Sat,  5 Oct 2024 18:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728153898; cv=none; b=QX0YOWcf7NALV2TM3invycJbzCUjM4zgZpGXogo1Btqx7AcNurEs4OOxOKmXb6rmUmJarIaXMlOFB0uDEP2BUm+ccRmihWq97GByUfRIKwUSWOl42tswUz6PqDA7qL95QD5SNhE2n5QXnaK9ztdG/ddKgGNwVePExwc6ITblMLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728153898; c=relaxed/simple;
	bh=6RLhYMi5+WUMBMxyQrcB3l0ygGZ73nNgwKYQMVuya1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ncl5IKHgup3/C7VhycxqEoT8GgtjN4WzbgyEc3pP3FQG4Rpl6paK4Ppuvxb7S/1JEAf4v9R/JGbDrx96O8UIIG4hPlm/1lslOu5ItoIASDMckb3hUwqmON2ead5wzt7JNnSx2EfPOK8kxB//E9aLXB336vqEc/fpNtiGtrjE4vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRCfVdvD; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRCfVdvD"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42cbc22e1c4so23950825e9.2;
        Sat, 05 Oct 2024 11:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728153895; x=1728758695; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fRlB78UEFCV0w7cLJIZE7YuESd3mDDwJ36kzdZq9V+U=;
        b=FRCfVdvDiiPbYo76NSYP3eMsPZYEAPfc39oBd4fwjqzCgRo+rlpl+ch26V2fcmjWJq
         kHf/HppfUNiuuRq6SYgDf57BcnyuyAsB5XeUySlS5YF0Gleaxj7knAIA3EgzJS2NMlxH
         tDZGxLxsMDXvl9+WhkLrqvQ6pj4X+i6chBU10hDT6ffoLMgVgkTiVXvjkchsA5cZbft/
         ko9v+X36BAtrqyOlxSrGNfi9haYlXPLqsPgwaEUNsD7Y+E39wNnPOpfl6V3rsGOcNjgf
         ApSW0VIu4xMonM5ilgFfNiO6oSHQhMjy77wGRlh1/hDkFAnpy3oGXg91W4zDkmQ2H4Ip
         m+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728153895; x=1728758695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fRlB78UEFCV0w7cLJIZE7YuESd3mDDwJ36kzdZq9V+U=;
        b=pjxEiVNDnRU0xlFPtfVAg4o4NshM0ObG8/3jRCV/IHMKQzQfOzL+94hPTdhcv6p/ur
         agTBKbgzn1CsKa45rHzPS7fnc5n5zvYfYpDCjkKqlmX9kH9mUJ8jt/kWD/c4IjZIl8Oz
         bZxsYGI7eow96pFiA8VEz4PoQ90qhMnNEzUGG7CpHpaeg7XtOphd8K4RLhSOcBP9bBC8
         MqLEhHF7dMpnhBQeBudPAcZaYB7QwTDyzGG/SxyfHQwNsogTJPbs3AZon6Nw83uN720z
         5xz7vRa/EizbJt7kGNzBeqjHpl7TeiEvIapQJ5xrc+/lMKQF8z+3FU2vQ976cTT6LgRR
         9MZw==
X-Forwarded-Encrypted: i=1; AJvYcCUOJ7yCDtQirGD03E95ig2/GjLBPluWhYCrqiSO+43kw7qBQbV+1T9VsySpjWyvB+VlsiVARWqy1Vh2@vger.kernel.org, AJvYcCUe48atRazOwdZB3Eg/AJQZ+ifrbaaS/wUg2lxWkZhfv9yWpxtPIwEpJ7lO/cjbMUYyGdSuAvRO81ZF@vger.kernel.org
X-Gm-Message-State: AOJu0YyRu5hWnA+BZ2RZYgzLrBCK+iLRlKmtGQ8OosBpct6nuxtj31rl
	f8hwFLZK4tIpOGIsYXU9xirn3bl0g78+BPnu+Gb8NnT7xHIgrHX7UbVg/NIflYo=
X-Google-Smtp-Source: AGHT+IGS2SkoNgUtCC33Hu7GEybMTTgetpmYXGracfsFtDR9HtiXXW4uv8UCigJiKGvdOgxL1AhiBA==
X-Received: by 2002:a05:600c:4ed1:b0:42b:a7c7:5667 with SMTP id 5b1f17b1804b1-42f85aee76amr42496935e9.25.1728153894453;
        Sat, 05 Oct 2024 11:44:54 -0700 (PDT)
Received: from [192.168.1.18] (102.242-182-91.adsl-dyn.isp.belgacom.be. [91.182.242.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d169203f4sm2230523f8f.53.2024.10.05.11.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2024 11:44:54 -0700 (PDT)
Message-ID: <bc6673fe-367e-4488-b936-1bce5552f543@gmail.com>
Date: Sat, 5 Oct 2024 20:44:53 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] ASoC: add Allwinner H616 audio codec support
To: Ryan Walklin <ryan@testtoast.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20240929100750.860329-1-ryan@testtoast.com>
Content-Language: en-US
From: Philippe Simons <simons.philippe@gmail.com>
In-Reply-To: <20240929100750.860329-1-ryan@testtoast.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

tested on 6.12-rc1 with RG35XX-H

Tested-by: Philippe Simons <simons.philippe@gmail.com>

On 29/09/2024 12:06, Ryan Walklin wrote:
> Hi,
>
> The Allwinner H616 has a playback-only audio codec, with a single stereo or
> differential-mono line output.
>
> This patch adds support for the H616 (and H618/H700/T507) SoC. Based on the
> Allwinner kernel SDK driver, and tested on the H700.
>
> Regards,
>
> Ryan
>
> Marcus Cooper (2):
>    ASoC: sun4i-codec: Add support for different DAC FIFOC addresses to
>      quirks
>    ASoC: sun4i-codec: Add playback only flag to quirks
>
> Ryan Walklin (4):
>    clk: sunxi-ng: h616: Add sigma-delta modulation settings for audio PLL
>    dt-bindings: allwinner: add H616 sun4i audio codec binding
>    ASoC: sun4i-codec: support allwinner H616 codec
>    arm64: dts: allwinner: h616: Add audio codec node
>
>   .../sound/allwinner,sun4i-a10-codec.yaml      |  55 +++-
>   .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  15 +
>   drivers/clk/sunxi-ng/ccu-sun50i-h616.c        |  36 +--
>   sound/soc/sunxi/sun4i-codec.c                 | 297 +++++++++++++++---
>   4 files changed, 337 insertions(+), 66 deletions(-)
>
