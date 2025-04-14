Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEED628A1FE
	for <linux-clk@vger.kernel.org>; Mon, 14 Apr 2025 18:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744654355; cv=none; b=Cx8sG4aVKM4tB2kNYWQghJ5bmQ7ftEsuVOBVkznN1Ddih1dNo0Drf6BevLhCfKAYfmpekKmuUyyuUI/eONm+/xRvNNbT+PJ3NgQ4Tf0VSDYNO9i6YAUdN3LyIeJyisUqs6Af6B1r6+ReGgpVZIyM/rEj2jmEKyoPWI/LvpWojU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744654355; c=relaxed/simple;
	bh=r8A1/OXEw484ZNsSIzg2VWYDtiy/WuZ8xA8QHJ5Y0E8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=usvEbkJ8sTVwbli5UAcytSeAixUHOuyHXGrkZY4fekEAcBa0XawTolposmDXLKFt9C3MSqD7KysjgPWVQLA1Ymn1List4c4GlvHB9OdkmaPgbz8m+SMiWDQ1Ncx2xNOgJIfV+W7t/4UET7EKI8Z7e4ctT+wAfF5Lony6u84S/08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=TAap0tnB; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="TAap0tnB"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-86135ae2a29so427557039f.2
        for <linux-clk@vger.kernel.org>; Mon, 14 Apr 2025 11:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744654352; x=1745259152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W++7Ey3dQSUtlzRbYLNczC2fDf4DSp323YSWaoMgCKM=;
        b=TAap0tnBPpph09KS8EjY/gxjodkQWdTfRIk7pfckV3PqrgPqFJzS8TB4rSV1EoqGPZ
         1IY8Y5GfJ4KNTLQw9wfSSFGiFNiqY/57H8RC8rAGQ87BqEBRQowyme034nNZjhhYl5qQ
         0WrZ4CJTxn+9XLho5DProBeb3M0VtQ3e8tsTaprWkPJaTibrasAeLO1WuRxsGLqAS0nb
         bBOjgR4VjJqVI1CbC5S9eT62PdUelccYuSnwLYo7DNP+OBHRstwfXkwgv1XNwjmVsVBd
         PzRg5+RstcLUIr/pWteLX3LP71feMU/+6b3AYf5MJ6wyb2LXn3Y4v3+rG0AkuhibJ7qG
         HKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744654352; x=1745259152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W++7Ey3dQSUtlzRbYLNczC2fDf4DSp323YSWaoMgCKM=;
        b=Qj+lSjp/G/OZbPO2eiQMACw11XhbvrJGfZ6aYEMYcLfRR1fHzFq4C4hOp3VNVI2t4d
         dSR/00xyBZReN1vAKxcAtsA876jEH7FHYAYFkjNIwsTYq/cKSJ5uwfxT9kPc297IzOeV
         YwuLfAyaGIjft6B+ap46KrYb+fi6MABGlhqfzwJw0cwz6vl4GLlazrabS/4fYBBx1igD
         euTDGFk3vB2oJqxtCAtpk5vQn+68HZHWXXfU0kXR3Mk5fgiSQlSwOytdyTisTSvaU6G+
         n8rD+7jcrwj0k3xB/KEgC14FaOps4qsYizSGosFaxegAL+fal8tVxrgNegc5m9yCJhuV
         WGOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtOuM05hmb/ar1HwOPgnkAu0TEN3zKT2pjjP/38/yXLd6pTU3/yTR2v5cVfV/TrTBNvdxr9m9/6CU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3ZmoMJGwFUF+XDUCvUWFoB992DImYvkQGSvRm/PpcKHw97BAb
	L7KoArxqwl09zVAG/3Ubtd85xgctBP7lcOhOaG9GNHaoWTxeDLaaABvX3ZuQaQg=
