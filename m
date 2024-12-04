Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC00F192D8B
	for <linux-clk@vger.kernel.org>; Wed,  4 Dec 2024 08:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733301103; cv=none; b=bAZ6mR4MLg9/5dp54wxphYkuKjDMBNhvoQU41Vox9Nmx4+C0iQk/64nZxU5ZjPSnt9nDpxPNCtRVMHtkWjSIocCdTVsrnmK9hi8hsbVfz3sV6HTxYVtBp3HQnOYKikJWfzFR2fq3Q4H+UtMCxxZjTat5N9Axi+0h4v+YWrghZKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733301103; c=relaxed/simple;
	bh=xabGMu3fdt5kFURE8R2vOsZrTXZ3kgYgaYfP0f8Lock=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uHjEl8lAA6zQvYPyoJly80mCETKC3Kz4NM5oTkOk4p80vPHaOBk2GQIMBBPgVcKbg8QeylmYBLWItDPDD8AUlSeT10LwEYkFdro/r/m4gQ8aviZai9CsQlQJoCPCrraS4KvWa8IyRWgmK3oQLoAf3sXyi6/atMR+naGxSgmyiQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SDAJlXbc; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SDAJlXbc"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4349f160d62so53313695e9.2
        for <linux-clk@vger.kernel.org>; Wed, 04 Dec 2024 00:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733301099; x=1733905899; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GuEPwyIkCadZaJxdWvgGbzvWeURHvA2orRW9IhLBR4k=;
        b=SDAJlXbc+dFNvAZtCEL9z4dO7tpL1NCIZbOIMTllgcn+Hwx9qKKFR3MICdDaB7bOwf
         pO/4C10NFE7PdQillzmvinuobHqVhIoVjmqfwPD2lsIW9GHKmEb12ZUCaejQDVk1c8tL
         93ilif2dimOKq5EgwBXMsGHqCZjPdYJGLC91roJR//vrsZX7LtJ7bAkXSusmh4i4QI4Q
         C4jQ2sjcNvYMsAntI4UN16oJaVBGP00bTrS8SUcstQvlhgeb3EuU/gMbhYSS0Rf3ZKxn
         MWo9tCtk0N6mFFMsteUj/0NdjyPfWB8FmHwF+bIlqSTQ57CuUy1o0Kj8j/8geIMbdCiM
         bf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733301099; x=1733905899;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GuEPwyIkCadZaJxdWvgGbzvWeURHvA2orRW9IhLBR4k=;
        b=XoTZVay2DvRPOjd4w1u3krqaf196x2qzIQmaDZ63QpfKrVYZe+ha4SW+x1fz84DWRC
         sJx/GzVu9f7W+6iFLYXlBG5fmnZfYtyh8tE7kS19Tg8e7kGTtn22/9C96gWq3Ez+cv2k
         ksPnqoTDVuUet9K/VJFf9FRUyZMLAYRVvi37isf4T9HzDECTVSaHsr3TNJ0lQN/4w/D3
         GQTbXI+LXoMD+J3RKa4U6UhkQdmqN/QnU7rq97Lak4dLARKonLruBvSdRKjr9pBpyfts
         n36q0400Ox/74+IvGp51x/kRt8BqorGXPYz+VdtXTR4UkTYOxlHYJ7A1go+lhtW22kvR
         pwRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVJxZIJq0aUuu3c1HxHHv7aLyRf2rR/qRFn24maSHxNcj+28YaS1h/T/26SO8CoOAg+aa3KFIhtnI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9509mi2nB+oWsztvWKLBpwOefTm6Si0xarOm2qF+bvK4Q/Zxz
	LzEnCac5LHCpOzDWo+mbtNotfL1Y+G6OfXkiUAtG28lUT9LPLyEDxFpF3nTxjC4=
X-Gm-Gg: ASbGnctlNz/5UYMrzWELXyHvE9mUzfjNCiJPRh2OswnLme0rMIGn3MaqV6hr+5QT9KI
	gTMSNwpxIzg7RMqZeekhaYJpDQ4z40Zc01mYj/XktyOHAFlv9uo5eDw2r+L/aLzcXI2/qOZyHp7
	/I64sSuAnPepIPGZ5OaTKihMeOs6+jRdtPmYYGvFet0o/uRJER7qEWr6sRrelo5JVw9F7kIUCFs
	cgRXVvBrruFfVA5sLD9/k9/H+ayO7i2EVkdrmB3MCO5dKaMLgDOLB12x1A=
