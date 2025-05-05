Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B5914A4F9
	for <linux-clk@vger.kernel.org>; Mon,  5 May 2025 09:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746437631; cv=none; b=aweQNyZ/8z1S+2Vl18Ig9y+5DqvFy7pKMgRD8MQtJybrds4xGFS0x89VksXV3B2Wm78jmQzMM0y8Qn9ijO5ztsAuAUDK8AEdTdKNy7yFqvmBN5dwmfYTY6SdCtsh1muDEP8D86TdZAXhJtjm/NBiNXqs1Q2DLISwCJeIF+pXFD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746437631; c=relaxed/simple;
	bh=E+Rkfl9thA//8dOfnT2wGrUmTCO2FAydSwC3bxJd9l0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=INT5PnkSqDR5+A+4g1GsB4vMQ0YK6SAmrfoV/jIO8V42ozkeRX4ay1aZ9oHCX3Phb03LnmorOQhPtbGmru1/JwmmcfGMUjzCMJAEV9FNhrxaKO0G11bY9qOYQdYzN+XgUFhcBBHJUbfmghGkIo5VEkZ82buP8/tlEt0CWtSQ9bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kRFnuJrt; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kRFnuJrt"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so4021559f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 05 May 2025 02:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746437625; x=1747042425; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XJ06MsaCexaUo2LS8xihxLn4rYdIDADmV/TGsLW6+S8=;
        b=kRFnuJrtXOs8urM1bmbJ8Glgv7TRZKyPbRS3KB6Km4Zo3wb9NpoNzAn4YDkw4J1psg
         p+mfW0Y50fcS4uWiRaempd3C3WaNdLIvTkDgB/8A4r1hsOtuRrzSWn07AGOZ6WUABayS
         ZcwD0TVITNMSjS2ayuFqNCCfMVMEvTn4IqcP6abcGp7bTTmCYp+99NUY9JJyvo88UMwT
         65Y0zdt8e5ayd0PE0w1ywVo0EuqEZbGxFV39ElYin8PGql32k40ScYvuRpehOpKOFevl
         ZKW+A4D6gEz06hp/DpmQOTiJJhHdWVAxvRxowwdNZJLLhtFByRYrEgFjJ8WiFuSKV86/
         oTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746437625; x=1747042425;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJ06MsaCexaUo2LS8xihxLn4rYdIDADmV/TGsLW6+S8=;
        b=XGj1jIo3ozEC3MakOHTqA1sTiWQmFhbY8LnnaTQFuXrJaFdlSAhDHreymNF3iOSl0x
         /FfZdlyW0k/bPQ7whoYBPV7mGIg5nkWcn0+zreI0ra11Vhx7CPB70G9GLA/AzUBm+9zi
         bxBuDAWVYHxyOrNfog/rx7s/ArlE9fJJ3wc68sTcUxfQJOjJmmvr7fOTQbq8jBd8Sdiu
         b94oR7s18JLL+zx0G5X+/0B8EQa/XIpTVIsUyAnbW8tMB/UN4cuzrS2RQfKT+lan4fPs
         1AFOcYlR3vmhlbMj1cgmXxtq55/pp/uWD8kD4vXRbke/MHbKw9f6IEPDURdNQBvT2Ew5
         taMg==
X-Forwarded-Encrypted: i=1; AJvYcCWBQHx1J3pVgL1VFsX2K+2z8Mugs6azKGtyUwH0gHyZlIz32yE/SPuMautlPBjGnblYNQyT4RzM96Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWrLMCNBTeJx5DJjO3bV9iM9jxuGggi4toOH47chQzKTwwruSr
	JvGrNO6SoPldGNVHLCIG/+whgyFw1jPG5YPhe7NpQX03bmvGlvlg1r4r8W/YnSY=
X-Gm-Gg: ASbGncv46hwWfDFRkaQ+jYMuLjcoi5BS8N5VjpbOBBGQ+V9qcF4n3dOFTZ7s54FpeRz
	WVQISb/eAXvPpABg5KFuoP55SJk0b4SkHAuP7P6IAN4wCUGmD8QGIIhBPdhC2P1VllV4POemwMr
	IJHal0rXMg/l9kFtnjJT3WuQQeb7AyulWOAq2hJSO/T+2RbesdOoe/JAPs5hPXXgiZy086hf58V
	UWuwvpzsfIn57vqXamlFpSzbhP4ax8BVCBhpntEhWsAhjZxltnrT2G5oAGw3NQ6Op/rn2eC/nAW
	gGoSH/MCUIbblcSJy/OwtqKSZvg8x77+6PXPVSm0
