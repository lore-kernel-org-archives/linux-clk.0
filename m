Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A20747B43A
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 11:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845490; cv=none; b=pLy7zhzQptc6GkjGYajQulpF596xK99Vnnr7o+2tqc1JpoEKiPAonPKV6BXRZvcbCsD2DffZG88PZtpfrk2NZoz00ox+Tek12t2J9fNigWwKJkOJdSyhxquQoQA834XzS4U4mghN5UZQ7Vf+RRXaRAOd5MiO4J9tZCS3rieuQvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845490; c=relaxed/simple;
	bh=WLJ6KLbUaNlC1TZvkbe2NdC8+gAoHQknRt61X23e5Rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UsxNJoFkJttKKeoPtCOxs7cKuSm4bQwEZr+oSIFGl0l9Y4RcEcBf1u+WnQNDx09c8VM27vjhfx79IMqvtriZr2pcvbwFzbl3pWwDrvM9m7SUFXI6c7cxPYCwqnKFqxvL+nOgCpF1N2egwJpUZY+Bkngk7y2GVz2ElUGxI0B8umk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qi2KzeL9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qi2KzeL9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so150001005e9.2
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 04:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778845487; x=1779450287; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VKGnF5CC4ETtaEpeIaTcRgQeu3JGhooJgfF4cVfOKm4=;
        b=Qi2KzeL91zQ8hU0F15XfwI0ap2XmtEepSmOUmueWkE6SDVcWsLFHD8ZvZWci++1DmD
         0EgQjGC2Xo8rVKjAnEpgkcspfRW2PKxuHOrDMfGF8y4/WvlgMo9aHxelMCKaovDtRJvL
         dsyKsGh+Fq1sqEIL+Ra15accFrhFAoG/XZgUae45ojpKyPSQAMNi+vmqTb40psG9XJuH
         TUnhl9QfxAkFE2eGEdp0fTyHquVfaTygG120+KUfqXCDSiQBIbiz5cxyUMGxpF0R3DE1
         QFhHs4E6m+AxDf/vFLHu/4wYV/HsJ3w7q99v+H6TXaKGSeJkcjEQPcfWBRMx3z0Xjb8A
         /L1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845487; x=1779450287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VKGnF5CC4ETtaEpeIaTcRgQeu3JGhooJgfF4cVfOKm4=;
        b=SNL6FY0GCkOTioEQ4mLOLyDeqQsmt6TynUbgUiTHPeTxqTxRysGspZYvZgO5yAgpWv
         dytAFniXSthThYBbhFLA3qNJ6jizlx9ZxNSlD+2eDRjgaKOSgmTFwjUbGPLKtsO+zW09
         dpmlFZ/Pw4yjMxQajfm122vE3SJaeX5GyQcwfyvjZ3SYhXjONqVSWcyk/trkOUlQbseD
         0j2mhJMgOUHHwiUnTbPaFgRtbON7y88lEMyLWMcwUOxSiva7x6Q/TJzSBNFuKjFvJ57Z
         fUq8QdFff8qYC60gfEC9TZPBSnvFEwh2GMiRpf9rewO3AHz5w2zjPXtRPtx5zwfqxQW3
         KtyA==
X-Forwarded-Encrypted: i=1; AFNElJ91NfC+2MVp7NupjoGwzu32X7l875koelVrt0JWOnDNuCgH/f8IKHhebl5uynEwIZAWrpuvIVZ4Q6U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+DrlzPwu7SHHVe6DEAQuGyFn+5MGbMYTkZ7jf8jatTgiDNwzy
	XtpweGTM1JehItXYFVbIrupiDofULa2zKot+/zruT26ZCzgCxWqT2AqJdQqFhmZ0pn4=
X-Gm-Gg: Acq92OH5zrW1a4N6Mc5YirrGLgYDJlQErYFA9rMNo3TUQct2v5i3NG1di/Kq6UzQtBo
	4PzQi4k1HS97pJtdSBv2vWVK85jlHjjY1Jg8kQvPGCXYEBA8BhzQPGrcTsbRjYhwlbrJq23Iabb
	TFYRDi1vZRj8jGJr3+gYgC2L0gu3WyluRpUu9RE1ck2a3zxpk4g74F4eAxvVhT30Xu9sTKHiwU4
	47MGm40yPZf6peOK6hUwMyQgNuUMFp47RSRekZMUCN+URoCqgi8uNi+92zW7o9Ru6SNm68QiMcP
	M4qaRGZxCVI+FVH9bo0bEEatWfbvbl3ZvqIGYxGz5T5kb08xq1D2z0PURA+Kvb+iSCjzeZwPtay
	rkL0wgxaWjjYta6jnvvXIX406R68Iei2hEJmN1qI0wuRkrlwJP4+DUNPANP4IpHu7GKWIgvhDTx
	7Tf1HsSM3KxZ2cMj72/933ci0XjvxzYVFu
X-Received: by 2002:a05:600c:8184:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-48fe60edcefmr45897445e9.13.1778845487488;
        Fri, 15 May 2026 04:44:47 -0700 (PDT)
Received: from [10.11.12.109] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe83ba2sm11472195e9.35.2026.05.15.04.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:44:47 -0700 (PDT)
Message-ID: <a4c287df-0300-4fae-8a2b-23e2358fb740@linaro.org>
Date: Fri, 15 May 2026 14:44:43 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] firmware: samsung: acpm: TMU support and cleanups
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 peter.griffin@linaro.org, jyescas@google.com, kernel-team@android.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
References: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Krzysztof,

On 5/15/26 12:32 PM, Tudor Ambarus wrote:
> Changes in v2:
> - collect tags
> - resend as sashiko couldn't apply previous version. We want
>   sashiko's review feedback

That didn't work, sashiko still can't apply:
https://sashiko.dev/#/patchset/20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355%40linaro.org

cut

> ---
> base-commit: 5e9b7d093f3f77cb0af4409559e3d139babfb443
above is v7.1-rc1 (signed tag)

> change-id: 20260505-acpm-tmu-helpers-4c5af0e2f07c
> prerequisite-change-id: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581:v5
> prerequisite-patch-id: 18d89d0e2bc0efe2cb366746ac4db36f4682f061
> prerequisite-patch-id: e877f865862ee94f5750b877b5fad863d8acd7c8
> prerequisite-patch-id: b5da16b5c6d6731ea519ed68302fd52ce57c7ffa
> prerequisite-patch-id: df5b1d9df4c8894afaff645c9eb84aa4e3daeeee
> prerequisite-patch-id: be74a55583acb36dedca3e118f49633172979617
> prerequisite-patch-id: 31ebc7bd806d4d466c256049f32e3270e2caeeb6
> prerequisite-patch-id: 7ea0832fcf76e4f40e18b74083904e7e37e1addf

While I see I forgot to update the dependencies, I don't think they
matter to sashiko. If sashiko used v7.1-rc1 and the prerequisite
patches it would correctly apply the set.

If one goes in the Sashiko link above and expand the `Baseline`
(show details), will see:

5e9b7d093f3f77cb0af4409559e3d139babfb443 (5e9b7d093f3f77cb0af4409559e3d139babfb443)	Failed	View Log
	^ this is v7.1-rc1 (signed tag)

krzk/HEAD (254f49634ee16a731174d2ae34bc50bd5f45e731)	Failed	View Log
	^ this is krzk/HEAD -> krzk/master -> v7.1-rc1

Shall your HEAD point to the krzk/for-next branch? Happy to resubmit
the set.

Thanks,
ta
