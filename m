Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D14F154BF0
	for <linux-clk@vger.kernel.org>; Tue, 19 Nov 2024 09:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732009573; cv=none; b=Crzsp7wLbwSN4U8qcGFdE33GcvdKoheBlhxGfR1kiUGNUA88d0tsAeWAgMoG627TJnYF7yybmNafGMpP7Z8tRh1//l5S4SAJr3vmzpZMGTkyjBqbImvEUZM11oRUMLfZkauPDacO4oh4i1ihMAcd6thD3i+V+WoeQ7DOdPvnw38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732009573; c=relaxed/simple;
	bh=ve4mTfja6XZIEAPB66fNc2JLJByQxXnjYLnW16rs0uo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LN4PwhGXWMF1s/nFoEKaaCyl1Vh5uWytZV7gp4ENIyDWUEDHaA6oGbkVxLYU2VptCsENQm5Jmavv0Krp+e2JsUxdDlwcCc4IGTmaXVdB2pTfPdWRiyiFK1CEkZ3HDiqwnI8If2o8UZ71ACeXo/TcYnhZDmdr1rRdtb6ulGUhxYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D3jEhbYT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D3jEhbYT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4314b316495so34202035e9.2
        for <linux-clk@vger.kernel.org>; Tue, 19 Nov 2024 01:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732009570; x=1732614370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uW/Lrt7vQtMqvBoYmRgnoHpbirDah5r4yqywUagnRFg=;
        b=D3jEhbYTRrh8F90tSFroNByt1iwlpr6C7frhjAL77UvKSozWW1bbEJPN8fV00CyxS9
         oD7k9hf1Pp78AWdS0uhmO7X5E+uyJgKB+oAzpW5I4mKGPSpyQSS6ySQo0RBixmeTElci
         KxdQJPPK0BrXk90ZVhT29TEbqZoHODxTLT1wL3HXJ5poxyFGHtjIEIqgq14wBR1/eyUT
         W4+FwVSsLi8Am14lGMd/72+xNMFXdqQHjIKjH38lPuHsYraeiW3kgBSZ9UtjD4FPQQJS
         fSE9aAKzxCTZr4G7k25PdU3kmi9sAMyILBksecHXFnH3aDchrqpRxNfqDeFk2zMTTy5R
         YkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732009570; x=1732614370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uW/Lrt7vQtMqvBoYmRgnoHpbirDah5r4yqywUagnRFg=;
        b=lltlrcqnIpW6kAa6PD3+GvB9sRwAklFp5/6dBlmu6tmxiKF4sOSCeTw4jutZa9b5Bo
         y4pRlseNHLcs7KZS/ru+JoqfeHgLS54OqjxmFIOmmlS3hJ4r4xe0KUl6pXOyPz5TCtYP
         J+46gVuMnOJrotg38D+AnUtwOZrnhcHNKs1r4Xu+PwsTI/vn6l8E0KXSdpYCncJBcVV5
         rV0xdKtkvG9ZrX4fUXwF2b478a8b2/jry149lxNN0DhnKwkgAvX7koYmC5+vMB73wnIK
         HocL4u7bNCyssN644gnCw/KyvRpbwZE3Q6HIgohV5ePGTF9s/qE0v+5zIap9vlZCDWhq
         kAJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNT/WIH9iOiTDraY8keXN1uJ2//KvD5jw9m+2FNRPW1Dcr+aO3w4RPsN9T2ioX7zx0aiR1jzOkz7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeVyRarmr+yidk2yMYLOnJ4lX8WTXT3abZPITVCP+H9TwQX6vV
	mV4E0DkqDLJN+DqBCkywIIQSPzei49qewXo8+FwxA20FIN/x7AqottnYsyk/Cl4=
X-Google-Smtp-Source: AGHT+IG7ogy4qzTkt9UfxSsrDtJHiZVKufG5KQETrDc6UaR8utEe0hQYbj3RdkOsqApJp3Nvq6UZSA==
X-Received: by 2002:a05:600c:1d9e:b0:431:5ce4:bcf0 with SMTP id 5b1f17b1804b1-432df74d88bmr147004725e9.15.1732009569697;
        Tue, 19 Nov 2024 01:46:09 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab721d7sm190627805e9.9.2024.11.19.01.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 01:46:09 -0800 (PST)
Message-ID: <bad60452-41b3-42fb-acba-5b7226226d2d@linaro.org>
Date: Tue, 19 Nov 2024 09:46:08 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] clk: qcom: Add support for multiple power-domains for
 a clock controller.
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <1898ad2e-a6ea-43ef-af1a-25229b4771db@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1898ad2e-a6ea-43ef-af1a-25229b4771db@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2024 06:08, Taniya Das wrote:
> 
> Bryan, as we were already in discussion with Bjorn to post the patches 
> which take care of Multi GDSC and PLL requirements, I would request to 
> kindly hold this series posting. I am in the final discussions with 
> Bjorn to handle it gracefully to post the series.

Is this not 'graceful' ?

Hmm. What specifically don't you like about this series ?

---
bod
