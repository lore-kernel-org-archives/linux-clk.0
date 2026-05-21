Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2E913A3F7
	for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 14:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374991; cv=none; b=EdDY5xvddmCb+N4ff5HKeJMtTedf9aY+RUh6C/cw+RB+tVr6TdwdEevxVB8Ko+P4o63mC84W/C8zRlanArzpY5XC6fFs6aPntoA7xJDLC2Z1B1HMB939gCy9xRM9euqkZAAJ1pp7uic5SSfLcQWIdiiQ+dkh/JaX3YJ1DdwH/0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374991; c=relaxed/simple;
	bh=kHfW1tkeDqd0FB9koVmxfMJiTZ+rQNUC9ZCer8vMg4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C0n1I8Ju8sWLGOOqRh3ltAaQV3w9SAi+8J/Aw56E8vZ3HrjaW0D4kGvEkADN3aQT0DtP1WpWKL+sBx+nweIdwAGJN5iydNDUNX6GCPlqgXXDItEWebVVF71mmlH7rFZvaCRiAJGCVb/AtSl9Qdjpfy/JD1sG/VW6RqPfEgCRavE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zwYi+evs; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zwYi+evs"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so8038615e9.2
        for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 07:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779374988; x=1779979788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kHfW1tkeDqd0FB9koVmxfMJiTZ+rQNUC9ZCer8vMg4o=;
        b=zwYi+evsFyK43tb9HzHTSVntN44q1OnTQayutfzV+wb4Y8ri7IPaZjYbyRchbwO26W
         2dgAkL3l+uotciSKXUxP2wcaVxvJLC/AdkoUmqlZgAl8hyScxwQ6UNreVkdnyDh8oWu5
         cDToEJyPDZbwnEIGJ5LLlMD6giVf6ZTzVUFSJ1Yrd729vbGixIwUrWvdHB68QubCxGMS
         Pc+TC80jhuRXTJVkuKR6VmOG5K8mstXm5cLU4KNkqzsXYvRVLbyOK0NPkt5zDP5Ba+gL
         UsaRtuEv79JnF8taC/IDJUjzCuNWYfvg6T28K4tm1xb+GyFG9HkAbELuQqgmKcfPZ8rP
         pBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374988; x=1779979788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHfW1tkeDqd0FB9koVmxfMJiTZ+rQNUC9ZCer8vMg4o=;
        b=mtrI0FB9aeFKnrUJIt6SaabOpZCF+EFB02rxdk/8KMRPIHbr9tfPv8UTOygpEVyB9f
         dRF2kZ37mwyrC15/21+QFb5lSBGGzWhN73pmokqNhH6Lpn9bsOm4uVNjMKsGngrhvd6F
         VKXggTPlPUkR7dlZNgboxtXy0/6vdXJNcXSGuEYWHRNHZlQMaCKWdZNrZUGfDXbeTkN4
         2zDN3jEnxiAqwe5mALRtHLJvn3aLRIYHwIXsme/YlwvAgJeAxhEPpzs1OH6y4yF+w2a1
         c1H/jzkmrg5rSoWHJDvXMCcwdooO63B2sEiMp+wdraOkBIfgnqNlN9yj1T1zGzB5p/qc
         NIIw==
X-Forwarded-Encrypted: i=1; AFNElJ+kl16WyzXG/fU/N05JJRsnXfWNOBIKt+Xo3J5O+tU8TtcJpXiIsacdammydewmOzXzuhAIYlEHVxY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp+8qHuOdJRWPdBlGmu6e1bu2SJEVoMAtgfoW9e5dTWRdroOCo
	Vq3HtVStVmF6vsrqr9rgG3tnppPAccUCfIR6fX7NhRCPxMA2iY4pmYz7O8W0JX3E3pk=
X-Gm-Gg: Acq92OGkgJ+iTK0uf2RdSZO2ik3wfDo2a2k9Hl45na4lsvyyULwqEtzb9cB8/NsUurx
	t3ByagBDzAGfeErpWG3AT0Zk/1HRpKoatBPqU1kc8Gfo486LR6hAI6/bg0Qjwv/23HGjBqrt8Zv
	/vrF0RiQ/B75AP1JivkpetzBgqeN9ZgDd3lTXkmnRpe+fjzmOnZkVqQPiO1bLfusNQThM1P7UtP
	Mj7U5JCXcsdLEEcn6IQS2BDOxwvH/x+Bq4HY2sG1leUoX4Lk+kxmQ/ZOZGXGHIu4j02xDSnkozh
	sh7ApE6vm199e+O9Z8mtoWegqmhK8QPcHt75T32CYNVt9rAG4wxs2Z48mPOtnNjN6QuUnUPhKAW
	Ylya0tKwK6VZndMWCmmsfvzupLrDuhs6JXYP7hk2DKmGHWtgBSngVlheh81Z8/Eqq30fyedWnxR
	5ISase4PjSF75Yj6pULP22DCT+WgwDsCA=
X-Received: by 2002:a05:600c:3b26:b0:48a:5821:5ffc with SMTP id 5b1f17b1804b1-49036033499mr48409275e9.2.1779374988282;
        Thu, 21 May 2026 07:49:48 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c6766fsm35082475e9.2.2026.05.21.07.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 07:49:47 -0700 (PDT)
Message-ID: <b061d100-c0dd-467d-8289-be2c0935791b@linaro.org>
Date: Thu, 21 May 2026 17:49:44 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] firmware: samsung: acpm: Add TMU protocol support
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 jyescas@google.com, kernel-team@android.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
 <20260506-acpm-tmu-helpers-v1-5-a9cd5daf8355@linaro.org>
 <DIBOWQYHOPOU.3PCLCL8030WRL@linaro.org>
 <806da86b-45b7-43cc-b364-97bade8f4041@linaro.org>
 <DIFVKM72KZDI.14EVGUMQ0NV9S@linaro.org>
 <a55690fc-7727-401d-9b3c-06bf3c2852d0@linaro.org>
 <DILRJBWU9SKV.2P7EJN7ECEJB7@linaro.org>
 <73f18a2c-e729-45d7-9376-7c0e60ed35c7@linaro.org>
 <DINT2DFDVWFX.BGTG7LOC91RH@linaro.org>
 <CADrjBPqiooFC9o56bOAg-j7908ssPtrzff1reNe6eXmu7hcA=w@mail.gmail.com>
 <DIOE94AX265Y.4QU8ZF520FUV@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DIOE94AX265Y.4QU8ZF520FUV@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Alexey,

On 5/21/26 4:37 PM, Alexey Klimov wrote:
> Peter, I agree we shouldn't bother about hypothetical SoCs. However,

It's standard kernel philosophy to not add code that __might__ be useful
later. Please consider adding that print when you submit support for
e850.

Cheers,
ta
