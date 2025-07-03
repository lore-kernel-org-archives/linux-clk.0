Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535812DE6E8
	for <linux-clk@vger.kernel.org>; Thu,  3 Jul 2025 08:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751531757; cv=none; b=p8PeYqOjyl7E02lgb1Bq1zB24/WAisWVOQ93//1KFxiKo/e2iff74q+FP4392nmim5u96BOnEOwAzmGfxvIz9YGbLvVRIlr0KM/axu4L4qchI8ZkmLH2JE7eOy8uEC2kjKRjpcrfgyWwvOOfkLFREZbIxHLlY3C4PFXLbbmd5sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751531757; c=relaxed/simple;
	bh=opkUPpjM1YMmWM/mSYK4uQEZDWo6Bde587pwQjA2Cfg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WC183s7mRwHr4xUqQ/qItZqW7MIQSo7+PI7kJqxXuevYTeL0ojHuFvHKN5GNgRqT4qnSUD79Ps1n9yVZns0ImM0WAbuUjkP6m0LyoTyK/Dhql5Xchvl9CFmXrLfIs35NrOV1Ap4KOsGPCJ0HqQNfryJFIeBad6HXyaPoKab+Dek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QBRLDs/v; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QBRLDs/v"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4530921461aso51252615e9.0
        for <linux-clk@vger.kernel.org>; Thu, 03 Jul 2025 01:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751531754; x=1752136554; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Z/tFNKm/X+bKuxHPpGCjHGMiM6UDjlBSDIyMJdyoOM=;
        b=QBRLDs/v1CFBM5hyMtMclsc92ogEe4FRv9lFxI2oO0Jp08QRRSkYCf7OHBWXFraU3l
         v5+6I/ZwL03A17vsed2AI0cX0K6kUmmWy6+VZwUxm4L6JWRB+42sdlWLgo23NelZDB/C
         Odpxsz56y7rZ0qaNCO1y6HhP5301JjGDH1fbsTRftWdkeQJ6GlZhT4ZGsja6CWzF3SrB
         mnl0Nheds6mLm4ZelrcGBTwEJ3KdM+hDVJ/Q8DE4S+jHoGakdOpAprHCYqFrqQBoUwvL
         espK1HJV5soS0JrFJCLCognlWHg//Cb61RUa7B98vCzWZdloQxBbMYFWfnN35GOyiQXO
         2s7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751531754; x=1752136554;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Z/tFNKm/X+bKuxHPpGCjHGMiM6UDjlBSDIyMJdyoOM=;
        b=S9gJJcGMiVD89vdBp6Pm/1asih06A2U0DTZTiWNDOXAyMjnWbqhbuBJqNdxDToauFZ
         tWBFuErSV2IP4Qabv3VFa6IvFcvEGXTqpwJzzaw4XdVoVzCr/6VwHFKcwnZZtw4z/kbg
         /SnkitbBPyC4A3Y3QLZV0kPjDxu5kCkSuCulnccuUZMh04g3yuA5n522LYQs/qkXpKEQ
         3buJku1KyVbZXe4QIjYdhMBKq4m0Rd93TQca3PEZEnsIXaUd8j7EXiiqb/nbZ/zVPb/N
         Xui11EvQafOaAyGqC6d+mMUCQP/wsnOYgdJp5xOvrMINd/nUwnD7ELtcfKjM5+4hKdec
         vEfA==
X-Forwarded-Encrypted: i=1; AJvYcCVzaaWH+Yoo+rL4Gm3+jdxqms+eRjayD3QNaXggZfo4miRK49eQwl2vMItLUTYepHiahA+Kpf7qXdA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEJpit7Mw/WU2Cuf9P/shGalS59ZiiAGdIi8U+HNyLBVul2dFE
	T23GmYifOXipm1JKXV1Ovufzqp7Kizn1XWrSGBe97Bsq7S13HQ33DmNmgtOKn5/LIAA=
