Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925C135950
	for <linux-clk@vger.kernel.org>; Tue,  6 Jan 2026 14:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767710638; cv=none; b=so7q71v2AxaDsj04c16+GfftBSJhFvi7QKvnh5+b00VAKA4DQY+GMMYF9oay/CW+2dl5OTeYkqvoJZgrBlftvFabOpYV0CM2QuHrRhQ8T2WJfmvGUMCZPP3hJbi04hskM8qxv4HUv1WqqLNG1HAK/V6cxhIGnSgOy07hFgA4wYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767710638; c=relaxed/simple;
	bh=lgMKRFdh5v9iRb/pm3a055Mp9ATD38LF+MvykHbBixc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pVKNJjnj7QT6qXU53/xoHNXTePcKDS/uPPXZU4pqBMQY1JaehQ/qrSpncpe5bTYhq5KA9F4+LGsG/JvTJBYmAf62LCJ2wObdn+uggi/Hy0IHQzLautk2c3Mk/dnyf0FeQeYDsfCUbfTkPq1Uo+sL/kN4ewJXqS7dMdMixbqWOHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=IPrevUTE; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="IPrevUTE"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b2a4b6876fso127612485a.3
        for <linux-clk@vger.kernel.org>; Tue, 06 Jan 2026 06:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767710635; x=1768315435; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yjnd3cJi73pItwYWnZ/AGVro8SITV6ewWmgFqzGpdOc=;
        b=IPrevUTEPRsOZW6vSN66tVtbTQWZf8soBWefuU+HTkefSYRcJoSmjiz5ZgIdmf/H9e
         hh+p63r0/MuJagfsELcEoYBMmSFB6DrX7qs1piS/KeqNBrbmkTmfmwBRt6A+B/K/qDub
         36cbQfzpGkWBwm+jRqCL1ZOl8euf9fT3qMNAnAyXzrbvrBFcih4wN+bvOUBMrrjp09Sz
         U+nJ/LdAewnGYhYnhDFJE0ZZVIqfjezlMpQu89/85g741BbBkezReWvehtWHXpeZDbMS
         05uq67WtQaL2f4Q83so4tIZHXtAGh6FZ63ggh8SGVFA5fFeGzQRdkuRAUAwULZSw0sW5
         WS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767710635; x=1768315435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjnd3cJi73pItwYWnZ/AGVro8SITV6ewWmgFqzGpdOc=;
        b=uRh1990/yDYWW79yAGDV94WydfHefjGxSC4ywuT00+Smq36IY1DEQyRFUIdQRSqbBv
         r5aQHY+t6VJjI31ORDMhvJBKZ4TBUlaVpG/PwZzrsLj5MQxIL6PeVRSDDGxG/l7aoE1N
         Wygyv4W8sW3bPA9C1TImSORHYkx36pDW1WdrMJBVyMsXmWoJnH2dYPczM/IdxJ83MBNn
         yj5mR1cfAtDwWnFzOBd0kCyy4nQ76v5H35qUQHQnMuSZM3etW9YnI6Y0hJC28q2YAUMJ
         4PfxTWPFQZhsX9XvCLAx1+1Xpe8AqL7sk9vkblwc7AwEtSoT6P3ozSJrP/Kt4Qyh9kum
         NyVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlduIstYO8Bpf8CW8jgH07nQgy5FLpzsgwqtlEB8SqPuukhA66/ZYNAAOp+gyRRD8uUubS2I5Tm5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSwTjMPvuRJfk1pH/HqZiHkeTb8Yh0peWSycpsEDRAN6/pTC1i
	STnq6/Fyq1BWm4G8PrwW7+97npmjkwqvBQqugPoqFn+UEBmn7qmujW16C7LKZ5lcEmA=
