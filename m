Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC24337110
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 08:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761813672; cv=none; b=KzvutATSXiPBuAoA5C0sEkTpmqBKu1flu9kHqVgRbnCX5Oo2voSVcMP3T+GngFSNB8tIxlg+w1457LwhevfoHUH1fzMFzXaMokxI0ZNrd9ClEK4iP3YUYQJBUpmdxBo8vwPVDrzb3O/eC20lsrCBkC+sR+YscGlWHCKKF9tnJm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761813672; c=relaxed/simple;
	bh=jjcYsGRKW7uvKP+ugbkLpV4PJ98w/smU3/AsOL2MCMk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i3yLZkzRUM10Li6ZQUcnJ0KIjjEoMhqyJZbveqTmSeQ8LKXW9NeGcxtCtZaSUMq8nAIgvEt68Pn2Jx9OBxmISsWtmGXS3Hhz6OGz8/qtde0JKt/BHJLJRqTAzT1aBMwcdoIzaTcckAyIotB7Iqug71gZiWfAAfe/XnCjLoILOZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=02ciOq9H; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="02ciOq9H"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-429b7ba208eso245967f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 01:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761813669; x=1762418469; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VU8uRCsjTSwrlvmYL3d8u/PULJsMie63xUHiHDK3zBs=;
        b=02ciOq9Hyazep3goEe6AqfMbdRmv+dyKZp74IPhNpuW6pDmvLo7zzRB+VDF6nO3j+8
         qFwI1evlXeuowwolzoVgvFQccU3qqAfcWxEvdyzbOihkkoQMtTUijeni5YOEJLd0NFsB
         8k/NX51ny2EnPHyoZVHMA+Ncar1Uc/4UK8Fwz2fGLvPUGTIQV2roxPqxrOW2zPwEUtsz
         BJ4wJ7VrVJ/8uy5ZoqVoahOoGjOCNJRmeFd7RV7Q+80vhAkIM2ctNAsoxivLV6mwZ8ei
         Z75tUvkGlBQLI5NJnyqLgKghbegk22jSJiShTu6B9wHmqx59nL4PwJ5seq5SBk9gt33P
         ropQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761813669; x=1762418469;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VU8uRCsjTSwrlvmYL3d8u/PULJsMie63xUHiHDK3zBs=;
        b=uWO67nPQQpSVwyg2Vg4eaExajXzMH0+vp/SCQi5bOHt4EclxWwmM5FN/vTSP4jKEgs
         AAOKwZquP37yiQgd5K95YbJ1J217yDlE89ZWHVrmJ99Ndv104TFtoNfQSjx7SRCVpZRw
         VloPSKyzhDSsC0b6+CJcUuAuyF3SkeMXzLEMsi24SLuVWLUOb2I8JZ1kkKR95ODI9K15
         lTMaOqDGANhFyVWSsQdf0sEy54PsThUTFyzLKalUkYj2Htf5VZhQhcjfhj9BmDqBQgeW
         B43X2ZrHlDhCH0VIhDEA5lGdwYKZrMp13cl8PQPhfsMW/3g1TGL4WEDHx/FEdvjj1oSZ
         JulQ==
X-Forwarded-Encrypted: i=1; AJvYcCURgJdwdp29tI8LmnIheNO00BAYhtgqdOJ1IffRuLFv7OOJ3on1vG1L8G53lleTDBoXLcRXSXxsFio=@vger.kernel.org
X-Gm-Message-State: AOJu0YyemPq1fc1TKDIPNz3ZNZFE/mEw8YQ7B7niP/RWyIbvuUPLYkDx
	MdJy46Bfm4pECA2Zj1EsmHt76ScDjdouvgn49A7zE1KplFftztofHFgSed5f+4Nkxt4=
X-Gm-Gg: ASbGnct5pc6xY+r/LZMHBz4aYIbBRgS2QNJl1FXA+FuzMEznCNCd1M6E7HbiA5dnZo0
	YX3936HIK8F1QmZD1+mxnAXsAOBYX9O2Fp3aD74Y9siamvvCpc6enJO9PtMqr0Ut1z6cnN2W5mz
	JQYo+wYR7bj8secqsOkARUmq9gQi+uAzdiDFardHurpU7GnF9sNYg32l9gatmAK2YgjIeRoKin0
	DCYE3ntP+bI/SAj1Uf5X6T2lcfUFzDd/sFN5d8CCvLSsQ4eWkvH9VIu1WnJTT+dzR9AYwfpzCOY
	UwggsQCrMd7+JxtlahaHbh8nH0K4/hSrdF9TaC1M9FDpZiVXXZlxa91Siq0VlTlkEUz21eoUGuP
	sKQhdP5kcZKMNwkKYbQpULWrAFt3Z90lNHY5dxBETv7yB8jqyNyVHDiQvLDLRXSAUqgpwh5wssA
	==
X-Google-Smtp-Source: AGHT+IFwKPzXQBj8+qdUcovmW5nKytQ1wr3jkj35PQinv3BFL4IiVgDQRKAM+0DPrZKXF0WjOPRCMA==
X-Received: by 2002:a05:6000:25c2:b0:429:8ceb:ac3d with SMTP id ffacd0b85a97d-429b4ca2f6emr2088198f8f.56.1761813669384;
        Thu, 30 Oct 2025 01:41:09 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:64bd:9043:d05:7012])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477285d1e43sm32002085e9.0.2025.10.30.01.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 01:41:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  da@libre.computer
Subject: Re: [PATCH v2 2/5] clk: amlogic: Improve the issue of PLL lock
 failures
In-Reply-To: <20251030-optimize_pll_driver-v2-2-37273f5b25ab@amlogic.com>
	(Chuan Liu via's message of "Thu, 30 Oct 2025 13:24:12 +0800")
References: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
	<20251030-optimize_pll_driver-v2-2-37273f5b25ab@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 30 Oct 2025 09:41:07 +0100
Message-ID: <1jy0osye70.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 30 Oct 2025 at 13:24, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> Due to factors such as temperature and process variations, the
> internal circuits of the PLL may require a longer time to reach a
> steady state, which can result in occasional lock failures on some
> SoCs under low-temperature conditions.
>
> After enabling the PLL and releasing its reset, a 20 us delay is
> added at each step to provide enough time for the internal PLL
> circuit to stabilize, thus reducing the probability of PLL lock
> failure.
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 629f6af18ea1..f81ebf6cc981 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -368,11 +368,16 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  
>  	/* Enable the pll */
>  	meson_parm_write(clk->map, &pll->en, 1);

New line

> +	/* Wait for Bandgap and LDO to power up and stabilize */
> +	udelay(20);
>  
>  	/* Take the pll out reset */
>  	if (MESON_PARM_APPLICABLE(&pll->rst))
>  		meson_parm_write(clk->map, &pll->rst, 0);
>  
> +	/* Wait for PLL loop stabilization */
> +	udelay(20);
> +
>  	/*
>  	 * Compared with the previous SoCs, self-adaption current module
>  	 * is newly added for A1, keep the new power-on sequence to enable the

-- 
Jerome
