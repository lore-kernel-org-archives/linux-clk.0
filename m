Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A163744E02A
	for <linux-clk@vger.kernel.org>; Wed, 21 Jan 2026 17:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015010; cv=none; b=nQyDisOzTzFuaOUJ0dz4P/woChnYHXz15CV93r/AODB0K6LnjvizHZS+8jso4l3oxhLiA1vDf3iEAAHFJ/GLJy5SAuCbOmiX3ynDKiU9gq5rpNrclXzXhIy1nqLmTQLzFJC1GeQhu6+5mVqAls9STBfBHNRtg7i55H1qsJFWAi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015010; c=relaxed/simple;
	bh=UvsEdyt9thVnAqd6eA1QwrZugGr2IQ5O7105Q9OAmSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m5rhF7ycVXeTvOy7kCOw2liLv4iU9wwCtSB1pvp31p7YMSxncJ1WUCbEmee7vzr7CsCTrzSjuSY9txJ5DiVIqoujPtS3g47IxQG4Du7wP8RcRDexep/4M191DnxdLO0+CxdjOUsDwhiopxZBJbALupdGkbVl2m1/RDb6+uf5CW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ig9WteXB; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ig9WteXB"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso159825e9.1
        for <linux-clk@vger.kernel.org>; Wed, 21 Jan 2026 09:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769015006; x=1769619806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pfs/4OF6mdSfxEvgwVu7e3Rr2mnsLc9qUMIuq21INs8=;
        b=Ig9WteXBIL2eOztbGCnwQdZMIBj65FYIeHPaIIlaUm8Al5Wy2fnllesr0nLd+YU/Jg
         27LMkpVtwHda15FNHj6qJ6M5Iu+Awqzt1npy4oQpjhN/wQOQm8cfKJLiODLAswu9C6Z0
         vs7+0FTXv5j67Z0HZbrNjgoYGj20qrdMG4I919FpbdfqhqLUCy9qGGvDCBCOY+ImH9LK
         gBD4wEWp4cABn5F4Wlt6Z2ivb4uSamA4vzEO4LP8DGTrG4CaOQGEdqOC4B+Nhqd1Oy+V
         ZekNMnuAOGgLKe++/dn1Y0oT0BxF4qEMazkwhzIxPa/6233Vg+lmPtLe53xWajbYSkkL
         eESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769015006; x=1769619806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pfs/4OF6mdSfxEvgwVu7e3Rr2mnsLc9qUMIuq21INs8=;
        b=bV1jgP8QlAVPiBbt2aF+/LKISpql01cTVzDfwnbEXg9BdECbb67i9R8sJXLYp3KdH3
         xQNrpY5StC9B4oetW2ac9uCCvWeU63ZE8z3Kocj2KNN1s2ZPNBESmIVYjXBqLv3CHJDJ
         bQmYWxj2e/cgOX94tsr3Y2QxxWA948CuT6fXLpJkF+EhzrjotKB/Xw6zS7Edqj2aLnjB
         cEZu5baEG1czAvcrBG4Q2/tYC3YQho37yo4+vad1QR6GLC5SyOb11MKPCdcIhvxp9eFC
         3oHnpd0Yamon2+Vg83Fhs6hiQ1A7ZnKMDgoUNknk9cgZv/2il1KCqweB11upKYNn0BvA
         lM4w==
X-Forwarded-Encrypted: i=1; AJvYcCVHO4QTGsXz7PNeUR+wDObBWAy2xa3OiyiZ6GQsWnSUxshyt0DouEXke5vx/6n/1M6m2DK6sx0kR9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZeJ7TtSkHh/WnbPSLd7XO+8ScywtEGA8nkrb5KwPXjqaKklGO
	MZvTKfp0sBHSb2zywa5QAeQ1jq2kEsgvwCrCXkgMiGy7ASsql34wpHTDbBujX4+etUY=
X-Gm-Gg: AZuq6aLC7OtzAIr37G1qX6dYRENBRszCilhQOJGBCJzpCCoMypaQ6DkK9G6vhxS9zB4
	WhW7MK8ehlnn5661etGW3Ap1AfQBHjmv/JCoVfNHM/JJE8PHxMvLw6yLPgSq09caweUe/WkbZpD
	amTw/H517DTr9BAOngQLUy95/jLO4zBanIOunBfUuTsE+9fEcFA604oWR1QGxsfdirjXkKPpS0j
	1FOIfo5eElVYSwtP7BROEAcyRn0lFiv2NbzVzcqx2m1uXQ6NDGSmxuiuRsud/nS+ot64hiE5AvI
	GrKQNoAtmzRQZn+vo1Lqe5GRLLjW1E30zp2VY5gZZ50EeroTQt9G2NfSaftdyovHTLs83rJK3R0
	P/yamuDgehIJTyE/VOj0uBX0dk5xZvP5gm0WLUiVz6jsfXIbYC8VKU4E27poR8dvbg8/s9vTr87
	ASpRvfCjMXpv7J2DREfEdT7rHVFRqzOSxbhI0sPtJbJE9Wo7iT8C8wrfzrjsAOxg7N9gSomspBb
	Q==
X-Received: by 2002:a05:600c:4e14:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-480470a6bb1mr1607885e9.16.1769015005816;
        Wed, 21 Jan 2026 09:03:25 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:ebda:5627:9bc:1ede? ([2a05:6e02:1041:c10:ebda:5627:9bc:1ede])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-480470287c3sm2222605e9.3.2026.01.21.09.03.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 09:03:25 -0800 (PST)
Message-ID: <c7e418fd-d330-4fa7-a6c1-ec1401ebc0c0@linaro.org>
Date: Wed, 21 Jan 2026 18:03:24 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: thermal: r9a09g047-tsu: Document RZ/V2N
 TSU
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
 john.madieu.xa@bp.renesas.com, rafael@kernel.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20251209091115.8541-1-ovidiu.panait.rb@renesas.com>
 <20251209091115.8541-2-ovidiu.panait.rb@renesas.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251209091115.8541-2-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/9/25 10:11, Ovidiu Panait wrote:
> The Renesas RZ/V2N SoC includes a Thermal Sensor Unit (TSU) block designed
> to measure the junction temperature. The device provides real-time
> temperature measurements for thermal management, utilizing two dedicated
> channels for temperature sensing.
> 
> The Renesas RZ/V2N SoC is using the same TSU IP found on the RZ/G3E SoC,
> the only difference being that it has two channels instead of one.
> 
> Add new compatible string "renesas,r9a09g056-tsu" for RZ/V2N and use
> "renesas,r9a09g047-tsu" as a fallback compatible to indicate hardware
> compatibility with the RZ/G3E implementation.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> ---

Applied, 1/3

Thanks
   -- Daniel

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
