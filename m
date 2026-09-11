Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2223EAC68
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 04:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789100857; cv=none; b=KIIPt5K9IaJj5SO2HirYVTEL7dtcqm0edCxD0bE2MhayGOvJMr1cESUZh52kQMvj94AJ4K18rkrvi3qTxZ9F3wAvTx5SJwPBXBUKwWe1UAm3/nSQcBXeoxEL61C4UAE25Pl8B03q3SWJwaUIiXSQVdytDhPXKho40MiaMDI9liI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789100857; c=relaxed/simple;
	bh=KjXa5CpY0t7/Sea2aeIy9K61ObkwGdgMdzuD+QojuEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bl5IItgzP3MqPZyFZCaE9J65cMamvv/TMZbP23tkD4m1ih4HLd8p+GwWKvUn2PWbIGl0p3npKwSiiTKaG01kQ47BcoTGtYtIbwWO3cx5wKpSyHmPH41zm6+rO3yjVAnH1V5vdPyWSvvcRrwWt5eDJrABVRO7ps+3yysJo7kQ44c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KzXa+3wp; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KzXa+3wp"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f12so470119e87.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 21:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789100854; x=1789705654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SeQKP5JwuVTGflKEgsNGx/HQonSB5aJLQdw22Qx3ZnY=;
        b=KzXa+3wpOAhFJfdBZDYNR3Dt4r/SAU9rer05WadCZKIY+bvwGqsQM8lAF7OdcS4duN
         zsRRwYb1qomO/+9w+SiV2rZ5PJ3GYUXHNYkRuGMHKiIYde4HYUzubGvYYCPAAg+Fb90l
         r+fLNEKR0sZeJ94awn7m2Gk96YkJNloduzFmy7C3hzn9lnfZBUHs7DJ/nk0jhnU0n50y
         RhepHT+IDsyCBo/iuJyHRxr9N1YipU3610CPH/k55eao//JYqfGz523y0K9whByZMF+v
         Ou204Jby6LqYpFAljxhERG3OF8QJzCBUf8QLnoz9lODLswTVxsDB9LGi0biTrXmkbbwG
         cx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789100854; x=1789705654;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SeQKP5JwuVTGflKEgsNGx/HQonSB5aJLQdw22Qx3ZnY=;
        b=HXHFwCofZACFE/m3SymdbR6GvBHAm2gRRjz4JSFmPycEiayaPwa2o/INMuw/VdLUgn
         ykSLXIn5sTJczeuAyOKTh6Fa8USSIu1u/+rNk5pVT8McmGGLD6tUi038K2WumIpdV/J0
         X7CByzjfF5GgiKo7FAWzYG+nBDhWUyRFq2KQ3//a28e/SSMA+uvMgWKJc2/XFmvZ2Utn
         M/gezlhCnfXOwGs4OyIz5kQ9M2ZKTc5t2xWTv1dXaIEY8leENkh2fdAG4h87Vf+yYJV7
         OE3rqtfHxC58eizhFOJ/cAaW9GjQGl/pPMdBV1UW0xiqpm4JfIy1r/TaOOwc9rYeJLeE
         Ivfw==
X-Forwarded-Encrypted: i=1; AKwUvBx8aOAblD8jk+o/ZY79wyDGm9jCXqadCmL4ftIkSGF0u5rPhH3yUZkWC9vbdf5Yy+75HY4VCKH4TPA=@vger.kernel.org
X-Gm-Message-State: AFuF++kcbm2dy/lSnckJAIx8ohoesLxzFsaOwNZvNKWQqXfJ6u7PN63K
	0fJwh66AOKjoid7R5i7WnVftfVkRGoL3Ls//x9BUhZ3fAuiAdn931J8x
X-Gm-Gg: AYBFou3UTpSWdPxJN+QwrTFrTxmSgnPA/njKK3PosmlJz6AWXiZUGUdmp3VgzWUWAQv
	yRZtOCWe4extOi/X4HP174PFqSPqBYsh6riMSkYO7/BNzkYNtrW4OwE9DkLY0TtRIB2E+q5yER+
	qqACvRrpRjIRd3OajQ/QUl43TU8Dm2y7oYlV4xeueYN8ODYSZ3caeQv/H5wssGHZ56idsbtY5z9
	mphxNEZiOGY/+d5GMNhf0IadbCXm5R5Mk1EXyFZ86e32XY5tVlyo/IvBPhiVupbztlCmGebgxz8
	tgjn9zq4vBf0mBiQkbgJ6xE2xx0SI1D11dWX30FJmC2WJyWSolbXsYinP4lGmSbSGwT85ud1w4R
	S+7b78xitmOd5siARo85GFVTCrhWxXj9BI5sjkzatps6kE/c6RnhF4vhkMdxYTtwibZ06TjRNTh
	66YJBFEo/ahTJV0DOfu7y5kq9PR+bNvIQtb1xHi5L4YvXyk6fhvXCDCZ6g/FakUN9AtWJzr5w+O
	jczLRbeJIdLhhoKlU5aR8UvuE46ASR5EsSnAhvwZ3mLt9v2PGQmt14=
X-Received: by 2002:a05:6512:3f23:b0:5b6:6af:4e0e with SMTP id 2adb3069b0e04-5b8a02dccabmr896014e87.3.1789100853635;
        Thu, 10 Sep 2026 21:27:33 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0466a5csm291547e87.46.2026.09.10.21.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 21:27:31 -0700 (PDT)
Message-ID: <eb18485c-50db-4823-9e06-362b968699cc@gmail.com>
Date: Fri, 11 Sep 2026 07:27:30 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] Support ROHM BD73800
To: Lee Jones <lee@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michael Walle <mwalle@kernel.org>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1788346553.git.mazziesaccount@gmail.com>
 <20260910160321.GJ1051768@google.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260910160321.GJ1051768@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/2026 19:03, Lee Jones wrote:
> On Wed, 02 Sep 2026, Matti Vaittinen wrote:
> 
>> Add support for the ROHM BD73800 PMIC and compatibles.
>>
>> The ROHM BD73800 is a power management IC which integrates 8 BUCKs and 4
>> LDOs. There is also an ADC and operation amplifier intended for current
>> / temperature measurement and accumulation. RTC and 32.768 kHz clock
>> gate are also included. The PMIC can be customized via OTP and it has
>> options for operating as a main PMIC in multi-PMIC installation. Some
>> of the pins can also be used for GPO or GPI (including interrupt support).
>>
>> There are also ROHM BD71851 and BD71885 PMICs out there. These are, from
>> the SW-perspective, similar to the BD73800. There is only some different
>> default values and OTP settings. The driver should be able to handle them
>> just fine.
>>
>> Revision history:
>>
>> v2 => v3:
>>   - Rebased on v7.3-rc1.
>>   - gpio: Use gpio-regmap as was suggested by Linus W.
>>   More accurate change-log in individual patches.
>>
>> v1 => v2:
>>   - Rebased on regulator/for-7.3 as it carries dependency:
>>     f29a8bf6fde1 ("regulator: dt-bindings: ROHM PMIC state-machine voltages")
>>   - dt-bindings: Various fixes, split generic stuff to own files.
>>   - gpio: Styling, return -ENODEV if no GPIOs found
>>   - MFD: Styling
>>   - regulator: Simplify dt-reading
>>   More accurate change-log in individual patches.
> 
> I assume there will be one more revision?
> 

Hi Lee,

I thought everything was acked and good to go?

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
