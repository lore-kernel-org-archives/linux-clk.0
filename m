Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9565919D1BD
	for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 10:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711363971; cv=none; b=Gf9vqH3x29OGr9StYX1fcQPtqJbPL1VF5pdowfZHr6Sfwgr+pyedwn1bAsT2fSIh6L/ofzP+Txns0x4kofOY1V8eRozrEgxwT0DG2uIyysfvk9xYKb9VfUC00wF6FeneOD5xQ7B9YjlgpUmYseafEYbt2E7FbpZi0VgFcD1PR4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711363971; c=relaxed/simple;
	bh=krCHL+qxAQ4SQ2psaIH85lNezKIzeTKZh1ZNAsaTRY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikRr+weryIjceATBoL58QSgbZyYND38tajpFCBqjesh8l2EXDtkSBPfviFZ1/GqgbGKsraqyo/apR/pBEI7cpck6K3Ej/g2KpltwkT8dSdgq14tPNC23kqVMqHn6sHRXgwyDD5hUB/VpKQEWp7sRmEkcUEI1ThNZw7f24aAKuAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xGpnpF/U; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xGpnpF/U"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d485886545so73286811fa.2
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 03:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711363967; x=1711968767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B/45gkU1OW/Fa6jqiOKHWiKJTgLo8h9uP7u3dIPIa2Y=;
        b=xGpnpF/UIQYWQY/gDMIz6KBG+snbPIYjkMDxZrK3B8rFRKledvnifIcno/7ZY2naNc
         oNTvJcFyuU22bbKFpTbAat4bOnE3EUWH1CvVAWs+cxakG1yod4lTwpnNx6yFfBmT7KLP
         APQGNjGQdYCdqQrBjTDYAqB3ZB2P+ix5fobRRWoyVCXVOuzzateS7Ep+dPIuxfXdcVBu
         6mmASZF8vdhe1aQa8QudENDJUtbZGIKaRS3axCItweI9RxlYee7HIlPSzx3Njk7nK5zl
         PX87ihlyNetTCK5K2Y6ZHTX57Ka6plQR8Gg9dJwd7eS+qXhOkseaWp5ClRTxdbVftJcr
         bpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711363967; x=1711968767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/45gkU1OW/Fa6jqiOKHWiKJTgLo8h9uP7u3dIPIa2Y=;
        b=D4WVBjd0jXGLz2BszRd3z+4BGSkYzkscJYr9lqbtYQlJdnJHfx+MjGveIQ/ogxe3Wo
         FobSMaCzkFLXsd6SiXySV8mh0aYD5y3dOxi2yMKIa0/ZlLYSiN/4XxRoZVguLARWczlH
         QrKl4kKZseSFL3ch7anNkFFqP4zKFAvv1ZOUnbh2v5lHpoI+fMjGVbWN12YDkiPhMLo9
         hknJ/nCFwOuSiji/WpkY9gj1LYzkFNViMNd+y6o4+dW23F6Qn5IiLuOupe3wVjxI8Bk+
         D8QBZ2DR5dc+G18ST7MMSDAalaz90AyJsiNPHpgmRBlm9LRobu1doaw1BBn5ZV36u2YN
         dYOg==
X-Forwarded-Encrypted: i=1; AJvYcCWrN4LbGfWgh0M9Butu7Cp0DkQTyjYvpm/2k7UNQnedDMXwTV4orLKku+zqhoI1xQXZuqAea87BHow+aaAoSn3xPXZ8qLyclMRd
X-Gm-Message-State: AOJu0YwgBrQtH1YQfi4yK0t1u1LbJ0weU/a21mk+n28MHECvSuJdyluW
	8FwzzWs2gU3pAf77qyB/VDk8U9Kb8NnVcAsLjGcEL0rHNlbNKl/S/qjQoPf0tPs=
X-Google-Smtp-Source: AGHT+IEclAfbiEIquW9pL3ASZRMHbyWd/lIOzT5bu64XepiQ3fVd79XZUHfg0x/tT73njuoHcmQwYA==
X-Received: by 2002:a05:6512:1590:b0:515:a9d5:aab6 with SMTP id bp16-20020a056512159000b00515a9d5aab6mr3848775lfb.18.1711363966528;
        Mon, 25 Mar 2024 03:52:46 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id kj9-20020a170907764900b00a4636d9d28dsm2903246ejc.69.2024.03.25.03.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:52:45 -0700 (PDT)
Date: Mon, 25 Mar 2024 13:52:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 05/11] riscv: Kconfig.socs: Split ARCH_CANAAN and
 SOC_CANAAN_K210
Message-ID: <e255a964-27bf-4eb9-8e9a-4f60d1ccd12b@moroto.mountain>
References: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
 <tencent_F208A26B5338C6E14AC6648730368AF0FD0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_F208A26B5338C6E14AC6648730368AF0FD0A@qq.com>

On Sat, Mar 23, 2024 at 08:12:17PM +0800, Yangyu Chen wrote:
> Since SOC_FOO should be deprecated from patch [1], and cleanup for other
> SoCs is already on the mailing list [2,3,4], we remove the use of
> SOC_CANAAN and use ARCH_CANAAN for SoCs vendored by Canaan instead from
> now on. And allows ARCH_CANAAN to be selected for other Canaan SoCs.
> 
> Then, since we have Canaan Kendryte K230 with MMU now, the use of
> SOC_CANAAN is no longer only referred to K210. Thus, we introduce a new
> symbol SOC_CANAAN_K210 for any conditional code or driver selection
> specific to the K210, so users will not try to build some K210-specific
> things when MMU is enabled and see it fails to boot on K210.
> 
> [1] https://lore.kernel.org/linux-riscv/20221121221414.109965-1-conor@kernel.org/
> [2] https://lore.kernel.org/linux-riscv/20240305-praying-clad-c4fbcaa7ed0a@spud/
> [3] https://lore.kernel.org/linux-riscv/20240305-fled-undrilled-41dc0c46bb29@spud/
> [4] https://lore.kernel.org/linux-riscv/20240305-stress-earflap-d7ddb8655a4d@spud/
> 
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>  arch/riscv/Kconfig.socs                        | 8 +++++---
>  arch/riscv/Makefile                            | 2 +-
>  arch/riscv/configs/nommu_k210_defconfig        | 3 ++-
>  arch/riscv/configs/nommu_k210_sdcard_defconfig | 3 ++-
>  4 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 623de5f8a208..5710aee456ac 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -72,11 +72,13 @@ config SOC_VIRT
>  	  This enables support for QEMU Virt Machine.
>  
>  config ARCH_CANAAN
> -	def_bool SOC_CANAAN
> +	bool "Canaan Kendryte SoC"
> +	help
> +	  This enables support for Canaan Kendryte SoC platform hardware.
>  
> -config SOC_CANAAN
> +config SOC_CANAAN_K210

This breaks git bisect, right?  There are references to SOC_CANAAN that
are get updated later in the patch series.  You can't delete SOC_CANAAN
and leave the other references dangling.

regards,
dan carpenter

