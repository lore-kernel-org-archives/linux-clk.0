Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA8F192B79
	for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2024 13:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731937639; cv=none; b=Mi7E8zpNiMuLHCsvZbRQj4sKqUmOZ9uVsI1gngvMrOA35vOAhl4GgY6Fkv+qsQ5Dt6i1nZ/luF3OyX0Y8SGr7Tz5d0+jAawKAdCWAW9ittq4JK4EJBZU6LOVoIMtd/8k6rUFayU2Y1AiWv1i/F0eB32bUF1xRp5BmALqt5tYVzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731937639; c=relaxed/simple;
	bh=pJxl4rQZejyfJm+QNm/dBeQozxmiMKPzYEx1qY12VVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vjt/aHJ2ia2+CVHX+eTmRn2IplSrtNz30FIZxKMWVtAMmj52VQy0ITVwYngo1/96tdIhSKp2jUTXkA9FSqZADv3LSUfN2yWoqRuhjlFjygapTI6VEk7VLYCK/gqZqx0hqHaHZZcfp63MjlMu3YSVG3Q7jD268slk5Rfaf4P1JOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fDHEkSQq; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fDHEkSQq"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-431ac30d379so36859735e9.1
        for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2024 05:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731937636; x=1732542436; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s8NgQOCCqPqf7FHd7BM4LXvTtZURwEU3Cj8EytucMjA=;
        b=fDHEkSQqen5NcYUF5LL0TKURcC/drB2TuJlKJg5wMhCqe/ETcTc4NSA+NC96J3h9xJ
         A5y16q1MAnXTnGRGaDeDB+BdEWBrpvtZkrR/Il9WbJGOQXa/BrWL3obbRAraFlP1vrJ9
         N03K5G2Cy+BgdVevNEfQY8oXGSj7w1/+0cFBvNuz5yVANwSIgr5Si1v872nD8pCojKFT
         nPpFVzykUOmtIizIQUMee3+ODvQA36ADxpBtwU2/u9bSwkI8dMZXj+r499zIJccpjisN
         MeriaipxNx+4ey20pXv6roAt+H7fogpb0pTEtOrXWY9Ay9zh7aCRkEE4jd169+zgFxNI
         mO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731937636; x=1732542436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s8NgQOCCqPqf7FHd7BM4LXvTtZURwEU3Cj8EytucMjA=;
        b=VtbD/1RMhFJTQmW/vykfFMesCVARlZX5DE1hx09wA5c1UxK20XxD7EeHvQ6Rwn0YDC
         IVPfoDCkDQI2q/zyU6K18TM/3hOeFiK3B6Sp+pX3ZgGpQNfVGnuRYls5enE1HgPjIhYd
         GKUMAKPZ/V6oumxmcPOe25zYpkQQJri+9d684pDKX+Z9xqEe+5poZuHRVcSpGA/N6E1q
         /Sr8LD0gM/Yqi0rt2YxNXPEgFcZJ3VWcyiw4+LsnVfr4RadFrznTBNOVj8dupbEu0e6+
         eleUf+dfKnqS3Mk1WczYAgCepZRDTjfr0ja5z+AopzkYHkHOU1xHImbjfeNXCvig2o91
         ugoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0l0QX6qh8pUKecOox4X96MNHgLz0+AeK8AbqtbX1BjONTkL0BkJj7NSPB7E79PQ3xvoUEx9N6IvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YweJu9sKwlGm/i1rDlwrBrmbhmkE4FJ1v7Byr788+NcezMsAEM0
	R+3xqx8+snrlWIQN5YhFp26xSruYLNkAX9Oh6JuZmPL64jMdv85jUi4YOucAeac=
X-Google-Smtp-Source: AGHT+IGkNPMfEbTsWdumFk18TzboywRqef3yKH0bCK2BXh5ptB4CLaWCTXz64qGRHLnn74CknlpZng==
X-Received: by 2002:a05:600c:1387:b0:42c:b45d:4a7b with SMTP id 5b1f17b1804b1-432df78a971mr103770975e9.25.1731937636216;
        Mon, 18 Nov 2024 05:47:16 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab80ad9sm154398355e9.25.2024.11.18.05.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 05:47:15 -0800 (PST)
Message-ID: <d80e23bf-3e13-43af-9bc8-fa6bd4a86248@linaro.org>
Date: Mon, 18 Nov 2024 13:47:15 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gdsc: Add pm_runtime hooks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-2-b7a2bd82ba37@linaro.org>
 <atg6yw64f4aojcbjyarljb57cejqk56g2qnddrloa3smmupm6d@fk3oyiycnuco>
 <45c0950a-0cde-4bb9-9e3d-7f25b8a3da31@linaro.org>
 <5lg7rsndxrcogrwywlciek4fdfejnpmvuibpwhh33whg2ebtlt@jli5g3qliota>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <5lg7rsndxrcogrwywlciek4fdfejnpmvuibpwhh33whg2ebtlt@jli5g3qliota>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2024 13:39, Dmitry Baryshkov wrote:
>> It brings up every PM domain in the list
>>
>> clock_cc {
>>      power-domains = <somedomain0>, <another-domain>;
>> };
>>
>> No different to what the core code does for a single domain - except we can
>> actually turn the PDs off with the pm_runtime_put().
> I see. I missed the device link part of the dev_pm_domain_attach_list().
> 
> Just to check, have you checked that this provides no splats in
> lockdep-enabled kernels?

No, I haven't.

I'll have a look at that now. I did test on sc8280xp though.

I'll get back to you on lockdep.

---
bod
