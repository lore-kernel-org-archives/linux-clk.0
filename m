Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921353B19BA
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 10:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785235904; cv=none; b=BisFRBlhFEy09j+4n+XrfOqT3u2XDgnJAq8HnBXJI9X39fi8oUQqzoZ1KwxWzJp/PmgX2ZvOWUEb/CkYFjJsmfdSRsQyswF5i8D/eWR2V4PraPvWdubbfzSMECFf4aMKrf3nlMID2uO/ERa2s6+fmgBW3KPeFTjoT27CY00piC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785235904; c=relaxed/simple;
	bh=uFRNW+3w9EnOK3PrrtaSrrFmRFgj9UhlYBeXgQfDtfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H6FoA/IacRnloJZ0K+yTWtFFBtK7RvzR48IkeTiwV+uScdsLRLTdDiZgLRtaXCrDRIEEDemh8YY/VU27oLw3udV9UXP0zvj6DLSy9aCeS4LY0us3XiwTxlPvdbio/4Dw0Up6xeYy1ejaAVt8V5s8bZpAjEI7yOU7i498dQvalUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XT0+OBqP; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XT0+OBqP"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a02aedabadso1282976a12.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 03:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785235895; x=1785840695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s0DjSdXiKBw0ZZEMZd8FTQi9iSoUjrgkZuIJH9PB0eg=;
        b=XT0+OBqPLlgwsZrZdZioLsy8Z13LP1eySQdC8+FRBOfn2RbaTFDEkVw/Ge/n3+efSk
         QIQ+O/CirVFyXuT9m5cqgDOqB1Qg+qdQE9h6vzpA55KP1qKM1Z6Ioa7bkIovCcLFKzUH
         aF39TY6+RG5VGy6EaTgDnBZuLAPBH/I0gqnJwYivYfQXhgokfUy3s5AtUh++xP1H7/Uv
         FWA+XcQMA1uKiAsHUj4sOXB44hUnk2INPOLQuXt63fWxZa7mFtdMdYn0y8ktrfE5ZAVH
         jqIsPRUKRnbdmBKB8lay+ibWUoEnjJXW4RE4Z4Lq3oyGNrGc7ei9pPFtMKq4hOvx2raq
         0VZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785235895; x=1785840695;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0DjSdXiKBw0ZZEMZd8FTQi9iSoUjrgkZuIJH9PB0eg=;
        b=qsJt+HBlHcwW4CWtAjjQYqkfqrHPDWy+fNmGoR5gupEXbWIpzXWZdRf1sHLhJOjGKx
         K5GEzycY9feNDGwMa+O1r4ZxZdkd1BL1tfFC3VTlPOi/u4f/Ox2IzBVnDirYo5PTNQ4o
         pxD16SUxvleJwcoPudDvviIrSsDRqIdYs5QrgXBF4Zw9XNI/P54YEg3WDSOHw5pZi+cs
         NU/yRTipCwUQBiGSmtw5uGym1WWmW3YylsYofHLOnqfQLSKYn9Lgp7jQxyz++pJQAhcM
         JaAMWH2e3CggsIYeGJH3WmUM2vlaNdQ4f/Gbj0KnTY3o4tnNi++3Qx+QUHU9RIxLwMLk
         ckHQ==
X-Forwarded-Encrypted: i=1; AHgh+RrYx0i8wsII1ubAAEHghQBsWn2LUjKpQsvzC2M0zTpxmgF7P56g6/Zce0vltRzyIFmzMHHMsBAYgV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj7sJvB2APdlsHjdcmTEj22nX1nLGfjnOCpxbJOCVNBexghhAi
	qu9uHMjua+DBxw+9FZpakwe9XwplUoTHhLFOLUyDcHjWuf1ik7O/3ocWwNsnCX1wTi0=
