Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BB714A4DF
	for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 10:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745575619; cv=none; b=SoXQLk4+O0MlQCIIoyqH9Ic6/gS1on30FbbRKHrYt4RckUz85H12bhH7+UJktX9aekA/DdplnvY9n6I8BPEPFUdororKYbeqE6kU7h9CCnuWzAW/TeQm/26JqheJolXBkha/gJN7lGQ8VmImCx9MzG03U2WK0bbnNpCr/YsQtn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745575619; c=relaxed/simple;
	bh=obu+Qt9zPoq9Pg2EOlGvIr3eXjoQttpGQqYbnKED+rE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JD029XJ/eNO0h9N+7amEIUxyWtYAYtZyRpxA5bK8Dh71gs5si9nADzIRbVXAI5TwhElV+DloNUeXKisG2I++J725GC55ThX1za5GBwA+mgSLkkbWsfyNtjFnFwdik03qeRdrpd8xjB4D67lRl4vDrwsoZTnvsXqqWu4EqUs3b4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tX9XKfF7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tX9XKfF7"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso18172055e9.1
        for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 03:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745575616; x=1746180416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CJc4EEGZ5NPCdipsMsCOV+mhzV5z2YlJ4t595WgVtEw=;
        b=tX9XKfF7rl4zBkbO74LE69pIe31YkQV55gtGz0e0dQyEtA/ChN0OH4kK59xjM7b4IP
         RjLXZpZx0x6mIdTEK6tVNF7NgnePoBSWy0MUdO6fruaLXrP/bFwpnRKbTkRPd6XVk9Wl
         kg9S8DbbgyYBEoQOcI0V86ab7TsOLyYEJ6spNyMdx5WOW2lRaT54WJdjCCJBmldif/o8
         uCe99kKzirSler/QOBecAONB1y1VHm2c6whXlKo1PvIgJrb4cMfQ8ZTt6dG+1ISxP7cc
         Zzo/0mKB+s935dIjT3jAGABz2lnwNRz3IZByapVF0yeEo1h8YNaTpzSVCSHBgN7siasw
         qlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745575616; x=1746180416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CJc4EEGZ5NPCdipsMsCOV+mhzV5z2YlJ4t595WgVtEw=;
        b=XZ4OZ1Yhe+EUlqlE2Vy2uwVBObw7I8l/jmuBaLtYrMjXdUbNgGxOkDjfKK46hMHbPb
         3t70NvJ1LVz2bpph0qD16EYlzlQ/SkbPwKDLoiHKUFj7eN09nmk6h+0sVK2Ps88EVvlw
         6VhXFCB/EdhLSrNdre+S060upxRY5Rc6LD8H34dtUZF5LeM3LJe6xE1u4E5iyi5LfoP6
         //VXiYTLspVJxSfu9i/EL/wrRkrctyM5IZgKal1zfnrdBe14vgblI3JfmzKL/JVBHhBR
         fI5I/1qdvhvHXB9rdEAFItmavKZw/NAjxL4NwOyMEld1weFcR6fnv6XAVf3wIHBJw06b
         feRA==
X-Forwarded-Encrypted: i=1; AJvYcCWKJKZ4SU7/XOh363jlFgaZU1N1ZDExEJ2z7OwizxGcl7ERB/GTACun7mkCip3t1hrKXhRCrILZytU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIzMhSNSv8ck4t5fcxqcuuH9dwj2RTKGxM0UMn1gUYLjhiMQ9a
	MbDM1k9+GMrZXWbe3g3uZPbVbVjaEREDT/a6gTWhUHnuwmEluJ92csiOeqxnUAQ=
X-Gm-Gg: ASbGncuXqpJAEUjSApCCvIGsBuvS3laWzlY8P7BCI2XzePXFz8209newIIwhgHX+4Ky
	BNdAU++CWz7TC4jDN2DCQZVHQp20JL1ZWLSQlbkXB7ay1sevCf41vL1OcGeWHz/03RgsrVVoBgQ
	zy+xqaxfetPcj2+eldFLw5Hcqp/EUu4AiRbh0J8qFGxDna7Gg96j+SBIUEPGIVlHdCXvrKtZ6jy
	e4vVbETKD/cMuU8ZQSOSEtemS0kIf0VsamabDtLYwM28FSNJbUVUHGs1roilrBGAyP/ULVK7m5I
	A0LwPijD9z4JispUk+I+omAguu8xqjHFPiFOWaoif5ZF1N2oA2MifeifFB2wixGIOiasUwefp1c
	0rRv3NA==
X-Google-Smtp-Source: AGHT+IE5F4OU/e3M5Qxu03zUGP/1/CF6PkbZtrEE/1QB/qtY4l8x3I7V+uOqBhsxX/jjOQYPzZRFYg==
X-Received: by 2002:a05:600c:35c4:b0:43d:738:4a9 with SMTP id 5b1f17b1804b1-440a66ab49bmr12249625e9.27.1745575616014;
        Fri, 25 Apr 2025 03:06:56 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a530324dsm19279455e9.10.2025.04.25.03.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 03:06:55 -0700 (PDT)
Message-ID: <b74d90d3-2a85-4853-9843-6a6f22720587@linaro.org>
Date: Fri, 25 Apr 2025 11:06:54 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add Qualcomm SC8180X Camera clock
 controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com>
 <H56Iba_grof22uzTtGCI-APhiDAGSejNod6jsSVIykm9ijaaj7PWqyszShCEGjIpM2wCLOn4a3Vfb8Hjziqklg==@protonmail.internalid>
 <20250422-sc8180x-camcc-support-v1-1-691614d13f06@quicinc.com>
 <621d8556-f95b-4cbe-809b-864417f0d48a@linaro.org>
 <b96f8432-132b-4c16-951e-718e91ec52a5@quicinc.com>
 <f74d8b50-35a1-4ce8-bfdd-4c90782b8db5@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <f74d8b50-35a1-4ce8-bfdd-4c90782b8db5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/04/2025 10:35, Konrad Dybcio wrote:
>> The dependent GCC clocks are marked always on from gcc probe, hence did not mention the dependency here.
> Let's do what was done on x1e80100 - describe the AHB clock in CAMCC
> bindings regardless of how we handle it.
> 
> This way the DT represents the real hw dependency, but the OS takes steps
> to get them out of the way (and then ignores the GCC_CAMERA_AHB_CLK entry
> because the clock is never registered with GCC)

Ah yes, this is an always-on clock isn't it ?

But in principle I agree, the DTS should just describe the hw as-is.

---
bod
