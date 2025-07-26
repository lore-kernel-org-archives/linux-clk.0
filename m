Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C911DE2D8
	for <linux-clk@vger.kernel.org>; Sat, 26 Jul 2025 18:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753552817; cv=none; b=qH9qbvlKm5qJI0Gzk71ts0HZzlj2Juv8NHL68OE3gYqGuLV6mxzDEujQpDlmG7/mEFwaIh2CZpPXWOIgnOtKF4bZyPGT/Htxto3FVYfofdpZZJv8kdVui9XeHjp/UMxE/WSJYdhNSPzjGOoEQFbFhQhinGcvpEUSDt30oXm2xV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753552817; c=relaxed/simple;
	bh=yvcRHhXuYyD4nYec3hWl6gxmG7DKCLk6OOfx+dctTQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GAgphfavGfkS5vH+Dty/SVjW4JW+GVC4qMgV/SwPb9404wmffTmdRFTpoNpSYIMwIRZj6eOYKQjAY9Odm/IdI2QU3a/wzPQZ+725pOSDY7xDj1qbx9S9xaRduj1i3+XCB5EaHdcISUdSqwh04n4MRSBbrQPyhAI1iSrtLmBcGFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=tus2HBMB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="tus2HBMB"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d6ade159so22360715e9.1
        for <linux-clk@vger.kernel.org>; Sat, 26 Jul 2025 11:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1753552812; x=1754157612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yvcRHhXuYyD4nYec3hWl6gxmG7DKCLk6OOfx+dctTQc=;
        b=tus2HBMBku01iiKI2US7H3d6MuUDuJXPlnWVF4b9XTSfkBEN7cd40NSgzoPxnui+6E
         UMNJPS0XXg2arKHV6k9EYYlND/acVc4P/egn0osh7B4GGu9prtc+d0bFPs8mOuWG+Hr2
         +cSpzaSi+vUX2UegoMuP2ZNug1qa51hki7qjJt1hgqJ1Mhm8DRLgP8qRu4j4hkpTw6jZ
         yi8XvjA/COj9p1SWeTSKzwiWo/yoZLzvKbr9C53Azu50s1ygM3Vx+VkIWpELvXjoBYVO
         ZBQfeNsWJhU8npsFtRipiwBToAr8i1Oo58lQjuL11/93lsegF9XlbQ08J50S1GZoDtVg
         CdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753552812; x=1754157612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yvcRHhXuYyD4nYec3hWl6gxmG7DKCLk6OOfx+dctTQc=;
        b=OlxK38AGeP1aGU0nzYUWd+1i/w2h6EJ358QdhzmUUlYeLzqLLs/2jpmHuGYbWndFNu
         7KWsRThLPUdY9kcn7PXf/Ha1lIfhYsDhf7JquSyXMoPTP686tG1eMy+Q+PbQecGq1H1Z
         3Yd/y9yHCYmvvZmPKjcrwMwwY+z7pjwTIN61HioW4Uw+3hE6gTACRMe6ViP0Yk2bm3Px
         FndyadCi8J8TpK/cSIWDZFmQX8TwIE6ShqryHJRoPcXqFzq2z8egXLPSgV+hJyaz28jN
         8jFKejvy1gC01VoS+O6W7gGc5REQ/ZlRqjvm6Q7G83gb87sq8QxILQYrf/iLiH5ZtkiR
         rYwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUybI3It0x1w80pLsk273CWnMjt0Pv+2piKETv/3e7jv7Tgc4OB0PDdaEkL/po7KDN+H+v4gthynE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAqs9fePBHVlER/qyPCpIUtspMGPoIvYiXrXzzML5WSsfA0O7n
	pm9YpM5X4FopMS4dpMN0BGUe8XKQ4cb3EGrXJbzmmS3f+aWfif6vc+xO4Z/IGnAg6GQ=
