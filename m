Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA481514D1
	for <linux-clk@vger.kernel.org>; Thu, 11 Jul 2024 08:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720687272; cv=none; b=P3owT5mbBBadGbThYZkC0ACA3EMdnnDvUEO5z8XZI8MncCpEnKuPr2YcnCn3udGlY4u+yT3DqGDJkfmrH7UveDjYjQuOmY2QbjebKHKZiOzMQJ88PgLLDGKSitRS5wD5f6HkoiNWMiDAlC4LSB+0lkl2KqJw8h/nY7fyDAdLKJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720687272; c=relaxed/simple;
	bh=x4i1N1H6Wn0xiFNAiQw1PCFby+j9cdKd2mhVJ7jEYqs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SzLKyRxsr+jUFtKmI+EoOaMNR41RBPMEjB7EXrEfK0NezrRHJzHeAkhsCHWeWA+edgNRn7t4GGr0KJAaCMJZWxfq6o/Jxc54sgy0J8L1JX3KT4p4Sxm/iBePkGIH6TCFaEZtsPUMC3ERUlt+/L8uJL5KdsfGVqBrmQCYK6L7u1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NDFmcVtM; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NDFmcVtM"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52ea0f18500so660813e87.3
        for <linux-clk@vger.kernel.org>; Thu, 11 Jul 2024 01:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720687268; x=1721292068; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=F4hJMe1Yb9yi4VSSBc6ZDJo7fdcuCbEK9DIjftRMu7s=;
        b=NDFmcVtMzWgb5vU8bsrFMkRe4dzyDf2F3BrjchFR6lKv8GMCxt+XrFZkk+9WntsfSE
         IQkwYOeQeuc74EfSov8enRgiZvDjfaxpY/TlO7oYqronu2htABsEHfYPaOKfMhZ5yXar
         gjWYEfOtryk9fgpSi9NyvwYMtHrKVikIkyDkLUuIHPw5NRrI9PU9R7viJqFAJvP1h3eq
         e57ZhjylQdnYSkNmivHnWuEMOgn/CLfMyMWWbGrKTRLaGCjsPBDGlrWB+oqsjX1JnVL3
         sKOUQzNBrm3r0j2+ITfDzl+KYrilpQop5vkxKbyIt/ItvBpa+hmbKJ6MTahTbzNPsKfm
         /7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720687268; x=1721292068;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F4hJMe1Yb9yi4VSSBc6ZDJo7fdcuCbEK9DIjftRMu7s=;
        b=MF525pr9kEGohsYK6enwBsq1ir0FJ9jMAv7Fme4iqMtMKooFr0apiLCzhSKv7hHkVv
         cgWohDStepd8jKeu57MCdbWyjLUTZ6NL1j+5CVaiDOH9FNFtPMluNUiMF0eVbHCvTyDB
         q2mETCg/412BLpOpLGvq2go29BDXbzluPlGKx4X++aaDq6azHC2mf8O/ZCKSrGYKsFwZ
         dkM63AhOTRbR6J6hn0Dg/9AjzaUVj0zk/zCXpWT7qaolyA6Ab+66/ARgbvK9hMMj1XQy
         E1IwYiQPegU0hFn3GrtyO1llBDzOPNFelbN3l8qpgNn5we9SrIuIWg0vs3bPN3Q4RDW6
         YNBA==
X-Forwarded-Encrypted: i=1; AJvYcCXoQTMYTRlbogHRyUNIIILw4O+eFZGI/0JscQeX0JvtySseePWlziURZNrT1fvFKhGyjsNB4dnHpPC0bG/GeHmXd19KuRO53JoT
X-Gm-Message-State: AOJu0YyROr3dIGtClcdUNJrf+ug1CxZ4MgH1tR2/URghB8sBaCm2gYol
	+NyhZTrX2hAL4LMcAJTWleAUFtb0XavYZ1Mj26TMkQtkXjvGA5bdY1L65z5Pu/k=
X-Google-Smtp-Source: AGHT+IEJO/nqHAjigZAZduBXhYWRYVbv9hRi6m8XTEKnVPN3/RPTQHv6P0+rtwA6HcT8K1XGWUuONA==
X-Received: by 2002:ac2:5f6d:0:b0:52d:b182:9664 with SMTP id 2adb3069b0e04-52eb99d7698mr3637237e87.69.1720687267614;
        Thu, 11 Jul 2024 01:41:07 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a9e9:c71a:10d8:7f63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427272c4371sm73269515e9.22.2024.07.11.01.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 01:41:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Jan Dakinevich
 <jan.dakinevich@salutedevices.com>,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org
Subject: Re: [PATCH 5/8] reset: amlogic: add reset status support
In-Reply-To: <c34a2d1613da179a27123be95eaf4ddf.sboyd@kernel.org> (Stephen
	Boyd's message of "Wed, 10 Jul 2024 15:40:16 -0700")
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
	<20240710162526.2341399-6-jbrunet@baylibre.com>
	<c34a2d1613da179a27123be95eaf4ddf.sboyd@kernel.org>
Date: Thu, 11 Jul 2024 10:41:06 +0200
Message-ID: <1jzfqogw2l.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 10 Jul 2024 at 15:40, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2024-07-10 09:25:14)
>> Add a callback to check the status of the level reset, as done in
>> the reset driver of the audio clock controller.
>
> Why? Presumably so that this driver has equivalent functionality to the
> reset code in the audio clk controller?

I thought the description was saying so. I'll be more explicit in v2

>
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/reset/reset-meson.c | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>> 
>> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
>> index 3e0447366ba6..65ba9190cb53 100644
>> --- a/drivers/reset/reset-meson.c
>> +++ b/drivers/reset/reset-meson.c
>> @@ -69,6 +69,23 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
>>                                   BIT(bit), assert ? BIT(bit) : 0);
>>  }
>>  
>> +static int meson_reset_status(struct reset_controller_dev *rcdev,
>> +                             unsigned long id)
>> +{
>> +       struct meson_reset *data =
>> +               container_of(rcdev, struct meson_reset, rcdev);
>
> Nitpick: One line.
>
>> +       unsigned int val, offset, bit;
>> +
>> +       meson_reset_offset_and_bit(data, id, &offset, &bit);
>> +       offset += data->param->level_offset;
>> +
>> +       regmap_read(data->map, offset, &val);
>> +       val = !!(BIT(bit) & val);
>> +
>> +
>
> Nitpick: Drop the extra newline?
>
>> +       return val ^ data->param->level_low_reset;
>> +}
>> +
>>  static int meson_reset_assert(struct reset_controller_dev *rcdev,
>>                               unsigned long id)

-- 
Jerome
