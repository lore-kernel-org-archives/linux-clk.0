Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811C52C08AB
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 13:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532376; cv=none; b=SpLFs/JSU881WNEiJjyu9TOPF4FL71FOqVpOI8ZRWxnenMofiX7hc+7aZSkJjvBIFJ5he/iESpUe/JbLm3Qayf0EF4K8bddVsIGwTfGjdK43Xvw5PlrCssYZ67PAMhPl76yuflxjgFR0DwJU/3/ICsCYHrVsfZQIA+neRjbHSlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532376; c=relaxed/simple;
	bh=JkgrpngiL+BEeaapm2HsfEabVVknDSBXGysIaqseEg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PK6aVTBCTphXgD/fMMSLu0TvQDMlL7fcOc58ZiaaHh2vUfHkQte6aofFRbzGUqFTaHHxgAMkxTmZ1gDvEvLcx5lLxqAcNBy+lzXIpoZYUNcfWIdOEWDogbs5mr7OIINkwJ3RtFYfOzBkuUxyL+OVsCuizerG+KrS4rZ7EZYeB3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHmpZeot; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHmpZeot"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82c2239140aso399486b3a.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 06:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774532374; x=1775137174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yGSjpvKZZs8UcqAPmpfnz9AxdNUGLCzJ29ws53Cs8es=;
        b=DHmpZeotoBgXvuf6VumIs6SBR4Ur6EFfsd5sAnKT60/NpTgZ9XdgAv7dj6ncXW3Ydc
         aHNXLBTl/Q3EIRjE7/aqGwX1HaLgv6lPXpjSL+ivoRZ/iA2RIM0+qcwjLo82/8SaEsl5
         LCA6eMqWR1RqAELVOT5/mYdLh8e+HoiMh2DEF4zVbEVsT4ExxQVJjmNa39DWPPpCWLea
         MTbibXs0ZBgxc3pahOYsQWNwzxJDT3YsUv9uO/SfvpxkuP3UNrzz99tPfY1WtTuhud4X
         bVEvJdVfnHKIiI2jcVIRFMIEt2jlLm4gxxvS4dcHB5PLCkRhSXBTIaJkGyCVPp40OLOJ
         YKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774532374; x=1775137174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yGSjpvKZZs8UcqAPmpfnz9AxdNUGLCzJ29ws53Cs8es=;
        b=bGCQ/fCHsLskMjFS9pVSgXLlv0pYw2vOnqKTePghiTb/bUMgNh4tLJGqpinwsvvcky
         HjR+DkyIulWvT7wLnd8RNqPk1Ui1KL2+l8ybfSiaI2lW3bOQj1Swy4+fZowjJ9+gInqH
         nLiNSZdDEUhukwxG+074pghPRLJ1ca6LHu+3Wu5xvMycAqcdoCo+DmRC+suVPfZQhDOd
         pp1hLhgL/siwxnJZKjYNep2lbEjSsqct/UyGCiEea0TerGiVTlBn8+oFMfA/fyjuxfSr
         YuDGMIeynHOv06Ddoa5jWYtOlQ4q3nTeYJM94EBsBJwB/DsixxQBYkPXYqkbMt53tkCg
         85fA==
X-Forwarded-Encrypted: i=1; AJvYcCW84S591zWWIRmf/8Jr97c8dCOU/26bCrI24SnzyINjmDBEWLMMiEkBXwXUufmsm4cGauboznGpgrI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcr5Dw0NBvYKZnr23BSA5wxyt0QGBtqI/cKxt84oeXf6XCLLyC
	44SrHBTUT+/bvA70e6+F6mcwmoXCvCd7yxqu0DtoNVTanjJVjRxVBOM4
