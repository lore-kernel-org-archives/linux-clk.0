Received: from mail-ej2-f39.google.com (mail-ej2-f39.google.com [74.125.228.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C90A47604E
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 11:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558521; cv=none; b=USgOul3UneHorCS++rtDangtEsI4VwePvkQug1Uc09lUngFAupl+3erTvtFGX5QhO+1iOJiTDaeAf/FHErcIYL6zlb8RRc1f2Bg8QvhLN3YM2GTPCqLuYmaC0KH7Rn5Xxe/ki1Vf++Rr5GM6E7g0+LHhASsufZVTLhX+pXoRm7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558521; c=relaxed/simple;
	bh=JxFaW/WYqlOtA984BXiqHodpwCvgbe1pUjpcetQOGtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AKI+P/U1Bt/xFf5aCRPa3D2gn96fbMwkqWLYsXjjkM4oNGOBEv6BoDihmR9E5OBUpRtupL5cd7h3LoBVoAc6qCxSXc5Rx0aPhBL9wdZ4b/wgQ8It8HmGQXFQqt2APf+5EDybpm2w2RaMOQJEavIBscYJj9RL+SRvG9iq8+Rmp8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g8w6Whk1; arc=none smtp.client-ip=74.125.228.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g8w6Whk1"
Received: by mail-ej2-f39.google.com with SMTP id a640c23a62f3a-c2940ef15c1so116436666b.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 04:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789558506; x=1790163306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+ON5LylyLSRvB3Oy5FN+PptZ1PxOVJXbkytbHhMasY=;
        b=g8w6Whk1NXiS+r03W7LHSadISSNNdCcuyP+2QyoIr6Ja+0qXoeDqTvTM8ciHye3ZcZ
         H7f+LLrv6RoFQ7BQm+hpm1022MYEZn0bJ/3qv6TtC7kBJ45qkX/oaqk92qArVXB97mqh
         K6hESofwUV3tTZTaX8oNmMqbRsnMSYIyXKagV0doq1ESzmAaPn6S+dUvLbldT1njDdkY
         3JEY3ZLqwGaZz0gGoAVCb926rv1c8Tq9Dd8yBPiH4bthCmdFA9knY8YsR/kbaGbHRQ/c
         oocBsfBr6mDjTBmCL5CFgRdBI5KSgQDpZGs97/8yhSavJ+xX0r6Mx8uwdwU+/xeCZl0G
         9MOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789558506; x=1790163306;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+ON5LylyLSRvB3Oy5FN+PptZ1PxOVJXbkytbHhMasY=;
        b=P01aimCe/vHPsJJeOG+ot/b6FTfTbDNEFw3qi+5VqUMpG4cV1AUZXAFNME26gtCkhU
         TeX8iusw4ci1goXSrVaGnwiXC1w8Msamlfnr7zzvVg6Wn4MBy2FkgiPs8VHAasa2gSsO
         KdLBnxv5Yz7a/t99zqSWRUaUK/w1acTqbd3iclnIpmkDHVzQ/1gVUCmRttgfAB6pPwaH
         UwZDgcEMo8Dr/U07W4H567AF8g6sXEsdMM/zNOvttbPLbx/85XsWJQNP0rV23krsDBZq
         q6LxSTXzJu70PH02vRkd2O73kegHBA1tWSwXDVwipCR+sSdLs8r/Y+GBn8ViaRaH3z08
         41yQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSYxY16PSvOl0wzBdSpctYbcaD4mGpdquUUIDcEkJXTILXHStVBhFM6QELwLK6WuzwPQ7+s2j+jT8=@vger.kernel.org
X-Gm-Message-State: AFuF++mSf67PIwpfW46TUKADg2JdBW+jLRWr4+SutXJhwYLAYjKolYk6
	qntgmPpT2WfcrivFwN4iWFcKbVo5GRs1pl7Djw3EXYnPK0Vlen515p5nZoLIZFG3zMQ=
X-Gm-Gg: AYBFou3Pw6iaeIYAdBxLPDB6MjeHcQnr66G7EFmlEg/BB7yym1nWgFlie43O2Bj/oiV
	jDT4e/hHi5p5iJ7orXZhf4LEYnt1mXfrVHafz8BPhJQKH3YprnrLY/wCS+IiUhOOqs0Me9dn0KQ
	WyG8MF8x4bFxLLy/a+k4yUOd/y2NR6u2PvxWQk3g2KsuVPZQfVbXx1CIpp5br1k72OZ/SF3XXKR
	BiEpyaESFVVNNX8vYmPnO3gB+J+/n0wfJvGa0tlHrKmpIc+ZsTL45gJyVWhz0MSFkMQQT4D+yLJ
	nHgdneihws2ariXKc7EV9ILF1yZEFwcBJgML7BoZFVASBtRXkGEsPN9RVpTBnjTVeGBEVnB7mDK
	9TD2qV746fBMkS394ljSskvm6zVJGk8Y/eHKkWL9ncJgd71nRoiCFlAo37aCH+/8mwBnA3QXkIv
	3pE7FKlbo6dInMv+JLFUsOH4sSomLuRaiPgF3OM+8giwOKKEQopiTaehReezc3s0OrrVa+3f7S6
	M4qrSSWTMIipphjGdYUh9M=
X-Received: by 2002:a17:907:d0b:b0:c25:c54d:d1a2 with SMTP id a640c23a62f3a-c29e5236f43mr142950366b.18.1789558506076;
        Wed, 16 Sep 2026 04:35:06 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.116.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de0850ccsm117462366b.8.2026.09.16.04.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 04:35:05 -0700 (PDT)
Message-ID: <92a4b3dd-4661-4a4e-90fd-83249acf0dbe@linaro.org>
Date: Wed, 16 Sep 2026 12:35:04 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 2/5] phy: core: Add phy_get_by_of_node()
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 media-ci@linuxtv.org, robh@kernel.org, linux-clk@vger.kernel.org,
 olteanv@gmail.com
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-2-e2197a3e2551@linaro.org>
 <20260906143127.2B5691F00A3A@smtp.kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260906143127.2B5691F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2026 15:31, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] phy_get_by_of_node() misses the legacy usb-nop-xceiv workaround, causing infinite -EPROBE_DEFER loops.
