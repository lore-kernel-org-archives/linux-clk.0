Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4184C18440C
	for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 07:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711350921; cv=none; b=rixwkmcBsLdOce7puhdlUB4n/DdKTGDjiEDoZplgswlrG+3XqiJe/aObnZsjbPfztLQub5ptr+Ah5KW93HoLaAmz9Y2NaiFVz8YWUw3SZc9zuVfOrs6Yh0WTKp97KLFE/LPZnQIKqG1TSD9R/hQeW21IlmBZkYjk/ZB4FwS7B94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711350921; c=relaxed/simple;
	bh=+OyKK7IkvwEV/w7UMcTxO7cG4x4rvzI12pOx3LK8JQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l8qAYSl7m2Edp3etXwrHLXo1oxsdDNlxGFlMa2DTipuSaWvxDbwc57lNvtzYlfxm+vE0yea6FS5AClY9sWeFoPFE7U+Sj350QmG4wU8OKc13anXIoZZeOwlxW283QvZnWs3SgIeytDML+i6ZPRRyPwBUewhiRbWTChtYtk9iG7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dWtQRUQ9; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dWtQRUQ9"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a4702457ccbso513678366b.3
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 00:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711350917; x=1711955717; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OxdjCTpMFkU2iy+O7js4KexQH/nrED/NHR9zVi08e94=;
        b=dWtQRUQ9IMJDLPF1b5LIm1bdAF1uaUojr5+lRnJEPHBwJX+meFMR3SpiiAjiRCJuVS
         wfDLWvReB+zyRZtRWv/tIXI0P2Vh5Avp+zfXEZCL9pse9Q3NeJvlDVNO9gguR+ieOHaV
         tz5iEIqgD7xBqWJfJSoaZVwIeVHCIh6uiqa22Z5dI5GdaPv0Fk/JS3ad073csKDouCWQ
         J3chqL/IdrGgMwMfPavdWRgT88K0NZVk4Pop2iyb3B+D2q3B/1UAS4a/ZUEpDygB7xLZ
         JxUqGF1W+3I9z8GANUIvqgeulpQlM58rkAmAaUKsCLVepka4AM/gQduqgv6IEcg8X+wP
         lA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711350917; x=1711955717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OxdjCTpMFkU2iy+O7js4KexQH/nrED/NHR9zVi08e94=;
        b=eL0kQx59gM/ltdzE6q/+RbKEpOxDiJ1ptfRPCgbFX/p+m4wJj8TB7ounXuMptBv81c
         tP0FkV+7b2xScgbBb6mdPlPmPMjYx6ija6/fsSAkYRWlhh2uY3Fi1zqRse9SPw/rFeps
         SA5z3qXiiKmKc6Fsz1M8wU0qF3q6PR2+V2CG2zFAhzyYq5TChHNz+L4INJfogHjtP6oC
         wWj/0Aaxa0vY9SlSIkyMiFiJXmDSCkS0YXnCuhHgHFFgSipxjMT09vl/13s7uxwF48oZ
         JaGXXcdIa0fcagJpJQ7fSPF/LWEqdbxch5uEosXuadB6J8pc3APqdHuYgguEzBKxte5c
         0yjg==
X-Forwarded-Encrypted: i=1; AJvYcCXoQZl4BzgJJtl6gv5m2cnQhFRWGthpp/nOUKVhAJV8JJH4387ZAPMms9HStlKJ0jEleFuORJjNji90qYa0BYEEirJkxZzfkAKk
X-Gm-Message-State: AOJu0YxveB++HCYkn9f7yEJm6/c+FLQYqhaTmFcE2eCrjNdg6IfX5WT/
	WCMgxPtaeFhYuqtE3Nnc9u3H49E2bwm8NaNaAXVN7wmOee96zKpr3CX5Zb/yIPg=
X-Google-Smtp-Source: AGHT+IEABScS/uWpH8mLPgka5W2OjNZXv8LwGqs+ViqHFZf7wcLBOPPQPWhOE5l5IRTB8EdwF1y6ig==
X-Received: by 2002:a17:906:1d04:b0:a47:34c8:900b with SMTP id n4-20020a1709061d0400b00a4734c8900bmr3993917ejh.0.1711350917368;
        Mon, 25 Mar 2024 00:15:17 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.252])
        by smtp.gmail.com with ESMTPSA id lv16-20020a170906bc9000b00a464f709687sm2723321ejb.59.2024.03.25.00.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 00:15:16 -0700 (PDT)
Message-ID: <20deadca-48e2-4359-ae6e-82e44651a2e6@linaro.org>
Date: Mon, 25 Mar 2024 07:15:14 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: samsung: exynos850: fix propagation of SPI IPCLK
 rate
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: =?UTF-8?B?6rmA7J6s7JuQL0pBRVdPTiBLSU0=?= <jaewon02.kim@samsung.com>,
 krzysztof.kozlowski@linaro.org, s.nawrocki@samsung.com,
 cw00.choi@samsung.com, alim.akhtar@samsung.com, mturquette@baylibre.com,
 sboyd@kernel.org, peter.griffin@linaro.org, andre.draszik@linaro.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 willmcvicker@google.com, kernel-team@android.com
References: <20240229122021.1901785-1-tudor.ambarus@linaro.org>
 <20240229122021.1901785-5-tudor.ambarus@linaro.org>
 <CAPLW+4=jSr6ZsB7XekXsiUBm0SmVpVFnqpgjViuF3=HpT4gRAg@mail.gmail.com>
 <867158d7-0d98-4058-9c2e-6b573ec68516@linaro.org>
 <CAPLW+4=nRjRPdu80Y3izifxQDNUaJymU3di0hGErm1dHry3EfQ@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAPLW+4=nRjRPdu80Y3izifxQDNUaJymU3di0hGErm1dHry3EfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/22/24 18:09, Sam Protsenko wrote:
> Yes, please leave Exynos850 out of it, if possible. 

Sure, Sam, thanks for the feedback!

Cheers,
ta
