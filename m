Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A209114012
	for <linux-clk@vger.kernel.org>; Tue,  6 Feb 2024 19:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707246366; cv=none; b=lXw1juj4JUiX4t8F0pZjjKFQZwbppluAZtq+Xk0dBw2/jHOOJ13EQZlI1y1htGuf1C0qTEPdpuRqV8t5Y5XvQeNlil++W7QpQgBvpKBJpNG2+0z7D9Wts4nyrfcDxaShv5/Axt29IPt1A+CEW18oI/TLMzmCMxEwQ8QoeNQP1Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707246366; c=relaxed/simple;
	bh=tQtPI1JXT2lSd0eHCcuLa5vyUr+VtJSlf1amUbPv+f8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=swMC8ikYXqEbacGLNPBsYas49tLC7ZextRzrg5LzKcmKjZ4XPmBjWP4JWADmpCKByS9FmH3whOWed4xP6/tYZHMqxaoy9rNHptqX7ZbNcG/7q3KIc0S5Wh0kOYsn3XaemFPpdKLtPeg0KvGrT4/4UzIeNL6jadAtoumel0FLzw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G3POmxMw; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G3POmxMw"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a26f73732c5so847873766b.3
        for <linux-clk@vger.kernel.org>; Tue, 06 Feb 2024 11:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707246363; x=1707851163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RV6eqNzFkwY0CGHnRyn79KJNqJ7QC+xzcl3OGIdKqs8=;
        b=G3POmxMwHTdZxAWsHFSyuTw+Rl2dncEJwEfaRVzuw18B+Iz9WyR0gNM181X4P1jXnp
         DDoMkndtw8rR88UReDlYNNy2GuFtWBudV2ie2XZ9wGdtc2qrqlsKMJIhmO1NZXbGRC0o
         XGCWg9ooyjpvh9BGBzCpjMkuX8gsI2LJ12DKwJHzHOv+WXTNVCW0jJxVSInBHgFAGhgl
         xi90LKXQcg94dUL9xzq5DQc26D1kASJpoSbkZwzeobQAwXglsdxeersI1Lv0OH09tLBB
         D6rWguKmJ0og7IC4VaItwuaCWkjoJxzyVuA6Pde/NrswkNHoj4te8EQ1aiBqRVigu1e3
         bztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707246363; x=1707851163;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RV6eqNzFkwY0CGHnRyn79KJNqJ7QC+xzcl3OGIdKqs8=;
        b=flmD67+GJOTYvKFB1WXxaO8kAIpjlVl79XWjhfEYjzO2D4HB1kPsVlICNA8ZqxZ5YO
         z6opJgVQNGwCYRca7xUuOcyDsmei7qtLrgykegEeum95TmouvERjMIpf2tUfGDiU3yb/
         apqHbqKtj/Ub4b8Np8zXVFU/XWkboXLLHXt6zTkTRSZ/145W7/TWTV2WGg1KDXHSwrqp
         3bEn7Ag2hcARFGTz/uS/A99YyD4sKBvRvYw/BpIP9hDCfYWwaUFaypR5ODMGL3tr84Bz
         Ht2R7V3So39WCKUHvMAZygGaKKLTBBo3dlkUiaXgJwhC0ImWySb0ajoXli2AzNBvhWlA
         cePQ==
X-Gm-Message-State: AOJu0YykCCqep78rIZYO7R8iwAuU3sJbVhUbingPGFqU+KXJlVowkcwg
	LmhzGSY9Zt2/azxgXZZ8Je7k8e8FVXrX8hTeC4o9+aorWyvGrSNSOYg+iVKJpeI=
X-Google-Smtp-Source: AGHT+IEnfM3EC2xLFKxt4qoMF9bSLyRtBztjI7P30wgetixPKcE3Pey66voI1gM1sM0E5dpfxoP9qw==
X-Received: by 2002:a17:907:3a4a:b0:a38:4cdf:adf6 with SMTP id fc10-20020a1709073a4a00b00a384cdfadf6mr754953ejc.23.1707246363032;
        Tue, 06 Feb 2024 11:06:03 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVsY4fbZWuqOwvlaIbUwXkFTh0aXPlaT8Mrbj/EV1IvoNf6DuhhKYeeLTYdSZWB1UVdXU1IfgEQIoFTB6vsuMWWt4n+oxJFfbU3Ul0II6eXJnBRN5elouFnawFqpoEziZzhR4EiqFsMm9pRNfIgMHTqW9WvFNNp5+PWzQpf3EhQ32L/0Ju39Rob94Ftflkg1QyvfeQ9tCUsyPO/ClbhFbgHCg==
Received: from [192.168.192.207] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id h16-20020a17090619d000b00a385535a02asm224018ejd.171.2024.02.06.11.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 11:06:01 -0800 (PST)
Message-ID: <eba80a3d-6beb-4867-9a62-949af11edf3c@linaro.org>
Date: Tue, 6 Feb 2024 20:06:00 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: dispcc-*: switch to module_platform_driver
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20240206-clk-module-platform-driver-v1-0-db799bd2feeb@linaro.org>
 <20240206-clk-module-platform-driver-v1-2-db799bd2feeb@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240206-clk-module-platform-driver-v1-2-db799bd2feeb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6.02.2024 16:25, Dmitry Baryshkov wrote:
> There is no need to register display clock controllers during subsys init
> calls. Use module_platform_driver() instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
