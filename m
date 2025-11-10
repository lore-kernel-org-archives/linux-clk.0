Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F89EBE5E
	for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 12:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762777425; cv=none; b=g7UuhS2qA4VkEF2Ow1DdEVf8/i3+1eLJ9IO0vWU/M3KXMw3NyZD4/KT86Lm7M0GKn2LzXS538RJffLvIi6R+nblwAvhoW+AF+qbhQz+EwwvtPKWwAJrG1f9fisqedwP6A7QlPMtLk/LCKjdoOGB0yxkOw0iTysmrk4CgH9HACv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762777425; c=relaxed/simple;
	bh=zWbNCTtGk7yw43CTCAcuX34n6UWU3vWChmXQCsvs42c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XXAc3ZLWP5Fj3WurF64H84toJEVHFXuEHIgpo+cF1rFFWV/6bn7mzx5CIX/4yxTrepIZV+iMjTbgrUURHRlCeTF06Gn6N/2aVhEkr1W71dDHyqzl5AoSGhqrjS3ui2syfy7d7gGJBh0LRAZs3Lrq+KDHAcSPjhO1dCgYAlj4u5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ONEWKk4J; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ONEWKk4J"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64166a57f3bso2158286a12.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 04:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762777422; x=1763382222; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DzW1Nmfxb6NiioFQyuj9BtUlANBvsFTwFmbLEk2yLZU=;
        b=ONEWKk4Jdnzt6NSTRZZJhlzCozURxOxM0ctQAfFkoskUt8gSf4szk1kjdMhFYIg8da
         lk8UDMf80yhtQhXAMtrLyOGogfMjhM7aCNMj/aiiuhs4YMPnNzcj8OPu3dEOJnOoKfDe
         4h3a7YiF82GZBOlVhDihud76n8qXSUIjuIooJDY4F1qPiNWm41wL7t8wsRHdeRekkGCA
         atwK1xppiGCiDt2iRT9uytUUMqTwTBUT1/mfHGMyPqomVeG166xyCVZHFnlC4/7EuKuC
         /tioMpR8zcooXpGQ1rgScon2IcGSGCmdLl/LjN1CanUgNO5zxWWeSwCq2KizBMMbQPN4
         VrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762777422; x=1763382222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzW1Nmfxb6NiioFQyuj9BtUlANBvsFTwFmbLEk2yLZU=;
        b=JfdBsyjThVT3f4+C1brwXKX0Usuvw3rrpYEO2XRyznV6qQFsjQE3HVSzqkkE8liRGJ
         s7fC3u7raiJqSuvB1HWGkfu0PJRg/r3WQR+GhsKlT0iW6JICXVfNs6YfmvciDPByScUH
         +11Uq7PCMcm1juyfsxdfqcjNXCf6X5euLxoKa+n6blBP8lJSNz4fy7t/oC0d/dXtbSjb
         ZEypnIAm7H2ByEMnHg2cCvYw0KSWVLlZsmPfQs9BQ7iDVb+rKN6eUHDPd7hJElvrxB16
         Xzb1CVSc9Y2j2ghy5sZODvIYdw6oh7txzw7rB822t3eTzYSyR2I+AMQcU1D2skdXSJ8J
         7FKg==
X-Forwarded-Encrypted: i=1; AJvYcCUnoQkJ0Im4vBkGr2ke/vDCbxkZFbT0ukha23F2mCCSKBpra4QwPriefFyiygGQ+V3xMr1+u6xJaiw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPwV8g2eJkOiWprI+Qe0qNvnocvuNbG6IA6Aun6ytyEBU+Ftt2
	2lgspOjo1jNHVV4qf02e0oWM7ziXOVj7JBFmy0XDOwDyRov3VG2oRno+bsgkSPiv7Zz4WOiHygy
	DXA1dKdo5MM5uWPGpW1TiKhjecCX+pFS5AqeWvCA8KQ==
