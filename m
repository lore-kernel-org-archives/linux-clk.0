Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DD13A875B
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 14:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741667; cv=none; b=cywtHi6jMy+Hno3L0rTaDwPfh8BmcccMLGewzG8nOdNyMbjeze2vaS0M/kqdd5S8FlvsNBGzJCbLy6Z2hDJcffylsHdr1JePhkru+lLp+ldZ2/XDZYWbeKg0ryHnbUhiN+TLNBv1IlNV2EIrk5VLbOBhmdatBqlkjovP5fg4dF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741667; c=relaxed/simple;
	bh=sgunm2sNjagt46bq1ZIC/qX8k5vKqpE4P8hC394mvU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tujMc5Qxdhdj5uRoO0qqElIa/m4OIDGv1bWfjBBayNAKE2xGr2A/4MU7+eBK6XfYEW+AJ2XGMjYsPWMOgK8nSi4UDkN/ZDUw2twHdMFjqA9ACV/3VoYA+IZcjbCvLgGV6JHmKSlxCit7661E7jqWf1Yiowkp6+qaIvXm1O9evHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q0c/haM4; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q0c/haM4"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa650c8so126721266b.0
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 07:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789741663; x=1790346463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BnD2Ei89mkiOFb1zZQQ79Aq7EmWfIQzBftxY+5mS48k=;
        b=Q0c/haM434hFxRb9HrsA8HMhQ0aOYGv8PgHBrbqBJeyp/+aT5rApMn3T0JqghomwUW
         q8y2OWHAWCdnBzrh1nqiidF/S8Hp98uwPim6fYZfFsVX690bH/yv3113Q00lT7nb3fNG
         CRscyAc6emTw4eOnjRlzLsRVxc512gqkfkRZb8oypb7n9gFZJfIxA1B4OsUlwzlLOvFA
         zJ12gqU0/I1Hr+dE+lUijjXGRIQ5yD3533ZduBBF9fOnaawbEWC3xH6nXnGF9l9rT3ua
         qcY/rZJw9ABTJUHRati5Vdte22n0RM8V8fdXj/jf2ptSov9y9/iL+XoITfh6OSdpv4Ta
         W04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789741663; x=1790346463;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BnD2Ei89mkiOFb1zZQQ79Aq7EmWfIQzBftxY+5mS48k=;
        b=RShw8mNFg9KxKn16K855HAqEMaTPBITx7iWk+OBG6ovrt8KINA5o8KUFXS9OcsVZMJ
         a9MdAjQ9f0HEnPTd07sMG4F8AEYnfiYhfYmxt6iHWP7J78HMr2todQ4mgBexWqRgivQG
         udm+GyYD/5tphAgHiM8zLWq/q3ZcLg/JrdR+jWRJ0kjoHfupx2rt7/tCn6KtGsj25ipp
         5TwCFP89HKEnq8Vup8x6ejFgvUKABn+hmXdlSdAx11D9OoXrC0wTZCZdMOBuaXM8ArYH
         LpsJP4QV9/xDdWMIJN78PLDBYSzBvIPswzKqbhO73wy8OU3nTZSuq4ah9wApHw/vKSE4
         9W5A==
X-Forwarded-Encrypted: i=1; AKwUvBxu7gPtMIg3Dg5zwJLlsfTOKpHBz3M6xYmumbtFnkz165zEib9D4s0evJq+lGcgyFMRvn7IYg6W5Yc=@vger.kernel.org
X-Gm-Message-State: AFuF++mMBt0qh8Y2uHlD6BAuw5g0tJQRQMA3+V8RDuTvDIXV5a1mbFaA
	aqZBHndGB42tsY6joNr0VyUG4y9Ru4i4SuihwG9Tyin6iQW/Gpecu1ZnilfW0LT8E3g=
X-Gm-Gg: AYBFou2ngop+m7vBApJFLPn9CnFL/cKQHZ+H5zsOlMLw2blk1s3V5E8BuIMuaUHuVUt
	sI2DY7eUz27CjolQsXsacc5ET4GdKFVbdOq6tm6mk+X+b50E/H/haLbm3/xAGFnxQcV4mDsnp8t
	I16SQ0Vvj8cQij64R2Kbwo+RGyREMww8GEth2lLGRmoBpJmtJO9BH8Y+0dGjynobBdViONGVGwi
	9nZU9mxdP+dATSirhNTd5/uSQOl3bZaPTNalxveKVde9agNablfTpL0CPROgJM6BEza3xO1T7ek
	QJZuYv8A6Beo3oE8YQ211SKXg4fVaAF9SpDz8zqQMz+I1eCYq8kHc6p+JoOT5kSIIsm3r89B6HD
	WDTu7IG+6XJcKG25TLJTnvfKFKeqz2YNqoyLrJ4TXYWHUAxvVnThk3BLsxBLjYEj4F9n6NIptuL
	3wcjDr1nGJFQIsnHsbRELLkwUhtlRxH/SIUhixEIsanCbHtWFczh0KDjcU6JDr/8DPZXDqdF21Y
	W/oMBry+w==
X-Received: by 2002:a17:906:478d:b0:c29:5a76:72be with SMTP id a640c23a62f3a-c2a157c41a8mr252060066b.24.1789741662748;
        Fri, 18 Sep 2026 07:27:42 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.4.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb8ba5bsm61582566b.45.2026.09.18.07.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:27:42 -0700 (PDT)
Message-ID: <fd6bf432-0ce8-4793-821f-f08321b13a5b@linaro.org>
Date: Fri, 18 Sep 2026 15:27:40 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 2/6] phy: core: Add phy_get_by_of_node()
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
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
 <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-2-dc244e124e71@linaro.org>
 <211caa95-dfbc-427d-8ce8-49cc76c24124@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <211caa95-dfbc-427d-8ce8-49cc76c24124@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/09/2026 15:10, Neil Armstrong wrote:
>>   EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
>> +/**
>> + * phy_get_by_of_node() - lookup and obtain a reference to a phy by 
>> device_node
>> + * @np: node containing the phy
>> + *
>> + * Returns: the phy associated with the device node or ERR_PTR.
>> + */
>> +struct phy *phy_get_by_of_node(struct device_node *np)
>> +{
>> +    struct of_phandle_args args = { .np = np, .args_count = 0 };
>> +    struct phy *phy;
>> +
>> +    mutex_lock(&phy_provider_mutex);
> 
> I don't really understand the usage of lockdep_assert_held(), but why
> does _of_phy_get() uses lockdep_assert_held() and here you use mutex_lock()
> like before patch 1 ?
> 
> Neil

assert_lockdep_held() is just an assertion that the lock is held, Loic 
suggested adding it BTW. It ensures that when another function calls 
this function it holds phy_provider_mutex.

i.e.

phy_get_by_of_node()
{
	mutex_lock(&phy_provider_mutex);
	_of_phy_get();
	mutex_unlock(&phy_provider_mutex);
}
EXPORT_SYMBOL(phy_get_by_of_node);

_of_phy_get()
{
	lockdep_assert_held(&phy_provider_mutex);
	/* happy days */
}

phy_broken_locking()
{
	_of_phy_get();
}
EXPORT_SYMBOL(phy_broken_locking);

_of_phy_get()
{
	lockdep_assert_held(&phy_provider_mutex);
	/* wails plaintively into the void */
}

---
bod
