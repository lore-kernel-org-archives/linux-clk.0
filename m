Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251F01CEAC5
	for <linux-clk@vger.kernel.org>; Tue,  1 Oct 2024 21:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727819911; cv=none; b=Mgs8KxjuZ3jRok2SnV5JvQHurEa9gQNs2cllOCsm9kfyROJ3OvJA3TIUM+kNMjGJFVk3oRyUBRj6G5gT4AHo+wmMGKOMA0etSjZKG3c44sQOCfW+NwheITlVNSIxjpJpSt8GuJsKLqCCPcAuI9hcrduM0i8biSf1tCsjzyXSqUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727819911; c=relaxed/simple;
	bh=90cj3MZQ2bSTZsUCDSDy7qQ6PfIFyQv5SQPEYusdK10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ECggRIEtzQ8rTzq7F7JfLIduMJ32Yh1eaFijKncrFiI3jK//mEnrrBixoe8HbrK50GL+lVlWK8abRSsOCfNS5JUepZs2eJHuY4owthRJiYDvRK3uXaBtf+AFbaUZsVuaEkj/FZ3wyxVOm4GZZtsKgcdN123mzV40k7FKCTWWAWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=JMzEvdTk; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="JMzEvdTk"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3a340f9dd8aso32860585ab.2
        for <linux-clk@vger.kernel.org>; Tue, 01 Oct 2024 14:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1727819908; x=1728424708; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ypgub8lGo9uIxhP/Ts+gM6FIKRMUkTQXJvJ7axKC0No=;
        b=JMzEvdTkiuOL6G6w2L0fd5fv+tB4gpLE9wv4xaqcPWTRSe2ZvJ6y6SvKbQTyfsh+Z/
         ClpVxY2oKl7rx103MA//Y/LrTKwaey8VNOLZ7orVTwk090FR+Iscdbfv9E8KcUnj5YD1
         tXdKvc4Rft1yaqoY8R6+uTjwKniGYefF3d/W7wXNgvzjpRmv3ZUwhgCWxGFWMqS3nyip
         8QCjTu+vi6H8zjYn+lilaJy6293cgOY2ecaZvvBSIeNd5wrOTQdp7H50/HQ1b32w8UT+
         e/R0cyKrmclnFfa7ziTfRUSEO7S7qaKsolXbYU/PpvLdP5wNy2sDemGQbypnumJThH3c
         g4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727819908; x=1728424708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ypgub8lGo9uIxhP/Ts+gM6FIKRMUkTQXJvJ7axKC0No=;
        b=aWhSWoxAnyw85fA2XmmdmLfdh+Amu8iR5RL5jL7r967ErG/xu1kqWDuHXYrk+L9Ypp
         t5VS5w2TjVwr7hl8QOHTUTINaGsHjqqLGqKP/1Egfvp0m46ry2fQSgwq6vJUeFm1UQ9y
         a5ZAxs7EcO6jZpXbBq8J33S8nBakQS03+2AiDUbPV4BDoSsy7M6XZhTfRxVblGHDSdDt
         MRyfkcv9243HdU7EWtRHIigo3Wu2Tnr4ZA7JCpGeicLHiQ69V1gZ06cBlv3NZhElZ1yd
         LDPQ72NGHh6ON86nwF+1K6PGj6qczbc/8fvcm49Y5DNsriSssRDnLQwHmwV7npuxHba/
         tR8w==
X-Forwarded-Encrypted: i=1; AJvYcCVtrxbLlCf/3+oETu8zwfqVnVwAD2sMNNlCKgBHAkeRxaEUbNa6KCnHi0id1O/ji84JCw0NwBit4To=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHwNZ/zNFhdjxs8ZjCcaisF+rVO4Ucbj9NwHRgPCL5C/So+Pj2
	EKJjd+nOll1dPJM+TdvtaSLc8IWG6SqVCZvlQZQzN6U9GqPRZBmKWbKLOzx+miQiBV/VKvOXQYE
	tX7Pah6EsC9ForARNDLUUWmEMK1X68TrCzyGU
X-Google-Smtp-Source: AGHT+IG8Mbwj1HalbNL61KqJPzFf+za9Ivu70OdRA7nBBfmVxjXJSGKtMf6v6sdYVH+UJ6WqSeqKg1y+vZZ3u8imlbI=
X-Received: by 2002:a05:6e02:1c87:b0:3a0:a4ac:ee36 with SMTP id
 e9e14a558f8ab-3a365918466mr10985925ab.5.1727819908246; Tue, 01 Oct 2024
 14:58:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240912-test-v1-0-458fa57c8ccf@analog.com> <20240912-test-v1-9-458fa57c8ccf@analog.com>
 <CACRpkdZb6AhxB7XEtOsxV5_oa=c1h2+ZApLFsTS_MQs-cjLmsg@mail.gmail.com>
In-Reply-To: <CACRpkdZb6AhxB7XEtOsxV5_oa=c1h2+ZApLFsTS_MQs-cjLmsg@mail.gmail.com>
From: Greg Malysa <greg.malysa@timesys.com>
Date: Tue, 1 Oct 2024 17:57:16 -0400
Message-ID: <CAAjXUapu1DBqnk24ng0izU7opn67YxiwpGpFtqrBmqNgyCxRVA@mail.gmail.com>
Subject: Re: [PATCH 09/21] gpio: add driver for ADI ADSP-SC5xx platform
To: Linus Walleij <linus.walleij@linaro.org>
Cc: arturs.artamonovs@analog.com, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Utsav Agarwal <Utsav.Agarwal@analog.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
	Andi Shyti <andi.shyti@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org, adsp-linux@analog.com, 
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Thanks for the review.

> > +       __adsp_gpio_writew(port, BIT(offset), ADSP_PORT_REG_INEN_SET);
>
> Interrupt enable in the direction function? No thanks, poke the
> interrupt registers in your irqchip if you make one (you currently
> do not) in this case I'd say just disable all interrupts in probe()
> using something like writew(base + ADSP_PORT_REG_INEN_SET, 0xffff)
> and be done with it.
>

This will come up next time too so I wanted to mention that INEN here
means "input enable." The PORT design has two registers for
controlling pin direction, one to enable/disable output drivers (DIR)
and one to enable input drivers (INEN) to be able to read the pin
state from the gpio data register. If I recall the bare metal
reference code toggled both but we can review if setting INEN for all
pins and leaving it is acceptable as well to simplify things.

Thanks,
Greg

-- 
Greg Malysa
Timesys Corporation
