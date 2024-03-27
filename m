Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFC42C85C
	for <linux-clk@vger.kernel.org>; Wed, 27 Mar 2024 08:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711526991; cv=none; b=LnkdEeLTqkgdUPBIcsjpXM//kwv5dbcgp343YnFC+BwaPy9rNEyMTHJ/qZ/nUaEg1yhbwUmwW8yHzSuIhgEZFqtwKxIso/YJltV9f4vrwkPfAxmRQcDyuhAwIGAtctIXnrz7YDsWlCPrtQJB06YUz8n/Whxj2WSj7Os8qxAdUBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711526991; c=relaxed/simple;
	bh=GPu0olZFo/3Df8UKJk+W9AS/4Etn7baYS1zdkvAVtIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Naj71ckxlbATkrtSuFcikEtOyKf+YPX4qzjRM4rK6gkTxPS+zO+JyuGSJ+Ir6vMIcqzfGJ1+3WaEz/YRv/yj9eGsKp5rhE0ON2gzakzyVU+Mvd+M6Z6g2Oh5ccJ0/G9wppg9G2huXyhJcjw8hTBSdNG3UF3yb+byQK86gja2sBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q3Pv/gQs; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q3Pv/gQs"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41494aaa1c5so2050095e9.2
        for <linux-clk@vger.kernel.org>; Wed, 27 Mar 2024 01:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711526987; x=1712131787; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=laN7yfiUrlW9A39+FpFCocbYRuO1xnHUno2fLpcSh5I=;
        b=Q3Pv/gQsam2BY1ZZCrfrZ6Hlc9c1ZugUlFx8C2V5B26fyhQxDdIn48rWTzIhBsxkn/
         6dlUizWBny8f/AE7DfduNSyquz8n2WUH2y59u9ULjekIZqux4+J1/ilV27JsjyxUyPQN
         K8aEdiEciNBSFe88a5gE+bpwnwp2ev8d4bYtUPvEStwXedCBt8DqHFGdY/l96kWcc/4r
         8iydzL9PQX+wqmvwr+E6d8ty2GoMUCYzenYzCIfONLBga7QlZvl5BWvyzDK70QR/4Zx8
         4R4B2t6fJMDASk5Qk3QUFWOZY1ycksmlwfD2HSfVJ0IGoLiMDUMts7cw42+7M6xIBSJ7
         uyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711526987; x=1712131787;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=laN7yfiUrlW9A39+FpFCocbYRuO1xnHUno2fLpcSh5I=;
        b=KgiPXbCvN870KAx0WIgnK/IMKSl+vhYXR5PVvjYAkgjhgauG24+0OcLwUrcc3BMFZL
         UIKFZ8mdMOGNGu9MAUSizAWddw7ta83kShODMRda8IFt6JWrnRET/NxvsQE73ygQMDe/
         M0W1W5JusocECSAIKqUwf9Tj8ZQKeNOqoXlO49VbLP59o8rk2WlbOBTEMi1L/UaRTaUO
         I6WueCDHHcziIlyg8I8RbPVOzvr0ZHR0ba72OdemzDBI2xG8iGbUwMbPL0jbMUkuN5kY
         Gz9oYsHdzZYLt298kXQimDIE6ShdzarM/K1VmVr7JmXv7366wiZ/bLmJtwgByf+0sfaN
         GkGA==
X-Forwarded-Encrypted: i=1; AJvYcCVqdV4y1ta9WD29fcivYYDz1k1pIVDy8t8VUNIyCOuySPs8PYfuqhom0iTOWcQQHvI+hLXs28wlnXdgNpp3Daa5lScrM7v+4hom
X-Gm-Message-State: AOJu0Yx9glK5Dag0lMqbNk0Txas5qfXUN8yK8JPqFQq0ne5TlwJIDK7J
	xTg0I3wRt8phMHI8B58eU1puwGgeuCGwmBU3EQSagTeEPO/AaWsFUUNWstNLaLs=
X-Google-Smtp-Source: AGHT+IGEz+1d1jkgyoddachI7gTTbD9dQEkwNHSRq3xwokZx4P8MvimuzJLiHrnBk29XtEAHxjXt3Q==
X-Received: by 2002:a05:600c:1c15:b0:414:21e:86e8 with SMTP id j21-20020a05600c1c1500b00414021e86e8mr410489wms.27.1711526986918;
        Wed, 27 Mar 2024 01:09:46 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.252])
        by smtp.gmail.com with ESMTPSA id q18-20020a05600c46d200b0041409db0349sm1334313wmo.48.2024.03.27.01.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 01:09:46 -0700 (PDT)
Message-ID: <2b441832-9b3b-452f-8c63-444f29cbdd12@linaro.org>
Date: Wed, 27 Mar 2024 08:09:44 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: samsung: introduce nMUX for MUX clks that can
 reparented
Content-Language: en-US
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 peter.griffin@linaro.org, krzysztof.kozlowski@linaro.org
Cc: alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 willmcvicker@google.com, kernel-team@android.com, s.nawrocki@samsung.com,
 cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
 semen.protsenko@linaro.org, linux-clk@vger.kernel.org,
 jaewon02.kim@samsung.com
References: <20240326172813.801470-1-tudor.ambarus@linaro.org>
 <20240326172813.801470-2-tudor.ambarus@linaro.org>
 <c20452059e62d3b8c45efb8070223f10f0bd06ed.camel@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <c20452059e62d3b8c45efb8070223f10f0bd06ed.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/26/24 17:43, André Draszik wrote:
> Hi Tudor,
> 

Hi, Andre'!

> On Tue, 2024-03-26 at 17:28 +0000, Tudor Ambarus wrote:
>> All samsung MUX clocks that are defined with MUX() set the
>> CLK_SET_RATE_NO_REPARENT flag in __MUX(), which prevents MUXes to be
>> reparented during clk_set_rate().
>>
>> Introduce nMUX() for MUX clocks that can be reparented.
> 
> What does n in nMUX stand for?

I thought about using the common terminology, "n-to-1 multiplexer",
where n is the number of select lines. I'm open to other suggestions if
there are any. I should have specified the naming scheme in the commit
message, will do in the next version.
> 
>> [...]
>>  
>> +/* Used by MUX clocks where reparenting is allowed. */
>> +#define __nMUX(_id, cname, pnames, o, s, w, f, mf)		\
>> +	{							\
>> +		.id		= _id,				\
>> +		.name		= cname,			\
>> +		.parent_names	= pnames,			\
>> +		.num_parents	= ARRAY_SIZE(pnames),		\
>> +		.flags		= f,				\
>> +		.offset		= o,				\
>> +		.shift		= s,				\
>> +		.width		= w,				\
>> +		.mux_flags	= mf,				\
>> +	}
> 
> You've duplicated __MUX() and removed the CLK_SET_RATE_NO_REPARENT
> from flags - I think it would make sense to instead drop the flag
> from the existing __MUX(), and adjust the only two existing users
> of the macro, i.e. to add it in MUX() and MUX_F().
> 

Yes, I find the suggestion good. Will do in v3.

Thanks,
ta
