Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E3F1EF0BE
	for <linux-clk@vger.kernel.org>; Tue,  3 Dec 2024 13:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733233222; cv=none; b=CjswRU3FOknFoeBKOWXo7xZrRuUQud3v7zSOuVah9PPciMHrHimMryw8wB5+DgzLgKVyfoMR+PhoFa9CfbG18ZGv22obT5jsluCsgsGqf2Jq0ajls3q94pqS+vwAcbyRvI7gkfeEAP3/3hs+g6aelOocr1c8RgcEP/ZTmOpzA14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733233222; c=relaxed/simple;
	bh=gVds39EeL4HS6vcGaHXuEyB+vHQeohJ5fv2/hLPIul4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LCHpFdNlI2n/bEcUrsYTW3SafpZG4ZsCjDGoNgpiTzIDeXRWbO5MHEv2HtDtw30w4Eps9CrIhV6sVsATc+V/cHy91IaMJM2vhnc5MZiZPJczXGqmtk5ujV1s8tZj2zcKZcqYU69MY780DyiQzmi9+4iJtFKkqCTxAKnpLANE7c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GZJ3PeU8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GZJ3PeU8"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4349fb56260so48439265e9.3
        for <linux-clk@vger.kernel.org>; Tue, 03 Dec 2024 05:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733233218; x=1733838018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xEoCnIl9TBM7hPMoS20hxmppTJP/LxiF7FoXkx67aU4=;
        b=GZJ3PeU8VnU9pLKWvDKVZm5sEMXDYkETuYBchqHHHYenHH0al5S2YjBNJ8fRLZw75t
         g5Trmf9qympemvmVGa8Pr7ND49RFgGRrYdrzcOviULkOoKHrUs2VCisdtUMgidXXHIot
         KLHjmY9X6wEwr6BMvNTQcjutS5Yy+ILThetfGnwIVBya/EqEH1fXpBn+Wtcm359Zeq9d
         H9ZmPNkfH3DK0tXvSymCymynzQAdUg1B7VdGAZecVCeZSWBLESukvu9M/UqYggnoTwjV
         WO79jfWQUB9Vl5RVZHR5Ay98us9dcB5Bi2lIa0dwmB8JChjBOFreN460cj/+w8aWVyoU
         PM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233218; x=1733838018;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xEoCnIl9TBM7hPMoS20hxmppTJP/LxiF7FoXkx67aU4=;
        b=ie/vC/xEeKuddMdVqyqkf4X7pal/GOidaC+0pe0nNLMm7Dt9Qmlm8gzoe5lQRylE/E
         hxmpq9kWIOisBVF8/e0IjKX2Zvs4qOdV7N/KfCcETw888+G1FQpf6KfVU5o7qHhNayDU
         SSpzEkHhBWNBXg9cSBt50QaN2cBvN5/hkbExcQEue6m324eItbH5MW20AHRUPrx7wCXP
         VAr+Qn8yOnJU87xEaRkLuLuB39QpB/s3aPZ5a6bpo9i5aU2CkFbm+nnuGKu9rlKeOKtB
         hJ6Gt229GTFSadxms5t9ISv8cLCR0OAaM8uD+jV5104Pi7dvuBiflS0mJ/ZcJbCU0jur
         Xe8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8lsCmiTyH84pbWkO6xC33xnUezD4ln/k0HEsqNb8tH2JUj281dG7Wt/qZp4alPrVq5v7Lt8CuxiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiE7J53NcKPUA3QjkbglX8iblPYWFzzW/SSvfzyUoIlYkL5Wx3
	5TiDrWL6c6D47G6Prbeqq+80tIZLNPcJf9hsDmjo2RtzxWqxK43KWWGo49BUtgE=
X-Gm-Gg: ASbGncvW7mN1BNeagx4d05Inwqxcrqh07vla5aFv8hJIRbuc1ReLTVUOoz1jKVM09k2
	E/BlLSwNldB9+XXz0HAxDHRjIZIDdprdvI2g+PitOHTm7mRssjCovjxne4sOUTMzhCK41Q0o4cr
	ItfRZexdPs/DAfwduXKvHKGMCPatAktDUjMcU83ISILqrDQFzEVFpdFUg46KgPqSe/tt1zuzUdd
	ypldTtS1iMhSgkuHBCEAxBGL1J/uu0QaA2XBlIrDXauxKJ2V9n8Pghwp5Y=
