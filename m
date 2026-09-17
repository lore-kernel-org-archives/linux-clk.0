Received: from mail-ej2-f20.google.com (mail-ej2-f20.google.com [74.125.228.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113CA52B1F4
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 13:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651684; cv=none; b=O9n6LcQnTR9LPVgbBo5OYuaN/BnwMtNUyP26WJ4fH5qwQCnXLHQS0RLI/uZJYbTqv9nn+PvUGSeb+heFg2ltWCcwrC0gKwrJEK3xz1KNW2w2rro6A1OCwm/r3ZZiF834HBsFLthKBf8gpNP6DyRCUIXDiUgyvGwznBLfeQlIPs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651684; c=relaxed/simple;
	bh=TX6xhS4Vhis/cVqkO7iD2bmIOPGH7N8MJNCWfFGrVr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mTdRLj7AISWH/W39hedn7brJTmpFXAoAcsU97iIb7GbqSUcfs6d9x8+K7d8KCpC3uYf9iCS5epm0u2bRVzx8oXvcEMvugYHG371I4YOR4+j21F1c5Ur65LH+wmfyIQJYxHJuigfilkFMmpKPLUGuYl6QbIwEOd+TVCIrGqLhETk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OJPx/VkR; arc=none smtp.client-ip=74.125.228.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OJPx/VkR"
Received: by mail-ej2-f20.google.com with SMTP id a640c23a62f3a-c293c683202so129936066b.3
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 06:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789651676; x=1790256476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rajuo6bzngXrBhLYotQd0SgbFpshLprnWII6O4/hths=;
        b=OJPx/VkRtQ1fIdASIxegqFHT0i3xYB+awFm099+ZIEeVsYTarq+xHv0polyYdj22JM
         BHvYD3HpW5LLY1/Aq8nBlVzmuN57UM6PNT5gIDypU8XJwCcRqvqCmU7RAddDDNNjgdrS
         l+cZxshTdscz6asGb3tqJaQeBOYVFwmuFO0GPKGphIrO9LfQv81y+dlfRDREHa1+jy1Y
         ALBFDSqNVCwkuWI7zjO2/kwMmxKRnYoe+9z+Ugs8VuwC6HHpsOkYI48vRu0NwfJ1pk75
         M/AG25D3IuNO7Ftmcd8Oo0IgT18PvFy/PPpoj833Kj7kh8Eil9yogKdpr9WEo8d+BaXY
         8DpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651676; x=1790256476;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rajuo6bzngXrBhLYotQd0SgbFpshLprnWII6O4/hths=;
        b=hKQ0df7LoVfvOzKEVcOpba6VHZQX1zv5URYAUob1v9NXyhTaISiYuJQBGafM5vsmVY
         ui/LYX2iYg3QIZDGI7QRmhmHmaQM07lmMHu3jvP7kuyFOpeqldkiT7cBYCqtjio5iKSx
         Ku/i8XAAPd9JQvB4vWqVJY+5qobB+9Lrae3RKnqfSgwB2PqrwfqTFz+vLxdoPWWkaMu+
         kn2TdUpcXxbKF6i9Tk2ltSJ8dDLV6aetne5+NyEyAqDgCA2migMMEjYN9znP5InV61c5
         Y1CppIfNWGJ++SpYaXYBFaRijD7ETOtPO0LmdBhF7gJYLYTjcmjZtauhjm8EpF1I/BKW
         0cBg==
X-Forwarded-Encrypted: i=1; AKwUvBwuNj9imDsMju1s7GTnTlp1Lb6hnQWJrgfza2uch59aWqPRHIu7q76xZVsocer1AbhpHLEJdBZJR9w=@vger.kernel.org
X-Gm-Message-State: AFuF++lNucqcGGTKIEcOu/05Su1zeNQuoZu0IDTH5+owSkDtVEAu5g63
	yGDjgmxr50lp0r17e8zOAE4O5L4fCdZwFZ2OUDmd8I8ML59Vg5mwOH34dxLzyPwsvIM=
X-Gm-Gg: AYBFou3R0Fwsqq8ZjcDhSTKY8NAhBqYy9gQtMRENumfHO1mfgjZEbG9U5YL+/4J95v1
	jyWuGWlrwAqHzSeRujJZTKVGebmu59Nbs8B1+uXipitz+bQ8khUZ28nyg2zmx03/cFEJM7hOZPc
	YD0KaYWoxGRCJolSQenD90zwC1xzrWwdNOgjHslaTKKX0H/4gY8a7Dewq982J6rsKJDrVhoGBdI
	HYYopJgo3vlHXPYSoSj9Fp0UcwomkXtzEPifuCQMUUZevGA4g6gvkQs2THbWG80e+gGBXMznKFN
	r2bpYOKUWPhqWg4nmzHqrdVm8BSXN7DDPfC0FbM2waP3h99mM5IhGIPRNtWjbkD10KXc93Qzmcf
	vhdnjOVXC7+9HDB8YvAzL79b1ltQDL35P4Qx3WnkNuQ8dCoDAK0GOQMjcXKZEd7sQ75ZY67uID5
	IaPAbma9oQYIspmsPjcDSkOmOKTxFbJBWrt5QVC/cK+ezHcuss5MJonkzukKsJyZXSfAnBSBsy8
	JY+XFLpx7o=
X-Received: by 2002:a17:907:d0b:b0:c26:19de:9acd with SMTP id a640c23a62f3a-c29e5308381mr463526666b.37.1789651676039;
        Thu, 17 Sep 2026 06:27:56 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de453f04sm293940366b.15.2026.09.17.06.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 06:27:55 -0700 (PDT)
Message-ID: <37f182ad-a137-4066-9e94-b06be2cd03da@linaro.org>
Date: Thu, 17 Sep 2026 14:27:54 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 3/5] phy: core: Add devm_phy_get_by_of_node()
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org>
 <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-3-f85c9103177e@linaro.org>
 <9e8ae55f-6d95-48a9-bef1-ab653d0f1c7d@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <9e8ae55f-6d95-48a9-bef1-ab653d0f1c7d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/09/2026 13:32, Neil Armstrong wrote:
>> -        dev_dbg(dev, "failed to create device link to %s\n",
>> +        dev_err(dev, "failed to create device link to %s\n",
>>               dev_name(phy->dev.parent));
> 
> This change belongs in another patch.

Doh Frank gave me a comment on this and I just changed it without 
realising this isn't in my series at all.

I'll drop this altogether

---
bod
