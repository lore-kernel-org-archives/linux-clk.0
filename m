Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34A63358D6
	for <linux-clk@vger.kernel.org>; Fri,  8 May 2026 21:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275689; cv=pass; b=SoNE/3JrzoytZlqQu2an8KlN1f/cm2qrJGlB2pk2MW8kjtL3cKwKBRG6WbPtydM/k7Asrh5xgg38ATgA8cXh9qmqhVe3Wv4/cU21NcEdDw7YK+Iskx5UZ7ELHLksknk7J4Qyu/7GhWheqPU4qwJIyfgbAPA5Q4wDzqiX+LtJlAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275689; c=relaxed/simple;
	bh=6A68+dfr/d+pHkYNchrRBxT3co+NdL/w8uNTbJYvy6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uDJ5h2wZmMaAZnHdlxVJ6Z3oG494dB+3C2cPHqTYLqYGlKchPZRdbxGV+SOz0lmlW9cqmZsj/TbGWwWWxONVAf5NZKLio/FhJWk5voqt3ix6H328ikK50zg8GkjXigVKI3pKuQPnUZjcQOQvA6fqUwHiKp7yxJexOHnz0NrJyKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SYSNzrjZ; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SYSNzrjZ"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9358dd7f79so404656366b.1
        for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 14:28:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778275686; cv=none;
        d=google.com; s=arc-20240605;
        b=YknVRqTLqKkF+h7ik3SQwqscwUlPT60quxH1qfxBfuRYeXioBUEQrS4DwyC28O1/sG
         2Jk/S7/kEdhbozXoQejMzPN6vc6rOD75DCFDEEracO0ruDVRZEJ+vVMqiviQEKUMDeKX
         p0l5UyEBmWET0NWTPBwKzxm9jC8AbtLD/k7hz3GJ29KmZBNIyRYOoF43Uu6TcdV1sB9M
         a5cO2tSyNadZ3+eI8mA4Mh6bUOM+3jllR+Tysr06DTLris5Ea2Tn0Q9Lhprm/IjIPguT
         tB1kJdq8dy2gyQv6LW23i2fD0UuPlI9aAGknPcyawSHHIZeaxX44AHc7MKV+7lFxbf2K
         rb+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f+9T2opq2Jf9+yahtQzhCStP254LOW+LGHWIgTifG5A=;
        fh=Fdq3QLzebNflRO7qXDIGp/gJ4RUX0gpvYA26awbHxek=;
        b=aqkxHG0HxjoJFzRRu+VbRLf+JeMMuyWhZ1AzopEXGMP73OCnj2QhJhiDtFmLRfefQ+
         EngsW+4xk6CX/NsKjAp3H9kDwzmMb3kfhq/CNREmQYISbKD6O/+HNPGO5vsTV2HcfF6e
         RbzTQ2rwNlKls9ZgnhMT0aJ8RfiAbglxrM8YdK6WvW2EwYJn5TVF0NuCf6qgJWLYmNdY
         YG4U2QDw8JywbMoGNhLbwrAvp8unK/AfJ3tDRkejlw/Xwpf9ITGokwnbBhcLpoW0JWjo
         5PZHXql/W8tXz2uWTX9nNfJa3AAGChnpIZynkn3tXbLD2ZRXz7pld8e+8ONhmcF8tXmu
         CjYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778275686; x=1778880486; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f+9T2opq2Jf9+yahtQzhCStP254LOW+LGHWIgTifG5A=;
        b=SYSNzrjZxAkp+BQvd7UVXPTZvpfdqqvXeR01C0tPTrKJHKzu26ZMzjwr2N9xz8IJD8
         658JQJCGZtDp2xtAg6YlMpyTHIUhvlg32Hn5sbztWB/IXIz9b6M03saPeGVQ7zfubU42
         wh0txolqeAprk3/1MQeixqbB9e26FtVImhgmFKl/t08RtkJDK5JmPQlAIy10kZM9fGSk
         1xnX+knmotI9VoBXAwbtRXcgii2k5i/OD84CJ5JeA5z4907ETETNaLUmKw1x4WYBhMIz
         iXjQ8e+glDs+5u+DPmUoOVx0b0aPxU8Mf2mG3hoaeDY2UAm/mscJ/rsQ2/UeMINlY91W
         gT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275686; x=1778880486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+9T2opq2Jf9+yahtQzhCStP254LOW+LGHWIgTifG5A=;
        b=daOpjDpu+Q5fT/SAhSRPFQo5J0w1rp06RcPyt6ToICLZ7nuU4EyfmILr+n8Cp9+2mN
         f6xQ9R6ySwkYtGenUBr25sDHAyZUJYz2oNh7PSyxgeljBKuXaJsexgUG9UY4lLXNyZAB
         gDBQQgTadi9RF0G4WRBbO0cPJKW3LXaHS7mohboNN3rnGoeDb10DOF9cQ9KzOkKedbVL
         xs37pgfmER5m7XSfrF0d2h4PJCXJzA7+/jIWlTL+t+XzAzXxhrV8GDsBz+x4VQM5Azh9
         3rmFMkh2ALtRgc7ehAtBXgiasuOMOEPh4qHjBhFH4Fe0os9zJkug2iaf+StuWcMbmTZw
         BfpA==
