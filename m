Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732D53FBED4
	for <linux-clk@vger.kernel.org>; Fri,  8 May 2026 21:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275423; cv=pass; b=VL+/gmDl5DRC+f3G0JXagb/+tPss30Sb3Cn88H2EEcQXAqDHlA8KeAp+AvWq9KWKPugO3ZnvAuTmjMbR9Va7WdquetlCgTi8GzadT0m3UrkG8/jW7bnDflb4ywsz12jRGVJz2tz/j8LWyBLYz8/EPt5Mmrexf2QR8tNKLimiwmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275423; c=relaxed/simple;
	bh=JjzbFy2ZE5GCQkLQ2jpRAjPX4ddb2In753y94sylcBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W6z7ESxK2XLk29DzpPYspoHmxWlV7n7rsJ8B5vF19OxcY7C3HUrzrTBDKmhL8xT5mLGBt6XM37IUBqPDy3m5JUOFT8MpCllPaVQ1ERWyBWwU7tXaWrh1qyh43f2t6Mk1GhHWj/buFXzbJjN8XuVAEnisknty6MXGOSIhf40A7F8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M7uyINkU; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M7uyINkU"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bc2301be8ecso419320266b.3
        for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 14:23:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778275420; cv=none;
        d=google.com; s=arc-20240605;
        b=VM/wL6RAC50R/zdCGIzouujO0qlY8N+E+WhcI2eH7NThee5T13KqwbZWPJAJv0XaW4
         2IMzT4BF8eOlg6aBYVvYDhn4A9e8QNqNr/yGuTuzF0OTAe9l1I1GvR0AwJyPwNTixoAu
         QVLaR/ON8pziBeAAI+BRwsvdwpepsc9pmx6W5UfLluZwjqi/GOwukgR6iGmM9Uh/rAgu
         w8KiCgJzoYX9WquJicgxaBW6EbPaZ8ttN2FgXKRkAsTEpk7xc7/34bvirz46ft3v1+t6
         y4SIvokfWM86Vn+fBexH+PYc6qNboz76o0E/eo2iawgDdrJA+FAK9fmrWDueCdviEry1
         b2dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zIq9ZcUws2t7WWIjJD6g+oZhRW8RJPBQCH68MpVs7Xs=;
        fh=Fskkv3CltEvbpipfkdP/P7/x5W/p9UlqsdjRwNeqU+0=;
        b=IRsRCqoQlsJHfUV1mO4GfVos6AY2eZLZF/obN0iYkMp9e1tr7+3XrNzsen39zzvojf
         8mLHryw5W03i0EEm5g4+RSENXWbGpZnR5aLDavgRPuaAWr6TWaaKKDpayD9qMsMFzjIZ
         Vd+eA+bvq0Ll5q82CB+TE6jG+mMbq3BPKLYJ4kTweFhYHUftgKBeKhNhKVSLzfCiF9LV
         W9TGJYBv+2UjP6+yTrVNbi/Y2nxunljBsRNebo3noCmaVzQ4+xPZoFRmcXuB5LcWxvDb
         GdVs0bcBMBE8M10bU/MqyrsIpsm6qSu8krjofwFCbpGmT/13gpl8FU6L52wKOspHMOIF
         2blQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778275420; x=1778880220; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zIq9ZcUws2t7WWIjJD6g+oZhRW8RJPBQCH68MpVs7Xs=;
        b=M7uyINkUoLx8IIpyFEjRSs5ccMtENsWh15L3FCRSEheigOPlV7VMcetlhkhH/nDJ8F
         ymA74EjMovQ3N1+GZpVUjLhJeBOsqdsfy3p/vVYwyK70WhubXOGkuN5zvN2gVnNSQCN/
         BXy6U5D5kajDvBgNu9Fes6pWya3EzZ8FtKM3F4M4fT97BG1q6lYVLH3bJ1pXDafW5Qjd
         SSkpM49VTa2i9qaVffHZGIaS7OyMbmJa/9JYTp16MkqL/793VQINlPADrGgLM5xc83RS
         IpG7ulC1zGjPsjiJ4XjasCzST8cO5JpVcBzTkzFX+O9nozOPEY9KQtiSdo8oAsXVCMrg
         hbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275420; x=1778880220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIq9ZcUws2t7WWIjJD6g+oZhRW8RJPBQCH68MpVs7Xs=;
        b=cKlCpLrZ61JxTg1sY0E3rsDfCz4t5sjqqiZrReJ67bkMbQBJsNX5CDStV4sjrQ7OA3
         NELgP+0i8CYauwLvwUdR5Oquo6lXMDXC5ukZLAuecFxy1R207c91ms5WhGUcUiI2Z5mc
         RFaVW2Y/vpI2P43Yo1iza65+H4BCkpNbSth0/vP00EOw7C5uOVAzaGCeszZqstO1WpAR
         XES63W9StAg/XznBZMINESW2mCR21yKqlUR2JzpertTgZ7pIwx/rM9W/Kitj0uT2kxv6
         UYK8tZ12RL5PnXaEr87tp8Th3FSfsGK/EZAA1AsXdLR/W3ZLE3IhqVAA6TBOms1O23Mo
         mWgg==
