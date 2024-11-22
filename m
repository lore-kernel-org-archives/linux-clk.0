Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C89174EFA
	for <linux-clk@vger.kernel.org>; Fri, 22 Nov 2024 08:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732263474; cv=none; b=khiIqd9wXd9cWQyzPCKnfQegx9WTAscQBiwkqAL0C78HLGBfzjU/iGkwSrIFQeCug1tAujcHwcEbZEvBUQLY9sB7WSM0KJwCINaRy48sIxb/l7iVOak5+7bd2ckItJstlMV7q3YQ2q7Mq/Xvc1ecgAPhLGxknT3CzI2KI7UoyaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732263474; c=relaxed/simple;
	bh=boBUZED71KdfqGSGw6POXs81i1ZDX0l63rl2uX3ndUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dan3ozy/u84rG5rTQNWS1DHF562oC3FABlcWCYRT3R4QTxMnLD+8AYWA4aP0JX00lNyOP9IPm9VWYyORkB/2wz9Uv1pBg+RJdBrpmozomT9/AlUkqIXq5s0V1d47c4mbb8VDKZOQp4CnWWfKsyQvVXRlbhnok08ZFOKRaTL0j8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=A86UuIKc; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="A86UuIKc"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4314f38d274so21199075e9.1
        for <linux-clk@vger.kernel.org>; Fri, 22 Nov 2024 00:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732263470; x=1732868270; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3LYPzAVO9GrxpJTZAkUlAwOS3/mbRjtzYaoHCe2V1hE=;
        b=A86UuIKcJOWnfh6BTs2k6URjFs6JPYkje4N9UR42Y5w6AeZjAJAIOyZ/HkCz06Oc/+
         EDC77sO7/Cbre4vovx8E9Ti35Mi/AwAp6bgtudslxQ8UEZERUloWohDuus5/mTQ1XEbN
         Y34K/fUwGzrP4XAfH06qY7xwO4VJjGDL8OJunFQ622uq6Oy46qdyQPAE+Iw6e9G2Phnm
         1UKINkxuQAo62KkcMBl1UhDm9EvFKdh4Q9Kf4HKAv0cP2xM/Kk9RLj5qizSGqahz7l/P
         fRwTeGnGPWPoiAHXzn6a+2Ya86EssNz3dBzggB5cnU/kRz3d+unpO/4Q4kLBUqRksCc2
         J7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732263470; x=1732868270;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3LYPzAVO9GrxpJTZAkUlAwOS3/mbRjtzYaoHCe2V1hE=;
        b=Xxui6WYZyRBX06icjCUnt4i2jempBgJBmNmMz00fnOixNC6M10lOL8eNKcjARX9ZD+
         qqfTeyBA2xkyTkBzbryHqgKtIuve5dARXEFYb69R812I0tGw7DqN9u8EHDiiXlrjG5BI
         JKRAm4z/VILiFft7Qbja0/TWXz4eap6T32sNMQDZD7Q5R82Z+2igyfsCjH7kZ1bvLEG3
         Xywe7nqzE+z4GvUBY95X/DBsdfB2OTrx6u0hxf2yPXxr3hiKuvwXGZPxzyBOODpckkzf
         cBuDI4B94vsx77UaAMrLIha3xIud6N6HkJ3c9Oj/KgX/NUmwxt/s3dnFJu7dqg65l968
         QCqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnz3F4JVoIrPRgV/4xiCmza9Q8ws8KyiKgwHsKIQe/FWPrlO5a8+qFlSgiqEtVT4HmNF19lZuN4js=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/xjUgGFsQnexBGFPxJcuMSoAxuJcHoNzy9GN/WizjVp2xxq/B
	O4fFfGedPFl7NcWuxUFN9zMydxUflhdzX+uW1afyWQKiMojjw5KreOvtnzlTtdo=
