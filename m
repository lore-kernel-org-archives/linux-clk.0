Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC4F22126C
	for <linux-clk@vger.kernel.org>; Thu, 24 Apr 2025 21:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745529034; cv=none; b=eBGaJqCB0XWZlLJEx11JCkJ/lfXTdDsgGix9wg1xea79+7IvfBm1VV0xCLLPWJBw+AfIiviqUIg2A1YCQeCGdqTaaSP8YtLQ9nGECqgqJpr3LCoLuFiyiSE4bO4ilMqIvz0XWWSX5N0MOVynXmgmnWjmW2IcuA/6obGPbG+dOGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745529034; c=relaxed/simple;
	bh=SAAXfe/KmgVnrM0sBHNxSuQBzWcxeMCd6SSxcmfEm6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SDRThV8N7Gxzd3cWX9bFSgFXrjOt85bsL5qIoBVqinCGPXieiiZa8cYk4GbLujQrj5PIdYhcbJyR8aoPUPpNnzlyj3bwCGztvAT9QXW4Tsc+C0cqlJLQAIIvHbjAiLBA+7xm2Smro3Yf9eAV/N1jTQpi7IpPivLbk5/WRsQ4P5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mPtE5+EW; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mPtE5+EW"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39ac56756f6so1452573f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Apr 2025 14:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745529031; x=1746133831; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fpJUvS8XH91DbwFGx0Gn68uuFYZumKhYa+GRw9ZFlRg=;
        b=mPtE5+EWP9AStOYu4l6kt9YU5MwGrW0PFLKCUpy4JN5UrIHtbzr98YNeUMEAo8c7dl
         f4BYUiy1HSPyob8bBdh0tO3BS9RvekVUHBJRk1c6TeMbPhkFt1p5BBIlRQ0q4bwAdorL
         7QisSGfwjRNNV5GCUd+fNZ+tEWgTjmP1ihmhKabRwnsoU9Jt9+nI5BXjPHiT26Ump5Qt
         rfcLk4pt4k8jtY6JNfYaCZH0H6TH9eTOYJh2OAE0c6rD3MouXIcelUyikVxLcSD/XX8P
         tRHxBCpEnhJZQieXT7oIofMzJU42Xy6YvmejSwAOcBsTbHaRIhTU10XbMpCwZHQoeLeQ
         Nolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745529031; x=1746133831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fpJUvS8XH91DbwFGx0Gn68uuFYZumKhYa+GRw9ZFlRg=;
        b=LvKTj0lpuO8DlGJ0ryjXEEUeGKtTnT3WS5eMX6NDgFC3KLFZC8IE/G1RT4C7+tq7o4
         XUZng3fUqGOAyn3UqpYOrDobFCWJp5lnHEVoy0wFjoedk/cYtnG3kogjcTVWISVSyCWS
         ZKRiLqOVJfPiBD3M8jDcIi3vmuHmwt1/E7wqg0ku6WH26Qza8Si/goZyjmserZ8aDwSh
         YwTVfzhF9lQvSke94ITyhnWOsDH/qs9Z/FwK5rlfAz5dendpGbkBSfu8Vz7UsKDXiFRR
         hiAPFRZaKlBeHQVbbg3K7yPrCWuQekZejbjUz+rmnuEUkO3HMHcVGoqjeCr6amHIwe1u
         pnUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7PMVLQuIao/kw4y2qkJhEI3iy9xADxTuBXU6BYYI/K2jfS0AdexZlpaX/MplSVlo8eI5qGdkKZ4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF1YenEVnzh1/Dy12ezavZ4sCTZVB/0vprUfCiL4GE+AakaFHH
	FqCb2XKKCzd5wnSfzIcSVIguJEDXc3TRQl1klroe+UkUKTGkPwsrKVuWSN/VLSw=
X-Gm-Gg: ASbGncuZ08yhhJCzS1/5BdP/AKl+aXqFH4Rxml4fudtjdl849N5klrzm4jQh4Oz843P
	jlfk1YW2sTpOIkizxw2CGUf3c0ORpJhuzlwCiDeIqMvDbRDHClpUhriOp1BSVd6jRXv6tzZxAhE
	g5xNI1MAFtvFQaBkQPOjIdmnQLjxbf0PkBjEusc354zMvyeOilyL9iv7iZUbhpeuFmFS/AxZHlL
	rLivPtDgEy/CdZwZ8BhmSyX4p+6K7bVHANPvGFyXV4G+pizjKhjjZIlcLoAezNtLV6Q8ccHPZBi
	EGTnXlebgIVz9XYxyXOusMYDtXK4CF1lCLBmIqul3i8EmE8jkMV2Vp0sCuZi2pn6KS5bbjlbUZu
	PtZkLBw==
X-Google-Smtp-Source: AGHT+IFQkn1+bYDDTCD4Ik2NQke355Zk6NhxCyw/2MWOpTV1mCxM9793lDKvqt+tzTQ/fQ1A8Lt/qQ==
X-Received: by 2002:a05:6000:40cb:b0:38d:d666:5457 with SMTP id ffacd0b85a97d-3a072bb38e7mr581586f8f.42.1745529031365;
        Thu, 24 Apr 2025 14:10:31 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a536a1e8sm1651745e9.28.2025.04.24.14.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 14:10:30 -0700 (PDT)
Message-ID: <e7a229f9-b02a-4979-b609-ef5e478fe9c6@linaro.org>
Date: Thu, 24 Apr 2025 22:10:29 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
 <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
 <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
 <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
 <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
 <6a4ec36c-c003-4ce8-9433-8c12ed3188ee@linaro.org>
 <d97194a7-2b7d-4a76-998b-92da495e8bd2@linaro.org>
 <d0958f7e-db81-4e4f-93e5-24ba0cd853fd@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d0958f7e-db81-4e4f-93e5-24ba0cd853fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2025 21:08, Konrad Dybcio wrote:
>> The Test Pattern Generators - TPGs would then also fit into this new model for the PHYs.
> Maybe we could consider modeling various camss subdevices as separate DT nodes,
> perhaps on some sort of a `camss` simple-pm-bus or something alike

I hadn't though of that specifically, call it option 0.

I had been thinking of

1. Doing like venus with a subdevice based on a compat
2. Doing it like DPU PHYs and just moving everything into drivers/phy

The fact that the CSIPHYs are technically inside of the CAMSS 
collapsible power-domain seem to mitigate against option 2.

---
bod