X-Gm-Gg: ASbGncs2I4OLr2w8dItMeKIx2PFChXTI7s6dVBFSBGRUM6uwzvLPoophCC2JQWwf3xk
	8ZfXIb1KvqcsaN8FfHtIjniNBb/eS9eSuTXtnp+TU9UJ3YOUAWyMapI/1WD4+F83E3Mgv1JrZB+
	8Fv+R65ZO8oUZ8rddA/t5NrIvqgf0K8RR7YoahEsSrTJjKHxk7pVOePgi1E9TJVSjXfq2wLH2JD
	QIKneWBN0Q5Xy2fB9aqqiMOPaXCWYvcIlrd3KFvi2yfoBK5XdFcQGALqTXsJ5EN8CPbQFv7WXgL
	jr/RrLrIgkzRlFCa+bYfCl5WLhiI4eLNkbrVy8HlooU23HLAfRiFuUfZsoLOUg5mcwjTbV+J
X-Google-Smtp-Source: AGHT+IE3U4A+14gN1VsA8pGM9HPiNTu4gifAOlHAGEBIiYxAf/3iGRWCVM2COik1DJdkjDU8qXICew==
X-Received: by 2002:a05:6000:4a01:b0:3a5:8cdd:c174 with SMTP id ffacd0b85a97d-3b32d4d0ab9mr1866465f8f.26.1751531752716;
        Thu, 03 Jul 2025 01:35:52 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1b4c:1be9:25d0:5634])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e59884sm17658899f8f.80.2025.07.03.01.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:35:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 16/26] clk: amlogic: add probe helper for mmio based
 controllers
In-Reply-To: <68134d81-e15d-41e9-933d-95190af9b989@amlogic.com> (Chuan Liu's
	message of "Thu, 3 Jul 2025 11:29:07 +0800")
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
	<20250702-meson-clk-cleanup-24-v1-16-e163c9a1fc21@baylibre.com>
	<68134d81-e15d-41e9-933d-95190af9b989@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 03 Jul 2025 10:35:51 +0200
Message-ID: <1jh5ztd63c.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 03 Jul 2025 at 11:29, Chuan Liu <chuan.liu@amlogic.com> wrote:

>>
>> +static const struct regmap_config base_clkc_regmap_cfg = {
>> +       .reg_bits       = 32,
>> +       .val_bits       = 32,
>> +       .reg_stride     = 4,
>> +};
>> +
>
>
> Since 'base_clkc_regmap_cfg' is only referenced within
> 'meson_clkc_mmio_probe()',
> we should move it as a local variable inside the function. This would be
> more
> logical and may optimize code size (During compiler optimization, only
> critical
> data needs to be preserved rather than the entire structure?)
>
>
>> +int meson_clkc_mmio_probe(struct platform_device *pdev)
>> +{
>> +       const struct meson_clkc_data *data;
>> +       struct device *dev = &pdev->dev;
>> +       struct regmap_config regmap_cfg;

Actually a partial init would do the job nicely. I'll refine this on v2

>> +       struct resource *res;
>> +       void __iomem *base;
>> +       struct regmap *map;
>> +
>> +       data = of_device_get_match_data(dev);
>> +       if (!data)
>> +               return -EINVAL;
>> +
>> +       base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>> +       if (IS_ERR(base))
>> +               return PTR_ERR(base);
>> +
>> +       memcpy(&regmap_cfg, &base_clkc_regmap_cfg, sizeof(regmap_cfg));
>> +       regmap_cfg.max_register = resource_size(res) - 4;
>> +
>> +       map = devm_regmap_init_mmio(dev, base, &regmap_cfg);
>> +       if (IS_ERR(map))
>> +               return PTR_ERR(map);
>> +
>> +       return meson_clkc_init(dev, map);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(meson_clkc_mmio_probe, "CLK_MESON");
>> +
>>   MODULE_DESCRIPTION("Amlogic Clock Controller Utilities");
>>   MODULE_LICENSE("GPL");
>>   MODULE_IMPORT_NS("CLK_MESON");
>> diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
>> index 26cd47544302b28ca1a342e178956559a84b152a..b45f85f630d7190fb6509b088f05f17ca91fa1c8 100644
>> --- a/drivers/clk/meson/meson-clkc-utils.h
>> +++ b/drivers/clk/meson/meson-clkc-utils.h
>> @@ -25,5 +25,6 @@ struct meson_clkc_data {
>>   };
>>
>>   int meson_clkc_syscon_probe(struct platform_device *pdev);
>> +int meson_clkc_mmio_probe(struct platform_device *pdev);
>>
>>   #endif
>>
>> --
>> 2.47.2
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Jerome
