Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E3F2AEE4
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 11:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769858062; cv=none; b=F/XadgN4nM1469Czslza68EnnAPZcaHVMfzANrqHd+lyl5y7Kg74H7H0/bTArTzPuhCMeyEnYeyLvWe/dR0pp/UHH5pi8I3GKhgL/1+UzhVVlcOvebzX+6A68nwjP/XsvVA/cnaD3+EsYjd3ioGlfRAU5X20xH44mOctUIyTUHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769858062; c=relaxed/simple;
	bh=7FfIMR/jYlwxyBLXE7zqwi5sIIIGC5nKSaU8m1rZ2WQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SlBkg2nCsGvtRtyyf1EfcKo0Z30gjMz3kN9r9HnxNqbMrNT/CzQcrNqAl3N22e/fDq3CjRDqzOfJ76yKvFF7+iCDPRkCzUbjH1dXZBucGLg2y6db/2s2Noao8YnVnqnWznNncFTOWzk+wCyEk1xg3m4TsbPTYlGShQR3kr1fCL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=PuwFonkl; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="PuwFonkl"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso30936335e9.2
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 03:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769858060; x=1770462860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tdH4255hYxmy/F++J6erRokTwGbIkqj4FsLH5B/UD/Q=;
        b=PuwFonklXIncLYDuJ+iO+9i03No/5+L4K0Dyjt3CFma/JtWYTOPP29MR8AKb74f69d
         zzsOWOUNIM+VIwlOH/wB0ol0NwykX/u1qOHsDOK2TKghLdowcb81/hw4wD+3tvLcu/pW
         H8u9E+rUkceqMfzVTtbE9z0OjO02MG56T78CvtC6Zin7zH8VNG7Ld3UU2uU6nMoaC/Dp
         2x0jDmN0tSMdZKn2UQtEUj4cmcNW2lf6IWTTH8KS+ZIn0JtvBUt5ZOhSf39FW1o6TvcZ
         iiRvrctn8PMPZOCAeURDgSu056b44RqqwHThNTSwGNBw4Iz5/mCRQ4D3rOeNQ+sKJdF6
         UY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769858060; x=1770462860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdH4255hYxmy/F++J6erRokTwGbIkqj4FsLH5B/UD/Q=;
        b=FJa83q9wMUUAgzbcA55COVYT6RytZJ+aY6z/IG3dbuD7BRqiWXpJ5IEo1j9BVNFvGN
         ITcUqmSFzIJnEG8IQbOB2t/3MnZbWFE/4hOwWHrMXeoLrHA7hoGLPr+0feoJoISp9ajm
         OgQa2XWhBx9wsZWjGRiYmCxKKLp4Z0JkUAYJeWLFqH7P5hMcRMcDcxEb78FUkmtBE84F
         YIMDMadAcY5OqsTfsj+G0+IZ5srXQBGdzHDQtMtcjL+efDRZPP8A2fJbOapsIzFGptak
         /G8WNG9Ay9Na4Tsdozdv80Hi+EkmMr7wDM1L5v8Fp7G5WJEjH1lbAWFocE2DUZDlPzb2
         Ti0w==
X-Forwarded-Encrypted: i=1; AJvYcCWEkrjzH2t+E9uXMt7E/ONov1P6CBsVHc/y3M93zx3oTZVc7m7IWcssU4pqrKAdLRiNITNTAL4e+WU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMc16Dk58ujqnG6q4RItFDY3QuHpSrI9jwMiCsWDJEZSaoZpCI
	3BUft+yw4+0rP4ztrJurS02MxylbsyepYYWFCCS8wPjJXcttWr+9XQZA7XQeHQfSseI=
X-Gm-Gg: AZuq6aKKBNrDtd9mgzUVK+NHcJmvmMbnDZFDhqy7JQRcB9ans6N/8BixTeZ/e5RDZGM
	I0VbTLZhs+aEerPLOZT+QIdLMtfgE0I9vKoNUIxo2HlbbDu5goC9aM3MUMZN65e1Z0rlaG1ZkGl
	7tHPbI24FO/d6MVZD+D7BLLJQY4i88/jfc04rOgHICOznOD4CekZgHmxDc4m0L0Bo9fANA9gNVe
	VYpPUVgHERcl1NaqTR33/7yxuy4gQ95kBpxD0vOaegH/OM54VUNGmXh8rGiH3PsTZz6lZtqlsaS
	hVSxUM8eiZGJvnCo83JWGgG5+tmhLD02wXOGp1Ao7lGg4Jp4J1yMDwcEYR6ABBxTnVAV9XHOqlF
	fWxL+VXC3/x2yrrq9aOw5df7sbc97jljlF43HrYcDuC+ljOgKYzE1bWrm/Men+ARcv4ZnIoPWVY
	06NHYdXLTWJIGsb3Z1DmUBdNa+
X-Received: by 2002:a05:600c:1e89:b0:47e:e72b:1fce with SMTP id 5b1f17b1804b1-482db4b5e04mr64888425e9.37.1769858059938;
        Sat, 31 Jan 2026 03:14:19 -0800 (PST)
Received: from [10.100.159.246] ([213.233.108.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cddffc0sm303822115e9.5.2026.01.31.03.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 03:14:19 -0800 (PST)
Message-ID: <56076f82-f255-422b-b99f-f182d413b34c@tuxon.dev>
Date: Sat, 31 Jan 2026 13:14:15 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 24/31] clk: at91: sama5d3: switch to parent_data and
 parent_hw
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <9431385f28f6a5fad9b4ee37086be58d87643856.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <9431385f28f6a5fad9b4ee37086be58d87643856.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Switch SAMA5D3 clocks to use parent_data and parent_hw where possible.
> Having parent_data instead of parent names improves to clock registration
> speed and re-parenting. Update the clock registration functions to use
> clk_hw.

I think you can drop the last phrase. I don't understand what it refers to.

> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

With the above addressed:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
