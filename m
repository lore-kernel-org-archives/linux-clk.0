Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261770;
	b=dynWVvd/eCl/VtImgK18766c0z+5AOd7DlbJq8mrYv+7ZY+zhdnSXRlf6IK3JTZzidER
	 I8Wfj0W3B2RhPGUMlZOmbcBM8XBAfEAMQsKa6/6sUcyiuOrnX1RBRjcXT4YzV6PVG5Eft
	 Cjh63tgL/9zrl4TDDtLEsVGLusoseYGD6dxEE0J3WkNprzpccZtbQXgkX/2jmZWKxlFEA
	 OfD8Qpe981NM6Nef9gV6M/ukdUpWUk+NeRn8GkbtjacZOXlloxGdF3+IfD05Gcod2P2u5
	 TrGTyI+Q7LIEFTJgH//TWS0gJF6wIhOg85sdmTIlqd0Sk1XixrR0iRFHvGBOJYCRj5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yKwHsBgWsnYwW2gL1FVzWYClyycwT4ewUl/GuVtdUlo=;
	b=C5qv3EUDqtiQ7QjnHefDzxEYhB3hjIPmnxKayQwS61TQMOaJp4303tF6Zkx9oIPyNMrb
	 Y8bUU1J8eYlGmEBBKGUtor6PvVeMXYrOoNB3S4kVy/OkzjQNHzMk1irnVBiu6KdMPQVX5
	 WDB4po6rPyCsOxoX67jMEsflXx+hIiTKtG+clI6g6HGbND+wBHMbrp7K9E53WO4/Zb87D
	 C3DMK7h6V+XwjIa+rJ93LnQafsaQk+jzBi4r3YqVbETKOB9W7njE80rwCGsHd2WmnquCE
	 oy3kg8ObzyOV7AZbSyJPX9poiIxyj9qNF1NjiSNkt/yn/yWmg/aNxdUVzNLgJ4L6m5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DhVm3V42;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58193606A32E
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 08:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58193606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DhVm3V42
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso15838315e9.3
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 01:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793261769; x=1793866569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yKwHsBgWsnYwW2gL1FVzWYClyycwT4ewUl/GuVtdUlo=;
        b=DhVm3V425hO9R9e8v+hQASAIDN4E8dzPnfNKYpbAAL7Ry3mgMhwOniEIFT/py07BqQ
         m0ZtiB5OLL4rCQR/ufb209Q+iGKxHsBvmZRFAmMnCJ5h6lpT2E89H/76AVFv/bp4350y
         EqXighxV5+Hx9qgc092i46RZDp2oBfhcbgksBYsmdBLOxLCoMKK1rdFeuyUQNSg5kq34
         vnap7Z8XnXGepqbO7ixR+t5k9vJ9+rf5FAcT+TzoIYSobtYBU7fLvkepEouzWVO6WL7m
         UItEvzDA+2I9Ee269dKArN11nkinerJ2Ij/Rkztimsx4mnBO/aH/KyU6UU7LHUb6ZohN
         4Rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261769; x=1793866569;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKwHsBgWsnYwW2gL1FVzWYClyycwT4ewUl/GuVtdUlo=;
        b=M9Dc8/0a5JrpWxdNQmkX4zj/40aQYWdol09uop5tjflHMp2XQarK9wFx8YIbaMfX9L
         kjLYCnbURI9VI6HxquQkHijhP+r7C0Mgl7Ja9DYvildVYT9cDmEczcBPTJG10eycWAxD
         fyULtSQXvZlA23FnuDoQbptpTCTk/OZ9KMhj0N9TCKBpdxzUwQe0K0PkBdOmWA5iKPG8
         zhXtWjv5Ohjto2fNQ/k8rBmILOGu5ee1bKmKpWJd93gtNVuyJBTp4MFyLea6Il7cIbOv
         2fgDNTWxfo4pGDOS5hNh9KfnvEVebB7ZlStMfmb+dlP2rGObq2Cd6HAAZ6AzpbyCzMu1
         /TtA==
X-Forwarded-Encrypted: i=1; AKwUvBxpXY0DEwELmtid1WTU2ZtI3r/l415IGR/4yIgmOMS/agVVdQlpmaQ1NNQQB9Zs2nsC/F8vcTMmvC0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJj7uPzTsAa6P5o3nuxq73VmwaYLwFhUJWq09V68Gd9c22tsybY
	UoEem3kL91JGJT7YaXkVmPRUwUO10fIyzwZcVUtecNbwK/gAxUWIF6oF