X-Gm-Gg: ASbGncuMmNaRJK83NdUTwgR0OMqyqGvueoGp8f2hAtPhSGzpPChpu62KguEzcB1W5IY
	ZjirKuf0olpHB4kZRSM7XP2SUWke/VQ9iK9nOX9mO34GUTcXwf1wbmOPBX4wfdA49V2EpXs+J8e
	tF9qfqaaarNfNDxm5EqBT2ntl2BRNGxM/N5h0xIl/y6X9/NqxB7DkqnBcRvh1oc1enJ0DE0QMPw
	Ya40l3ruLXlri2yOMn8OL2OI7J4zWPoiEkvRHSh6KVgzcJj6e+hZXYZlNQ0EK6kVaVF/LleXiyQ
	Tg66qVo=
X-Google-Smtp-Source: AGHT+IGm5+Uu79ujlZItIA42GflK7UfV+AyBRUd53fOR/2PdZlplGxgc5r7/bRr9gNtqR7fwtBSp/+VdEs2VA7Pi6Oc=
X-Received: by 2002:a05:6402:305c:10b0:640:c454:e8 with SMTP id
 4fb4d7f45d1cf-6415e7fd2c9mr4878827a12.30.1762777421528; Mon, 10 Nov 2025
 04:23:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106-clk-pmdomain-mediatek-round-rate-v1-1-49441ea27f84@redhat.com>
In-Reply-To: <20251106-clk-pmdomain-mediatek-round-rate-v1-1-49441ea27f84@redhat.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 10 Nov 2025 13:23:03 +0100
X-Gm-Features: AWmQ_bnh8tp1oLAuPElgvSFmN8WE23c2ga9LAvFWkFMPaVp1NApY8JmtQI4OamU
Message-ID: <CAPDyKFoq=dJW_FCVykBwH85+RbeZ-SR6=vF0vKw+237TsgOfDA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: convert from clk round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Maxime Ripard <mripard@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Nov 2025 at 00:40, Brian Masney <bmasney@redhat.com> wrote:
>
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's convert this driver so that
> round_rate() can be removed from the clk core.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> index af20111067c02a5f9a0d6d751e9e0dc32c1a4d90..9bad577b3ae4bf1b83d4f782bb52f56f779a8974 100644
> --- a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> +++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> @@ -309,11 +309,11 @@ static unsigned long mtk_mfg_recalc_rate_gpu(struct clk_hw *hw,
>         return readl(mfg->shared_mem + GF_REG_FREQ_OUT_GPU) * HZ_PER_KHZ;
>  }
>
> -static long mtk_mfg_round_rate(struct clk_hw *hw, unsigned long rate,
> -                              unsigned long *parent_rate)
> +static int mtk_mfg_determine_rate(struct clk_hw *hw,
> +                                 struct clk_rate_request *req)
>  {
>         /*
> -        * The round_rate callback needs to be implemented to avoid returning
> +        * The determine_rate callback needs to be implemented to avoid returning
>          * the current clock frequency, rather than something even remotely
>          * close to the frequency that was asked for.
>          *
> @@ -325,7 +325,7 @@ static long mtk_mfg_round_rate(struct clk_hw *hw, unsigned long rate,
>          * high current frequency, breaking the powersave governor in the process.
>          */
>
> -       return rate;
> +       return 0;
>  }
>
>  static unsigned long mtk_mfg_recalc_rate_stack(struct clk_hw *hw,
> @@ -338,12 +338,12 @@ static unsigned long mtk_mfg_recalc_rate_stack(struct clk_hw *hw,
>
>  static const struct clk_ops mtk_mfg_clk_gpu_ops = {
>         .recalc_rate = mtk_mfg_recalc_rate_gpu,
> -       .round_rate = mtk_mfg_round_rate,
> +       .determine_rate = mtk_mfg_determine_rate,
>  };
>
>  static const struct clk_ops mtk_mfg_clk_stack_ops = {
>         .recalc_rate = mtk_mfg_recalc_rate_stack,
> -       .round_rate = mtk_mfg_round_rate,
> +       .determine_rate = mtk_mfg_determine_rate,
>  };
>
>  static const struct clk_init_data mtk_mfg_clk_gpu_init = {
>
> ---
> base-commit: df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
> change-id: 20251106-clk-pmdomain-mediatek-round-rate-649a9bf7d30a
>
> Best regards,
> --
> Brian Masney <bmasney@redhat.com>
>