X-Gm-Gg: AY/fxX6wsW9oGFdJLJU/GkwS8QCiWclaoV8eCON5K3xWeQO0dYg78/Y6PZCo2D4ZvRY
	2DfkW41ZepDTGYEFoR28oKU65blvqYhKGngT6xGYyuNvpJRV6LmPjrbh1ebyj26rx84c/gRQQJw
	E2tGjrj38Mavz1g5GyWZ7xpZWsM4mj+ayPebqh9B1Qbs0XHcNzgg8jcHz5cfuB/wkE0b4NDoHte
	R0U/WU2ytAtTh20A80/vqNNT0pPHjtvnbezloVRK7bdKd6Xq8+9IZO9viip0VFK4iM8FLbgDfxD
	+UkTGlZRLLqGpwBMzYa8pTz8h8IwWUPAWwFqLIeS+GXRD5XExCAnZYSP+3B9KMNfvkFLAyh1zg3
	aVWp2uAF5xJCn6WPu+r+zMrW+Tx3pxKBnq39oA1Cd5HzNI64dgUUdCpKrFLrp8ELnz3+Slc67co
	dVIv2NU8GYekr+J4g7VfGEUJ5Xw06l2iMH2hN+pA1EcaCfTXEkJBs=
X-Google-Smtp-Source: AGHT+IEt3VwJP5rxykKJZ4q+39Q3RxlylF53FJBHrqUXpOK98r/RkrMmPUkkduDxAmcDVa9qHWO1bA==
X-Received: by 2002:a05:620a:254a:b0:8b2:1f8d:f115 with SMTP id af79cd13be357-8c37ebcb5b5mr442348785a.65.1767710634577;
        Tue, 06 Jan 2026 06:43:54 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51b732sm173883085a.25.2026.01.06.06.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 06:43:54 -0800 (PST)
Message-ID: <9ceca23a-8709-43b4-b266-38cc0d924aac@riscstar.com>
Date: Tue, 6 Jan 2026 08:43:52 -0600
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] clk: spacemit: prepare common ccu header
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Guodong Xu <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
 <20260103-06-k1-clk-common-v3-1-6061d9f69eef@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260103-06-k1-clk-common-v3-1-6061d9f69eef@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/26 1:26 AM, Yixun Lan wrote:
> In order to prepare adding clock driver for new K3 SoC, extract generic
> code to a separate common ccu header file, so they are not defined
> in K1 SoC-specific file, and then can be shared by all clock drivers.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   include/soc/spacemit/ccu.h       | 21 +++++++++++++++++++++
>   include/soc/spacemit/k1-syscon.h | 12 +-----------
>   2 files changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/include/soc/spacemit/ccu.h b/include/soc/spacemit/ccu.h
> new file mode 100644
> index 000000000000..84dcdecccc05
> --- /dev/null
> +++ b/include/soc/spacemit/ccu.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_SPACEMIT_CCU_H__
> +#define __SOC_SPACEMIT_CCU_H__
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/regmap.h>
> +
> +/* Auxiliary device used to represent a CCU reset controller */
> +struct spacemit_ccu_adev {
> +	struct auxiliary_device adev;
> +	struct regmap *regmap;
> +};
> +
> +static inline struct spacemit_ccu_adev *
> +to_spacemit_ccu_adev(struct auxiliary_device *adev)
> +{
> +	return container_of(adev, struct spacemit_ccu_adev, adev);
> +}
> +
> +#endif /* __SOC_SPACEMIT_CCU_H__ */
> diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
> index 354751562c55..0be7a2e8d445 100644
> --- a/include/soc/spacemit/k1-syscon.h
> +++ b/include/soc/spacemit/k1-syscon.h
> @@ -5,17 +5,7 @@
>   #ifndef __SOC_K1_SYSCON_H__
>   #define __SOC_K1_SYSCON_H__
>   
> -/* Auxiliary device used to represent a CCU reset controller */
> -struct spacemit_ccu_adev {
> -	struct auxiliary_device adev;
> -	struct regmap *regmap;
> -};
> -
> -static inline struct spacemit_ccu_adev *
> -to_spacemit_ccu_adev(struct auxiliary_device *adev)
> -{
> -	return container_of(adev, struct spacemit_ccu_adev, adev);
> -}
> +#include "ccu.h"
>   
>   /* APBS register offset */
>   #define APBS_PLL1_SWCR1			0x100
> 

