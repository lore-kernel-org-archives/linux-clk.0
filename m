Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B761932C94A
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 08:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761813515; cv=none; b=XKCy3/pokpss0/xil735nTiblwRuimWG1N8mRr2p3kSIsQN84qZwaKee3Cp9Bb9bwRMr8Kq7PaPjSoQnXssB8PxUVNMQ29oG+82HTTPf6ZN5cqb86RrgkIJ6e2ZmD7mEXd2i+lX0P9JFYqNhq7S2DkNmAFGDKEnO5RNcC+wywdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761813515; c=relaxed/simple;
	bh=bnNftVFQXjZyorc7GhSgaJgVkTxOej4kNzmLyM/0BFc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tnCXGx2uAM6bJCbevzvhdUGJFeKyaJgsJNlpaXsYxs+y/aSyC3Ut6a7Ir8WxA28p6EEkx0VxgumxwQWc2BQh3RDJTh8VpFjum2htLeVxZ8d9LscLddxXM70XtyGrKzQhwmW5zNLFRxJoGWvQcjHuwfbr5JRnej+8jHDUQmvyL5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NEhp79xA; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NEhp79xA"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47721293fd3so4660545e9.1
        for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 01:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761813511; x=1762418311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcL62a5hHqNXI6ber/2x37lX4UAGBk2bkZQAgf4AoSc=;
        b=NEhp79xAd0iAjDFjO5YTzMftMB9ckkilT0Gc8et7EXpXW2JPuCI+XA0qz2d2l9WEzj
         PCH7wAl9B0XitUGRzIMsx4iNnPRdgqLqUpJPZSMwEjMWFBpB3k2M8wiyryXEL0tiMXtp
         9Pg2aZ0cFjdJc8h7DD/Op+QWcoC5cMOQusTqtMd0kNIXZf3PgtB5gzPVbl1a0trZdB0R
         0SoQJkZaMbdgyv1M3r/zcOhRygmlplIdJb668dgjbGQHjsidHLlRoNw/xFG5946JXRn0
         YHrW1uclW4luDj1TrOhtHrO4c6sCxThoFIW0g/WfFwwZIMiZEzdB6aKZPf9jQfwLn9fA
         HBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761813511; x=1762418311;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XcL62a5hHqNXI6ber/2x37lX4UAGBk2bkZQAgf4AoSc=;
        b=suaVBel1S03R1V9gcmgfjinG9yKjXGmBnPE68eNvRS/+bvl68ZtFcX8kkZkTJtSuHj
         AnxEuKXeZ4Ib8WLTqMptn3gp9x31jHxflXTz2QnpwWx/OcFUeGfFEAS8+H6N2Kkwzfrn
         pRRO1Rr9mXCpHThCHgVbQfPwlaF5pgkracq7dbOwuVybG6sviA2ewuAxGt8VCxx5bcEZ
         zCCTGDPoF8aEJrZFXwnA7pm6wkna6wYcVEmasZzLB6VZD8rzLUP8OUGbRiOXCYa45Z0y
         G38P93UkCUIehELc/2Rh4nudbFY5u1MC0lBpr0Yz8NQqw2jTWSrtpzxx5qEpXNd8uQLM
         fsoA==
X-Forwarded-Encrypted: i=1; AJvYcCXCEEUFn5ki96xMS6S6h+kLsw/aSZS4b5DpRGWgZe8d00G6474qGk0Hc06nn6NAy4akOCWqDoTR4ig=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK8P9IUlW5J4yYSbeNFKM7REXhjEjGPkAuW/r7Tg3vQJoUENC4
	XpJH1x2ANDU5EULW8orVFRtrht2c5ISstJuc5k0lgh70cdrwe9Ta0df3fBX+F3Yy1ug=
X-Gm-Gg: ASbGncsSMRaMK2a42MUw4r/ybmZUlchmoLBLg3Vlr1ejANXdz9eBbyGAYxb0xoLrb9d
	sbO3i3lfwkL8Um/q/1JwC/iZXewH8ESpRb/mGtoXjTvQCFzL2MZl73hzzsuuX8jnvVET/RtfkFp
	2qk4HJ6NzAFZ+lcjTn6+emXF6TSXoS3+0AME+EQYX4/j+Mr6mQ8v4OHrkWR2wuQ03wDqaEMsuFg
	1sCKd0yvUC/Bskct5ynf4JFCvsRYoSjRyFTBlrekkmvznvTkIF48HHsIB1VuERn16437O5DmaHL
	FH2/bV9OmsoJYNSgeKa8Kzz+GIWZFDHSO6tSAhDkShEpyR+7JOaQkkZ846TxJjplzTD0sRN7JQF
	nUZAWHmFW4tEsyh0tglRS1kLAsSWdOvrPHn2NTjzuuxLQpAnjo8mLUgBReOl0PEU5+LKxAbjM1P
	HPOgxZk21v