X-Gm-Gg: AYBFou1z5ogBK6YW3GbBN7fnPRqXxJQ8dwP3rTD4TI7h8uRuwKW+5UIxx4buanFepuV
	+DvYRcgRTV0aQzCvjrEyh5w/m7M+7EjTFwQUv77Mn2naiduSQZzrW9qVn+q9BWf+HzODccNkxXl
	k41lOJyNc5tQ2ayUoLZLJE+ct30RQvg/IKBXVUW9MUdVGhMe133AIjdHVEOVGkuBiSkGUAMIhQ5
	3ZiH0VjEyUuq71pbSeNzfrvnnqiiBUt1iFX0i31ru5IiFgKrQQTBb5kKSSN/NE/ewfmInYhkPNs
	7r4q91AED2kZI+3YTy/DNyg5vykDBzcrq/DB/BwgF3bN+dLNrF5fSfFloKLKdbR9FXkvHg1hiqS
	tOpWXabnW0tKMVL3uMdmMHo4LBI4kRxIMzPs5Fpp74K7VE42mW1C0crPg0Y66LaYHL246lI21U/
	XeKmJqCyQmXSdNOyr3i3Srz9Wy5UM0dnHKHIC5NSG84jizzTSMvO7yljZjIKynIz764SjoWHhH+
	tSP5bfwlZRAK6ggzdE2aD3aTDnYmIwEjZu9Q+2nEXAYbMIsvHghLWaKMpzdMhYwLn+60BWUXC/U
	4sWVpjm2dGlFuT10vWrx2ZcYJk8psmdM0d4Q8JcQFgEyFqf9gQy6vhvmqgbxNQL1t3GL
X-Received: by 2002:a05:600d:8496:20b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a9b1434621mr59499955e9.33.1793261768411;
        Thu, 29 Oct 2026 01:16:08 -0700 (PDT)
Received: from [192.168.20.170] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05e4e4sm70001885e9.3.2026.10.29.01.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:16:07 -0700 (PDT)
Message-ID: <974845a6-16bf-41ad-932b-244112b85cae@gmail.com>
Date: Thu, 29 Oct 2026 09:16:05 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: rcg2: validate frequency table entry in
 __clk_rcg2_shared_set_rate()
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261027-rcg2-avoid-null-ptr-deref-v1-1-43c21b54cfeb@gmail.com>
 <d0492d0f-42a5-4400-80d0-987086d7d224@oss.qualcomm.com>
Content-Language: hu
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <d0492d0f-42a5-4400-80d0-987086d7d224@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2026. 10. 27. 19:24 keltezéssel, Taniya Das írta:
> 
> 
> On 10/27/2026 11:35 PM, Gabor Juhos wrote:
>> Commit aec8c0e28ce4 ("clk: qcom: rcg2: add clk_rcg2_shared_floor_ops")
>> removed validating of the frequency table entry pointer returned by the
>> qcom_find_freq() or the qcom_find_freq_floor() functions.
>>
>> Since both functions can return NULL and the pointer is passed directly
>> to the __clk_rcg2_configure() function where it gets dereferenced
>> unconditionally, it could cause a panic.
>>
>> Restore the sanity check removed by the mentioned commit in order to avoid
>> a possible NULL pointer dereference.
>>
>> Compile tested only.
>>
>> Fixes: aec8c0e28ce4 ("clk: qcom: rcg2: add clk_rcg2_shared_floor_ops")
>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
>> ---
>>  drivers/clk/qcom/clk-rcg2.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
>> index d7914e59129f..260e90f53461 100644
>> --- a/drivers/clk/qcom/clk-rcg2.c
>> +++ b/drivers/clk/qcom/clk-rcg2.c
>> @@ -1385,6 +1385,9 @@ static int __clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
>>  		return -EINVAL;
>>  	}
>>  
>> +	if (!f)
>> +		return -EINVAL;
>> +
> 
> Normally, the CCF calls .determine_rate before .set_rate. The floor
> determination helper already rejects a request below the lowest supported
>  frequency:
> 
>  ```c
>    if (!f)
>       return -EINVAL;
>  ```
> 
> So an ordinary clk_set_rate() request below the table minimum should
> fail during rate determination and typically not reach
>  __clk_rcg2_shared_set_rate().
> 
> 

Thank you for the explanation, it makes sense.
In this case, we don't need the patch.

Regards,
Gabor