X-Gm-Gg: ASbGncvBDAk0hGGi7EHAqbRjbAWq2nfcSXl9ayC+KOeWSDPEmsV38YANutKZ4GB9Xs/
	VL7i1LxeIgnhNg/vQjmrYa9SkKzaKidt6wbK0Kb7zTOM1LjjSALz/mBwDAe7SdRg7I+OyfjpduO
	j6xt8BSCczdOtLyl7B+7KyHvP6Aqng/8Yc667Z12P/sGkpU7tT5DoV06HvZJV8JnfzrI0AUhCei
	FmRkdtLVzkxwaAW/8+k68cg8fHwtZ/Xso2owsv7gRKYHs4ll3mfVRL/5WIWuzWmZFW7YTxNAd31
	UP4OaVFBc/acX1cZ7Kj/7xY8b8k/4XegF8sMkhtDzRUyBwaapuXP0zgy7fO04rekOFz6hcxmDsC
	c3b6g/Zy9Q7ptJX9bC6chpaEejns6yswb8hgi5W6XEccvWJVS9f0mgDKiPq8Jbu8nyWzMN07m+g
	LU+cPWIIxr30h0
X-Google-Smtp-Source: AGHT+IEflhfEaAlph6QytLsmeVZzt9JsNjEPC6m2JqYaPbPelQ7eBKZoO5O6AvlWzFTa4x0V7hT1Cw==
X-Received: by 2002:a05:600c:3514:b0:456:27a4:50ad with SMTP id 5b1f17b1804b1-4587667a7b4mr43141945e9.33.1753552812037;
        Sat, 26 Jul 2025 11:00:12 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:49d0:43d5:5891:26ac? ([2a02:1807:2a00:3400:49d0:43d5:5891:26ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587ac58045sm37621935e9.22.2025.07.26.11.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Jul 2025 11:00:11 -0700 (PDT)
Message-ID: <a9acf284-d55c-4c8e-9f34-c2feb26a446b@hammernet.be>
Date: Sat, 26 Jul 2025 20:00:10 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: spacemit: fix resource leak in
 spacemit_ccu_reset_register
To: Alex Elder <elder@ieee.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, sboyd@kernel.org,
 dlan@gentoo.org
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250723132504.66273-1-hendrik.hamerlinck@hammernet.be>
 <ed5fcfec-6330-46e8-a302-5cf1d8b3a9ce@wanadoo.fr>
 <d968eb77-50f2-4d28-a57a-112c87dff8bf@ieee.org>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <d968eb77-50f2-4d28-a57a-112c87dff8bf@ieee.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/26/25 14:57, Alex Elder wrote:
> On 7/26/25 4:16 AM, Christophe JAILLET wrote:
>> Le 23/07/2025 à 15:25, Hendrik Hamerlinck a écrit :
>>> The function spacemit_ccu_reset_register() allocates memory for an
>>> auxiliary device. If auxiliary_device_add() fails, it skips cleanup of
>>> these resources, resulting in leaks.
>>>
>>> Fix this by using the appropriate error handling path.
>>>
>>> Fixes: 988543522ebd ("clk: spacemit: set up reset auxiliary devices")
>>> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
>>> Reviewed-by: Yixun Lan <dlan@gentoo.org>
>>> ---
>>> Changes in v2:
>>> - Properly place the Fixes tip.
>>> ---
>>>   drivers/clk/spacemit/ccu-k1.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu- k1.c
>>> index 65e6de030717..5bb85e32c6cf 100644
>>> --- a/drivers/clk/spacemit/ccu-k1.c
>>> +++ b/drivers/clk/spacemit/ccu-k1.c
>>> @@ -1059,7 +1059,7 @@ static int spacemit_ccu_reset_register(struct device *dev,
>>>       ret = auxiliary_device_add(adev);
>>>       if (ret) {
>>>           auxiliary_device_uninit(adev);
>>> -        return ret;
>>> +        goto err_free_aux_id;
>>>       }
>>>       return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
>>
>>
>> Hi,
>>
>> I'm not sure this is correct.
>
> I'm sure this patch is incorrect, and the original code did
> not have the stated problem.  Thank you for calling attention
> to this Christophe.
>
> Stephen, could you please revert your commit of this patch?
>
> Thank you.
>
>                     -Alex
>
My apologies, I am terribly sorry for this mistake. I was convinced that
this was a leak but was not thorough enough in checking it.

Thank you for catching this issue in time. I will make sure to be more
careful in the future. Sorry for your troubles on this.

Kind regards,
Hendrik

