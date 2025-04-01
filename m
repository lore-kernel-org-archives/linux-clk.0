Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75E71CD21C
	for <linux-clk@vger.kernel.org>; Tue,  1 Apr 2025 18:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743530584; cv=none; b=T2c9FV+h+5zg3dA8OKT8iwcfl2iZ3aTX8zNdoYPtK6+bgmKpJ6blu2JohXf6+T23Hf/LEu9rWIDvi7pYiRsmV8sj/qhh8N1LXO4ro7T91snHFFFb7o+vu877wPFEBo0qo5b04RiIeC7bRoV/GAo3gEyBO2jD3BDTtddWAKQ2zaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743530584; c=relaxed/simple;
	bh=dmqg5GhAnNOYRTKbDo2x0+pPDeIiIFeQ0zAhtcA6Jv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FTxt/BGAxBZoT0v1IxvJuIBmVaV5TGJetc4bei6isbN31QiSnQ+WAZIccMmYQOfYU85WRMp+z4kgt/QHXYknUCRw7pQ6Zvik+41kHOPduaGbBy7FryS0lwk48QWGQ70s4fJanmYt5hrqEfG+GBtDkIF43TuXQkcSJ2ZWU0T1/hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=bZUQmI/Y; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="bZUQmI/Y"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e6405e4ab4dso97874276.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Apr 2025 11:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1743530581; x=1744135381; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RElqtDNXiao5Fe66tX7PbQO9u80Hzs14f9V2tQZKzpA=;
        b=bZUQmI/YoF6cyS+u6LKi5Npktu1+3Tw8+8O5K5vXR8FAxe7fx6LTiUiUT7jawTm2yz
         +e1XtQZsKSEfWB/8BZH0rUv0hrvZksHCG1rCMkYvAoEcgMosX5Kx4+q9IdNGOBv50SC0
         SDXCEIPfTifSHv58Bhn/b91eMa7bGhgTuN16DUrnbak9b3pM29NDb6a6g9hHve2efaGz
         Z22pzUov3xECKaue0MwIqKTkIl3PWjbjDdEZdMZznxdrGmgoyghco7N6MwssqaQs+fZe
         mvhuGYPb90KXKdD4/R90Trj/Igp87aMUvTZiZu8y/uyjjukyC31qiRijciJ2t/pX6KkB
         f4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743530581; x=1744135381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RElqtDNXiao5Fe66tX7PbQO9u80Hzs14f9V2tQZKzpA=;
        b=lhmgNyysdWDS1WsJwIUSZu06duK9bEIrYdk41J1TLariXL1kj03vt5w4XiOvaXtrlx
         SdgguAhIlLg57wkj4KbEAxnylEg5HNGQjocjpL3XpyNNsxeneyWI3Zke5qO+fwMsi5BO
         x0vPpocmkzaxuBjcQRNVKHqqy47TE0YrMoVYb3/D8GWNfS89rrOeqHTUvI0EEkCnpLQh
         FIPOI7L8zLTJ4t9QNIialQuKfwlwo+J0RZItazJ1uvK18Qc8fgLeaLE6kEWJ3gXU4j1j
         uWrilD2/mweAEzc7QRBFMPYO8A+iwjMX6Q5TlGGO5JUPYv+cZctAIyeATV+6tfNKwtJi
         IxAw==
X-Forwarded-Encrypted: i=1; AJvYcCXvoD3Bdzp+hVujAwHASLRym1CuvFDK5J3kioRzggPU0GrQ7n3n2sMzT4aErpXg9GiFhUSWXE0CyRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzab8mQbIJblG5Aj4YdRO3v4MWQF/ElHQU8wXIEAD050KMyEAnS
	oBt1SSA1ZXVyHXSSEghu2naPhn/PyV/4RcEFzaddGwL50iq9MvSi10syYu/MYCpy1UbrZSOHrv6
	k+13kXvgYzgUqwjlCucMs+aMZSQK8vP6QNU30pQ==
X-Gm-Gg: ASbGnctLUZVEX02CUDJw4zgX43JfF3n30biHXjVV1LeuaLodtXG76Q2acz2mtLF0dbe
	CVOZWECXMfZFws4iMrKg6OiBsX117GY917FUoUMK4Mci8V4uZFOS7xve5WrrMFnwN31lVo7zJhX
	Gh2FZp1fTzWFZk5HZxRPIMVbM7XHLPvjbflnkS+NlwuwW37forJbQbbkr0Ig==
X-Google-Smtp-Source: AGHT+IEAZ9awAdsvEF18jxvMFTvl6qOXCPx2YncirI/WvgPAq+emAZx1k23zW+DI5dEunJl/9DWT7JfGSiLy6Ulrod0=
X-Received: by 2002:a05:690c:6b86:b0:6ea:8901:dad8 with SMTP id
 00721157ae682-703b65e9521mr14267287b3.3.1743530581705; Tue, 01 Apr 2025
 11:03:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401132324.27312-1-bsdhenrymartin@gmail.com>
In-Reply-To: <20250401132324.27312-1-bsdhenrymartin@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 1 Apr 2025 18:02:41 +0000
X-Gm-Features: AQ5f1JqNWcGg680Z3tQAJYQEnY6EuyQA4mTpaPDzPlzakkRAMGdaRw5B6PW0Yrk
Message-ID: <CAPY8ntAFHW3kiqCnXjFtzL9FnRoQ69v8+3yJ+jR8_W8Bb+6d8A@mail.gmail.com>
Subject: Re: [PATCH v1] clk: bcm: Add NULL check in raspberrypi_clk_register()
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, popcornmix@gmail.com, 
	mripard@kernel.org, u.kleine-koenig@baylibre.com, nathan@kernel.org, 
	linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Henry

Thanks for the patch.

On Tue, 1 Apr 2025 at 14:23, Henry Martin <bsdhenrymartin@gmail.com> wrote:
>
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> raspberrypi_clk_register() does not check for this case, which results
> in a NULL pointer dereference.
>
> Add NULL check after devm_kasprintf() to prevent this issue.
>
> Fixes: 7dad8a613185 ("clk: bcm: rpi: Give firmware clocks a name")

Nit: It was 93d2725affd6 ("clk: bcm: rpi: Discover the firmware
clocks") that introduced the devm_kasprintf. 7dad8a613185 only changed
the thing being printed.

> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/clk/bcm/clk-raspberrypi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
> index 0e1fe3759530..720acc10f8aa 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -286,6 +286,8 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
>         init.name = devm_kasprintf(rpi->dev, GFP_KERNEL,
>                                    "fw-clk-%s",
>                                    rpi_firmware_clk_names[id]);
> +       if (!init.name)
> +               return ERR_PTR(-ENOMEM);
>         init.ops = &raspberrypi_firmware_clk_ops;
>         init.flags = CLK_GET_RATE_NOCACHE;
>
> --
> 2.34.1
>
