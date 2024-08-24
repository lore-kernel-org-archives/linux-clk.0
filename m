Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7B047A6A
	for <linux-clk@vger.kernel.org>; Sat, 24 Aug 2024 17:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724520495; cv=none; b=fXDaOg/DHnRoxabH9acAyBcakFn08Bjw8xmGJ5u3dJw/DmTQ7G6AUy8tsEtlUpe98T0MT+iNjKVRO6+J6CBDw9m3DZLM1Op0LD0pj71SBOfrRpalPLzUNWC65SgIEb5F+5wrLO1Q5w0T/y+PM6w/xPY/b2wL6+Fl+OaCNwfp0fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724520495; c=relaxed/simple;
	bh=G+DYGeNowrK9DfjtX6jb02BsxwxQEtXCFbG3AWjzsO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j0272+lQ7ESRpwKruWzvaEKOKPdMpFVWwJdDk/raNELMC8CFkRJlJPOCPzDTi/cGJPKPfZu/UJ0ZZhnIJvFvqxb3n2cgOePHOBtmLKtEkASt4v3ExJjJnk0ijUhGV6I2mG0c+ye/VSVs9WhWQoLS4Eq/RVOaeVqn8OPaCB/0aiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=q+8E5rrz; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="q+8E5rrz"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a86910caf9cso486229366b.1
        for <linux-clk@vger.kernel.org>; Sat, 24 Aug 2024 10:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724520491; x=1725125291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dAjX8uJ5kKnKORpPTokQbusW5FK9D7CYGqN4q6ZCkB8=;
        b=q+8E5rrzJs1nHbByqL5F5ldj9J8lnGE7cMcsM0v+iahE4FJwrhVn+qA1k0aXuGOs9c
         FY1fNbUZUP0FCNeXRT1w7P43KviW1PUcGHGojZHHoUBb+lKGaZSO00Mo5LMsuzASLl5d
         2lHScEWbd1YL/UrOv2PhJfxUSCK0Y276vLsgBZZjYSmMQSkvqsK6m/EEir70yKAhwFH+
         NXA/zfj594YKbhjiFfvDZLDfrPbxxWEKXvhq0LCAANA+pq9TIwMNytaljIVdDOxYnbD8
         kt+87HwgG37te7U7Oo59DD3rqHpidjcCe3goviC6WkB0uaeQ9158l5C8OKsrrJaoMKZE
         MpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724520491; x=1725125291;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dAjX8uJ5kKnKORpPTokQbusW5FK9D7CYGqN4q6ZCkB8=;
        b=OOzUs7hmLRPe6bHPo6d5gG74M9Hq9AbE9MmSsJTUhvhEBlP2iLyVUHpgvNjMFJTorn
         ZMBFh9JDxCqadRdixLioAZVPtti9Ne/SLaaNLUtNaI31arUZOdJTv4PGbKb6/H3566EO
         tSXo+XnDB1OCni0TLpxmxz6fjX+EQ4Ivr7YIgTjYiPIX0bBjo3tiNCFXVehixy1hev1d
         kBvkelr8RVvc68Z49rJQISLNsMZ4T9/yFrj9BjFumdQGG47cjsVrS2sp6CWAg4O8DTu+
         RQ2WLRqyGiBSGupnVWEfrwBLUA/WI42qwEvVw1Ifgz8JP7MAuUya5rirCUMdWKSWToMz
         azBA==
X-Forwarded-Encrypted: i=1; AJvYcCWd9l4GS9Wi4nrseYDUj57QugDcZxIZARJlaXmIgRclxm/PfRZ4oaXTzM0BAWPZ8U214onNNzNNq8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtG8yCs1utTyzb1LcVW7yLlEfGZo9QukbX9wggjK7bLhVjraTu
	lHtJwIJIYVKl9KwimguI6R6RBhRk4ibTilM7tuEW0GZK0RUQdKk7mifR1Gx7aG4=
X-Google-Smtp-Source: AGHT+IGkZmS3th7XQ+DNJRc7J1ksjGqSiB6v4AK9SrH8RDtAdo9Neq+o7kwWVAjvRjKkO6ui7OWhww==
X-Received: by 2002:a17:907:d89:b0:a7a:bae8:f2b5 with SMTP id a640c23a62f3a-a86a313765bmr425883266b.36.1724520490524;
        Sat, 24 Aug 2024 10:28:10 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2a5077sm425612966b.69.2024.08.24.10.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Aug 2024 10:28:10 -0700 (PDT)
Message-ID: <1f570dfd-ca07-4dfc-8c2b-de551cf24415@tuxon.dev>
Date: Sat, 24 Aug 2024 20:28:08 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: microchip: sam9x60: Fix rtc/rtt clocks
Content-Language: en-US
To: Alexander Dahl <ada@thorsis.com>, linux-clk@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Sandeep Sheriker Mallikarjun <sandeepsheriker.mallikarjun@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20240820132730.357347-1-ada@thorsis.com>
 <20240821055136.6858-1-ada@thorsis.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240821055136.6858-1-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21.08.2024 08:51, Alexander Dahl wrote:
> The RTC and RTT peripherals use the "timing domain slow clock (TD_SLCK),
> sourced from the 32.768 kHz crystal oscillator.
> 
> (The previously used Monitoring domain slow clock (MD_SLCK) is sourced
> from an internal RC oscillator which is most probably not precise enough
> for real time clock purposes.)
> 
> Fixes: 1e5f532c2737 ("ARM: dts: at91: sam9x60: add device tree for soc and board")
> Fixes: 5f6b33f46346 ("ARM: dts: sam9x60: add rtt")
> Signed-off-by: Alexander Dahl <ada@thorsis.com>

Applied to at91-dt, thanks!

