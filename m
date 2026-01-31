Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBE0354ACF
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 14:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769869624; cv=none; b=DBdazJI02ciedv4D7gib9Zz8sdYPjUbKyuJ7NfKAT7zT+S0w2E32saKRHxqgsVfJbnMDMaMr8iWyylOgB6ylr+Yj3sjzs54LrCADcOuUdiOdU2Yp/ojaCft3NJZVSD1Af6kw737mvbjFFVd+oMFv2G5KliufCHA0uTzr6lY3C1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769869624; c=relaxed/simple;
	bh=JLbNuT4wvHvRF+H8EXOsvLVF2hATZ9wcHJKlSsr5w1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WObakHvRG/lx48nmAv6FNHM30Wlr/e0y0wU6vB9GtllQV9H+jhxMDaNLK11wmM637teVvgOh5SKe8a/hSi3JqVvr7PBqRBz79+OvcEIfvNz0EVUaJ6BAWF3jHMR2pWnF9zk0VLo2OCgz1XUnVsM+JzbJqP/Sn/jMQNaa0H/KKH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SMdP+jBs; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SMdP+jBs"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48069a48629so31084105e9.0
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 06:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769869622; x=1770474422; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IZemSK0/0LuKdd+h8/xFopjdq8nFilP6S5QwqNfMT2g=;
        b=SMdP+jBsvZcssMNRptJG8KH58ftHxIL3zGsX9dta97x1Fwx+FdKXZZVVQTiUzssy2x
         cF+Eypmml/+xcnU7GxbgfaI47EKHB9kOAaDICccMmhbCVWvqH9zJO6/LFPdg0UXRj58Y
         h87TGKGOAI/QvlVo7hs26GmoAm+ojdkKNnK94xhqolATlSgfRjDh3wo/9+ZqCG8imxiq
         RmnxJQLb6Dz2lxJljsf5K7CpjcDV62eEPYhegHB+VK5EB7VEVpfWgqFqBXYwPKvTMk8d
         S1vEHBHVSUQ7IVcwta4AHIHphJX9/AnklFTdNwR5s4zEq27KKWkTNXMikZfHhbvE2yR1
         WuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769869622; x=1770474422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZemSK0/0LuKdd+h8/xFopjdq8nFilP6S5QwqNfMT2g=;
        b=RpZ6LUJRnt1sGSbtbNUrUs+foQXRXfpuNFc/rxF2McG4WoLKjc+vdGEjmICVLRvdyx
         UGytAaYoHs+NUbd4VBxGALmCkOSGneTtQFpKRU/UbvYb4JA5TvIw6jQxa5Ubl3yKXmgI
         pNobNYB5xb+AhJu74dIa3xboOKCWvuC1cNjRhcHQcRdEEp9oMEusbS6qTUDear+dnyhP
         tS0TKOyQJbgpFl3GkoLZ2wSUvD94lFg5mL41oyHQR8fYjMOPc74uVv9N6KtTXD4jsmWs
         ADCsPq5x6O0CccvqugPuvULmsZJoMcT+X0jJzOCSizCQXEtrSM2/FSKGFplGIx5LO04G
         wbxg==
X-Forwarded-Encrypted: i=1; AJvYcCV1WzeSTlRlD8veBh4HimMGsW0w6IbqLi9C+9zauFq55aWAMW6XPfT14cNYVt0CJYcIk99085ri7Gg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPkBlHcXvI8HVqX+zjKtEXn1KGCayQcTKU2GRt7jaN9pCMbMcn
	ieAqgoAOe95WwOxtrfrQ0EbAjWBGNS/ijAjTK1a0RGP8DVzEIVx9iTRM29O7zMluhuk=
X-Gm-Gg: AZuq6aKUQt90NeeWEdWA0/FBSCEy1fQXrDdvf8wdTC7aHzmYzTzSQ2MFiGhOAiSlyUx
	QovawCqHuONgau6DY+H262rp2HNix6ZLZR/2yUkEAQp1grGgAv1ZCV7B1IE2oEUZirOdmjLdpoT
	x65tAtoRTXOlk3/Z/Yv6QtZaZFdL+kZqd1Uua8S436Q7KAvU8qsqcTQDxQH3O1SUFamdkh+i9q2
	xZLJmf9HUau3LUzM+KHd2rZjQ/0FMIkSYtTPAoft9hX6nLxSY/SUH6HoJMOmWhJ/o0g07HG6X1C
	f4QJ7ytlPXldmYt0JCi3k31IFphc/WzkIP4ORHOkL5UyUx0NhIHuZv/BgeHGf8SKVmwYy1MNTVb
	ArTI6jrVZdc7/g2pD4aSgwKnOhJWRdNngudU36zj7/hT7ZLwQiwYCwTmhuF8a+RzbUkoIt1NDjD
	UxMvCeeNXBBF9xDk/XPQ==
X-Received: by 2002:a05:600c:6088:b0:477:93f7:bbc5 with SMTP id 5b1f17b1804b1-482db45bc1bmr73362655e9.10.1769869621777;
        Sat, 31 Jan 2026 06:27:01 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e267aad1sm39377375e9.15.2026.01.31.06.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 06:27:01 -0800 (PST)
Message-ID: <ea33dd99-02f3-47fd-ba78-b1988b4d3911@tuxon.dev>
Date: Sat, 31 Jan 2026 16:26:59 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/31] clk: at91: pmc: Move macro to header file
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <ab320688cf0f527089254eeb242acbb87569c509.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <ab320688cf0f527089254eeb242acbb87569c509.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/26 22:06, ryan.wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Move this macro to the header file as it is used by more than one driver

Please specify which macro.

> file.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

With that addressed:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