X-Google-Smtp-Source: AGHT+IEQcue1k4XN/UkoNi+0KcZ4JWKSUMbu8bAHoWYr4298di89GdcuReHjmyRCjR7TkE27M3LKQA==
X-Received: by 2002:a05:6000:2c9:b0:3a0:9f24:774f with SMTP id ffacd0b85a97d-3a09fdbf660mr4541275f8f.39.1746437625592;
        Mon, 05 May 2025 02:33:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c020:17e6:57d1:3a03])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae3356sm9664006f8f.29.2025.05.05.02.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 02:33:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: add a clk_hw helpers to get the clock device
 or device_node
In-Reply-To: <20250417-clk-hw-get-helpers-v1-1-7743e509612a@baylibre.com>
	(Jerome Brunet's message of "Thu, 17 Apr 2025 15:44:22 +0200")
References: <20250417-clk-hw-get-helpers-v1-0-7743e509612a@baylibre.com>
	<20250417-clk-hw-get-helpers-v1-1-7743e509612a@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 05 May 2025 11:33:44 +0200
Message-ID: <1jbjs7mmfb.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 17 Apr 2025 at 15:44, Jerome Brunet <jbrunet@baylibre.com> wrote:

> Add helpers to get the device or device_node associated with clk_hw.
>
> This can be used by clock drivers to access various device related
> functionality such as devres, dev_ prints, etc ...
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Hello Stephen,

If possible, could you take that change in so can move on with rework
I'm trying do in amlogic clocks, while we refine the test part ? (if
another round is needed for that)

Cheers

>  drivers/clk/clk.c            | 12 ++++++++++++
>  include/linux/clk-provider.h | 26 ++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 0565c87656cf5c557d8259c71b5d2971a7ac87e8..b821b2cdb155331c85fafbd2fac8ab3703a08e4d 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -365,6 +365,18 @@ const char *clk_hw_get_name(const struct clk_hw *hw)
>  }
>  EXPORT_SYMBOL_GPL(clk_hw_get_name);
>  
> +struct device *clk_hw_get_dev(const struct clk_hw *hw)
> +{
> +	return hw->core->dev;
> +}
> +EXPORT_SYMBOL_GPL(clk_hw_get_dev);
> +
> +struct device_node *clk_hw_get_of_node(const struct clk_hw *hw)
> +{
> +	return hw->core->of_node;
> +}
> +EXPORT_SYMBOL_GPL(clk_hw_get_of_node);
> +
>  struct clk_hw *__clk_get_hw(struct clk *clk)
>  {
>  	return !clk ? NULL : clk->core->hw;
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 2e6e603b749342931c0d0693c3e72b62c000791b..630705a47129453c241f1b1755f2c2f2a7ed8f77 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -1360,6 +1360,32 @@ void clk_hw_unregister(struct clk_hw *hw);
>  /* helper functions */
>  const char *__clk_get_name(const struct clk *clk);
>  const char *clk_hw_get_name(const struct clk_hw *hw);
> +
> +/**
> + * clk_hw_get_dev() - get device from an hardware clock.
> + * @hw: the clk_hw pointer to get the struct device from
> + *
> + * This is a helper to get the struct device associated with a hardware
> + * clock. Some clock controllers, such as the one registered with
> + * CLK_OF_DECLARE(), may have not provided a device pointer while
> + * registering the clock.
> + *
> + * Return: the struct device associated with the clock, or NULL if there
> + * is none.
> + */
> +struct device *clk_hw_get_dev(const struct clk_hw *hw);
> +
> +/**
> + * clk_hw_get_of_node() - get device_node from a hardware clock.
> + * @hw: the clk_hw pointer to get the struct device_node from
> + *
> + * This is a helper to get the struct device_node associated with a
> + * hardware clock.
> + *
> + * Return: the struct device_node associated with the clock, or NULL
> + * if there is none.
> + */
> +struct device_node *clk_hw_get_of_node(const struct clk_hw *hw);
>  #ifdef CONFIG_COMMON_CLK
>  struct clk_hw *__clk_get_hw(struct clk *clk);
>  #else

-- 
Jerome
