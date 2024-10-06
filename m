Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9562C189BB6
	for <linux-clk@vger.kernel.org>; Sun,  6 Oct 2024 20:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728245692; cv=none; b=D6nOm+s3Sz2yfAwHwV5fE1UVLlS3xpbvCCNaHvPVuGbXc0ZJj8U6A2+dha6f2UKz4LRQW6QfHLJPxQM87JVuoPORGvkIRIHVlJAGpnBTpd7AzafbkcmdK8a0oYOb8fl8VDeZkgAGeqU2EnwKO9C0Qvz3c4XpUMBLGCwFA0GUq+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728245692; c=relaxed/simple;
	bh=TAOnruZ+UY0G77/aMNG4re8guO/zoiQVSwbD9ShvBKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tk+UimbcyhhYu3GA5VrJfTA4l62HKqQSm5q/rodWKiAnydLptIdvB0UhqOn1KynFi9Qal2MEgZhFjzoXR45WkHnDtFdcf0tAxdvN0AzxjjGJ0DRmTNGGroL+vHQDce4w9a6H4vdg1oZnTn//z1uMDSjm0VtnKTDAH4nT5Y/q32g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LMrYpC1T; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LMrYpC1T"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2facf48166bso42504031fa.0
        for <linux-clk@vger.kernel.org>; Sun, 06 Oct 2024 13:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728245689; x=1728850489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bbcYT7ADpCO6HhcQ0PCuE8br5sqfMeh1whVSG+rVUPY=;
        b=LMrYpC1T1SLo3lAIkPZjpOxcyN3lvV8aeALnoPg3jBG2IZCXbm582ff3HinmmG5WJe
         A68bApvrA1QTgbqZFs8lc/4VxolTb89Dj4Y2d2rm52hMEOC8zVWX2bFkKthch2uW+4J0
         m1u1w0+x6SZBHK52agdGQGSh/7aPlko+U+DMpmMpHC25djjShF5oMBMe8Dwri6UAkpFM
         ML5ZTjsx3VFpcldcBrnkFEvjbFVki1nIR0UfrT9kkLmV7jgFhdeic4H/toaLnQ2QFRPB
         vcAl+f0a+55juaamlfcPZgcox9v6HgR6ObsZ1W/zeLSKjEp8rWvZORQprl3TnwfBj306
         D3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728245689; x=1728850489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbcYT7ADpCO6HhcQ0PCuE8br5sqfMeh1whVSG+rVUPY=;
        b=bVT/pQMICi4ida1HW/BWSP9YlD+CqMBKFfXpjjYSq0pVyo2Gkh0N2njFpBxpEHunn3
         uBiyWHNqovcE0K32ntedS0eHksRDphS0/H9OKPcixtfXeDYEgYCCbkUYHhTeYYtf0lT+
         IJM/7M080sBahy+/01xkNb6F6PMjF2WZm6BS0mnEtwhSe+qGoq16FDQlpc94wSR8W5VX
         m5SHyDzGNtMzfhk2C2/A5ySrNgnLalFt86oX5K9j5DMj3Ruh+snmSwVg4oFFwF2FS05t
         AJplgoItVjE7Ufo39dCBr710KwqiB2gr2+SKHq7yHhxI4EPpOBnXnOi+5T8Ak7MzTZq/
         dW9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPU9jInIDtEXVOQFfa1hVKPphgret0Yd2BP/gPfSDz+JieVSVE9pYbghb9U6WnY2DZp0Q+pnnSPY4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Jrrqn0sou4V8ZwQ2xmLmA5L2u1jzBE//xvIgrWHsdWzsbQbz
	Osl9/6z8iurFYrVCqqR3B4vOdfIatkrPA4x43QkTDh0ANbYle+KtagZxH7xqniE=
X-Google-Smtp-Source: AGHT+IF2Oz64RqFM18CQ1gi7geZOLRwqYHJ8HBR+9K0ClV1bZqi4bkDZKnMb99BP0u3VkiM4VwSzGg==
X-Received: by 2002:a2e:a99d:0:b0:2fa:cf82:a1b2 with SMTP id 38308e7fff4ca-2faf3d70794mr49136781fa.31.1728245688751;
        Sun, 06 Oct 2024 13:14:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9b3ace7sm6110591fa.132.2024.10.06.13.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:14:48 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:14:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Karl Chan <exxxxkc@getgoogleoff.me>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, linus.walleij@linaro.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 5/5] arm: dts: qcom-ipq5018-linksys-jamaica: Include
 dts from arm64
Message-ID: <f2eck3tudqoqyylcknfvz77wj52fornxevp6po3y7sov7swikt@asez6wepyl6h>
References: <20241002232804.3867-1-exxxxkc@getgoogleoff.me>
 <20241002232804.3867-6-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002232804.3867-6-exxxxkc@getgoogleoff.me>

On Thu, Oct 03, 2024 at 07:28:04AM GMT, Karl Chan wrote:
> Build the Linksys EA9350 V3 device trees from the arm64 tree together with the ARM32 include to allow booting this device on ARM32.

-ETOOLONG. Please wrap the line at 75 chars per line.

While doing it please also add the reason for the change (32-bit
firmware on the router).

> 
> The approach to include device tree files from other architectures is
> inspired from e.g. the Raspberry Pi (bcm2711-rpi-4-b.dts) where this is
> used to build the device tree for both ARM32 and ARM64.
> 
> Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
> ---
>  arch/arm/boot/dts/qcom/Makefile                         | 1 +
>  arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts | 2 ++
>  2 files changed, 3 insertions(+)
>  create mode 100644 arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts
> 
> diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
> index f06c6d425e91..147dbeb30a6a 100644
> --- a/arch/arm/boot/dts/qcom/Makefile
> +++ b/arch/arm/boot/dts/qcom/Makefile
> @@ -23,6 +23,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>  	qcom-ipq4019-ap.dk04.1-c3.dtb \
>  	qcom-ipq4019-ap.dk07.1-c1.dtb \
>  	qcom-ipq4019-ap.dk07.1-c2.dtb \
> +	qcom-ipq5018-linksys-jamaica.dtb \
>  	qcom-ipq8064-ap148.dtb \
>  	qcom-ipq8064-rb3011.dtb \
>  	qcom-msm8226-microsoft-dempsey.dtb \
> diff --git a/arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts b/arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts
> new file mode 100644
> index 000000000000..9a6ad767ebd7
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts
> @@ -0,0 +1,2 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +#include <arm64/qcom/ipq5018-linksys-jamaica.dts>
> -- 
> 2.46.1
> 

-- 
With best wishes
Dmitry