X-Forwarded-Encrypted: i=1; AFNElJ+w3u8e0b2N3LhWDCYtJMtsrMv6it8nKOnYg8gqTgVaIym3cpbOZencTxPGUIg8J8sJIoX59jAi968=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3UbPn/lAUdkkVvs55NrERrAEk19OirscK1JPYoDgDlo/I/AqP
	e3jHrV89sHByIXzsEIcefMBiHzHYOXnz3s08CNq3v6hT7DY/ENEe+n2DnpEt+CWZgsK7vwXd23Z
	zbUFWwVWdZWamj1NgfA0JZbtsiFPkPRB0OAgnqMh3DA==
X-Gm-Gg: Acq92OEibiboKq82qZFxEJ0umy5Ds5KFLOFe+uQ8wk1VKWKL5JYufAGgM6xXFaZeasF
	nwC6PPrbjb9HAqhTGoRUo1uzVw6GQIaI8poNofLmaZ688lqWj8ntzrgG2LV17DHfnGEMKJ1kz6H
	37pYLgyS8AQeRp8VoCr78LtUl4ZPrGTrNoJVVxABMqrcwETY6EawUWmZqzHtyw9JDVwEYieiwIr
	BaLf3rapc5mQp62oyVZfqtLH6DzQK9Gibx0WWB6IxnETpJSN7p3+ldMulD4LU7qSCUS/qJ7V7pT
	TruiIU5lEChskBBp1y9mUIgk48UfHmXCraMrWxMHLA==
X-Received: by 2002:a17:907:c06:b0:ba9:2611:31e6 with SMTP id
 a640c23a62f3a-bc56be3f762mr934940566b.6.1778275419723; Fri, 08 May 2026
 14:23:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org> <20260506-acpm-tmu-helpers-v1-3-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-3-a9cd5daf8355@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 22:23:27 +0100