X-Gm-Gg: ATEYQzzXg2G3XyssJHgox/eVj2nRDdmYBmwzqEXJm2+7QMd+ZnUhJqmfM6IwaiZzw9b
	VcdxR1XRQ+gslVzOsH8r+E4+Zbn/uLMXUwRkfVFo5Q5un+VbWfKdOr1zt/DUIu0eG9YdKByvlDh
	YElxQvA367Aq2KrZKuSNO6CS3/7YhPokpEQbpFtTAxLmi0XPDwrw1uIDLCOVtKNfxFUlOzeDyh8
	nkDx4jWSYSilQd40tbtF/tQWRl6xcHvVgJDOtVgcYouYjKKvQNHos5xZEFcmRJ8hiyvaBl+uP8N
	TRMiK4WMiC1835HuZ2qDaE1b2udw0YFUDiPmUxLPBI+Af/ze+a2i/UXObV+z30HU+3XUxQGYZTi
	qy/2CxZtTCpO+n6tTlrWfLFZwuiqpOCGe6ZdPLa23H1Bxp1k8y69h9762zIN1ir66000EcAapkT
	fcbsCVoTX/tIz8L/7u78QHiM50aAfCkqpkAAMlhCat
X-Received: by 2002:aa7:88c7:0:b0:81f:3afe:281e with SMTP id d2e1a72fcca58-82c6de8c9damr7486345b3a.3.1774532369606;
        Thu, 26 Mar 2026 06:39:29 -0700 (PDT)
Received: from [10.55.234.194] ([129.227.3.138])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3ca803sm2841015b3a.50.2026.03.26.06.39.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:39:28 -0700 (PDT)
Message-ID: <4d575f17-5cd5-495c-99a9-176b3393d54d@gmail.com>
Date: Thu, 26 Mar 2026 14:39:22 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: Add clock guard DT description
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Vyacheslav Yurkov
 <V.Yurkov.EXT@bruker.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20260318-feature-clock-guard-v1-0-6137cb4084b7@bruker.com>
 <20260318-feature-clock-guard-v1-2-6137cb4084b7@bruker.com>
 <20260318225510.GA639444-robh@kernel.org>
 <7c7034a7-686a-42c2-bdba-6f31b5179f7c@gmail.com>
 <20260319-yearly-wrongful-883f7fd86a69@spud>
 <b45d9845-2d56-4fdd-a3ac-b0e0e27ba573@gmail.com>
 <20260323-sanctuary-semantic-432089feb1c7@spud>
 <d097826c-3db5-4902-acee-ffcff7436d4e@gmail.com>
 <8e7d0c53-aa23-4514-81a5-335a76bb0c45@kernel.org>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <8e7d0c53-aa23-4514-81a5-335a76bb0c45@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.03.2026 11:08, Krzysztof Kozlowski wrote:

>>
>> DTS example:
>>     clock_guard: clock_controller_guard {
>>       compatible = "clock-controller-guard";
>>       #clock-cells = <1>;
>>       clocks = <&h2f_clk 0>, <&clk_fgpa_rx 0>, <clk_fpga_tx 0>;
>>       clock-names = "h2f_clk0", "clk_fpga_rx", "clk_fpga_tx";
>>       gpios = <&fpga_ip 0 GPIO_ACTIVE_HIGH>, <&fpga_ip 1 GPIO_ACTIVE_HIGH>;
>>       gpio-names = "gpio-input0", "gpio-input1";
>>       clock-output-names = "clkctrl-guard";
>>     };
>>
>>     custom_device {
>>       compatible = "...";
>>       ...
>>       #clock-cells = <1>;
>>       clocks = <&clock_guard 0>;
>>       clock-names = "clock-guard";
>>     };
> 
> So a pure SW construct? Device has specific clock inputs but you do not
> model them and instead replace with one fake-guard-input.
> 
> I don't see how this represents the hardware at all.
> 
> Maybe some diagrams would help, assuming we still talk about hardware.
> 
> Best regards,
> Krzysztof

Techincally that's correct, it's a software construct. If this is not a 
right place to submit such a helper driver, I'd appreciate a hint what 
subsystem is the right one.

I was not sure how to provide a diagram in the mailing list, so I posted 
in on Github https://github.com/OSS-Keepers/clock-controller-guard/issues/1

It is a driver which models dependencies for other drivers. These are 
soft or "indirect" dependencies, because we cannot access the FPGA 
unless the FPGA_PLL_locked, and GPIO is telling us we are good to go.

Conor, I think this should answer your question as well.

Thanks,
Slava
