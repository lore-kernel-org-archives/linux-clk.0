Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321B522ACF3
	for <linux-clk@vger.kernel.org>; Tue,  8 Jul 2025 10:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751969161; cv=none; b=nLWmVENOyU0Ciy0U7DMx9B+Zo1js+PL7OT1MalgYsoFIXC2Qzno+dN/Wm3/sVVa4DllhMubuNhnAeOn+x7uRfIxP4TcoRFlZdWiJQNXFZ2yjgsO3IyRGF5CcaxhB/5MyoSxICxs+G856Exfxn6XTYmwaj6IzCY667+HHnpq4t1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751969161; c=relaxed/simple;
	bh=npw8gRSYyPhizWIvlYkY3o8UycV4g1GzUjZZirfa4LU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RuKztcCF4rqPQ7JMQcGly4P3WO89ZEJTSLFkr/XNTiTs/4FXCWTCYYTsdiYXBlXCZJBWxADQoB4V6YLzrGxcxrOTt3tiPwP1+5ap6beQFrWopM/SS0mUNzukzkvxZv2O9neSXEQvSHoyc3ZrVQV9ICoPAZsBIoMAFM3qgFSaFDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fRCTyowH; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fRCTyowH"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae0c4945c76so645356666b.3
        for <linux-clk@vger.kernel.org>; Tue, 08 Jul 2025 03:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751969157; x=1752573957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AFaofTBqf3jJFFOESX3JkhI6vcB/g19rZziWAPYTo4g=;
        b=fRCTyowHGO8N/wndTMW8oRBNnjcF3QarC42ddnyQ5Yjo3OVL3PgbRg1L4dARk0BV/h
         KaAbt5Ivf1fHNkXFDNLQi2TDVADEs/LjBiepF61i4RzLXiY+gP+KLb6KFBWBjY7JRrqT
         +an1vPHAj6t7eG84lSY0xpDQaybNhbi0QETS4JJrbVltAnRwbcfnFwOUOArhB/580CqH
         bgTDtVcurLM4HVr+lCb9FXxfvAKSBcukMmZCHVn5KTe3B1heoYWpmiwrulvdYX4F4a6H
         kiz3k0QVXZUtkaYC9vw3di+M82Po0HFGGHl9ZdnVCIp+9AGjjMT2GELOiySucNQepCLZ
         fG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969157; x=1752573957;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AFaofTBqf3jJFFOESX3JkhI6vcB/g19rZziWAPYTo4g=;
        b=leasAorOT7QzJ7srYbe+NU6fz277PxRrsPXgtS9PdTomnltwAzGYGuwhABWEYa0y2x
         bnEgcsFhyJNTO9BxrDkxt3YfEjedb8p217RFmP6COXeoCn/X4+/Ex9YxwtYmEJsbIflv
         DaOVrsSiDp/FxbhREqU8sNAKAqBYEmPRPbStu1oCmQ2r2sh/riRLt4GgN0fAjatgX4Cv
         qftyZQ5B0aAPpM5xdk4ddlUMcvGnKNzTO14XXfUmEEdV6VTWUjaFNDSykyiE4rAO2kmf
         UxB5ChEGOYgV3707I5hyBL40ZMXALndqJcqX8KxpRiIlBe7TKep18ySDQGJXSM3H9Tud
         RAUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnpa5tC5ygV9jhcsz+p4o+TuoXY/9ccfNWoEUlEBBACGGQNVm5AMqMpK6aevaNnJjCHAfhKUL7/CQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7hCxbh50oVp3P+89EoHLpKj5v/4PWO5L1AL1aSr0697nHiDAN
	4VDXPeu+sWEzliqLYUzo3HED6GHv30rFr8sFHPHkakFw9FES58NN3KvXSF3aAYD1+tg=
X-Gm-Gg: ASbGnctsshWtafpnI5JpOniSRIk9VNBkgBHEkhr5GaREaNEGpReRi31Hhp9gIXwpIcS
	y9AAnDiR/DIs9fYsnpTmnii/IEXzApQ+cnct4tkY0g6IgM2N3Ood4Kg5aUwbKbbWUQ3lw+T5gFB
	hoidQHmXi82GtyzqYEXkjZi83KmDPbMuwqNDjxySaFlpCXjaUqS/w34kXrPTl0qZYUKaAxuFs1U
	WYIuMKEDAvjfsioFpok69od7fHcrX7NgKMaJCucDpHw851wX/3l8P60VCIUlKRESHvGfG38gXka
	2slR0Bm094angjQcROwoDbSHXZGTLLZKw6xwjX5CwvlPFyScPtbrBaWyfJQuTNDkEPMurw==
X-Google-Smtp-Source: AGHT+IH1qd7qj95HCNmkjaef2cJo2Z48HEAQTcdtLEjCxkTcfgtf7esYUZor7+6jXUs9BBNtYqwt9Q==
X-Received: by 2002:a17:906:24da:b0:ad8:a935:b8ff with SMTP id a640c23a62f3a-ae3fe59934amr1264867466b.31.1751969157067;
        Tue, 08 Jul 2025 03:05:57 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb1d4dsm881665066b.178.2025.07.08.03.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 03:05:56 -0700 (PDT)
Message-ID: <4f45e4d3-9b06-4669-ac1c-c277b9402831@tuxon.dev>
Date: Tue, 8 Jul 2025 13:05:55 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/32] clk: at91: clk-sam9x60-pll: use clk_parent_data
To: Ryan Wanner <ryan.wanner@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: robh@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 varshini.rajendran@microchip.com
References: <cover.1750182562.git.Ryan.Wanner@microchip.com>
 <cc085ca99d75fe59c13acd74782d8437bbc1d65d.1750182562.git.Ryan.Wanner@microchip.com>
 <486d447b-9984-4044-a620-1d73ffd54111@tuxon.dev>
 <784f30a8-e524-41fb-8b14-99483116e657@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <784f30a8-e524-41fb-8b14-99483116e657@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,


On 07.07.2025 18:24, Ryan Wanner wrote:
>> Same for the rest of patches in this series following the "Remove SoC
>> specific driver changes" approach.
> Would the best approach be to make every patch atomic and change every
> SoC to match each clock function change 

Yes, this one.

Thank you,
Claudiu

> or put back in the sama7g54
> clock driver changes that where combined?