> --
> 
> commit a021b561c8a9bfb36addca720d49ea935b34a131
> Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> phy: core: Add phy_get_by_of_node()
> 
> This commit introduces phy_get_by_of_node() to allow looking up a phy
> directly by its device node. It refactors the existing lookup logic in
> _of_phy_get() into a new shared helper function called
> _of_phy_get_with_args().
> 
>> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
>> index 89addd732bff3..490a7cde6d40a 100644
>> --- a/drivers/phy/phy-core.c
>> +++ b/drivers/phy/phy-core.c
> [ ... ]
>> @@ -1001,6 +1015,41 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
>>   }
>>   EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
>>   
>> +/**
>> + * phy_get_by_of_node() - lookup and obtain a reference to a phy by device_node
>> + * @np: node containing the phy
>> + *
>> + * Returns the phy associated with the device node or ERR_PTR.
>> + */
>> +struct phy *phy_get_by_of_node(struct device_node *np)
>> +{
>> +	struct of_phandle_args args = { .np = np, .args_count = 0 };
>> +	struct phy *phy;
>> +
>> +	if (!np)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	mutex_lock(&phy_provider_mutex);
>> +
>> +	phy = _of_phy_get_with_args(&args);
> 
> [Severity: Medium]
> Does this new API miss the legacy compatibility check for usb-nop-xceiv?
> 
> In _of_phy_get(), there is a workaround that returns -ENODEV if the
> device is compatible with "usb-nop-xceiv". Because this workaround was
> left in _of_phy_get() rather than being relocated into the shared
> _of_phy_get_with_args() helper, phy_get_by_of_node() bypasses it
> completely.
> 
> Could this cause drivers looking up a "usb-nop-xceiv" node via this new
> API to receive -EPROBE_DEFER instead of -ENODEV, leading to infinite
> probe deferrals and breaking fallback to the usb-phy subsystem?

I don't agree with this.

The compat string workaround should live where it is used, not be pushed 
down into generic layers where it is not.

No media-graph lookup needs this hack.
> 
>> +
>> +	if (IS_ERR(phy))
>> +		goto out_unlock;
>> +
>> +	if (!try_module_get(phy->ops->owner)) {
>> +		phy = ERR_PTR(-EPROBE_DEFER);
>> +		goto out_unlock;
>> +	}
>> +
>> +	get_device(&phy->dev);
>> +
>> +out_unlock:
>> +	mutex_unlock(&phy_provider_mutex);
>> +
>> +	return phy;
>> +}
>> +EXPORT_SYMBOL_GPL(phy_get_by_of_node);
> 

