Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA8476026
	for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 13:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717161797; cv=none; b=XbsPBRoSWzOoPzPNCLvnhgOt7XVNgdXoFN8o8wTTDQpceKeHU1nvdhN+f5oMFv8oxyCiuB2Dy1y0vgW1r26dye38HJhVCHfDvDhlePStWc0dGCNZ55WZ2ccGVsP7khqmSQV4PCAZh2RLQQKVj7aL8BSx6KrawRqEsRI5Gni62I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717161797; c=relaxed/simple;
	bh=8r9CDem7Kd8oF4q6YPYnMih7jmdP9hI2Js+nDr9y/g8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i9jPZoCu20qt3rOGNOihkVCKAlW7Q48UptFmGUNSVrBLTmGIdt3BCowdz3yiI3jHqBWOl+yI0am3qwvQmVIGY9TkqZpl5uBz8N1RO0pPh4Mu9F1P1kvGSPFJE9e+xXLUbfc1N+p1jLdQZvybeF7kGW59IRLifsGjLe6FPxhpNpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RcKIUPxC; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RcKIUPxC"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a635a74e0deso236487566b.0
        for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 06:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717161793; x=1717766593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=STix1dJXVxMghu73EX9zT2PylPHwrWELMf06LOWBhdA=;
        b=RcKIUPxCkr1CxHnMuKwUpR2ktcnRcOz35x2EUGJekvxzO4m+fzlg+Haeu3Y0hVjVbk
         oOgGIZDsWH4m6A3RlmPCJbQwmEvR22A/rfR4R91TvywhIhHfdKJSfIfoIBmwowLV19/P
         4YR9iat0x8D8THInDm0GPklZHTjLN1eFw/3ByaBAbbnGCLZhaRaDGlKLQUPurqpFGN6f
         nLcfKEXhlXO/d/OVUoplYEo5m2GRGFli2cdqW5Lvg87JxyzOTbBtJI0VS6S3wrGHnemA
         xDSTkmgnEerOGQcPaK6d3Z7vy4TRiQGmyN4p0pE7mywvISdD+2zzQTvsZFhl4ozVKCef
         l4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717161793; x=1717766593;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STix1dJXVxMghu73EX9zT2PylPHwrWELMf06LOWBhdA=;
        b=NcqW2ZpTsJ8/ukTVQqciMxE3EpIMeDmcd6L/6wSAc7aaM1JDNvqpnciLcwMeK92jv6
         7jUD2tWZgGt/rjuqz+MxJTJ8ExF0GyP3L2WWUKczIiiTld+5Yr3yxLMYjqi1ulZ6KVUq
         IBrqrTCFQBRFIA6ex1xv7xFcCiCyqVYH73qeCU1J1ff4E7gRPZKhUTevZ1RKFs/Kgr8y
         DcZWnP8hV+X1O/+ZjmCFgcZTqzDeR8xip8lIVGIUOlGrnX84vv39p6VcO6endiPEZPiU
         qONmSum4y9pbLiEZXUgzQ+enSfTjB7gSiHNyUuEObg847jjuXs+itsO1u1LJzo3gNsQm
         rhgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9QtuUHKTjYMPQ36FOfmwoZHLKmR9MOEuWi9i2C/Fl6rcuUgleARgLRu9XAcMHd9IdvOWd4zaDbfCLdgyjjoTXwlDWHrb95zWk
X-Gm-Message-State: AOJu0YwQxr8y+PlavWaBfTBlpBCfezGKN+2KUgsai3cV62y3q/A8/YQi
	xNrCB0dl7Ir8myQRTDKZBfmmYAWii4QPdMeWj43LYU0o/wHUefTAGR2ROMN7cS0=
X-Google-Smtp-Source: AGHT+IG6w9uC4RvKnKHCYwm6+Kwf0FjnMWOFoz/JqPbc7RNwGHUYQ4UZVR8hrtC+oxY7ezKmnlw3JQ==
X-Received: by 2002:a17:906:4e87:b0:a66:d1a1:f92f with SMTP id a640c23a62f3a-a681fe4e434mr147770666b.14.1717161793038;
        Fri, 31 May 2024 06:23:13 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67ea67b506sm86629966b.98.2024.05.31.06.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 06:23:12 -0700 (PDT)
Message-ID: <2fd8bcea-8bea-48ea-8052-d7fe6c1e8f59@linaro.org>
Date: Fri, 31 May 2024 15:23:09 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] clk: qcom: gpucc-sa8775p: Park RCG's clk source at
 XO during disable
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, quic_jkona@quicinc.com,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-6-quic_tdas@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240531090249.10293-6-quic_tdas@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.05.2024 11:02 AM, Taniya Das wrote:
> The RCG's clk src has to be parked at XO while disabling as per the
> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
> Also gpu_cc_cb_clk is recommended to be kept always ON, hence use
> clk_branch2_aon_ops to keep the clock always ON.
> 
> Fixes: 0afa16afc36d ("clk: qcom: add the GPUCC driver for sa8775p")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

Should the same fixes apply to 8350?

Konrad
