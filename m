Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143AD1292D8
	for <linux-clk@vger.kernel.org>; Tue, 30 Apr 2024 10:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714471471; cv=none; b=hA7NzQRCDKV7rGEdJu3BulRuibQBqpNHNf44eUXyA1cshvfeiKFuxXpDwAOKF4rj41rb/T6kIDF//Z1kQXWlZ+PHXpkMROP5tM8gSae+AfZg/pMpBJfXaTQxdWn5hRK4k3Ha33upp7WjyBO1eCxA1AIueGdr/HbJf9VujNqDJeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714471471; c=relaxed/simple;
	bh=70tjl/t+y31qBGGxj67RCvNPYFeKBlJU8GQtLI9F0wg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h96Nv/2rv61lN4fh+L50p+eFCTQe/fZfSv7Uk1y/85uLxR/q7HDOjsllM4PhdT6v+nLJJl2nWzl7aUxF4E0gMiz1uJdjpyjGDzkgjTxkA9mA+nmwMbFjiZ0f1RjR9oajuogLkiwQDLMyUaiSgv+Z3Z1O1nMkIkX9UMUD9hjcSko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PkR/kM3S; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PkR/kM3S"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2df848f9325so41923611fa.1
        for <linux-clk@vger.kernel.org>; Tue, 30 Apr 2024 03:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714471468; x=1715076268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oNbpOQ1a+q3TAWw2QizynJeLtbghbQgetkDUAr5pKuk=;
        b=PkR/kM3SlDj6xASP4byVDtejWVkzg620PGEJ65MRfGll8T9KIzTgVPFuIx1WHoffja
         0mp2sr/TIrXCEgJvZPUvoRIUTutd+vqnMbj62Tb5mY/HJnS9S8/W1h+SqbBcH/3NsDwj
         LIuF6zApi7sV5ZHETvPp95u/zKgeKyUSsWBPoDN2clyOlAi0Qnw/AUfSla7wJuItnB5Z
         7uIBeePCLhkHH/1KF81beUD/U5U1PNEmIiBtWa5/yNA7j7X6xfQPuBfK2LlDtDt+KUa3
         4rSPmyBcL/d8a1t/WWd8UploOUe1Ed+n1jhCdLCY++cGsY2FsJVyyFxwzRLlMSvEBZoh
         dEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714471468; x=1715076268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oNbpOQ1a+q3TAWw2QizynJeLtbghbQgetkDUAr5pKuk=;
        b=kBhK9INqnDBp/fInFfVgjHRusCsaFtm/j4Zr6crYe8RF6GRiaLrQnUvBDICF6Hyspf
         /+gF9RgGO4DjRf/lpe8NNwIpp/ARqJaTl9DHsGvh7Qauqg13Kp9ZZmXhXK4XkN+SY90z
         Yq/n9ugyllrOiHYeTPsbkEd0Fr4Nut2Ni7DTXKCWwnkWkFc3Jk6KCJSSQQlkSsVxU13q
         a10d59+3D72PIfAU4MXHy4Z4Isybt+uWTr6ztCujsePva9Ks3UDH+4Sjf+HzaPUvh6EZ
         LtkPLTZVQJPYY7hRaM8ztotZ8wUJLRGxSz8XSNg8tGJW9CBXG9eQ39/A96n1HMGDzxPT
         E8qg==
X-Forwarded-Encrypted: i=1; AJvYcCXBNvWlrInmqFtJaeaYiPXj5Q3gqpJWC/PIL3LEajT7tSY5t4jS7+nYda4ugKAMQSDQ0unrDVcpm1x34VqaUBWEnp3GWfmA+Fsb
X-Gm-Message-State: AOJu0YwLLuBfIzjMdMd1figoooh+eHsZQrsJnVBc+HmingRyYveHZpCt
	FCrhXLQ9z/tNs52Zw1UkxBCM+3C23M1yYxFnzCFxAZmhGs8cQZ4UE5rBTmXKFkg=
X-Google-Smtp-Source: AGHT+IEj6F4+pDMUd+ckim8PxDLKUD1EKTYKgEo7xSovwiNNKQuznC4XWB6mZTLCr0hYG/6wU6NYhw==
X-Received: by 2002:a2e:b891:0:b0:2da:d2b8:ffb0 with SMTP id r17-20020a2eb891000000b002dad2b8ffb0mr11004144ljp.41.1714471468257;
        Tue, 30 Apr 2024 03:04:28 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id bd20-20020a05600c1f1400b0041bdb409fa1sm12156306wmb.21.2024.04.30.03.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 03:04:27 -0700 (PDT)
Message-ID: <e2aea885-99d5-4aa3-beb0-4dfb80553d6a@linaro.org>
Date: Tue, 30 Apr 2024 11:04:27 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: qcom: mmcc-msm8998: fix venus clock issue
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marc Gonzalez <mgonzalez@freebox.fr>, Bjorn Andersson
 <andersson@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: MSM <linux-arm-msm@vger.kernel.org>, linux-clk
 <linux-clk@vger.kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
References: <ff4e2e34-a677-4c39-8c29-83655c5512ae@freebox.fr>
 <171424646121.1448451.7219465997551736348.b4-ty@kernel.org>
 <c595791a-bf36-481d-a2f5-aa99ec28a4b7@freebox.fr>
 <1bbd5175-31a3-4c4c-b2b6-6ee7c65bb17f@linaro.org>
 <312d3cbd-852e-4b93-8bef-c78827712f56@linaro.org>
 <557bd418-0e37-44b1-b622-3c824a6a7553@linaro.org>
 <b4bd6bb1-b1c3-482c-9140-24c8f9f14bff@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <b4bd6bb1-b1c3-482c-9140-24c8f9f14bff@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/2024 11:00, Konrad Dybcio wrote:
> ??????????
> 
> That's what the kernel is trying to do as part of the cleanup.. Either
> this clock is always-on or held through some hardware vote. Or the status
> bit is wrong.
> 
> Just leave it be.
> 
> Konrad

That's not different to what I just said but, thanks for restating it.

---
bod
