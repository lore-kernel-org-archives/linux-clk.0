Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026CA230BF6
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 12:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761741013; cv=none; b=qZ0LF26BYsIRWeMe5Q5X/i7U8yBBfvRi6z5qNLWQ0bbzmG/l5GEbIdXnWk0EmqxkKpbNeHy/a6mTJyrvDLI9dvqPNJ0efCoTSUwgSzRVSP/G2ia4mHI2P8u8OMZ2pejxs25t7aNqzGVSfFibzzWRevbntHvBJzIdb/L1848VARg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761741013; c=relaxed/simple;
	bh=yfVwVTerZPk2NHZzlK1pqB6FPkQ/oXmjoq1IP210Xts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p85LIQkbU4c7t9BNxYkoTcc+SEmN14PKvhIaMHTHNJfFdNbrW1qcgcGze49Z6VFqQlL1MbSkOlGCYVcOsxNtfIYoXLPQS2yupRZ0jClA45Lhgu7z1+wDPcbOmBx/SyEUVOqWaT5so5ExFGszyJ5QGYpih6LPbipNeaBoGh6JTQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTdj887y; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTdj887y"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-592f7e50da2so1181539e87.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 05:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761741009; x=1762345809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ui8ftKpD8oJJMrnzjOA4xyfnszlxAAkwMFpTMiFGLGY=;
        b=MTdj887yxeCcg1+C9KOyxLpebLhYr4D3K4eae5EfsfBGLwZZaS7Uj2ic8cnzWCTU7c
         IzDZJTUda9Dvxy9J5Ui1yoEikVYbDqL39O+PKS1dezNKm61QNf1wZNBlcM+VNzQJtXnI
         5XNeIjnuk0QhhBptDvDRRgmbQJn8DvHYe/mdGW4jDNXPOtGvVQfUmBGu07Z6Zz+d06eN
         cxaQvO57e9cHFFKyixZfLrNOowWwpk+t9vnwkrlIffJV2SxKUUSMPK026sep3ZpeneqU
         Ea5iLQsvlqmiCfkltQzcYCnop2zDNCtCpJG0JV8WdaZZC9THxxsag1m5tnOCP2COdXTs
         Mxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761741009; x=1762345809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ui8ftKpD8oJJMrnzjOA4xyfnszlxAAkwMFpTMiFGLGY=;
        b=ElG0okjfxFhWVlCts4sfULk5TKmVFdRaCYRz9ogTTMRhmpGbKFYL/KsMeuAQYHorQG
         EXDtxMSpC4L5+uKj5x9uzYzLQY4DNsKFSD0Bzci7hhZlf+0Pa6uukIAql+OnOzadgKrN
         M92hzoUzdBfMcxYr8gHKXEkj9PZ5kyRD5jrpTa/G82wMxkZe37o8NfQCnWKTD2d5y8Qb
         VNIolvqHdfIuxvkBEPR27ep1zaDEUxRXYkVdAJnh6VOCbRjMz69O+vuWjf6k0Q9Cjl/Y
         D2Q8WUOaNd8+T8kpR+VLqQe4lDDkwSKGw+NksEprC1N9vgeFMhdqIa1WKZWzBBhrn9aD
         bvBg==
X-Forwarded-Encrypted: i=1; AJvYcCWi5ob5tEdj/a1HfNc4R97bwFaR5HwEF3oyfOjUxAsmcJhMR5SY5VO+j5WQm82OIYP8VEFd2fG/2co=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9cu9tPOcTtLr99FN+wJIJbGawYF4q5rJfxPgV0Nfj+pgaCj+T
	BAXNBVaapw5NpR1Kwv64KD1zpB+byi7ozSqAdrvqROzdXMfHM2O0Rhag
X-Gm-Gg: ASbGncuPlcfz3EKiSL+7bzYowUgMBC79NR0t9XhiRjfNk/hOVNT9urDaM7TYQ02zOGk
	lTUMOFkDatRlmw+rl7V9/igp8epAmxHA+GU2n32P2rUxGKFIClXlkANDm4G77bkGAiZFMF/dMKT
	n6DNUZ4MKeqST9Y2E+pladSdTnI9ww0+uU/KHxOfa4cwrP6ZVL+88x/NbJQRoRV9mJJ/rgGWXfM
	T07yemhheRtw/0FmY3sLl6r6+0RFkAV6qAlefWsGVqPsj7UdFcNGyGbZG5BJFJfomRLWP9Xsk77
	wBlIMKjC/lS/PGZd6d7TP4Or12yC5s0BmcGUfCccgqvGp/xafTNgcJVWQszzwZMUlf4Cw+4rz4J
	lafkqdyK2viSkZtntkNtz0wCb4OLA40MGUSKzIhXfDzFd2q/gHU1UcY1DPxNAr+5KLY0oSEusXg
	f22Huo4k1a4Q==
X-Google-Smtp-Source: AGHT+IGoOBmpR56r91eNxNa3niN5na4xSuldumEKqunNvTbGH3/QMdmFRTjv+fJgOEfNR9uGhYfhgA==
X-Received: by 2002:a05:6512:3a8e:b0:591:ec58:ec7c with SMTP id 2adb3069b0e04-5930ee07801mr2415382e87.25.1761741008581;
        Wed, 29 Oct 2025 05:30:08 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f50a7asm3782619e87.34.2025.10.29.05.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 05:30:07 -0700 (PDT)
Message-ID: <8b5dbbf6-bbde-4015-b0d1-12d6ec770ceb@gmail.com>
Date: Wed, 29 Oct 2025 14:30:06 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/15] dt-bindings: mfd: ROHM BD72720
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Andreas Kemnade <andreas@kemnade.info>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1761564043.git.mazziesaccount@gmail.com>
 <a5957c4f83724d4f32527fb892fc340af4eeddde.1761564043.git.mazziesaccount@gmail.com>
 <CACRpkdYEUdJRvNPKhxx7orYHH3OE6BXXjrG9JVJo5MDHGKE88A@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CACRpkdYEUdJRvNPKhxx7orYHH3OE6BXXjrG9JVJo5MDHGKE88A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/10/2025 00:42, Linus Walleij wrote:
> Hi Matti,
> 
> thanks for your patch!
> 
> On Mon, Oct 27, 2025 at 12:45 PM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:
> 
>> +  rohm,clkout-open-drain:
>> +    description: clk32kout mode. Set to 1 for "open-drain" or 0 for "cmos".
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 1
> 
> I think CMOS is the same as "push-pull" ( I could be wrong, but I think I've
> seen that before) so I would probably try to use the pin config standard
> names as strings here but I'm not sure.
> 
> rohm,clkout-bias-open-drain;
> rohm,clkout-bias-push-pull;
> 
> Mutually exclusive.
> 
> Or maybe use the pattern from rohm,pin-dvs0
> with string enumerators?
> 
> rohm,clkout-bias = "open-drain";
> rohm,clkout-bias = "push-pull";
> 

Hmm. I kind of agree with you. Still, the way it was done in this patch 
is used by the other existing ROHM PMICs (bd71815, bd71828, bd71879). I 
am kind of reluctant to support another way in the same driver - and I 
am also reluctant to change the existing bindings as that sounds a bit 
like asking for a nose-bleed :) (I've in the past worked with some 
devices which didn't update the device-trees when kernel was updated...)

Do you think you could live with using this existing convention? :)

Yours,
	-- Matti