X-Gm-Features: AVHnY4LLKqUnG42bw1kGuZ5A8Ore_i8f_07LxVicEeYBN4fNYRTwN4DHlu-DLSI
Message-ID: <CADrjBPqzKpcd9vuCmNUptCUPyPpPbHcc19-7kN-1c0RpW1e5DQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] firmware: samsung: acpm: Drop redundant _ops suffix
 in acpm_ops members
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
> Rename the `dvfs_ops` and `pmic_ops` members of `struct acpm_ops` to
> `dvfs` and `pmic` respectively.
>
> Since these members are housed within the `acpm_ops` structure and
> utilize the `acpm_*_ops` types, the `_ops` suffix on the variable names
> creates unnecessary redundancy (e.g., `handle.ops.dvfs_ops`).
>
> This cleanup removes the stuttering, leading to cleaner consumer code.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/clk/samsung/clk-acpm.c                        | 8 ++++----
>  drivers/firmware/samsung/exynos-acpm.c                | 4 ++--
>  drivers/mfd/sec-acpm.c                                | 6 +++---
>  include/linux/firmware/samsung/exynos-acpm-protocol.h | 4 ++--
>  4 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
> index d8944160793a..93667777094c 100644
> --- a/drivers/clk/samsung/clk-acpm.c
> +++ b/drivers/clk/samsung/clk-acpm.c
> @@ -68,8 +68,8 @@ static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
>  {
>         struct acpm_clk *clk = to_acpm_clk(hw);
>
> -       return clk->handle->ops.dvfs_ops.get_rate(clk->handle,
> -                                       clk->mbox_chan_id, clk->id);
> +       return clk->handle->ops.dvfs.get_rate(clk->handle, clk->mbox_chan_id,
> +                                             clk->id);
>  }
>
>  static int acpm_clk_determine_rate(struct clk_hw *hw,
> @@ -89,8 +89,8 @@ static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>  {
>         struct acpm_clk *clk = to_acpm_clk(hw);
>
> -       return clk->handle->ops.dvfs_ops.set_rate(clk->handle,
> -                                       clk->mbox_chan_id, clk->id, rate);
> +       return clk->handle->ops.dvfs.set_rate(clk->handle, clk->mbox_chan_id,
> +                                             clk->id, rate);
>  }
>
>  static const struct clk_ops acpm_clk_ops = {
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index fac88c427d2a..da960d3e1145 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -676,8 +676,8 @@ static int acpm_channels_init(struct acpm_info *acpm)
>   */
>  static void acpm_setup_ops(struct acpm_info *acpm)
>  {
> -       struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs_ops;
> -       struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic_ops;
> +       struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs;
> +       struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic;
>
>         dvfs_ops->set_rate = acpm_dvfs_set_rate;
>         dvfs_ops->get_rate = acpm_dvfs_get_rate;
> diff --git a/drivers/mfd/sec-acpm.c b/drivers/mfd/sec-acpm.c
> index 0e23b9d9f7ee..9e15b260b8df 100644
> --- a/drivers/mfd/sec-acpm.c
> +++ b/drivers/mfd/sec-acpm.c
> @@ -391,7 +391,7 @@ static int sec_pmic_acpm_bus_write(void *context, const void *data,
>  {
>         struct sec_pmic_acpm_bus_context *ctx = context;
>         struct acpm_handle *acpm = ctx->shared->acpm;
> -       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
> +       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
>         size_t val_count = count - BITS_TO_BYTES(ACPM_ADDR_BITS);
>         const u8 *d = data;
>         const u8 *vals = &d[BITS_TO_BYTES(ACPM_ADDR_BITS)];
> @@ -411,7 +411,7 @@ static int sec_pmic_acpm_bus_read(void *context, const void *reg_buf, size_t reg
>  {
>         struct sec_pmic_acpm_bus_context *ctx = context;
>         struct acpm_handle *acpm = ctx->shared->acpm;
> -       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
> +       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
>         const u8 *r = reg_buf;
>         u8 reg;
>
> @@ -430,7 +430,7 @@ static int sec_pmic_acpm_bus_reg_update_bits(void *context, unsigned int reg, un
>  {
>         struct sec_pmic_acpm_bus_context *ctx = context;
>         struct acpm_handle *acpm = ctx->shared->acpm;
> -       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
> +       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
>
>         return pmic_ops->update_reg(acpm, ctx->shared->acpm_chan_id, ctx->type, reg & 0xff,
>                                     ctx->shared->speedy_channel, val, mask);
> diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> index d4db2796a6fb..b206efa62be6 100644
> --- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
> +++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> @@ -36,8 +36,8 @@ struct acpm_pmic_ops {
>  };
>
>  struct acpm_ops {
> -       struct acpm_dvfs_ops dvfs_ops;
> -       struct acpm_pmic_ops pmic_ops;
> +       struct acpm_dvfs_ops dvfs;
> +       struct acpm_pmic_ops pmic;
>  };
>
>  /**
>
> --
> 2.54.0.545.g6539524ca2-goog
>
