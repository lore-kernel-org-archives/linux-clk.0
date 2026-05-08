Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843F5175A91
	for <linux-clk@vger.kernel.org>; Fri,  8 May 2026 21:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778274936; cv=pass; b=eYL8FAX+Kym616YAVInA04zrxCweqg0wxRfuTku79LFyj1JLypWB8xphPSpHx3exKLYO+mWbYNfG+CItJrkD17NuLYSYBPPZhlscHJmZgVgn9mKE+tV+lugAt+O6Lw+/ezDjMw2QMqGnd/JpnmJz60LudeoYJEz12uhaIjYlqQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778274936; c=relaxed/simple;
	bh=AdOmPXJg8zZHVEiRf3olZ41q5CFCGVm7wn2+MOpzjo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H01LXxnVhTSwQAzv9lKzGpVRbG2e9zyZ++nz75A5XpaLGFVZ5ztf38K0ClrrTcAZKFpwYLZ+ujnGugsVg2xAxnsRz6rcn/LS1sb5fORyrPtnybAOdykcCt63AF+ctQ95XNB5DyoL4OMOPdp9S64kAr/2BNexVlSLH6vp9W03tDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NcUhgEG2; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NcUhgEG2"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-678adefbd26so4448103a12.3
        for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 14:15:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778274933; cv=none;
        d=google.com; s=arc-20240605;
        b=b10wRp/scJ13nu/MuRo3VaomXuY3pgDRL2NYrW+QhedQ7inamKelFuvWGnqW0k/t0A
         khwnVnCtWaIrgM3LFMAfl3HIKfxT7hyHfiBhIxB9hRwWN0NgTjJXiGRaA0G1GL2NfRyB
         lX6pby8AXfFmPnS6Gc8Qe7wtGZFruSaStDwHrQOWNEjxO6P8F/6yZrdsRbSGgAo9sQdB
         awiGR+r0EJSo9XRJlTlfijGyBi4/uKRtfEfl4592YrbFnjuuDmpuWrJ1+T7uIjBJGQsP
         O1yCNrgprfdciTEkAh/Ovkxvi1oT+cZVp9hOS3DbGrI58UmzB1F3p/jMNZn6E0kUgbZj
         bWEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sF4SuvsEGJOTrgo1Gj2trBLxLXz0XZiSaOSESpUWpCI=;
        fh=pcgWHySBVoiAf6XahlCr92/w4riig2+uxnzjV2NdWII=;
        b=ZxoS3MIL3psT9F+yD/onaG3GHxQrZwhI3ppVBybl8LyxfTEpCl4ZmAuuZB7BWgZFHZ
         0vZEATI53W5bGDG2C1M1kjsp0CaBDfyIOt3D8sZtd/oquYIug8MeNuR7ohk4I/0w8xzg
         0Y9gSl784rD6phba3uijlnU2lVmAhCEWhq6Yfzfzo0+1tXHEWmA+dr4p/5fzHrtTe2Pj
         9XDvrkGgoa2fXuEXIbPRIj+L8/56P50XVG8g7q7td7/AuaabINlkwHiOLsbSHvkBLZPS
         /Z81mQiu3+wME0iIzR6+bLgu82/gYU9Uf3Fw401V1diOf5Mi4XwxveDHDMeeQLn11hv4
         BILA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778274933; x=1778879733; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sF4SuvsEGJOTrgo1Gj2trBLxLXz0XZiSaOSESpUWpCI=;
        b=NcUhgEG2pfV1qvKToK2GQYj6dVnWyCXC9Lps2AT5eGWl1vvgjQb8RtJjNgTy1FUT1e
         F+CwuOpzsrlAem7rzLkhhHQeEOMYVw8tlPOpl66EZ09OiOGq/j2+8+1N62iSij1mMenI
         rifeA+svDtveqQ+g/WhyuiiVFANwJVc/+518F0EZyghACeRQqoqdb1UCAm6/Eb0LCcLJ
         nkggyF4BPYh8LJT5Xg2rbk5iWpNpFE6UrjEiWuiXmKR7sgr6zuVj8cQqTrDazi/QBYJ3
         1emkqDJU8j1a4eFngfA/KRVZXP1/BTPAyR+OKgo9nQwxp7hxmbn+7WmiK2tNQ0nKKygf
         /8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778274933; x=1778879733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sF4SuvsEGJOTrgo1Gj2trBLxLXz0XZiSaOSESpUWpCI=;
        b=g1+gLXRBmwPoTVnx8YcWGqV2XBlCsvXqWUFFXIBo1c5jMDg9Ew1ov8yVjzSYyqw71U
         /0apctJN7rvZhrldpouZwz/QgGcOO1irMHMReRpS0ldjUHaxuC5G1Emggq4jO85whFVB
         lri6SknrKm0+4xePuG6mtYlbgmmpEgORDxk7DC0HvvSYOcCcDvuL50gHOB6ttn+wweAF
         TSsEFFYUW3jBkQ54MH4quPV+b580ursbwD1DbgeQ3FNN37UxAO0/XZCYi1VzEgXUHEr2
         2aSrrMksgGb1hvLjFRafA25g93OO04EZcEOViRoLXCEnUN5mdexW2KmRXl2CWJ0/6KML
         rmyA==
