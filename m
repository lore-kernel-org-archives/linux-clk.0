Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E4C263C9B
	for <linux-clk@vger.kernel.org>; Thu, 13 Mar 2025 09:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741857038; cv=none; b=M6HCmYgac6ZDD8YmlOGei9wnRSCS0KpS3jh9S6tY1Kxcxd5G26TBNhbt3sV14/fJlFs241NtZIFbnLN2JKBaVIGBltSjy+cU1VLk4MLPkIcS4nK/yRUqwgkPb8MrWQSz3ryVJWRuffHx8/XFqqUHDkKpLadQw27kVsdh7RwnJ+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741857038; c=relaxed/simple;
	bh=nZv1gY6ezIhNopCsWK2xFniDLo8vetE0Mgdzt4JQTEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S1TUUfMASwwPXYskglwz/6UbcZg0TirqTXJBJ4b48jx1dJoqmxh4dQDPM9cECCM6hmSd+VBJji+h5tDDA+4xMSGniTCrm82HMSmW09BOAfh5Y3lZKJl0iaOOj42whEmHnrRgYjWxEoqhOnb3vYFb/ALiQKE13PJ58lWeUJPMf2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZY9Cn0Gg; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZY9Cn0Gg"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2963dc379so124793766b.2
        for <linux-clk@vger.kernel.org>; Thu, 13 Mar 2025 02:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741857034; x=1742461834; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QOcPeBvKiZjYkNIOUDpasD383L3JOlEk8FFNMJq4prM=;
        b=ZY9Cn0GgXV0/XgNWanrUm/ARhc/cabcihUDxNLeTRB6i3hAedYxDOXA70A3I7hG9B6
         SFJ2bEn8YJWOvmsNsxAKW8Ao9HhTOJqTwSQ/kVwrNr2/Xv93v37w/Ll5OdBuwWTSCJ7Q
         Qv+Pe6j6XdduD6KgQiQwo/9UIcrR//W3+E6Yk80QmziyjPp6vcg20LGPrGOV+dKzsMDj
         71iz0t5S2fCN7MPlT3l/JQcPL0K0yvgkx17c7udH3Fbj5L9CUimKmPRUh2eniVHbZ5D2
         ZDRwZQaJX6ggP0qVL/hUYMfoMFbApFqM0BrnTHnk8h2gTau5cBYwT1zTXwdI401XatQI
         noGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741857034; x=1742461834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QOcPeBvKiZjYkNIOUDpasD383L3JOlEk8FFNMJq4prM=;
        b=RYpc4B2uVvQJZbb9Eah3s2cv9pGRxEsw3keWj3CVpsNhr5jZN4qm/7EXHVoXauHQbK
         LY6VRrmVJXmV1q5bghgeZR0PYbPAdUzfHFa3RAVtZPnefakLl2xHiMjAEgy5EbCBmZRM
         aldrcozGM1NvS4zJDIGp7aGyPNqg403YKE3LRvtKlwTlpXD/nfTSnsc4xskMAbnkiQrW
         lsnYnsADP6hcHn2eKeYBiWStRWpz6yMFRokSwveCD6N6cQa7qLIw9PX2/f1PGRyk8OiB
         1zYZfUp1AqjguvL9iZNN7ewuJ9CY6cGg1o6V9A+6l+TWGwFqF4gKFtFDjZptwoSw+v51
         pr2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVD7urE7ezZF6ObK96uzDrAD95Xu5+kvxXlJApclp/5GDfYKICZg7Rhl+Myu90sEnmHQ/N5S3zxmp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO72y7YMxelubkhJS8wINokOycw9sZEkZg+g03ZcJg+vuBeP+8
	gyilKEzpfJ+y2pmDwrJKJnVvm5kdOsXeI1iqxyibt02HgngeM4cozTYWFKLy4/8=
X-Gm-Gg: ASbGnctnUWZhryQKcQ09UtyZofN3amY3jvbYrjwTnmemqlpkb/0k++5X1Hs4Y7yBd0l
	R/1O29Q97a7YkqYbc5NJFVW2OVTq/Iz3IjTqshWyzqCGwXRKb24xeG+QpdrSvhL7W+Xr4tECvAE
	etUuo7iAbjJ9Pk2WZFcWMtz1m7LyZAtkvjgi3oUBFbYCwP+4ikf5hIAsYwzZ6bQlECmPT6hkyb4
	DSyVldrH1zBTq6JuqumY8ntIwTLXVhT7NbYsl6PXqEGbi3m1E4dDFR1Gp9WYZZZSNWwq29j+xLL
	+U1VsbDv5q+/3ThHaObcvcYN8u9MDkSs8vXQvUfXHqZu6stP5QXcD4vY1JB86THieluX4+Bxi6Q
	rUxlzbcnMopFtXBbh98+waZxDWOwTO5LTVG1Ke7po9tSV5flvIC2KX+5Ok76h3PiT8ulbiPWQnW
	wAMPOQ08Zlbzu9xfyujUbCiqH0A1BvYJo=
X-Google-Smtp-Source: AGHT+IEtFUT/HyU1XkKnojP30ZgkyrJ7wulvcnYb4MSah+etAKV8hZac0ohkCGy+frqkdqETlqR81g==
X-Received: by 2002:a17:907:831a:b0:abf:645a:df9a with SMTP id a640c23a62f3a-ac2525ad616mr783408666b.10.1741857034541;
        Thu, 13 Mar 2025 02:10:34 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a9d13bsm55663566b.167.2025.03.13.02.10.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 02:10:34 -0700 (PDT)
Message-ID: <93458252-956b-4630-957b-784cac4ca7ad@linaro.org>
Date: Thu, 13 Mar 2025 09:10:32 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
To: Taniya Das <quic_tdas@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
 <59b2553f-adbe-4a92-b7a1-8b388c03ef6b@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <59b2553f-adbe-4a92-b7a1-8b388c03ef6b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/03/2025 04:39, Taniya Das wrote:
> power-domains = <&rpmhpd SM8550_MMCX>,
> 		<&rpmhpd SM8550_MXC>;
> 
> Once the above change is incorporated, please add
> 
> Reviewed-by: Taniya Das<quic_tdas@quicinc.com>

Why does the ordering matter ?

It shouldn't, right ?