X-Google-Smtp-Source: AGHT+IGaIha2nuoz8jrt+cE5pgI+VJzm+ijZNjpXMyU/F0fQvHyvDhStIYNXWfm/PBDpohWawi3FOQ==
X-Received: by 2002:a05:600c:44c9:b0:477:11a0:b746 with SMTP id 5b1f17b1804b1-47726239d25mr15315075e9.6.1761813510964;
        Thu, 30 Oct 2025 01:38:30 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:64bd:9043:d05:7012])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477289a57fdsm26741525e9.7.2025.10.30.01.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 01:38:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  da@libre.computer
Subject: Re: [PATCH v2 4/5] clk: amlogic: Optimize PLL enable timing
In-Reply-To: <20251030-optimize_pll_driver-v2-4-37273f5b25ab@amlogic.com>
	(Chuan Liu via's message of "Thu, 30 Oct 2025 13:24:14 +0800")
References: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
	<20251030-optimize_pll_driver-v2-4-37273f5b25ab@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 30 Oct 2025 09:38:29 +0100
Message-ID: <1ja518zsvu.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu 30 Oct 2025 at 13:24, Chuan Liu via B4 Relay <devnull+chuan.liu.amlo=
gic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> l_detect controls the enablement of the PLL lock detection module.
> It should remain disabled while the internal PLL circuits are
> reaching a steady state; otherwise, the lock signal may be falsely
> triggered high.
>
> Before enabling the internal power supply of the PLL, l_detect should
> be disabled. After the PLL=E2=80=99s internal circuits have stabilized,
> l_detect should be enabled to prevent false lock signal triggers.

You to reformat this description. It feel that both paragraph are saying
the same thing.

>
> Currently, only A1 supports both l_detect and current_en, so this
> patch will only affect A1.
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 6c794adb8ccd..c6eebde1f516 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -383,36 +383,38 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  	if (MESON_PARM_APPLICABLE(&pll->rst))
>  		meson_parm_write(clk->map, &pll->rst, 1);
>=20=20
> +	/* Disable the PLL lock-detect module */
> +	if (MESON_PARM_APPLICABLE(&pll->l_detect))
> +		meson_parm_write(clk->map, &pll->l_detect, 1);
> +
>  	/* Enable the pll */
>  	meson_parm_write(clk->map, &pll->en, 1);
>  	/* Wait for Bandgap and LDO to power up and stabilize */
>  	udelay(20);
>=20=20
> -	/* Take the pll out reset */
> -	if (MESON_PARM_APPLICABLE(&pll->rst))
> -		meson_parm_write(clk->map, &pll->rst, 0);

Why is the reset moving around ? nothing is said in the description about
that

> -
> -	/* Wait for PLL loop stabilization */
> -	udelay(20);
> -
>  	/*
>  	 * Compared with the previous SoCs, self-adaption current module
>  	 * is newly added for A1, keep the new power-on sequence to enable the
>  	 * PLL. The sequence is:
> -	 * 1. enable the pll, delay for 10us
> +	 * 1. enable the pll, delay for 20us
>  	 * 2. enable the pll self-adaption current module, delay for 40us
>  	 * 3. enable the lock detect module
>  	 */
>  	if (MESON_PARM_APPLICABLE(&pll->current_en)) {
> -		udelay(10);
>  		meson_parm_write(clk->map, &pll->current_en, 1);
> -		udelay(40);
> +		udelay(20);
>  	}
>=20=20
> -	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
> -		meson_parm_write(clk->map, &pll->l_detect, 1);
> +	/* Take the pll out reset */
> +	if (MESON_PARM_APPLICABLE(&pll->rst))
> +		meson_parm_write(clk->map, &pll->rst, 0);
> +
> +	/* Wait for PLL loop stabilization */
> +	udelay(20);
> +
> +	/* Enable the lock-detect module */
> +	if (MESON_PARM_APPLICABLE(&pll->l_detect))
>  		meson_parm_write(clk->map, &pll->l_detect, 0);
> -	}
>=20=20
>  	if (meson_clk_pll_wait_lock(hw)) {
>  		/* disable PLL when PLL lock failed. */

--=20
Jerome
