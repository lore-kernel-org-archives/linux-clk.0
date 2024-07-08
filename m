Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ED56FCC
	for <linux-clk@vger.kernel.org>; Mon,  8 Jul 2024 05:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720415966; cv=none; b=Kp++XEGqIeZVjnn8x9ReK/0/Bvocv+IQVw4WEhXoQ3R6/kp7Cr+HtLY0xlhd3SWu6IcQURwZ9Fi2txIZn6MSyK+4EdO5oLfzNnmtB3xmxRDMleBJdf4GxEAlvYA9mdaxkkeHMP8IkcFofNquqx/QL8B/tnLD7JvLHUBY2xA0h8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720415966; c=relaxed/simple;
	bh=obAmZQjKYTR4UL87PjfxdDYKt/Cd4nommN23G2lJ6Zk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mOpoV2LF6QbnccObg3LPjm9W+hYzWXm8BPkKrgph0eG+DcLheIcpj73VEvgsvzl6eoRl2g026mytakOb2NRMxJurIjR+DQDWQ2BrvJX7nNLzzAb2sVX/+1qGJUbz3kFqC0c3g4jVV2Vww41kJcHMm0/0hSudscMCgyWdLVHh3A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bMfYhjyH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bMfYhjyH"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-426526d31a3so15877775e9.1
        for <linux-clk@vger.kernel.org>; Sun, 07 Jul 2024 22:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720415962; x=1721020762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=st0ZPkxd5F2MKlXcA3s5v8aNC1YTG+RQErMhWa4hH14=;
        b=bMfYhjyHrOpHJTemmUiHIfnwoSuq4Lb1JBn35+xc6WPW52xUTfafC5Noq5GqnWCFjs
         K1bb5eBNnFyfQffnS93vuI0/Zb53uVen+6MsIjBldxvmTq8YRQuqb2Fi9LZx8vC9rCGc
         oP6xGNVz+1MZ2Eu4CIFF9J+Ug0pQ9SHAL1r0C16cFdwzuBN5VGp7niiKpc/a6aSOYzRU
         vcsCAUh3I/3KatWqRTJ5TQlHLZpSE/6ZZGe6A4qQODm2wKMSf/i97S7jRuCXphnalje7
         e0zfyGLTDRfBfh7NMUTeSZ62k+5sRrLOHUe4c7x+wRJ1nRnnzuhi4fjZsSPmj7TjdtHM
         aYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720415962; x=1721020762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=st0ZPkxd5F2MKlXcA3s5v8aNC1YTG+RQErMhWa4hH14=;
        b=VXyr8iMg2JzF+hGKcUkSg1CWbIGrG/9iCyruo7nSG0M6c6h7zD1FxFfM/bDzc11O6m
         /j4N+/k8roxozPsx4AgUpFLJenDWarPv4maQJZipfKBGhuSLmE5YXUEqcpIejH3u4ErQ
         B4q7tb1HlXGXq5SD/wubNGH2AbSmZdqt2/Vhoy2EIeG/zv1BFDg5lHNfVeypYnZAJViQ
         1EJ8v/PIhgYoeT6xjRFyqzZ1BEXWy2ti3SGOTJ5rz6GJ1/JhA178pPanKGDKMHot5Ian
         tb9jOAcbwwnPdRcrhqBihYOboVgfyXfYJJbQ2T99PqDTZ0K0Ybg2fQIVgNHanP8ftINA
         1Yvw==
X-Forwarded-Encrypted: i=1; AJvYcCXdS6zKcjU01iY9y9oKBRPdeMeqKxjzQp6CIxxhBrtpLeFgpK4i3ot86yXruhk6Cfb2sYwDDHYmbRrBFFFQgZe0SFWrTHEXnOgo
X-Gm-Message-State: AOJu0YxF9cTb+EKxa8wqmXvMmdYSBIA8/fyEmP8MQydlkPTTCK8jBbIQ
	P3WrGmQFMBY3/PbV4XzV5pFkicSxkrCW2937xwApm/XriqUO+pGkmPCcRp/mpzQ=
X-Google-Smtp-Source: AGHT+IETsBIsaljp9EWGAGT81NQ2T8WGDGmhewcJPHsOXa8m0v7dKcV/UUR92Qj8s3oEWCOzEEaNvQ==
X-Received: by 2002:a05:600c:4289:b0:426:627e:37a7 with SMTP id 5b1f17b1804b1-426627e3bf2mr27955515e9.8.1720415962157;
        Sun, 07 Jul 2024 22:19:22 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266a38f5a5sm21441355e9.43.2024.07.07.22.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jul 2024 22:19:21 -0700 (PDT)
Message-ID: <dc232ee9-b28d-486f-a878-0320be84d1b9@tuxon.dev>
Date: Mon, 8 Jul 2024 08:19:18 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: chris.brandt@renesas.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, wsa+renesas@sang-engineering.com,
 linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-5-claudiu.beznea.uj@bp.renesas.com>
 <2wm6vd4dib7tqpdq2eusjhyvfl3sofyvy65w6axvdjbkmgm5cn@bjltpbwwilc2>
 <CAMuHMdV=Uhqar6k_z_wo5jzge_7oY4tBK5zNiBbpsWa39Wvabw@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdV=Uhqar6k_z_wo5jzge_7oY4tBK5zNiBbpsWa39Wvabw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 05.07.2024 10:19, Geert Uytterhoeven wrote:
> Hi Andi,
> 
> On Fri, Jul 5, 2024 at 12:42 AM Andi Shyti <andi.shyti@kernel.org> wrote:
>>> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
>>> index 83e4d5e14ab6..002b11b020fa 100644
>>> --- a/drivers/i2c/busses/i2c-riic.c
>>> +++ b/drivers/i2c/busses/i2c-riic.c
>>> @@ -113,6 +113,8 @@ struct riic_irq_desc {
>>>       char *name;
>>>  };
>>>
>>> +static const char * const riic_rpm_err_msg = "Failed to runtime resume";
>>
>> Please, don't do this. Much clearer to write the message
>> explicitly.
> 
> And the compiler will merge all identical strings, emitting
> just a single string.
> 
>>
>>> +
>>>  static inline void riic_writeb(struct riic_dev *riic, u8 val, u8 offset)
>>>  {
>>>       writeb(val, riic->base + riic->info->regs[offset]);
>>> @@ -133,10 +135,14 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>>>       struct riic_dev *riic = i2c_get_adapdata(adap);
>>>       struct device *dev = adap->dev.parent;
>>>       unsigned long time_left;
>>> -     int i;
>>> +     int i, ret;
>>>       u8 start_bit;
>>>
>>> -     pm_runtime_get_sync(dev);
>>> +     ret = pm_runtime_resume_and_get(dev);
>>
>> In principle I like the error message to be always checked and I
> 
> s/message/condition/?
> 
>> will always approve it. Whenever there is a return value, even
>> when we are sure it's always '0', it needs to be checked.
>>
>> I had lots of discussions in the past about this topic but I
>> haven't always found support. I'd love to have the ack from a
>> renesas maintainer here.
> 
> I don't mind checking for the error here.
> 
>>
>>> +     if (ret) {
>>> +             dev_err(dev, riic_rpm_err_msg);
> 
> Do you need to print these error messages?

No. I have it here as a result of some internal reviews.

Thank you,
Claudiu Beznea

> AFAIU, this cannot happen anyway.
> Ultimately, I expect the device driver that requested the transfer to
> handle failures, and print a message when needed.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