X-Forwarded-Encrypted: i=1; AFNElJ83mhwqvL5ox512Pcfk2EqnXdNp4XFX5rpdIpH81j1cN4zIHQo7h0Bde9JlSu7SxQo33eI908uUG2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiGf7ACMJa3beSC/2BSdG7PWcVIOfK8LcMF+lzSzr9q9uq6VEx
	jeWHBkTtBrTKMZKIDBxXihTk+uE6VIhdDzHTWKds+bOs/suZKwMif8ZXd12Is9aqWrCQi95QRPS
	jBLvVB/4siIVzpbkfG+CPsFJbGEVp/kmA2QwKb6QO0w==
X-Gm-Gg: Acq92OFxJtoVxygjqMi/6mRogeOUrsMI/yBMVoyC+Mpr/WQxkbB3WNYeOqR8/RXBke3
	J3hf8B7iL3yb4LlD0TMs6+WFo/9av4RE7scwvOHCQbBwTQ9QpdcFZVQ09g+l/2tvgAsBfCZONd0
	8HWuIrxdG/ygfrVQK4u4hR7nghLjxbwJ8pqQ0IzkOyVSMW/f4GHMz06pRPuL2bEE94brNlUIBy8
	VsBncjcJqIVCKkvHxrBr3h1e/Mp+NSHwpRpuGKBzjhIBK5/1QX9GxiYfJIemEJZbf2fUV4wDWY7
	DsPx4G0o4ik+QcwyERMSt4HoAcL/HSKJR1OKutDxcNGZVxMtLRDM
X-Received: by 2002:a05:6402:1ec9:b0:676:9c6d:5c4d with SMTP id
 4fb4d7f45d1cf-67ef09b24c2mr2202764a12.17.1778274932823; Fri, 08 May 2026
 14:15:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org> <20260506-acpm-tmu-helpers-v1-2-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-2-a9cd5daf8355@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 22:15:20 +0100
X-Gm-Features: AVHnY4INLr6tr26Lmd7iIN0VZuJDb4bQSnp24OgoULrQQwKG8Z2swPkqXTHOYdY
Message-ID: <CADrjBPqdZrpRJwgHknygW9rdB5rj1W69L26qoXwuHAgVcjrG3g@mail.gmail.com>
Subject: Re: [PATCH 2/6] firmware: samsung: acpm: Annotate rx_data->cmd with __counted_by_ptr
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	jyescas@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 May 2026 at 12:39, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Rename the `n_cmd` member of `struct acpm_rx_data` to `cmdcnt` to
> maintain consistent nomenclature across the driver (aligning with
> `txcnt`, `rxcnt`, and transfer helpers).
>
> With the member renamed, annotate the dynamically allocated `cmd`
> pointer with the `__counted_by_ptr(cmdcnt)` macro to improve runtime
> bounds checking.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/firmware/samsung/exynos-acpm.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index 88a06842753d..fac88c427d2a 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -105,14 +105,14 @@ struct acpm_queue {
>   * struct acpm_rx_data - RX queue data.
>   *
>   * @cmd:       pointer to where the data shall be saved.
> - * @n_cmd:     number of 32-bit commands.
> + * @cmdcnt:    allocated capacity of the @cmd buffer in 32-bit words.
>   * @rxcnt:     expected length of the response in 32-bit words.
>   * @completed: flag indicating if the firmware response has been fully
>   *             processed.
>   */
>  struct acpm_rx_data {
> -       u32 *cmd;
> -       size_t n_cmd;
> +       u32 *cmd __counted_by_ptr(cmdcnt);
> +       size_t cmdcnt;
>         size_t rxcnt;
>         bool completed;
>  };
> @@ -432,7 +432,7 @@ static int acpm_prepare_xfer(struct acpm_chan *achan,
>         /* Clear data for upcoming responses */
>         rx_data = &achan->rx_data[bit];
>         rx_data->completed = false;
> -       memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
> +       memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->cmdcnt);
>         /* zero means no response expected */
>         rx_data->rxcnt = xfer->rxcnt;
>
> @@ -584,19 +584,19 @@ static int acpm_achan_alloc_cmds(struct acpm_chan *achan)
>  {
>         struct device *dev = achan->acpm->dev;
>         struct acpm_rx_data *rx_data;
> -       size_t cmd_size, n_cmd;
> +       size_t cmd_size, cmdcnt;
>         int i;
>
>         if (achan->mlen == 0)
>                 return 0;
>
>         cmd_size = sizeof(*(achan->rx_data[0].cmd));
> -       n_cmd = DIV_ROUND_UP_ULL(achan->mlen, cmd_size);
> +       cmdcnt = DIV_ROUND_UP_ULL(achan->mlen, cmd_size);
>
>         for (i = 0; i < ACPM_SEQNUM_MAX; i++) {
>                 rx_data = &achan->rx_data[i];
> -               rx_data->n_cmd = n_cmd;
> -               rx_data->cmd = devm_kcalloc(dev, n_cmd, cmd_size, GFP_KERNEL);
> +               rx_data->cmdcnt = cmdcnt;
> +               rx_data->cmd = devm_kcalloc(dev, cmdcnt, cmd_size, GFP_KERNEL);
>                 if (!rx_data->cmd)
>                         return -ENOMEM;
>         }
>
> --
> 2.54.0.545.g6539524ca2-goog
>
