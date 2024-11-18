Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B5738B
	for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2024 13:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731935993; cv=none; b=RV1LbpLc71S7GyVtfUVhd6+R6zpc8pSA1pti+9CT9tTkWTmiLO3FHxx7SBaz+ObzA06+0+TO6utfn5I1+SKb06HZR77TlEAPF12VfWEpb5LKjULZ+6gdqwfLxyonTPdpd5CjmOLa2W1Df7NDehhZlhUKNCJ535Px6NOUjP/zkok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731935993; c=relaxed/simple;
	bh=qIcvMnQC52tYX2G4nuC1xLYq4YJXsKuRnpykYxBGao4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ojD7kjvHWa+7/N6u/lQqHV2n5VLZAp0r/E+cp7zmaKU6fLBmK/oSdvHjibFY5lheDWQywppEsJI0m6JfUMNCke8ehwrPzvez9iOXXUogvr+ztKqVZx99j0vE68O6udNfcWF99ETEX9UwTgvMfoBF9WcAd987EZBtq1PK01XrkfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ljl/nu4x; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ljl/nu4x"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so25266395e9.0
        for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2024 05:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731935990; x=1732540790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VtuhoZhhvCGfOpiXHW8Zu0H3HAEvNd0jDyeLVJ2x+IA=;
        b=ljl/nu4xYvri/da6KZ4ktJ34X41wTAk9TWXo+ZF81EB7S6pRkNBGl7jtW4aW34gWFD
         NRwX3oe511GYwWChLSA1ziA7z4IwCjkpWZWa3cTjDRUk+5DkECCYdQEDtNrvllLp7+Gb
         CqV3/Ve+CS6wsi8t/fqJjDGDr53mrTr+Yk8oeYDcxuu/3LOYSV4OAIpSa9+gu74BbGl4
         eEnwnabWAXiabG+o4znW20xNCpPTGtuHVtuTzhdB2cp6Sl0IF4UMbxOe1Tlzd5Qgea9c
         /7jaMXwx3Pv5yywRhjo5MObD+zryqVy1qJpIt4vdy8Wq1bi+7uxtT+Pb63WTzPvzZr1L
         YNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731935990; x=1732540790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VtuhoZhhvCGfOpiXHW8Zu0H3HAEvNd0jDyeLVJ2x+IA=;
        b=HIkonhZOMz2UA4YI+wU1uDzmR3sQ03EjQeduEOekOLy2sI7qDi8fHqF1mm26gLdWUn
         +js8vamhh9bSxWQC++GFnQspAqPizXXqNvn1E6C73HYsDhQTDysn2VzdiOksY96PBuzd
         nD6hYgchS0rwkl6SauySksDum52d1hM4pCTb6Mo/9hJ+heMnpK6/F7oazv5AYSp3W+GA
         Xrbzph7onjd/9RihioIiGOzHDUIlwGJp6giw5s/Wzp+aTSU29/5fR0wrtDytYfOz+Iml
         0z5EXoavvhnu4gxdjfHBOFNjGTNMvgHy3gaL3KPsug7JUKmp8aCBXn6s5pQHnx3dd3qY
         3ezg==
X-Forwarded-Encrypted: i=1; AJvYcCVbJDhjc8JXJ9oE5txpcveq06LD0ha+eTG6MQr5AMzy8pd3jBH7W/zLuuZcFu8smnyEv+4kOPwzwuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIhRQ5RJ1srZ6U8P1+6MHY8e4HyGYzyyKCI6TLapUppxBVl3PP
	OEFIpzOBnFK6fWSY0JpAx55lEe5p/5ZNa6EZKZpPc6HfLYJDG0/XSR1Om9S8JfI=
X-Google-Smtp-Source: AGHT+IFDU8TL7fVbynwae6++z1FbBZ6NjFadKjdCzvUaCRSPJs4yXj8fLvQOhIgiho5aOHgSoflhyA==
X-Received: by 2002:a05:600c:3d16:b0:42c:bb96:340e with SMTP id 5b1f17b1804b1-432df792c47mr109338535e9.31.1731935990575;
        Mon, 18 Nov 2024 05:19:50 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3822ed2bc9esm9011456f8f.6.2024.11.18.05.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 05:19:49 -0800 (PST)
Message-ID: <45c0950a-0cde-4bb9-9e3d-7f25b8a3da31@linaro.org>
Date: Mon, 18 Nov 2024 13:19:49 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gdsc: Add pm_runtime hooks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-2-b7a2bd82ba37@linaro.org>
 <atg6yw64f4aojcbjyarljb57cejqk56g2qnddrloa3smmupm6d@fk3oyiycnuco>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <atg6yw64f4aojcbjyarljb57cejqk56g2qnddrloa3smmupm6d@fk3oyiycnuco>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2024 13:10, Dmitry Baryshkov wrote:
>> Introduce pm_runtime_get() and pm_runtime_put_sync() on the
>> gdsc_toggle_logic().
>>
>> This allows for the switching of the GDSC on/off to propagate to the parent
>> clock controller and consequently for any list of power-domains powering
>> that controller to be switched on/off.
> What is the end result of this patch? Does it bring up a single PM
> domain or all of them? Or should it be a part of the driver's PM
> callbacks? If the CC has multiple parent PM domains, shouldn't we also
> use some of them as GDSC's parents?

It brings up every PM domain in the list

clock_cc {
     power-domains = <somedomain0>, <another-domain>;
};

No different to what the core code does for a single domain - except we 
can actually turn the PDs off with the pm_runtime_put().
