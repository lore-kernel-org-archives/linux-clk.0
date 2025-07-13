Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216E5188734
	for <linux-clk@vger.kernel.org>; Sun, 13 Jul 2025 09:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752397970; cv=none; b=C74uKCBTuptsb3pgbvK2RCftwFu68wWXbxEIgzC7eaB7LVYmvu1Ov8LH0Xe3W3VyEtLAYmz1dq3BHZHtfLzBUDJIWPeSVzQi634GmT/KVCNvCDi7NW/pvuUrFw0indxodqJCYW1vl9rErU7L1325ZlOENrZe4Nioebid02jGOKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752397970; c=relaxed/simple;
	bh=ttP2+H/bej+IM7hX8rbyBToQUHpPpcZy6rtLIIOb6c0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i8+nZk9e8TM/zrf3Jr6QqC+GVHz0xa2GEmSrdiLcov+L8CYjf5Ecq3N8jVU/zTiYGnHj0pP2KhJ8HTy2cCXDqSyFZ0TV+LvB300fo8LuYmrBjeR8ItzVmhjDNzC3GkxGe/h3fY8jU9bKTbwSKAtEgqX8YU0okXZEYmWGwncPg74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hRg1H883; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hRg1H883"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-45363645a8eso23044625e9.1
        for <linux-clk@vger.kernel.org>; Sun, 13 Jul 2025 02:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752397967; x=1753002767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2bZfg9DF5nDVKhJoydkljHjxo8IZW88WiR/LfC60k7Y=;
        b=hRg1H883qwLMSTjeEigBOEFhVD6QoGYt4zn8ehVVliF72zunVAlKF6WNNtBtgsOkjo
         yeWypeD88AfwA0risdqQDYOTXkWQtUEI9wgSRcPWRTTeC1BDJzzxqhGjuU9Z6nnO12Th
         JO0qvtjoh9undSE6DPYmGfRWpxzu1IdfljeRwn2if4+TgwT1cD8tPGYIGCSebmwD5r/d
         3+oEqg0jYBrlmBwBR5I2hK4Pqr1ynD5FfMPE7/ElU5olYtwPe7GE2og0ReNSy//+d5/N
         p9Hum00PCC1Sso5SS0NksWNep0lqBFuCcdpvC4NT8J51UWaugcDVmKOIBPdj/VdWsR50
         CdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752397967; x=1753002767;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2bZfg9DF5nDVKhJoydkljHjxo8IZW88WiR/LfC60k7Y=;
        b=RZhpIgNLBzvkGSi3jEssIWnJVMzyFcFnbieRQ+GHQi8aLqtm3fvtudrT8NTTCcaCYK
         BQJqlA5gFNlyluNXOmwHeXsS8Jhn133sqQxf3Z8WKK0JXdI6Wyguo1+1vXQJ9Yk7F00W
         AmUEm9dW2hro5yNyhpT6QhXkb9FK2aMIj22QhGFEtw3O169YgkNXq+w8dsHa+J9c26NR
         kARkBi2mEWoeXclT2fyvwkBHbkUkSDY3K3wxmj2rKa61FTV8AyX9ePtU17/rAv8OxLoH
         jbk05irWhYwsaFm4Ixt1sehc1H2zKi5E2Y4xhk9uDzDtu41XqvA1o+9Wwf1Xxtfz3Quw
         M4+w==
X-Forwarded-Encrypted: i=1; AJvYcCUB25W8ULP2/yeCioRSivAqUkahZv9WHqka5Tmkvv/F7Ex9hNy5ZOeO0zNKWE5KEACRcq7icitWFcE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv2m796cZyh7/D2NT7a25A16LJZ0BPAwzQICX1JzpkOhHJp8Tv
	VhmZVjSyifdjRFGGLuNfb7kGttRYFwDCVuiw3X4csFeyfDr2at7iQKWrqLSyz56gfZc=
X-Gm-Gg: ASbGnctDnN2rWpS3ioQQvJ9ZzsyzoCuhnUAg1d9zR1yET7EA/sho0IpEvNGGYzCNZRK
	YEWecQxO82jeVtFkWN6ibclMQMh8HlOs5n148OAbA9bA7wokAakgCqeZqBNScCN0EqhJk7Xohah
	U7k4ihiZUb/LfG0NbATkQmR460xjw6HC83fF2TKLlbR6A+6jny3ici64xR3q4mKXAUe2B46TSBY
	Of+Fa3kBFkdhh/9OywYKga0sSCIeZ+98XTfMGSZIestin+A7wKU1RoPljSOPvwWsNTeumUmUywv
	kXMJAKfwEACFH+5d06FmYxSYH4BFj9edYXYC3JKGBpX+2KEyJ/KmW7k25FrBMJ13qM4QFtYLWWB
	b/JP80yc4yRem7FGtMT2rsJXx6sZU+6NJxFGQ0hi22djPNP+g21YCI91JecrxrpA=
X-Google-Smtp-Source: AGHT+IFYMtWgYdOmndlZ3GtfdgwsQKMDhvhnsOVqQJrHIBGY5YzlakXukB0kQt0B+MV4iFsnSxY0lA==
X-Received: by 2002:a05:600c:1f8d:b0:442:e9eb:1b48 with SMTP id 5b1f17b1804b1-454f42692d9mr74678445e9.24.1752397967443;
        Sun, 13 Jul 2025 02:12:47 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc9268sm9235312f8f.41.2025.07.13.02.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jul 2025 02:12:46 -0700 (PDT)
Message-ID: <6ca1b24b-5f9d-48e7-9afd-7dac47b486b1@linaro.org>
Date: Sun, 13 Jul 2025 10:12:44 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/15] dt-bindings: media: qcom,x1e80100-camss: Assign
 correct main register bank to first address
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-1-0bc5da82f526@linaro.org>
 <f4fd544b-bd5e-49eb-83d9-290f77e503ef@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <f4fd544b-bd5e-49eb-83d9-290f77e503ef@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/07/2025 09:15, Krzysztof Kozlowski wrote:
> On 11/07/2025 14:57, Bryan O'Donoghue wrote:
>> The first register bank should be the 'main' register bank, in this case
>> the CSID wrapper register is responsible for muxing PHY/TPG inputs directly
>> to CSID or to other blocks such as the Sensor Front End.
>>
>> commit f4792eeaa971 ("dt-bindings: media: qcom,x1e80100-camss: Fix isp unit address")
> 
> I have next from few days ago and I don't have this commit.

https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/1da245b6b73436be0d9936bb472f8a55900193cb

>> assigned the address to the first register bank "csid0" whereas what we
>> should have done is retained the unit address and moved csid_wrapper to be
>> the first listed bank.
> 
> This is confusing. Did that commit change entries in the binding?
Fixed the unit address.

What we _should_ have done is put csid_wrapper as the first entry.


> 
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../devicetree/bindings/media/qcom,x1e80100-camss.yaml       | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> index b075341caafc1612e4faa3b7c1d0766e16646f7b..2438e08b894f4a3dc577cee4ab85184a3d7232b0 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> @@ -21,12 +21,12 @@ properties:
>>   
>>     reg-names:
>>       items:
>> +      - const: csid_wrapper
> 
> Anyway, this is ABI break, so needs some sort of explanation in the
> commit msg. We don't break ABI for cleanup reasons, unless it wasn't
> released yet etc.
So I since we haven't added the node to a dts yet which to my 
understanding means no ABI break.

---
bod
