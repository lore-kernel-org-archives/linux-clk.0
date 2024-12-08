Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D397158874
	for <linux-clk@vger.kernel.org>; Sun,  8 Dec 2024 16:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733675121; cv=none; b=VWSJO2vd8c+d3kNnObQhDracBccPlvlve7WPTTy6VUVTYA2lmWm+4FQtoEBbXXk5brt5DBhMb56O/hJx+FwBWUzgJizIb55HI1FrISv/e/K9vjFLdIJliHJ/WY83ZEn1p8aRnZe0wIDe5N7jq3ldvpTS41T+nS4TpwiI7Wd1kYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733675121; c=relaxed/simple;
	bh=XCzsuhWtTBgtikcHpQDU1X72W4M21kQHkNT9eU1FAm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j0VIxUl8F45dAZI1i0ggbbDhQAWwMHRB3/rpLPe8zX8E7Ih7o5XDOhjfrOXyF+r7VUQtewAj81wW5GdxYv6CECQFARtLn6HDejVN8gPpD3ROllzBFzc1AZ3UDjKLuAgv8TKBYA+5/JcIQl/FgrZpkkMt3J2HMnGTOj7EcitlVBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JPtfCPYD; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JPtfCPYD"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d27243ba8bso5054853a12.2
        for <linux-clk@vger.kernel.org>; Sun, 08 Dec 2024 08:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733675118; x=1734279918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CL3RW1M+1jqdpfrkKxaJcNdqzAjdBj4zOd/4LxQYQ28=;
        b=JPtfCPYDuQDj06h8h+BLrPJzg/AXfRYTSlqafQby1FIHDPVYsp3WwvWVeqpJgyOtLV
         9lDr2Hc+9G6pcoQZFz4Ip8sk6giEqX1uWgDYzqUV+dnAVnKUkEgnaQG/8qWOMno4jBQK
         gpdoFjrJnXRpLdZmz8pNdEVWZl2FBju7+YEULByZJ+VuEL69iosjeokNCHr/fl9JcS3B
         BJmFqJhblfn4GJvsQZlzR8AuUVnArMm00PdjQQbpLekOZ18xxr4fCSjVP11SUBdHceec
         GAwzYCe3mnmtfdVNjBdRTxUWFNCQjsWGhegiCtRVkzdKAEVOMN04nEHKFeYTlzX6NvN/
         mcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733675118; x=1734279918;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CL3RW1M+1jqdpfrkKxaJcNdqzAjdBj4zOd/4LxQYQ28=;
        b=O9TSCvj3HftO7pV55vq7+TN3rtVRBaX4lTcwbUF0o5BLSAN13OTdZDgFPnUvA1jkVS
         khqUGQFyVdHke5EJRSCrl7TXJmR3GMd9TWo4VdKKw64R5UwXL47uK6Z3ko1Q0EyC18yx
         0+C7yYjmjNvklZ6aboRGkjvdkju+Gx2xiGAo9o2tdO+d+66jpV5eqeUDbSZ02bh7DEjd
         NSzilsCDlh15Tzf8EJnYewm46knbcBygtk02oIQ21yTBvExE/SZU/HzJ52stPEfuY8vP
         qRlySTP87kcirBxQ3OikvRePkDkDo6SV55Y05Px4lUT3UJaMhea+j+O0lNX0aQEDv8eb
         1lbg==
X-Forwarded-Encrypted: i=1; AJvYcCX8dYtXtJndjyQ4Q/DdTmI3pe4qqc785nW1w9FOQZtJyuCHJwFZBXLbGXG6KNzNQp+qDdN1jDec3Kw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqvuVyoAaKMrsdP9nOQeyv0KOcRvhn83dZCI8UspPUMvbUk/4Z
	AZEBSz2zsS6sY8jtQ4ltavS2ZX4YJhFgCYVX1o6k2v/r9i1cmnhpw4EJQqOcQoo=
X-Gm-Gg: ASbGncv21LIZ91LzviaICRz4tW2Mdu5qy0pDhpoG5fIGezwU8rlk5mW/F+O9zPakZlc
	KxTnjj7CxLeAvj4hES8ZdPAsZnQUcrjjaGbd1+hztdEjLngEkyVTmRvMXtWNeeYtoYHHOKhkIgA
	+TWXiaNZ+9O9P/YoEylOiaEtjaZDoTzc58fewBmGJKK4gqM6V3DKCrG71EybzIrYqjeYgi4whlI
	TSAzE0xmEId63BsonYgpUwa2iW5atLDOSHThe/F8o8VmfzLvwP2gVCjH+8=
X-Google-Smtp-Source: AGHT+IGJWEQkcn9gVXm4gaCzJ3nLfFkBCixjRRK2yzf+GnrblXYRmSu5ZvLGFdA9zVJtqFoG2CIf5A==
X-Received: by 2002:a05:6402:43c9:b0:5d0:cfad:f6c with SMTP id 4fb4d7f45d1cf-5d3be75abbemr10808689a12.21.1733675117744;
        Sun, 08 Dec 2024 08:25:17 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d149a49e48sm4883698a12.30.2024.12.08.08.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:25:16 -0800 (PST)
Message-ID: <91b98edc-4313-45a8-9bfc-7df83b3d5640@tuxon.dev>
Date: Sun, 8 Dec 2024 18:25:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/13] dt-bindings: clocks: atmel,at91sam9x5-sckc: add
 sama7d65
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
 linux-serial@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <b7a8a22a571f6fc2be56a25f26757f37fa8d2bb3.1733505542.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <b7a8a22a571f6fc2be56a25f26757f37fa8d2bb3.1733505542.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06.12.2024 21:59, Ryan.Wanner@microchip.com wrote:
> From: Dharma Balasubiramani <dharma.b@microchip.com>
> 
> Add bindings for SAMA7D65's slow clock controller.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
