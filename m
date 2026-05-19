Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98212F7EF5
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 15:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779205581; cv=none; b=WDGuh7/DMT6or0b1rdy+QAFHDCkTiR2mg1WnHU+VgvfrU/xwvaBJZz8RcABiQ3NF83HiXWOq5wUVrL3N2OfHXtvCnvPxyq8EnwDA/pmwVOAHGpOmNIpCdj1qLz8JWE96YXKt5GWoy1dr+vDKIQ84sxlbSPw6Xa/AEmyGm3P8f44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779205581; c=relaxed/simple;
	bh=5T+dGixDG5fmBL/dmq6WzOVfoP6DUYuLr5vjU9kA3wA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fIEYe8O0+i8CkGlVqpBJKzNI+riFLa5r2kAFFTfGMlJne6cXqlgJxTnmyMen+Liad5jgtzvW0iotgDQax9mC6We56Q/+uRRBdvL9z4szzMypiv31NVFVkVTSf9av7qLOFSZRAxe95BpoDMyf6ic8MWZhFKaCwirJnjWz1+J5Bjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P5o5p2/u; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P5o5p2/u"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso27700155e9.1
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 08:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779205578; x=1779810378; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cNEYJ0/3OL6V5KtaRvLweTOXbANv4SgmKSvooy29LIM=;
        b=P5o5p2/us21ERwcjXlCUCV3w2XDJiLvqzH3sMy3g5u0Czyl6cV8Td8hygZfyob/FoR
         wOb6omBvdJiHNXdlyvXkKW8QJ8ud0MwmMbKxmTtHlQWruz7RlIVQ3mybtTIVCB/JzC3k
         dmVpguypTG4gTmIKSshCHQYku/40bKcLmmt/yx0Ozro4uV3ptJhVh75rIzkjVLM7W1S4
         uWR7+w45Z1kQ5hxT0WybTKy3oi3eiVdHGMPcwm0Rtsdq5Ia6RgEXXrjz893+oLUJRlS2
         9gke22KZeRV3V/KAcvri8HyCCre+sTTR4Y3hujiuAPEM/uBlbIspea2JfFfWt2MI2Aj6
         gVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779205578; x=1779810378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cNEYJ0/3OL6V5KtaRvLweTOXbANv4SgmKSvooy29LIM=;
        b=fJ7C4g8+bucbBoSBWRKb8hNBogvqfCUih2YxIk2OndFii5lyOBZPoUqelkYwoJZYEQ
         tSy9yuKctcmnU3PKMM0YfXMoQQ+cNB/ajhneXgSLlCfnOXcy2/w2pLb58cBucFtTJSOI
         /dOXhUkqJOUp+Blu2nG+cdc8n43YLbTSworxK2lBOslMvgJ4CykUIizbYDw/hDqbneHE
         CJAfwOOnKq2U56IO8byVREN/Cg2diiHR9MpaPXMdYZVw/Wdl4UaT6D0KuDPhoIzSc/ns
         bQAOEd9IXuhybOO8G4m4cqZWc2yNtG9+YxQ027OCXp0F2fClnBCqx2T4mrSVt48jILRs
         mHfw==
X-Forwarded-Encrypted: i=1; AFNElJ+OqFI52/R0xos2jlQe6FIXdKJwSa/GZWFk8zDMnJ953Py9AFvaMHwXvTkLhPwgKy93WkAdBrJAKe0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxbEQPUtTdDgK1A1lsoinc9hLSLmumrisoQsXwCqroMesCZnbb
	L/V5kNquRuxHd/PIkJvUF79uSwEDzWJNoEWjKKurhIURnn23SzA+6Mtue9tWb9g96j0=
X-Gm-Gg: Acq92OGBoP/tXNmL/seXARWl5lEMZj5c4see2EGh/sLVSzW57Hxx2ahNm/d9HmbkCyN
	ZK94MzgoS0aLV8aRiJ/++A+D5019SbWIsxIRAdobclGTNT13EhmB8wd+eKE+QfAhN6pfaGB0cme
	DBFyDX0fRk6GljNPwds1J+BNRGMLnU9QA2txLzq52tCOtIRkkFPEonEXBa7SSnM5D11dvpkzT5l
	28S40s2dDEmQmrswwMyKo1Lf2iMlsCqmikUvXsHhw7z5u79AJchii6ILzh/FOLOYV4PMHrOA88d
	NoXpaEQl2cQOg6zcHGyDqgMbkitmyddY+Y6Svzs3synHiVbNZxvFIfPSOp67DMHSktasExEESmT
	UjfK9TbOV9PuQTOr8tJQ3krUt0IrnBkkrzq6HmqxExNRzZ0BvPC/4iVcpVkzlphk2C3UWc7fpy3
	7e6oRy76LytyXaJLrgxFHREjPhEJ5qku0=
X-Received: by 2002:a05:600c:34cc:b0:48e:60a3:220a with SMTP id 5b1f17b1804b1-48fe59af1cemr336906785e9.0.1779205578122;
        Tue, 19 May 2026 08:46:18 -0700 (PDT)
Received: from [10.11.12.109] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4862209sm333119405e9.0.2026.05.19.08.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 08:46:17 -0700 (PDT)
Message-ID: <73f18a2c-e729-45d7-9376-7c0e60ed35c7@linaro.org>
Date: Tue, 19 May 2026 18:46:14 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 peter.griffin@linaro.org, jyescas@google.com, kernel-team@android.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
 <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
 <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
 <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
 <a55690fc-7727-401d-9b3c-06bf3c2852d0@linaro.org>
 <DILRJBWU9SKV.2P7EJN7ECEJB7@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DILRJBWU9SKV.2P7EJN7ECEJB7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Alexey,

On 5/18/26 2:24 PM, Alexey Klimov wrote:
> Thinking further about this I'd humbly suggest that even
> 
> 	if (fw_err >= 0)
> 		return 0;
> 
> 	pr_debug_ratelimited("ACPM tmu call returned: %x\n", fw_err);
> 	or pr_debug(...);
> 
> 	if (fw_err == -1)
> 		return -EACCES;
> 
> some debug message would do.
> Perhaps we need some convertation, for instance as it is done in scmi
> code (scmi_to_linux_errno(), scmi_linux_errmap[]). But I don't have any
> data for mapping acpm errors to some human meanings.

I did that for the pmic helpers. I don't need any debug prints for
gs101 TMU as I have clear instructions from firmware: 0 for success,
-1 for error.

You may update it for e850 later on if you need it.

Cheers,
ta