X-Google-Smtp-Source: AGHT+IEkPw+a3028ZQyrhsgmHH+SzklBTFms6yyL7p+03ifSENO+S3RHSgC/4IQpypF76SJjGitgmA==
X-Received: by 2002:a05:600c:4ed2:b0:434:a7b6:10e0 with SMTP id 5b1f17b1804b1-434d09d00c5mr22741135e9.18.1733233217778;
        Tue, 03 Dec 2024 05:40:17 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434c132b4c8sm122292095e9.36.2024.12.03.05.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 05:40:17 -0800 (PST)
Message-ID: <3f2dc65c-61e9-4d4b-9610-4b106bb691cc@tuxon.dev>
Date: Tue, 3 Dec 2024 15:40:15 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/14] iio: adc: rzg2l_adc: Simplify the runtime PM code
Content-Language: en-US
To: Paul Barker <paul.barker.ct@bp.renesas.com>,
 prabhakar.mahadev-lad.rj@bp.renesas.com, jic23@kernel.org, lars@metafoo.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de
Cc: linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241203111314.2420473-1-claudiu.beznea.uj@bp.renesas.com>
 <20241203111314.2420473-4-claudiu.beznea.uj@bp.renesas.com>
 <9fbf057c-164b-4451-85a8-cf4d5807b4c1@bp.renesas.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <9fbf057c-164b-4451-85a8-cf4d5807b4c1@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Paul,

On 03.12.2024 14:53, Paul Barker wrote:
> Hi Claudiu,
> 
> On 03/12/2024 11:13, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> All Renesas SoCs using the rzg2l_adc driver manage ADC clocks through PM
>> domains. Calling pm_runtime_{resume_and_get, put_sync}() implicitly sets
>> the state of the clocks. As a result, the code in the rzg2l_adc driver that
>> explicitly manages ADC clocks can be removed, leading to simpler and
>> cleaner implementation.
>>
>> Additionally, replace the use of rzg2l_adc_set_power() with direct PM
>> runtime API calls to further simplify and clean up the code.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>  drivers/iio/adc/rzg2l_adc.c | 100 ++++++++----------------------------
>>  1 file changed, 20 insertions(+), 80 deletions(-)
>>
>> diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
>> index 7039949a7554..a17690ecbdc3 100644
>> --- a/drivers/iio/adc/rzg2l_adc.c
>> +++ b/drivers/iio/adc/rzg2l_adc.c
>> @@ -8,7 +8,6 @@
>>   */
>>  
>>  #include <linux/bitfield.h>
>> -#include <linux/clk.h>
>>  #include <linux/completion.h>
>>  #include <linux/delay.h>
>>  #include <linux/iio/iio.h>
>> @@ -69,8 +68,6 @@ struct rzg2l_adc_data {
>>  
>>  struct rzg2l_adc {
>>  	void __iomem *base;
>> -	struct clk *pclk;
>> -	struct clk *adclk;
>>  	struct reset_control *presetn;
>>  	struct reset_control *adrstn;
>>  	struct completion completion;
>> @@ -188,29 +185,18 @@ static int rzg2l_adc_conversion_setup(struct rzg2l_adc *adc, u8 ch)
>>  	return 0;
>>  }
>>  
>> -static int rzg2l_adc_set_power(struct iio_dev *indio_dev, bool on)
>> -{
>> -	struct device *dev = indio_dev->dev.parent;
>> -
>> -	if (on)
>> -		return pm_runtime_resume_and_get(dev);
>> -
>> -	return pm_runtime_put_sync(dev);
>> -}
>> -
>>  static int rzg2l_adc_conversion(struct iio_dev *indio_dev, struct rzg2l_adc *adc, u8 ch)
>>  {
>> +	struct device *dev = indio_dev->dev.parent;
>>  	int ret;
>>  
>> -	ret = rzg2l_adc_set_power(indio_dev, true);
>> +	ret = pm_runtime_resume_and_get(dev);
>>  	if (ret)
>>  		return ret;
> 
> Should we check (ret < 0) here instead of just (ret)? According to the
> docs [1], pm_runtime_resume_and_get() can return 1 if the device is
> already active.

The v6.13-rc1 implementation of pm_runtime_resume_and_get() is:

static inline int pm_runtime_resume_and_get(struct device *dev)
{
	int ret;

	ret = __pm_runtime_resume(dev, RPM_GET_PUT);
	if (ret < 0) {
		pm_runtime_put_noidle(dev);
		return ret;
	}

	return 0;
}

It can return zero or negative error number.

Thank you,
Claudiu


> 
> [1]: https://docs.kernel.org/power/runtime_pm.html#runtime-pm-device-helper-functions
> 
> Thanks,
> 