X-Gm-Gg: ASbGnctYlJTPV8Abpjvzm54f3zNayw6yR6tPAwEEGQL1sp0nIpkII/KB4rV3xIXvzY8
	71JfiBvBjGnBWyZsVc76ywL2oyld6ie/pgT+RByOJQ7pn12hsjsKTS515utFm0WtuoKuaoGM8Uw
	lxjMFWxNo3ygQbtmyW80NKZNwLilUFI+4AFlX/15vSsuIwZJkD4G7PQDFQck128bLTRnnQTtH0F
	gwTwKj1edyAssiempgg//UM6PJRs4/BE4WqkUM/VjPuVuzO/AyIsuqDrg==
X-Google-Smtp-Source: AGHT+IG24uth11H3seaGIlK86z9Idb5xroXboR3d9BNbuTnG7ATgertZjJsq4KPOn8S8cOPUQJ6gqw==
X-Received: by 2002:a05:6000:2d02:b0:382:504d:31d with SMTP id ffacd0b85a97d-38260bc79f6mr1467237f8f.40.1732263469676;
        Fri, 22 Nov 2024 00:17:49 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc44f7sm1755264f8f.82.2024.11.22.00.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 00:17:49 -0800 (PST)
Message-ID: <bf8aa2ca-8a5e-4484-8f93-c74b7c6e0db9@tuxon.dev>
Date: Fri, 22 Nov 2024 10:17:46 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] serial: sh-sci: Check if TX data was written to
 device in .tx_empty()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: geert+renesas@glider.be, magnus.damm@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org, jirislaby@kernel.org, p.zabel@pengutronix.de,
 lethal@linux-sh.org, g.liakhovetski@gmx.de,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-serial@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20241115134401.3893008-1-claudiu.beznea.uj@bp.renesas.com>
 <20241115134401.3893008-3-claudiu.beznea.uj@bp.renesas.com>
 <2024112128-faceted-moonstone-027f@gregkh>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <2024112128-faceted-moonstone-027f@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Greg,

On 21.11.2024 23:32, Greg KH wrote:
> On Fri, Nov 15, 2024 at 03:43:55PM +0200, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> On the Renesas RZ/G3S, when doing suspend to RAM, the uart_suspend_port()
>> is called. The uart_suspend_port() calls 3 times the
>> struct uart_port::ops::tx_empty() before shutting down the port.
>>
>> According to the documentation, the struct uart_port::ops::tx_empty()
>> API tests whether the transmitter FIFO and shifter for the port is
>> empty.
>>
>> The Renesas RZ/G3S SCIFA IP reports the number of data units stored in the
>> transmit FIFO through the FDR (FIFO Data Count Register). The data units
>> in the FIFOs are written in the shift register and transmitted from there.
>> The TEND bit in the Serial Status Register reports if the data was
>> transmitted from the shift register.
>>
>> In the previous code, in the tx_empty() API implemented by the sh-sci
>> driver, it is considered that the TX is empty if the hardware reports the
>> TEND bit set and the number of data units in the FIFO is zero.
>>
>> According to the HW manual, the TEND bit has the following meaning:
>>
>> 0: Transmission is in the waiting state or in progress.
>> 1: Transmission is completed.
>>
>> It has been noticed that when opening the serial device w/o using it and
>> then switch to a power saving mode, the tx_empty() call in the
>> uart_port_suspend() function fails, leading to the "Unable to drain
>> transmitter" message being printed on the console. This is because the
>> TEND=0 if nothing has been transmitted and the FIFOs are empty. As the
>> TEND=0 has double meaning (waiting state, in progress) we can't
>> determined the scenario described above.
>>
>> Add a software workaround for this. This sets a variable if any data has
>> been sent on the serial console (when using PIO) or if the DMA callback has
>> been called (meaning something has been transmitted). In the tx_empty()
>> API the status of the DMA transaction is also checked and if it is
>> completed or in progress the code falls back in checking the hardware
>> registers instead of relying on the software variable.
>>
>> Fixes: 73a19e4c0301 ("serial: sh-sci: Add DMA support.")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Why is this bug/regression fix burried in a long series?  It should be
> sent individually so that it could be applied on its own as it is not
> related to the other ones, right?

It is related to the suspend to RAM support added in this series.

> 
> Or are you ok with waiting for this to show up in 6.14-rc1?

I'll resend it individually.

Thank you,
Claudiu Beznea

> 
> thanks,
> 
> greg k-h
