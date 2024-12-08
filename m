Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D2914B088
	for <linux-clk@vger.kernel.org>; Sun,  8 Dec 2024 16:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733675431; cv=none; b=csQh4jtfxKNMwk/Q0eFCXqJKxfnia+0p11GYITW8iiquvYndkMsRSxdufcQxy604ZeifZWuGI5jkfPdpuGGPVVVlGtRos9PihYQ1v+ml+pOqBA2l1BvVusyG2d59VtI9fzWc6apXiRqkS0NCVNqdy3ZL/D+dK98OK8wGPyg8wMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733675431; c=relaxed/simple;
	bh=OFDmGehoK600SvToI+7RLgjBAFQXs+mVcolPpCj+dNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kb0smhNhpxWRd6DznLi2hT3cSjY1WKC63otss994AueUHssfweB1LLV1L3HaulkFcOc+LBRdF20/GK5jIHZvhV1Tn3ClBUl5vGY9tcaU8/2Ea31e/kvzO87zTou/NjD14zsLVSJDqtL5lVeDAuCGFc+3YxC7xo7rt+FAEzbT14Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OS7lJW0K; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OS7lJW0K"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa5f1909d6fso686298266b.3
        for <linux-clk@vger.kernel.org>; Sun, 08 Dec 2024 08:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733675429; x=1734280229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8qhusLfuIgsMbQqxPaQUwX3ow4Gf24/DeZxPYGalAiY=;
        b=OS7lJW0KQwPj/dpK1GsZlGQK16iHFjm/dbXHlyMetzafz2DYnsdy8vBj9qCJJT9MQL
         r1Qco8HEW68kiTVWGTw7+gOrzyMzM/kgyHS/vOZmr5cLxLilwaEQzIoR5WM5qsezSQCC
         defBDd+FhjdybNql+C6qk13L6f0giVSdbO1vvDEWFNpf/OCbPFHBUO6xneIbOe0ygXUt
         csd+/DAlQcm2rB5QCjNcMwtBV0AapOSgwDrV78pVpwyjKoRWFWTyP0mZ6Z2kDZj4O2Sn
         8QzRiQ+4qM8dxfwLD+7KMaMSgiafwcEIBO0IvDJgEnw/Pi3p/aXvmEj7pS0feJAzcSaS
         dKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733675429; x=1734280229;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8qhusLfuIgsMbQqxPaQUwX3ow4Gf24/DeZxPYGalAiY=;
        b=ma0SPVPgud7ZceI+g5AtufpaAHHP/Dpa9e0BU+7D3QQCI5X9xRoqezNJEZzLGudHBc
         76cUnCrfs1JL8UAYunwM4pWTudMngyLoKUmE15m/VlO2vaSRB0NEBw/BfUdVtbWE6nZE
         /GvVJoKGkq9bVoddkzMJirBofos2lNandOK5neQFhnOuLzI7DYowGtyh3vaWAr20HmaT
         tASFK1DtVpshN0iEaUKsrob4TwEx3rbujwAmFDzNURhS6Hw80lEy4Oyve3WpR9cidRNg
         Fd4K4YfGv9wIviaOjScQBWBux9jR+wKcFbKYlfzZnWXJARlzjgbV0BPul0F1t8SFgsLn
         IhLg==
X-Forwarded-Encrypted: i=1; AJvYcCXXujXDQYHS10U16LGTg1f04qMnfkZ9W3euBv0fmZCGamy+ImSCjQ37RtD2XKluwi3z7G+sLskZnm0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrrGvfOCMwXJKhFibARpaja7bITe7PvkPEqWV2ZqyW5V4Ll6ZO
	ezVtDLlKzd8QqbrJQUcpUhswUQjWuf/8SpSGwoRgtRUb201G3my1kp98gISjBoI=
X-Gm-Gg: ASbGncu0jAsfipFc5SPeLqaTGpi/FDOELWa673nGhz0YtbzIlpx5I2/UhOtI0KAzBy1
	S3jRHSo0d5XppxBn+W9Q+DudTI+mM3KRb5AhNZqYvGazjAiibgjsNi/7y6FCx2TQkLihBB2K1gP
	xx/drBJWd3VYoD39sDAUDXUeQ3oToWqK0iIyOI64FvJfydsff0AEy8M7/JLOB3ipTxjv+W27bwt
	atyyKU0/ENEfeZoeF/LFgKY0JzVaKgvyESN8O6B9vz+rpdeoe2FCJhZpOo=
X-Google-Smtp-Source: AGHT+IE7YDoN13k+KH8JOtiRLrAMtuSmlPV0i3qWniWezo/cHtHK2Sxr/2xiHf8TyJV2wCkaLPDXWg==
X-Received: by 2002:a17:907:8315:b0:aa6:7148:91f8 with SMTP id a640c23a62f3a-aa67148942dmr286404966b.4.1733675427547;
        Sun, 08 Dec 2024 08:30:27 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68a97498dsm5949966b.99.2024.12.08.08.30.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:30:27 -0800 (PST)
Message-ID: <022a34e4-2a9e-4cb8-8998-d5decc4d9fdb@tuxon.dev>
Date: Sun, 8 Dec 2024 18:30:25 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/13] ARM: dts: at91: Add sama7d65 pinmux
Content-Language: en-US
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org,
 arnd@arndb.de
Cc: dharma.b@microchip.com, mihai.sain@microchip.com,
 romain.sioen@microchip.com, varshini.rajendran@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <a8f880b89cd4470526a2955a0b6aaaaa24ba65b8.1733505542.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <a8f880b89cd4470526a2955a0b6aaaaa24ba65b8.1733505542.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06.12.2024 21:59, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add sama7d65 pin descriptions.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
