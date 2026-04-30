Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8E71482E8
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 13:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777554240; cv=none; b=VimRLmAvVcCT3a6DMVm4TNECuZu8/OF5QfMifiEvtKq4A8ZKpS0ANpBuU3fFVLAlGDBKGneyvh5lhur1SbvY8MReas/IXojzz056G1mNjDKCMydyfljRWoRWuUxt6735Y+hW1Swqp80cMq+X3GWR36G6gyM35J+F1oo1baSZZ9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777554240; c=relaxed/simple;
	bh=OnPJ4Y7ZhNXKSRaGQfqeI1Wn6feDuKjt7CixvnuHVn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N4fq2XVgQBcj8y4OpEkt7uk9ZkRYHMRROnNvZ6JPx1R14V34MlypYTeaJKBL/F4+Qh9xmRc5Eq+duAEer49d0+dp7cHq8T6kc0j0Vq23GglFe4MKoXZJl4iGOBWpnDqyz1bZy/wI/6/WJMuboyIiafeOsppLwD4sod2ze8WeZgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hAYsSPOQ; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hAYsSPOQ"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38dda82b601so222271fa.1
        for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 06:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777554237; x=1778159037; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3NaV3QelK6BDnitYhWyC3c/XebfQ4XHG3/KpvqPAI4=;
        b=hAYsSPOQf/Uvr3sP1/DxbSJGEGCixDFIKhbxKRs8q316o3fzRQH9iTKNLC91lbnLK8
         4JEhwAVZKKYkWdm13rCUM9f20QS0INZxl43085xxyUlBtPNHmNARkoP6VLSGJ7oH1w5C
         7YNBpV3i4NwLXRudcHf1mhXCofqjXUfqaJHxusku6E5fLlF3cDfHN4Tj0nv062vs0ugu
         EznOees6WF6pjuEHP+E7B+TdcYpZNe0+R5F+/yWH6evcdbCJ4+uXqVmqOC1g9A7wmhdC
         DAbvURs7aA4weoI/CXFcnNyWGcWs9OUErV7jYemxIoLxIIJYJI3P0A3UgIQjLMV+BOAn
         nQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777554237; x=1778159037;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P3NaV3QelK6BDnitYhWyC3c/XebfQ4XHG3/KpvqPAI4=;
        b=Jrjf5vtfSWHRbRnW9LXRowGJbQvikA1m3/G1M3cxDBOXZGIqPfjTqFhpBW4OYNKm2O
         YSfPONfw5Hgxt/CKITAE98lXu+6oXKRuUP00RMMKC2Xe9hzVL619WPFWNXHBvYb5eHmi
         mcqjIMVA+dlQc6W91U/0FYAEjObhp//HbfNNS4NmBgd+z4nBGHCKMiqVtW8qbSHoD4IV
         G3ATCwpXjK9Bi9c7cQmo7dvak3yBxm0/wbTlhRJVTuveYmlTwfYXLiDeB+1WV4tNcEF1
         JBYh2NzIvmsZWRmryKNtRT1YFVBSzGRBSQzk3mlIVwkWzFWwVcECv8v9l1JErXpKUz7v
         dcBg==
X-Forwarded-Encrypted: i=1; AFNElJ/Qvw8XMdhK6byHwz8EQ+0Zgqr5240tv8Fa9627h2xU7h2lenHs6J9DN5+mT/grF1lHT8I2BJbMbG0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXTdDP8bJUyPn82DKsXrYXbuF+x7AOHgC7V3SeLOOwMhDTjymt
	VvwZCF/6NkxANfHSGi0WXThUN+vBQLGRFyWGDkpyjw/U+TklyvFpbhNvsjyWlNIFIBk=
X-Gm-Gg: AeBDiev2qHl3eT7GM4+7m2aLppBMCMYMEs5i2IZ7fzU9zs7m2F+Kubkl0VlY29K9Zj7
	hxF3Z5IYqqF8UP+yvUQSCuLRet/zid9e8aQNOGKYn1LCwIX7jG4ovRbU1BpEJGC8nVXWfnH77Zy
	BSQoRsFAiCvxXfG+2G1usdei82woLiX2t5qKnDOXsn59jhWsQjUK9tSgr47+ZoEe5bVB1GlfqeZ
	yKMB5vDblJqPjETVOztIEMJEJqUQEV7CgDd/dSyx2Xsg8+Dp4iqL5LVWU/Wt4vbUgAT3IesDFx7
	GTxK8KFfH+9QCA8Cr8P7gMxyp2VruE1J5LEcjUQVJiXBwZ57zH40YFMNijof95L83HnWNsydtpU
	/UVUIPhJK+lBVKq4tnandNaqqVqJZzia3r1e4QJRgvQGYBVdfbQysvO5NEdZ7RPwKFKLm0cDSRB
	IzS1/7DMARNQCe6WTGXrYhBjgRSWLzufXjBKET1lYuCgki1bup4dhEkCSRIx6MerAW3bwWo0l4E
	aUHneVvieFRHx7O
X-Received: by 2002:a2e:a806:0:b0:386:5df3:8195 with SMTP id 38308e7fff4ca-3934e221e17mr3591971fa.6.1777554236594;
        Thu, 30 Apr 2026 06:03:56 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3934fbd8072sm5397201fa.32.2026.04.30.06.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 06:03:56 -0700 (PDT)
Message-ID: <a0a9fb8d-c109-4120-8780-8f9c21027b89@linaro.org>
Date: Thu, 30 Apr 2026 16:03:55 +0300
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260429170859.247165-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/26 20:09, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
> are already treated by common.c code as pointers to const, so constify
> few remaining pieces.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Constify also nw_gcc_nord_critical_cbcrs (Sashiko)
> 2. Add rb tag
> ---
>   drivers/clk/qcom/gcc-nord.c     | 2 +-
>   drivers/clk/qcom/gpucc-sm8750.c | 4 ++--
>   drivers/clk/qcom/negcc-nord.c   | 2 +-
>   drivers/clk/qcom/nwgcc-nord.c   | 4 ++--
>   drivers/clk/qcom/segcc-nord.c   | 2 +-
>   5 files changed, 7 insertions(+), 7 deletions(-)

What's about constifying video_cc_sm8550_driver_data from videocc-sm8550.c?

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
