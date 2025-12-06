Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B08C222585
	for <linux-clk@vger.kernel.org>; Sat,  6 Dec 2025 11:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765019511; cv=none; b=E2s77BkvW7r3D/tU9osffyufAIOB+5p/ikqyzKK8VVYTuaAsESZbCRgGe3ES7N1sS41cvZAHVmL5D65tqFFll9ABswJ7PzkddtRUTPT4qPVKkQ1wCaK4gKz3MkDKbyHgigjH0jvBAAKKgJQRC3HX+veLO8m9bLW8hbdWD2jyapA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765019511; c=relaxed/simple;
	bh=i6DFH1owewNhW67SaCjr52SMT9liSY8pPxcicJCPwkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k4E7P7c23nTOoGa/ho9wuVeZfTDZX9gnGBJhg5xIJD/MbPvVUxFd2eVG36R7hGu/Gnv7WUqws7SXTHskLN39H3YVhyPGrlaSY68UTXCHxMr1mv5W9t2nTQ/qUdD9KKXR4coZZneLQwzjFYo7Y2uvq40xovZtC9EHMnusVgij1bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QEpcormi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QEpcormi"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso25090065e9.3
        for <linux-clk@vger.kernel.org>; Sat, 06 Dec 2025 03:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765019508; x=1765624308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kA4dYuB49zNcflG5vvLKKvtHOONzwthyiF/LnUsNAAo=;
        b=QEpcormiRUQoWpOAd9BKXD8tVp1JKrmxelxLLiHPMmoMhrXelQfwXGLFzjkyb6L8JM
         E7+AHRcMxNk9TCR9wE1usq5zOtI/zY+laCb5i1711Bq3nFSMht6PInpXVH2zu0/qX7Je
         ADreAEEJBMv6n3sJtb2y19MAD4OHufDYP4jS+PXmmwk6Vytm9hVQoQf1/mk1dcA2GIBy
         1wVoshSzXVFqE/S9TQ6uepyaRjcFZOotLPa2Ku/T7VRRwcFbSk2ZjGMRi9WeaJ8Bjf2m
         f1VosxKI1ZlrwarYeaaXai3flwCv6QJLpgznhSvac/WvqQYD24xStPpTQ7ECG+y6BmRj
         oW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765019508; x=1765624308;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kA4dYuB49zNcflG5vvLKKvtHOONzwthyiF/LnUsNAAo=;
        b=QLDC5Gx4lAQ8EUis3DDFsVukr5S3IVYTpCplnVZn3M49zZjbXuFmTBv75P2K+zEE5e
         ypqRLpJX5qNBOxEEHJI+MG6ZnBEQqkSNbYhXTONCM9ldRE/stwjZSf2IIPtYANimg3Qk
         SiUWS6lZ0BaWuDLd92+vbpQ3AlGxlC+tFu2q0GfDEVweaDrVF7vJudXTujqUEIa9eJpr
         /NQqwIhZYU8OsMNmJLRIjzg9fngAqJdJslLsGuiofljhllj2oYtstceKs38uxuwU5IJX
         EDu3/ucKO7o4uGLVFHV8PteTxYmNejc4obW9OVwQaAioFHNdyUOgluyZfz206uqNHqHi
         udkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzrLHqn6mPHJr67oA90NyzxpO6+ELN3WmaVG21jVNT3F7p8qSLd2ESyz/vXSaKBY8pt9ViDiq7eDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmxfkXlNJxFkz9g0VzfOnl9UYLPo64xjIyoqPav2fGQhXW6qvX
	EKMw8+bxSpVpcd0aloSNXH1uVppKT+oAFnMeVh+9sjOsx1KckYbmauKnLpJy3e02uqA=
X-Gm-Gg: ASbGncsKoHytkXKyCwGsLw5UGvJ60sNCg3oAh7loiroA6ORtEsmOzSTDwzjBRnCFLet
	Al97Oq/cNGFi5+FHLpS7kG3uCiK55cDZ92ycsbcB6ENoy6vk+pmH7kb56HtYxGYO5v7MW4BbIYm
	3WxIF46q90hy5QnJ1u+AHBDZkTEo38q3tCuila3fiDdqqNhgW8DfJySvPXmlLKHMXvNFSZOg0TD
	QX0DMW9JAMCiPxARpMHxphHjgKoMJTScigRCMH5XuhmM4jr1+9Q6e0DuF3mRtSvzyG64bASk7iq
	9ar1N2oX1Y36ntDP87xoql+mu5q9vABcDaxy/u6V9g7kMkYAmT/2mWQZFbU0p/tvXjTk3gxCkuh
	ZFKoj1o1BSJQBodPZp61ZLCYhpmLTc/uOpusWfvdMzl5CjtAPHi4Z2BoVmZ86uSnoeNqBdEClvW
	dJ0HCb6zlqjB/uUlVcUbo=
X-Google-Smtp-Source: AGHT+IEXAY0hNz2eOSoL0Hv03FAjM8+tLdCbApP/CpVTsWfXGDNXQB9mZEeEHfi46Teq/N/IO2sImA==
X-Received: by 2002:a05:600c:621b:b0:477:55c9:c3ea with SMTP id 5b1f17b1804b1-47939e50ce2mr25774055e9.35.1765019508463;
        Sat, 06 Dec 2025 03:11:48 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479311fbaf4sm124579745e9.15.2025.12.06.03.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 03:11:47 -0800 (PST)
Message-ID: <ae7dd616-f09f-4729-a15c-411d964461d6@tuxon.dev>
Date: Sat, 6 Dec 2025 13:11:46 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] clk: microchip: drop POLARFIRE from
 ARCH_MICROCHIP_POLARFIRE
To: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20251117-shadow-police-56aba5d855a3@spud>
 <20251117-bulgur-wildfire-a8c5a2b417dc@spud>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251117-bulgur-wildfire-a8c5a2b417dc@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Conor,

On 11/17/25 17:35, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> This driver is used by non-polarfire devices now, and the ARCH_MICROCHIP
> symbol has been defined for some time on RISCV so drop it without any
> functional change.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/clk/microchip/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
> index cab9a909893b..a0ef14310417 100644
> --- a/drivers/clk/microchip/Kconfig
> +++ b/drivers/clk/microchip/Kconfig
> @@ -5,8 +5,8 @@ config COMMON_CLK_PIC32
>  
>  config MCHP_CLK_MPFS
>  	bool "Clk driver for PolarFire SoC"
> -	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
> -	default ARCH_MICROCHIP_POLARFIRE
> +	depends on ARCH_MICROCHIP || COMPILE_TEST
> +	default y
>  	depends on MFD_SYSCON
>  	select AUXILIARY_BUS
>  	select COMMON_CLK_DIVIDER_REGMAP

This doesn't apply on top of the current at91-next. Maybe rebase it once
6.19-rc1 is out.

Thank you,
Claudiu