X-Forwarded-Encrypted: i=1; AFNElJ+SUfZ3P40rzgur0ZlvgSl6I/eiOdHoVJOIbOrEbothgBxLPh2aEepVPlCjyzi7Q4i71iH62V3GtIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGUBw8gGhERdLOu3GOR7SyWh9OmDcbMHR+zzrWWHKQtZyuPxmh
	+RG6T+X74CmDWgF3bpIEgtS+eAUlKPpFiB3t6RRtKRbtx8jDjCLMrHl+0B1SNbjVJk0qh3ar8vM
	643T1MtZF3X5eQwbYVaPcJjSZ0LNTYkusbbV4DRpRCQ==
X-Gm-Gg: Acq92OHI3UwdTFJaAje0HPlNSdA6M/zibs4YgdEZW7H/rUME1wabEmleGtDgMMpEGT1
	IHLf2uvnZJZ810+sfG9vQUNiOfd6Z4ycVevIMZcjYBWDMm20YQujPNH+YpoVCSd4dzvSX9FXyDQ
	oGdtEad998GIMtHsLGHwOrwePCPJrL0FomnxI2MpBzwAuo+0nG7bx5WxzRRX/Vg2tGEPPHIvTvE
	a5LUpJm1eaBkDFMcdYopAgw6ePErb+pFhsUrbiNuf3L1AYzI8synB/mzTWFCkXatxxaDud4aBA+
	kqvU7yFy3dqXnkXk7VUakHgA2VtnJoFnPUesBB2XUA==
X-Received: by 2002:a17:907:868a:b0:bcb:ea69:39c8 with SMTP id
 a640c23a62f3a-bcbea694c4fmr29891466b.38.1778275686056; Fri, 08 May 2026
 14:28:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org> <20260506-acpm-tmu-helpers-v1-4-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-4-a9cd5daf8355@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 22:27:54 +0100