X-Gm-Gg: AR+sD13QEgz+RJik+bE6g0sYi8qY/cR5siaN6kjvWjECqQgbIIVSxiCdVeDS6vHAddZ
	y8ImkWJKr4dlwzR3U+2bCakPlqpXhlH6mXpYApoLWRXqm3D6zo6rg0qoTEFGG+yoaaLfVj/GOOs
	brVmqqykPbhTaJFF9x/IhVHxMHLkPmK5zkJ4RaONg3m693qu/E8AMBIdhTnT1UqVDA5I616UFjz
	2ZJjTorBQNHBDkaUxVpbgb5ki+RM3WkeSunECCNMQJNA1rjhxPcZ1KtKpymb0YDq1i4vLztMFjN
	KZbYB4Qfw4WzDk/ctU3m/wl/oh/tMaOC2vlBFBsATGaDJmAYcw+cWCY9CmaXT8gpr+LUV71CNz4
	UrhVPqxLAS9jpUFqPGNH3Io9v6+p8AiWhORMnjLJvGagoCdV/lnYStolAENXVQrzeR85jtNHdze
	n2sf2YQjAUQIdC
X-Received: by 2002:a17:906:fe43:b0:c15:ce72:9352 with SMTP id a640c23a62f3a-c1f72147fe4mr100806566b.33.1785235894410;
        Tue, 28 Jul 2026 03:51:34 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.204.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebc3c0sm744772166b.51.2026.07.28.03.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 03:51:33 -0700 (PDT)
Message-ID: <bdcb1c93-a560-42c2-9239-bc197b230a13@linaro.org>
Date: Tue, 28 Jul 2026 11:51:31 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/5] phy: core: Add devm_phy_get_by_of_node()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-2-ae811e2f0799@linaro.org>
 <t2c7lvpp3xyoumd2gdzntkwb6xpdjvhzyp2hllukimzfzbwbvm@fkgwdtcqxof5>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <t2c7lvpp3xyoumd2gdzntkwb6xpdjvhzyp2hllukimzfzbwbvm@fkgwdtcqxof5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/07/2026 11:46, Dmitry Baryshkov wrote:
> On Tue, Jul 28, 2026 at 10:35:33AM +0100, Bryan O'Donoghue wrote:
>> Add a devm variant of phy_get_by_of_node() to allow for the familiar
>> pattern of having devres automatically release resources on the driver's
>> exit path.
>>
>> Signed-off-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>> ---
>>   drivers/phy/phy-core.c  | 34 ++++++++++++++++++++++++++++++++++
>>   include/linux/phy/phy.h |  7 +++++++
>>   2 files changed, 41 insertions(+)
>>
>> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
>> index ebfad5325072e..7af24f2f4120f 100644
>> --- a/drivers/phy/phy-core.c
>> +++ b/drivers/phy/phy-core.c
>> @@ -1029,6 +1029,40 @@ struct phy *phy_get_by_of_node(struct device_node *np)
>>   }
>>   EXPORT_SYMBOL_GPL(phy_get_by_of_node);
>>   
>> +/**
>> + * devm_phy_get_by_of_node() - devm managed lookup and obtain phy reference by device node
>> + * @dev: device requesting the PHY
>> + * @np: device_node of the PHY provider
>> + *
>> + * Returns phy associated with the device_node or ERR_PTR. devres manages
>> + * releasing resources.
>> + */
>> +struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np)
>> +{
>> +	struct phy **ptr, *phy;
>> +	struct device_link *link;
>> +
>> +	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
>> +	if (!ptr)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	phy = phy_get_by_of_node(np);
>> +	if (IS_ERR(phy)) {
>> +		devres_free(ptr);
>> +		return phy;
>> +	}
>> +
>> +	*ptr = phy;
>> +	devres_add(dev, ptr);
>> +	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
> Why are you adding devlink here?

Looking at 987351e1ea77 ("phy: core: Add consumer device link support") 
- adds this link to 
phy_get()/devm_of_phy_get()/devm_of_phy_get_by_index() to enforce 
suspend/resume ordering between PHY consumer and provider.

So the get_by_of_node() replicates that logic.

---
bod
