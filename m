Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B73313AA2B
	for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 20:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729627522; cv=none; b=LUmATZ9xBFTzdDumpEARu2T7TpaEWGFRtYozcV7sTNWpFDKN9+t+QfLg0u/WcrnB4IiqCZybT5ZGe+eJ7vAvSSxSEJhqRaxxI6Qsys8SSuyoVR8aLpyJHmKUeAZNWomT98pc0sHVK45vdMDfkIpG2Ae31rayvSC4+zBpwhjhNFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729627522; c=relaxed/simple;
	bh=GCQKkAcKnKgTmO8vzB/rzEp/s6XYcF7aWEgqZG2TBVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BCcr/xp3mtlq0rSNKoU337yIC0rT6HadSiS0prkIGSWbOT+x5FNroiYFiItHBwIcbJf7ApHGNNZnnlNWIHHUJo9O1Ojer3MjX5OMwcnEwNuaOaSDD0FK7sAJ9TUzfFOZv0T7ZBwJP8//2uyMxaBd519UCOhaSasSScDosvjRH0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UeBTpfdj; arc=none smtp.client-ip=209.85.160.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UeBTpfdj"
Received: by mail-qt1-f195.google.com with SMTP id d75a77b69052e-4609967ab7eso45855551cf.3
        for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 13:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729627520; x=1730232320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MYlTQY+c/X9dLwV0V+RnLsCbwqJ22zjaYU7d2BFIH64=;
        b=UeBTpfdj0O64DNgjGPks4fAjKd9wi+wDIb2vmTK3d1KBKmf1UZCH8SaBZwTf8eSTrQ
         +A9loBwZYrQiwv3XwF5vc8ezXf9DvLufAqzVXzaEwBOvFUzbM4NVfrf4ylXCjnxiwkpm
         y9AJ3ST5o8+mmt6xlkNv6e4pt56JxCFrU3aTnIEtLdJWrk0xwU9F7bzI589iT5ktAUGr
         oK4Oz8JI56lr8ZVGM2Qrp+cB+StiI4vz6xryjkBdf+pskruaGzQBwRHgAfllVO9GAZA2
         Yr5gsJ49GGowxTpeS0PQNF36FM0fgqSPxHzxeU+9xOOv0N+Cuk1Y73bJGHMMhPAk4+Lm
         enfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729627520; x=1730232320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MYlTQY+c/X9dLwV0V+RnLsCbwqJ22zjaYU7d2BFIH64=;
        b=umgTiocEKZp/SwlwoLiOPet5EWVkIPYyRwDwW0ppkpt4pB8tUWT1UOMR1vkNdKnsDU
         WGRWKnXyMv9R4Obpabnca0N6fHbh++i9pQmgxa/Emo8/CC3nvU9kKYCTMnDEZ5GIso3q
         p2fc/CK874WfJcAygetyzW5EF1wD1OcZE4k/mUPKLsbbdZ8mY59rcKGEKxWmdhFNm1QJ
         fygdxH5XCqxlShgwoWB8Bpxa2x5H2JOW621UI5dSz8KCRetDTK7E7+9PSw3FFDLChvC+
         6ym2SgfML0gM6J5Hs4F6m+g76RwIHNT0cJH6bG1Hywpz2yAoJ8gq3gKhoOaDsMbZ7Alt
         aFgg==
X-Forwarded-Encrypted: i=1; AJvYcCVJUAjmGpJnhywMFCAkjNYlmSnfsB/AFbNciv3g6eDFajglANLbXgA0JHglMVaCvr0pMAKPDT3GeOk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLASWGLqt4SW9PDHwu8tM+J6Uu4HmCV0jsEW3MND1Pn39uJ5Hh
	OTNJLYNXdQqivnv5B0qw31CcWwZh5wxbBuxis39Fned1U3QSXq6x
X-Google-Smtp-Source: AGHT+IGcAjlEQMQ+VVA/LUBeffn51xDNHL2/rVY0PWb8IhKE7quJTJdNsYyvV8WWTKPa0iw5ixkP4w==
X-Received: by 2002:ac8:5fc2:0:b0:460:8f81:8c9a with SMTP id d75a77b69052e-4611472865amr1187851cf.60.1729627520179;
        Tue, 22 Oct 2024 13:05:20 -0700 (PDT)
Received: from [10.194.139.248] (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-460d3cc6d6esm33430791cf.55.2024.10.22.13.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 13:05:19 -0700 (PDT)
Message-ID: <b950ad31-b5da-409e-a7a4-441368cec7ba@gmail.com>
Date: Tue, 22 Oct 2024 15:05:19 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: sophgo: Cast an operand to u64 to prevent
 potential unsigned long overflow on 32-bit machine in
 sg2042_pll_recalc_rate()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, unicorn_wang@outlook.com,
 inochiama@outlook.com, nathan@kernel.org, linux-clk@vger.kernel.org,
 zzjas98@gmail.com, chenyuan0y@gmail.com
References: <20241022195500.8805-1-zichenxie0106@gmail.com>
 <2bdfbba1-544a-4bd7-9b51-e239540c86df@stanley.mountain>
Content-Language: en-US
From: Zichen Xie <zichenxie0106@gmail.com>
In-Reply-To: <2bdfbba1-544a-4bd7-9b51-e239540c86df@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2024/10/22 15:01, Dan Carpenter wrote:
> On Tue, Oct 22, 2024 at 02:55:01PM -0500, Gax-c wrote:
>> From: Zichen Xie <zichenxie0106@gmail.com>
>>
>> This was found by a static analyzer.
>> There may be a potential integer overflow issue in
>> sg2042_pll_recalc_rate(). numerator is defined as u64 while
>> parent_rate is defined as unsigned long and ctrl_table.fbdiv
>> is defined as unsigned int. On 32-bit machine, the result of
>> the calculation will be limited to "u32" without correct casting.
>> Integer overflow may occur on high-performance systems.
> Fine.
>
>> For the same reason, adding a cast to denominator could be better.
>> So, we recommend adding an extra cast to prevent potential
>> integer overflow.
> I wish you had removed this or said that "We recommended that we cast
> the denominator as well but Dan Carpenter said that it was a max of
> 3087 and was not even vaguely close to the 4 billion mark needed to
> overflow a u32  ;)".


Sorry, I forgot that.

I will fix it and send another patch.

Thank you very much!


Best,

Zichen


>
>> Fixes: 48cf7e01386e ("clk: sophgo: Add SG2042 clock driver")
>> Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
>> ---
>> v2: modified patch to numerator casting only.
> Otherwise, looks good.
>
> regards,
> dan carpenter
>
>
