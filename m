Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A03C28B4F9
	for <linux-clk@vger.kernel.org>; Mon, 14 Apr 2025 18:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744654356; cv=none; b=jT3zkcpofBsvmaIlCkKyBLnfm6P37iSZIvEE+yUGQRQyYcrLilTgn2/LbjxprpVvYCiB1bxaldnieH/TGHu+XIksVCFDJpQs/K/nLn/gChXUmbm472yDmhR/r5+NUvxd8+97TOmBpyobBZqymgCJP37CDcpQ536+j56qsrBGJP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744654356; c=relaxed/simple;
	bh=M88zxHxMuT5Hi+r12Pej1eNGbm2XjVO4O0bNQWtajxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJfcl+ELLm2TgxQ2UI9e4zhO1N0zHWVAmwXKb9kiREra9E/BF895Zmjnr9Z1A+C/HobNMa9gYcvgy+AIJp2hbX4hbLDvBsgqn2ZskNo1TkIJNH/4TbLEDiCMi4GkS1cn9ve7AF0XFnEwJOQr5HBGQVrPuG4DB66YybmIFJS26UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=k0alu5/t; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="k0alu5/t"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-85b3f92c866so89598539f.3
        for <linux-clk@vger.kernel.org>; Mon, 14 Apr 2025 11:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744654354; x=1745259154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uo0iy7MAQ4hbf5+c4Te/phX/shJ7ZZ2Na/tgJWtoOGQ=;
        b=k0alu5/tlamnZvfN2Ar7I9lIPbMJBJFhRfIhT74ju7BpbO7EDq8VZQGVQ5HH28ANaT
         cyhVUFbGdyY4ceh2aDaMBAF8Dp4l3pXkAThBal6jXexOXLpKsIzj/6TmozNFJ9nR9GIv
         3ixOvzVzAjlulrwANeQNLaRtft+loQoMrHN2f+B6Azz5+SiSS+zZ5V5Kxye8fiPoDI1Z
         unMQyhP2PLPHoKa9m4noPNWTSSYVPClgFJLsQOfGhyQZkN6e0kvygARdxJav3AOdEqQW
         c/77LLhV6fO6hw7W4BZ3Tz2OZpsk1DLrUFJnRD7XllW65MbAW2+w5J4z6ME70+Ee/ByL
         oBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744654354; x=1745259154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uo0iy7MAQ4hbf5+c4Te/phX/shJ7ZZ2Na/tgJWtoOGQ=;
        b=nY/P8PLSs61gbYXWE6hfO+QVdtSW3bmkH45oX9ZTnVz1MGlZCKj4YkYzIFQXCt4k8l
         hetFVBV7iLopF6BJf8bcRcQ6bs0S8vbbYIaEJc9ialUyUCjabNmXalv/GD90VzGhptzq
         vDPZvxYQt9oOA2DcwnFDtnlFIIfVddZLaTXRVI/IHKWMVCCBesNb7Vyl1S0Ta4oZzkNY
         veRZu2aLjFM9AH4b2hlN+jLFIbRRDVRCnWvmN4KgPV8LNxdX/nNosLiJsjRZWjKeKF79
         PsQ4e6QiWx26nw5JcPEVh21t+DWftjKthH8barSXvagPnNUYEaqjciXcqABao2Q/epE7
         +mvA==
X-Forwarded-Encrypted: i=1; AJvYcCW6w4b1E7iw/V/bFSlFRLD6OC+p8TaFnnUkpZbxTYCaA0RCuf7hAZbah5gfyZ7lQLQ+RCfZcpAPks0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ+X7k6Fo3Ofc7uZXD+4JvKhLQv2poiVnC/uxqAhY2vuiAhGQu
	0CbSGUfMTfVaeGSYNqxXYKYQ6SdYJKFkAAAPxunomzuCt1qaCiseH+7oz1cP4h0=
X-Gm-Gg: ASbGncvuZiCevatCveFivT5PARwsnIqxGuIEf/+vHs10iT06gi+KcuQqKvz752veboJ
	3GwHa23NlN+ZhGMqXtEh7ASYm3C4MaY9A4lcULINDQvlDsG/NEE2uddGIQmR8OAH/M0uKNL6th0
	r5u6EgDX0tlpgSPUdnSCStVrZp3xfQ/eXmojk8/1mnZ4UIo65vqR2omf8ADL0dzoa+K1XLIkovH
	Z5q+7wv1P8pMkX2Na+oqX4vs3ACT8UhSZQmnlv1AlvTDupUTmNCKseXSVr+6xo1IhaHrdfSlSuV
	XEOwwz0YWwtZSpWykOPgDHqEcr8TW1wDvsygE8eoUw/0ZgznA623evg7sqnAD+ZHqlU7N6UA+VQ
	69lJw
X-Google-Smtp-Source: AGHT+IEPulg8UQUye+ERWDwcR54kMX3JF3oXHebpwxdb/gMTX99uIyKUf+GhSeeH3MJ9K8PzDd2i+A==
X-Received: by 2002:a05:6602:3890:b0:85b:3e32:9afb with SMTP id ca18e2360f4ac-8617cc00bbamr1642828239f.14.1744654353950;
        Mon, 14 Apr 2025 11:12:33 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86165428af3sm219588339f.15.2025.04.14.11.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 11:12:33 -0700 (PDT)
Message-ID: <eadb0ac9-f46b-4525-a198-0c6c289084f3@riscstar.com>
Date: Mon, 14 Apr 2025 13:12:32 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] riscv: defconfig: spacemit: enable clock
 controller driver for SpacemiT K1
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
 <20250412074423.38517-8-heylenay@4d2.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250412074423.38517-8-heylenay@4d2.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/12/25 2:44 AM, Haylen Chu wrote:
> Clock controller unit, or CCU, generates various clocks frequency for
> peripherals integrated in SpacemiT K1 SoC and is essential for normal
> operation. Let's enable it as built-in driver in defconfig.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>

I know Inochi wanted this to be "m", but you can see that
SOPHGO sets it to "y".  Meanwhile SIFIVE uses a default
value for its CLK_SIFIVE and CLK_SIFIVE_PRCI config options.

I'm not going to solve this, so I'll just say this looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>


> ---
>   arch/riscv/configs/defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 3c8e16d71e17..4888529df1d8 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -250,6 +250,8 @@ CONFIG_CLK_SOPHGO_CV1800=y
>   CONFIG_CLK_SOPHGO_SG2042_PLL=y
>   CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
>   CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
> +CONFIG_SPACEMIT_CCU=y
> +CONFIG_SPACEMIT_K1_CCU=y
>   CONFIG_SUN8I_DE2_CCU=m
>   CONFIG_SUN50I_IOMMU=y
>   CONFIG_RPMSG_CHAR=y