X-Gm-Features: AVHnY4LpLOSjFyVaXAGyH7bOa_gQLppEIJLOzpAApaqZ0siC-A8__fDWDoAHaHo
Message-ID: <CADrjBPry4yQXjc4MLVFvkhHbVCUPmVw5BFLVuMkE21wA2FAdfg@mail.gmail.com>
Subject: Re: [PATCH 4/6] firmware: samsung: acpm: Make acpm_ops const and
 access via pointer
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
> Replace the embedded `struct acpm_ops` inside `struct acpm_handle` with
> a pointer to a `const struct acpm_ops`.
>
> Previously, the operations structure was embedded directly within the
> handle and populated dynamically at runtime via `acpm_setup_ops()`.
> This resulted in mutable function pointers and unnecessary per-instance
> memory overhead.
>
> By defining `exynos_acpm_driver_ops` statically as a `const` structure,
> the function pointers are now safely housed in the read-only `.rodata`
> section. This improves security by preventing function pointer
> overwrites, saves memory, and slightly reduces initialization overhead
> in `acpm_probe()`.
>
> Consequently, update all consumer drivers (clk, mfd) to access the
> operations via the new pointer indirection (`->ops->`). Finally, fix
> the previously empty kernel-doc description for the ops member to
> reflect its new pointer nature.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/clk/samsung/clk-acpm.c                     |  8 ++---
>  drivers/firmware/samsung/exynos-acpm.c             | 36 ++++++++++------------
>  drivers/mfd/sec-acpm.c                             |  6 ++--
>  .../linux/firmware/samsung/exynos-acpm-protocol.h  |  4 +--
>  4 files changed, 25 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
> index 93667777094c..953ca8d5720a 100644
> --- a/drivers/clk/samsung/clk-acpm.c
> +++ b/drivers/clk/samsung/clk-acpm.c
> @@ -68,8 +68,8 @@ static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
>  {
>         struct acpm_clk *clk = to_acpm_clk(hw);
>
> -       return clk->handle->ops.dvfs.get_rate(clk->handle, clk->mbox_chan_id,
> -                                             clk->id);
> +       return clk->handle->ops->dvfs.get_rate(clk->handle, clk->mbox_chan_id,
> +                                              clk->id);
>  }
>
>  static int acpm_clk_determine_rate(struct clk_hw *hw,
> @@ -89,8 +89,8 @@ static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>  {
>         struct acpm_clk *clk = to_acpm_clk(hw);
>
> -       return clk->handle->ops.dvfs.set_rate(clk->handle, clk->mbox_chan_id,
> -                                             clk->id, rate);
> +       return clk->handle->ops->dvfs.set_rate(clk->handle, clk->mbox_chan_id,
> +                                              clk->id, rate);
>  }
>
>  static const struct clk_ops acpm_clk_ops = {
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index da960d3e1145..1a0d98b55439 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -670,30 +670,26 @@ static int acpm_channels_init(struct acpm_info *acpm)
>         return 0;
>  }
>
> -/**
> - * acpm_setup_ops() - setup the operations structures.
> - * @acpm:      pointer to the driver data.
> - */
> -static void acpm_setup_ops(struct acpm_info *acpm)
> -{
> -       struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs;
> -       struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic;
> -
> -       dvfs_ops->set_rate = acpm_dvfs_set_rate;
> -       dvfs_ops->get_rate = acpm_dvfs_get_rate;
> -
> -       pmic_ops->read_reg = acpm_pmic_read_reg;
> -       pmic_ops->bulk_read = acpm_pmic_bulk_read;
> -       pmic_ops->write_reg = acpm_pmic_write_reg;
> -       pmic_ops->bulk_write = acpm_pmic_bulk_write;
> -       pmic_ops->update_reg = acpm_pmic_update_reg;
> -}
> -
>  static void acpm_clk_pdev_unregister(void *data)
>  {
>         platform_device_unregister(data);
>  }
>
> +static const struct acpm_ops exynos_acpm_driver_ops = {
> +       .dvfs = {
> +               .set_rate = acpm_dvfs_set_rate,
> +               .get_rate = acpm_dvfs_get_rate,
> +       },
> +
> +       .pmic = {
> +               .read_reg = acpm_pmic_read_reg,
> +               .bulk_read = acpm_pmic_bulk_read,
> +               .write_reg = acpm_pmic_write_reg,
> +               .bulk_write = acpm_pmic_bulk_write,
> +               .update_reg = acpm_pmic_update_reg,
> +       },
> +};
> +
>  static int acpm_probe(struct platform_device *pdev)
>  {
>         const struct acpm_match_data *match_data;
> @@ -734,7 +730,7 @@ static int acpm_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
>
> -       acpm_setup_ops(acpm);
> +       acpm->handle.ops = &exynos_acpm_driver_ops;
>
>         platform_set_drvdata(pdev, acpm);
>
> diff --git a/drivers/mfd/sec-acpm.c b/drivers/mfd/sec-acpm.c
> index 9e15b260b8df..3397d13d3b7f 100644
> --- a/drivers/mfd/sec-acpm.c
> +++ b/drivers/mfd/sec-acpm.c
> @@ -391,7 +391,7 @@ static int sec_pmic_acpm_bus_write(void *context, const void *data,
>  {
>         struct sec_pmic_acpm_bus_context *ctx = context;
>         struct acpm_handle *acpm = ctx->shared->acpm;
> -       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
> +       const struct acpm_pmic_ops *pmic_ops = &acpm->ops->pmic;
>         size_t val_count = count - BITS_TO_BYTES(ACPM_ADDR_BITS);
>         const u8 *d = data;
>         const u8 *vals = &d[BITS_TO_BYTES(ACPM_ADDR_BITS)];
> @@ -411,7 +411,7 @@ static int sec_pmic_acpm_bus_read(void *context, const void *reg_buf, size_t reg
>  {
>         struct sec_pmic_acpm_bus_context *ctx = context;
>         struct acpm_handle *acpm = ctx->shared->acpm;
> -       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
> +       const struct acpm_pmic_ops *pmic_ops = &acpm->ops->pmic;
>         const u8 *r = reg_buf;
>         u8 reg;
>
> @@ -430,7 +430,7 @@ static int sec_pmic_acpm_bus_reg_update_bits(void *context, unsigned int reg, un
>  {
>         struct sec_pmic_acpm_bus_context *ctx = context;
>         struct acpm_handle *acpm = ctx->shared->acpm;
> -       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
> +       const struct acpm_pmic_ops *pmic_ops = &acpm->ops->pmic;
>
>         return pmic_ops->update_reg(acpm, ctx->shared->acpm_chan_id, ctx->type, reg & 0xff,
>                                     ctx->shared->speedy_channel, val, mask);
> diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> index b206efa62be6..fbf1829b33db 100644
> --- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
> +++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> @@ -42,10 +42,10 @@ struct acpm_ops {
>
>  /**
>   * struct acpm_handle - Reference to an initialized protocol instance
> - * @ops:
> + * @ops:       pointer to the constant ACPM protocol operations.
>   */
>  struct acpm_handle {
> -       struct acpm_ops ops;
> +       const struct acpm_ops *ops;
>  };
>
>  struct device;
>
> --
> 2.54.0.545.g6539524ca2-goog
>
