Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4732E209F4C
	for <linux-clk@vger.kernel.org>; Fri, 21 Feb 2025 15:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740150635; cv=none; b=JTi0aOQuGVhJ5VR0if687GOj4Z2c34uBMveRwZWxwXupyanGDO8D3Ep6UFUxecS06r05Y21hVqEAEeRsR5mof73uinBWw90X9QJf7R9W3xtDdeB0N9PWzuHS53i7BH0V66GDztqOU0UjtGL9MbDfDx44SfKGhMJJpO/PeJPIyIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740150635; c=relaxed/simple;
	bh=/YcO1fOwoMQjCxiwEUc3NanBYOJHiziDLRfP6Qiq4Ec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QUC7gwmihQnWw8SQ/IpHyYGaCbjW66p2R3f7LGvbNRLiQu4mYV/2KFW+sSW+8Dj7TOq8cTi4yDCiwQvo/9l/7yJrwlTj8PZu5kJyR1XdONuJLe2LRwMiGdzoU4IbjEEZi5Czh9bi2se3/JkoWQbqshhG3U5e2ae/bbIqSKM/IVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HfrCO5Q3; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HfrCO5Q3"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abc28af1ba4so2420966b.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Feb 2025 07:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740150631; x=1740755431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q017wuvqryap7aPpTrbH5l2BPQ0yyhmTjmA8/NisBfY=;
        b=HfrCO5Q3i19ICLmu+yqzb14wttEhVedyHZBHtxR+yHMFslXce5i5dV8HbklezoSiwW
         ZsxGfez278Jxjr2cZQHbf5G01foF/j7niVocQ5/u10WpYeP+j6BO7nHpF/OgGW2gPoKx
         pkDv4Cp9hpyCL5aavKpR7acsZxp3t/g8AnxOTeesP/+UpqmYrdaTfGQ9MT1ysLUzb7pK
         SqkZFRCpCKpbkY+JEfxpqkE7IAqVCJRAHEMBy2naeJBDkf/XWiycuQi8g+qu6CL8tcQL
         JGc3TfuNh8nAZYVtduYyeM5IiSaAcgarcfYC0yP41neX2wpSaF7NUnPrb4zT59gbk+bN
         EEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740150631; x=1740755431;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q017wuvqryap7aPpTrbH5l2BPQ0yyhmTjmA8/NisBfY=;
        b=cFiPIbthRHzXykjr0eFi8KlxeQFFuDSZSeIgGDFpW/ntIomKve+A8o+odgiKpgCvyy
         bSDHZ1beeEiCxWj47XVLw9hvBbe4nUIZUZGdo2X1UDzyC0usEvH8Q+F1kY/VamR0NgYs
         2QejXtPA6p4j6gl51hycmWL2m2C0iximwYfSdsEyNGCrpGCh5bpqX5JM3C8X/TVYIq3i
         MY7fRo6P8PDTybOMPSn88Nenth/3e4ir7w9c3HGedG0Mlar/VlggeBzv9C00ShIL0E6B
         Liuh+1nF/wQvDcYY89LKiiMwQLjaDBz42HjdJk7iQQkgEZr8qX7N8mGyuY9XyROiWpjU
         Zsaw==
X-Forwarded-Encrypted: i=1; AJvYcCXzbwQWF/Ca/8mGu1DtqWVpJENqfAH1sZiTnXfdFzkby1suAHf0s4zwLrtFz9J8VoAIuPQwFNxU2Uk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhWA9v/W54aO1wZGnwM0lCB8ap7QGiepwB5npzYAVN43gvJbwZ
	GAISVaHJPNpNLWdi8FP43cmDgzhyfOb8LyXve3AEJgRo94fHnukUhYjVHQLu46c=
X-Gm-Gg: ASbGncuTPMKOkNPkaF3XCeihHueFvACOHGFDNhyaVNdjkidFyGo9emRemn5W3Z5F6u/
	X/nPHsPQGRSpDilfG35YAEaDgfv/xeY6oilKi/263JdxDhCyn7I3rxYXiiuTCWIYemykynO+BAz
	AXyuhURIHmMevLNUMPJnnxHne6l+3LYEhkPCvzhQx4inoYW8F3+hRbh7hv+yQs44GX5ssSI0L9p
	BvLV65owdpjYRX8diOdMf8KHjibgoAcahO9fFbVm8bjT18mXsbA97F5/u7FPvC6HG/2nZIBp7ft
	ORgLOSJszwCUaaCcL7siuPTY62XOzG1JQC1tYTjWqZGKgh5HRqt11O9GsodlnT9hOGLORJCiWFW
	Wwe+B/A==
X-Google-Smtp-Source: AGHT+IElVOKQrHQSW/WG4AXM2/H7NAh/sNrOhfOcPDza3R9P1CmFhC8jRazW/6xVsXi0tYza7X5QMw==
X-Received: by 2002:a05:6402:5215:b0:5e0:88d8:440d with SMTP id 4fb4d7f45d1cf-5e0b70d2589mr1135128a12.1.1740150631534;
        Fri, 21 Feb 2025 07:10:31 -0800 (PST)
Received: from [192.168.0.104] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece271223sm14141922a12.59.2025.02.21.07.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 07:10:29 -0800 (PST)
Message-ID: <37292bb9-6886-479d-bfb8-05e2ee540c6c@linaro.org>
Date: Fri, 21 Feb 2025 16:10:26 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] dt-bindings: clock: Add Qualcomm QCS615 Camera
 clock controller
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250221-qcs615-v5-mm-cc-v5-0-b6d9ddf2f28d@quicinc.com>
 <20250221-qcs615-v5-mm-cc-v5-2-b6d9ddf2f28d@quicinc.com>
 <ljfgljuhlpkjvqwomhvq5l6giihqv6h5nzswncaqgelvjycgew@bcxjrgbj3lts>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ljfgljuhlpkjvqwomhvq5l6giihqv6h5nzswncaqgelvjycgew@bcxjrgbj3lts>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/02/2025 15:11, Dmitry Baryshkov wrote:
> On Fri, Feb 21, 2025 at 02:50:13PM +0530, Taniya Das wrote:
>> Add DT bindings for the Camera clock on QCS615 platforms. Add the
>> relevant DT include definitions as well.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Just noticed. I've never replied with this tag. I've provided a comment
> to the v3 of the series, then in v4 this somehow appeared. Could you
> please comment, what has happened?


I think that's not the only place - several other patches got your tag
even though you responded to only *one* patch:
https://lore.kernel.org/all/cwiai67gs2o3tj3bjziao26uxg3yrbd35dknkvjerbe7cbgfca@qhjtij23yn26/

Nothing in changelog about adding tags...

Best regards,
Krzysztof