X-Google-Smtp-Source: AGHT+IHQNqpt+GIB9xF7p8MXDoapzcemzg5VBTJ4EDGzEYyaHfuVToI8Mqv94RLzyinN5pW25vh12w==
X-Received: by 2002:a05:600c:5117:b0:431:6060:8b16 with SMTP id 5b1f17b1804b1-434d0a1d63dmr53758325e9.30.1733301098852;
        Wed, 04 Dec 2024 00:31:38 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52723b6sm16489015e9.6.2024.12.04.00.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 00:31:38 -0800 (PST)
Message-ID: <e05191b0-eb3b-472f-bd8f-9d9a28100d0a@tuxon.dev>
Date: Wed, 4 Dec 2024 10:31:36 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/14] iio: adc: rzg2l_adc: Enable runtime PM autosuspend
 support
Content-Language: en-US
To: Jonathan Cameron <jic23@kernel.org>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, lars@metafoo.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, linux-iio@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241203111314.2420473-1-claudiu.beznea.uj@bp.renesas.com>
 <20241203111314.2420473-8-claudiu.beznea.uj@bp.renesas.com>
 <20241203200046.0dfb784a@jic23-huawei>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20241203200046.0dfb784a@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Jonathan,

On 03.12.2024 22:00, Jonathan Cameron wrote:
> On Tue,  3 Dec 2024 13:13:07 +0200
> Claudiu <claudiu.beznea@tuxon.dev> wrote:
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Enable runtime PM autosuspend support for the rzg2l_adc driver. With this
>> change, consecutive conversion requests will no longer cause the device to
>> be runtime-enabled/disabled after each request. Instead, the device will
>> transition based on the delay configured by the user.
>>
>> This approach reduces the frequency of hardware register access during
>> runtime PM suspend/resume cycles, thereby saving CPU cycles. The default
>> autosuspend delay is set to zero to maintain the previous driver behavior.
> 
> Unless you have a weird user who is polling slow enough to not trigger
> autosuspend with a non zero period, but is still saving power I'm not convinced
> anyone will notice if you just enable this for a sensible autosuspend delay.
> There will of course be a small increase in power usage for each read but
> hopefully that is trivial.
> 
> So I'd not go with a default of 0, though what value makes sense depends
> on the likely usecase + how much power is saved by going to sleep.
> 
> If you really want to keep 0 I don't mind that much, just seems odd!

I agree with you. I chose it like this as I got internal request (on other
drivers enabling autosuspend support) to keep the previous behavior in place.

Thank you for your review,
Claudiu

> 
> Jonathan
> 
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>  drivers/iio/adc/rzg2l_adc.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
>> index eed2944bd98d..fda8b42ded81 100644
>> --- a/drivers/iio/adc/rzg2l_adc.c
>> +++ b/drivers/iio/adc/rzg2l_adc.c
>> @@ -207,7 +207,8 @@ static int rzg2l_adc_conversion(struct iio_dev *indio_dev, struct rzg2l_adc *adc
>>  	rzg2l_adc_start_stop(adc, false);
>>  
>>  rpm_put:
>> -	pm_runtime_put_sync(dev);
>> +	pm_runtime_mark_last_busy(dev);
>> +	pm_runtime_put_autosuspend(dev);
>>  	return ret;
>>  }
>>  
>> @@ -372,7 +373,8 @@ static int rzg2l_adc_hw_init(struct device *dev, struct rzg2l_adc *adc)
>>  	rzg2l_adc_writel(adc, RZG2L_ADM(3), reg);
>>  
>>  exit_hw_init:
>> -	pm_runtime_put_sync(dev);
>> +	pm_runtime_mark_last_busy(dev);
>> +	pm_runtime_put_autosuspend(dev);
>>  	return ret;
>>  }
>>  
>> @@ -412,6 +414,9 @@ static int rzg2l_adc_probe(struct platform_device *pdev)
>>  		return PTR_ERR(adc->presetn);
>>  	}
>>  
>> +	/* Default 0 for power saving. Can be overridden via sysfs. */
>> +	pm_runtime_set_autosuspend_delay(dev, 0);
>> +	pm_runtime_use_autosuspend(dev);
>>  	ret = devm_pm_runtime_enable(dev);
>>  	if (ret)
>>  		return ret;
> 