X-Gm-Gg: ASbGnctqO6u4zcjHLSf7BJcMOnCaeqfKxy3gs6RJ9IURzz5qIc3fiueUu5Rmbt4VmRt
	LaulwjoHmfbrUf8xHpHhKfrjJYp1g/MvfoIvtRzE2VpiL5txK2zPnDvob2mpnbGzXqmj7mnoRnC
	Hadpa5TPEeyhBAQGFLp3b8TFZjzuGrozdiSPfKXWwLoOjhqoYbBkz6MY/VVsQXBvMqzOGuaAT+o
	AaVjxBUbQ2WqI/0TO63m0eYFaiPbFUUJAgx9rEU0PvAN+r/8gVV6B2ZoW5wnVpWKOY1Ka0LD9il
	49K4q6awSTY7Any7L5QQD3/M2UGVpG/c5EtqMTdJT1npE9WjQAuJz9ooRzh9/wE9a/E+LJmqI0X
	o/0Eq
X-Google-Smtp-Source: AGHT+IE/wgwkbNsHlK2gyNx1GJkEELkMB3G+2KIj9Z8NP9udlt6BR88zVmXF8+R9i96TFdJe49eIEA==
X-Received: by 2002:a05:6602:728f:b0:85d:a1c4:ee03 with SMTP id ca18e2360f4ac-8617cbbbb51mr1548100739f.7.1744654351717;
        Mon, 14 Apr 2025 11:12:31 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86165428af3sm219588339f.15.2025.04.14.11.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 11:12:31 -0700 (PDT)
Message-ID: <b557a075-a184-4234-9793-ca1d13eac9df@riscstar.com>
Date: Mon, 14 Apr 2025 13:12:29 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
To: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20250412074423.38517-2-heylenay@4d2.org>
 <20250412074423.38517-5-heylenay@4d2.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250412074423.38517-5-heylenay@4d2.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/12/25 2:44 AM, Haylen Chu wrote:
> The clock tree of K1 SoC contains three main types of clock hardware
> (PLL/DDN/MIX) and has control registers split into several multifunction
> devices: APBS (PLLs), MPMU, APBC and APMU.
> 
> All register operations are done through regmap to ensure atomiciy

s/atomiciy/atomicity/

I think Yixun can tweak that for you.

> between concurrent operations of clock driver and reset,
> power-domain driver that will be introduced in the future.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>

This looks good to me!

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/clk/Kconfig               |    1 +
>   drivers/clk/Makefile              |    1 +
>   drivers/clk/spacemit/Kconfig      |   18 +
>   drivers/clk/spacemit/Makefile     |    5 +
>   drivers/clk/spacemit/ccu-k1.c     | 1154 +++++++++++++++++++++++++++++
>   drivers/clk/spacemit/ccu_common.h |   48 ++
>   drivers/clk/spacemit/ccu_ddn.c    |   83 +++
>   drivers/clk/spacemit/ccu_ddn.h    |   47 ++
>   drivers/clk/spacemit/ccu_mix.c    |  268 +++++++
>   drivers/clk/spacemit/ccu_mix.h    |  218 ++++++
>   drivers/clk/spacemit/ccu_pll.c    |  157 ++++
>   drivers/clk/spacemit/ccu_pll.h    |   86 +++
>   12 files changed, 2086 insertions(+)
>   create mode 100644 drivers/clk/spacemit/Kconfig
>   create mode 100644 drivers/clk/spacemit/Makefile
>   create mode 100644 drivers/clk/spacemit/ccu-k1.c
>   create mode 100644 drivers/clk/spacemit/ccu_common.h
>   create mode 100644 drivers/clk/spacemit/ccu_ddn.c
>   create mode 100644 drivers/clk/spacemit/ccu_ddn.h
>   create mode 100644 drivers/clk/spacemit/ccu_mix.c
>   create mode 100644 drivers/clk/spacemit/ccu_mix.h
>   create mode 100644 drivers/clk/spacemit/ccu_pll.c
>   create mode 100644 drivers/clk/spacemit/ccu_pll.h
. . .
