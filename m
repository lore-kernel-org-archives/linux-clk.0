Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251EF2EC083
	for <linux-clk@vger.kernel.org>; Wed,  1 Apr 2026 11:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775041520; cv=none; b=RgLI8oUUzuDUxRqOAnwwGvz76FuFCRvCZgnWSknZXKu4gABdK5No9NhbFX/HtXWqpIFt6MzRr2soVMCZ1CXtLtoHPDq5WHnBXMInoNByspUHmGD9eA0Sy3gWltFepON+KmvXa5kbkpq1oAhmfZJNiu3dr0bMFbfJm0Qq5/12TDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775041520; c=relaxed/simple;
	bh=om1doAdG2PMAv9rQ6C/z/VNO3DmdhRZwcmQFk9Vnqy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hHs+0xbN6YNvG3+atCXH7IhjhRqBUKyTD20iYIxW/Loru+xOocBNbCz8oTtTQdQbCzJwgXYsLBubEfHKSPTQfMeIxy+bJ9qLAIJ38jvmz8a0IeHtN/ZEmNJ+B15/UmV6oygWgh3TIZKGryWVeJPEjkHmGjFRwbHoDvTP5CQ1X7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MwxJJyLQ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MwxJJyLQ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso61386135e9.1
        for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 04:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775041517; x=1775646317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HBGBJDQ/gRb2ZWiVOaSaUlUwjskXrH5SbODqYF4ayW4=;
        b=MwxJJyLQ7TkzsOQEuDMS3aQ5MCPLtNV05Zx7ZFJQJg1+cVgFzygzln6QmIjgLNv4Uk
         8eVxWSAMDMl447kLXj8sPezmkQkx5BokGxstHbLMHww10lotwivBq8E3oNWX9w6sxbw3
         kf+Y4RwtfwJavFB8EQHmaDANJ5vOT3AFd4Wpv89/nKIpFIiE21A5bgiCGAaOplgJX3U4
         3Y35VYdJORWmUdKA8c4ghTAPnXhQhdrJ34oX6lZYgsmL6muUHgcMP54kAP1FGUhlXNz7
         9+AC1ajqXHKG3CMEDJRoUh/kJkLj8twvztJHq0xqHCWI9kKmQRP66TxrtRfiO/Zaw7K+
         K7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775041517; x=1775646317;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HBGBJDQ/gRb2ZWiVOaSaUlUwjskXrH5SbODqYF4ayW4=;
        b=Xga93E7GYGfpgDkmuMTbCd5dwEiUU9PGpXbu3E4gdvazus/2K02PBiDHXuGrI97suI
         lTINb0HplOeISsPe70haX2f7jqzTYFMoOpF5uf/xQlI1eV18etC8s6rNRuCNPheB/1WG
         IAjaaeO7S7Jbxp+MVBseDp1RDbbYoE9syFg2sOU11COffuUOU7xOCE/uPtwlauOYNB/a
         AHAGNwjui7RZbGvS9+Ueat+zOYzFVZ2rQgY5h31kV2MUxYbpQ5kcEFhBRLZBJlH4ETGQ
         iGrVgqkUIl8Zsh5fYpse9Lvk7fHT4VAknTOQ0DuD8LBUxJKi3Xs+Q9gQCpdr3bQIE5Da
         LNaw==
X-Forwarded-Encrypted: i=1; AJvYcCVALPMRsQw5nXEGKpsecY4Krg05iTXzptfLIM5BmxKKhJBDXN9HAn2R/xM6nDGd995FZVeccatS3k8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgS1TH/7ezliGyg+2w7bo/3TOCFonRE1Kg7rBfVHk/qlDTOK8g
	F5/RmCo1LB+G8VElztnFTmjcr4YzhfxJ7gv9ceBF3oZvmjaTpoJ6X4U1qy44VKaNlvA=
X-Gm-Gg: ATEYQzyjuUTnHvf0RAGJKg0yNIfIEGSr2XEnuzDEaFAwM2isES3g/XESknJCMdQczcf
	KRmHLW2NBVtey8oHR9FNw0+fJbJCpFZewn6jVj2K0IWspTiDVO23dByGjCktHxxqvAICu9unIgr
	6AEs+hYB8xbgh9/mNUOYzIPASP25VzHA8qS1xG6mYqxZ+oWSCJaCMAZrEY3CjA4zqPQhqaC95Rm
	G8ZGN0vJqJqzBhcLQ+rUrbfZvf62WSUW5JuWXA9Ks+F5PlR9JPxdjSYiE40wvl0z4MInIDvIQhJ
	z/gKB6VKjF5pRfCiK+3YZxRYE2UgLjVX41XxlGy4cyiA/TO+/FaA0XmdhsrPvDHw4eS7CRyuTZG
	vOkBs9T29rGjwQDayZ0V1HNFCFQJeJAT348JaWDQgwMvPBGaQcRD13tn6WVFfiK4VnglgeUcQws
	VuWVP8tLJkVA1QpZvEW5hQj7l6w2JibeoujDM=
X-Received: by 2002:a05:600c:4594:b0:486:ffa3:55f with SMTP id 5b1f17b1804b1-488835d0f0cmr51363045e9.27.1775041517450;
        Wed, 01 Apr 2026 04:05:17 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.235.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf90424fcsm30627349f8f.32.2026.04.01.04.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 04:05:16 -0700 (PDT)
Message-ID: <69b993ce-07b8-4071-ace3-9a33147670af@linaro.org>
Date: Wed, 1 Apr 2026 12:05:15 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dikshita Agarwal <dikshita@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com>
 <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
 <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com>
 <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
 <6yfn6ux3gbin2dtopdxxv4okinspueryuey5vfdq633gsewc6r@ttp56brnpgvr>
 <CAPDyKFpm7ujNw51dVpPaHCwssjgYe1JVBEyrQ_1CsPbDJuW0Ww@mail.gmail.com>
 <4fiyjcqt5smotudsfzyqrevxxnx3sf5grbgfluzkndbp2od6pq@vlyikcvl3xkb>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <4fiyjcqt5smotudsfzyqrevxxnx3sf5grbgfluzkndbp2od6pq@vlyikcvl3xkb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2026 12:01, Dmitry Baryshkov wrote:
>> Right.
>>
>> Since it's my mistake, let me reconsider. If I rebase my branch and
>> share the necessary commit through an immutable branch that you can
>> pull in. Would that work for you?
> I think that question goes to Vikash, Dikshita, Bryan and linux-media
> maintainers.  Bryan, what is the plan for this patchset? Should Ulf
> rebase the branch? Or is this patchset delayed for some other reasons?

Yeah no it's grand, immutable tag works fine.

---
bod
