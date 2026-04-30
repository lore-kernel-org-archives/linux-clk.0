Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704254279E6
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 14:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777559810; cv=none; b=D7XsjlN8di8QqTfk4y/i7x+vaJ4H5wmZRfEs7eVP/bR4B1KpxykVoAB8BR2i/xbcmvtww3OSD8l6qQgx3OlijIjdViMfq8OSViKVYVA8QiGrsIAo1GxR7X+Wz28tDa3aFe2fey7V5VyBAJH9XOlHX8fLMzOZkMk/o+60Myf+xzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777559810; c=relaxed/simple;
	bh=q4KFS0fUCLAoDRvlQFqZ9THrM4lzkFXcoKZvVvkflbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WgAciXNinEqVHGG5yykg7SjW6wIWJWK1f4SM27mJyl1Tq2gO058pSBbjc7DMNmXXO6KIuBra5w3NuoBrJR2SycSgzpJWPqqwNA0mXK1erPI6xIU9oc5wzUDhq7ovHxq5k/idb7/qUHvACeJ3oKt/PDxMwa9BGqiPi4UR5W3qVb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PSbIpxIv; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PSbIpxIv"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a2c0615d6fso121993e87.2
        for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 07:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777559807; x=1778164607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AASJG66/zuamirWxKBfOYrG2p46fQckg6evU2EmKX+4=;
        b=PSbIpxIvXqoLMkTe8bkOr1b7U09reLGSJuNquHJeSJQND339hHSDny477vbDYB0ZBH
         6CV6oBlcE0CaMPfbXHEY59bw66X2KwYNXc9KEntUVrUnrSD9/iTbXDtl4RhvQLBSnFx2
         erYY3YO6ojqYm8pVxGjDBrUFxmunOiD3tVjWawIS0oDrI2AUzhKj8H/am8NTh9YQM/Ov
         gcrVIH/31veckBRIxDgnzTnCtFjBom1gH6M3ssMSsMG02bxUxC6x3qWjY0n0VYIDC9in
         sIPBDX1KQvsVlId+2WHJHOZho8rjePGUYhh4sMSuDpTRpGV2UWjRkufMEOg9KKAa40+O
         R1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777559807; x=1778164607;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AASJG66/zuamirWxKBfOYrG2p46fQckg6evU2EmKX+4=;
        b=FYUAtHQC1+LDPjkk30CkJ3PueinhwNYHHelyfvqpKyjMtVMgWR5YWe/1Kqjk/BeyQc
         SD+uiZ2ePyUbWi4N7oM5mB8hNyjhC3HvV7ZHwEbzT0icqsPGdriO0vejfd4uvjfyzkgy
         mxGdLBKBxBTpF1T87ReLEfreq1255gSQLMpaVKGQk3kIPMeJAmoDS1BYeokPp3rE0350
         mndn6+/s4xrR3KKnmhdLp/Rhb0gTRVyAAb0K31Nq74fXisFDpVq0Rjc6zsK+VGvAcESz
         2ZXMaaZqdWMfMQCCm1WQD8klVdA9luGmRn1eGzvgr4dqek3vm+Hp/07LRkNCNvV4GCT8
         wx6Q==
X-Forwarded-Encrypted: i=1; AFNElJ97+Q32VVkiYTK4aLovWlEhxCm/C/DOLJNwG/EN05HgL0MJjQlVcQYgbqaUhejgmDtl84KTFVjl2D8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh8ONDQA37+yz6dS74NfO9Nakq6ZFd7O78fHIuMgQjxOgFy16o
	Shv0H6N0dMcM20va3OYKYTe2Ij4rS12raL6CAaE1aUFlkGIRuzsn9WUgkcqAYQ8NgEo=
X-Gm-Gg: AeBDiev3I4no6CYfngym9Y8nch6FX3AICeWb2yH+24NmGWBDUOky7OUk9y/vvxOKai+
	5bPl1Qfcxqeioufb1xPX7DRbsi4blo96Ti0NeOsEsJfPf4XZSTqk1YRu9+otOONB7zCR9A6zMwm
	2vHrz+i1RPPna1R6lKyHpsTm8FmaS5uAVeLjz3t0S7sacLhdapV196ZGVFOIkOqYR5R/vYjq+Uf
	81COq4ifOh5vDN3+MAexwJQcWW7fSkP6MAe9xSAit/9KkbxmwHfVqTY+cXym0LSXyHtLrvmKNAV
	Epsg69QSr5UzyoYhxxPlib2g/HqBzEcW7MPR+wgGxdnddYIdWSP/o1Cp6p/c1BBe6uSNuWUFZRH
	l4iMphWDH5YJtCGWvhISt6xy3oixArDPp2qmvaFS7IY6hoGNRilDkki1Js9BNC71FEq4Ql11fUa
	MhAtiZXH/rVwoPun0DkN59bIQj1bXn9ovok/khFxL+cDc781g0lLMJ8CFqsusNp2HnSOPX2CUGo
	MjZYGNyyH2pVzTI
X-Received: by 2002:a05:6512:3d1f:b0:5a4:f0:c4c4 with SMTP id 2adb3069b0e04-5a8522dbb44mr488645e87.7.1777559806540;
        Thu, 30 Apr 2026 07:36:46 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74a756c8fsm1460216e87.38.2026.04.30.07.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 07:36:46 -0700 (PDT)
Message-ID: <c2ef2e56-c8ec-417e-9771-f2e6746aa201@linaro.org>
Date: Thu, 30 Apr 2026 17:36:45 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: Constify qcom_cc_driver_data and list of
 critical CBCR registers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260429170859.247165-2-krzysztof.kozlowski@oss.qualcomm.com>
 <a0a9fb8d-c109-4120-8780-8f9c21027b89@linaro.org>
 <828d2935-e881-443f-b0e7-eb68466ecd30@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <828d2935-e881-443f-b0e7-eb68466ecd30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/30/26 17:05, Krzysztof Kozlowski wrote:
> On 30/04/2026 15:03, Vladimir Zapolskiy wrote:
>> On 4/29/26 20:09, Krzysztof Kozlowski wrote:
>>> The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
>>> are already treated by common.c code as pointers to const, so constify
>>> few remaining pieces.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>
>>> ---
>>>
>>> Changes in v2:
>>> 1. Constify also nw_gcc_nord_critical_cbcrs (Sashiko)
>>> 2. Add rb tag
>>> ---
>>>    drivers/clk/qcom/gcc-nord.c     | 2 +-
>>>    drivers/clk/qcom/gpucc-sm8750.c | 4 ++--
>>>    drivers/clk/qcom/negcc-nord.c   | 2 +-
>>>    drivers/clk/qcom/nwgcc-nord.c   | 4 ++--
>>>    drivers/clk/qcom/segcc-nord.c   | 2 +-
>>>    5 files changed, 7 insertions(+), 7 deletions(-)
>>
>> What's about constifying video_cc_sm8550_driver_data from videocc-sm8550.c?
> 
> 
> It's on my exception list, not sure what would be the benefit in practice.
> 

The benefit is just the same as the one described in the commit message,
having such a peculiar exception left makes the commit message statement
"constify few remaining pieces" imprecise, and if it's done deliberately,
then it should be explained why it's done so in the commit message.

-- 
Best wishes,
Vladimir
