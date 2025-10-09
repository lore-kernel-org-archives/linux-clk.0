Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B866222586
	for <linux-clk@vger.kernel.org>; Thu,  9 Oct 2025 07:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759994382; cv=none; b=MFTSqMSfA1BlTRq+91U/EwD/HyIubCL2sunkAE4aU+Nq1ufnFUOOU7VIGhcRKqUBGBTC0RR6+xePyPq/ZBWnomiUiLZPvqXJXBC1Vcj43IGAHLaXRACEdbfeka7T7wJE5fd9OpacuQjb2kV61lS06Kc4Cndmy1+0k8OLKPzrvvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759994382; c=relaxed/simple;
	bh=oSwSu7UxNbNkaNtKrVySKYicTsoE7H2TkVuZcXvnVcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O5vh40wB+JNRNOnGIqbT1UJHPJ3bLIoJVUUIWtbnUB7TKjmJKjwCZiKxiU8uWLEBvpo5LwehzL5yD8fT56bPryu+J2IyEMc7VjLfUFdu60SCSIyqqUr6xmsWWIsw3V+AduZ6A+tCjlQ/5Ng2TVaT/OA2gADmfUP8nwItMeskziM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jkomd7Qa; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jkomd7Qa"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57a59124323so829275e87.2
        for <linux-clk@vger.kernel.org>; Thu, 09 Oct 2025 00:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759994378; x=1760599178; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5c5+mJ/UHP/9LbfelQ205BO5Ehj3e8KPSEEqoMsr+r0=;
        b=jkomd7QanJfQL+taGy8affio/Zf0CCSAeUZfKoNGNVLi9zNehO29/+8U9CHcC0x/2J
         NOzgoEf72XHoZVZ+PIFKq8IlW6Cz744RqexnvLtkWdxZXDjPCW3HRhEwBtiUxU6dZJYL
         Sol9Qedoun0z+zp3eegSOGa2Ybx1BnM47rRVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759994378; x=1760599178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5c5+mJ/UHP/9LbfelQ205BO5Ehj3e8KPSEEqoMsr+r0=;
        b=pTLp88/M+szrKW5ct/VdHqtVFcKH1OkATFBlXqnynvieU2FxTvdm1HI0doxUw2TJFg
         l0YHUhdCSRRkA+jr9UzIPoUWqZzCxOKG56mVDHTKazyOwQcG4Hsoe6BMbYP0qUfpgsNN
         TbRPBPxu20TBGUeljaKxPlRbRateAqbJknS4Eclm4ogICwRvr9kJOMuXSQ3l2t+nkP58
         nsUQLRG5CegRWgQysxp+gy98+ESJ6eOljqRJElVYHTUm6wRrEqkpCNpYhTd5zjUACwcu
         JVe6YOZVfVQPvdgkQSQTE3oWHi33AkoMuDvZhnDCF46LJk/ab40muWuo9YQ2Cuclr90+
         fhog==
X-Forwarded-Encrypted: i=1; AJvYcCUTyUbCZx1goXp95YD0iyt7JJF2EKoUWclMpuXx8DHPF0Q9YCVD3+7c3zEh0vPtoIRZymt11rv3xXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdjN1z4foA+r6U8kVEUVw491X5W74Jlg8dqJ0QdsXVlz+l5eed
	NQhz8dFvdkWxH/NfAp4nn5JTeNDZvyg4QHJbAHR26u3TAvOp+3dNDseXQZtFcdNredz6y5iRYIY
	ZrQ6srxEgAJZAPyLL5jMajHtlJCE8xNjzI+LqfCSf
X-Gm-Gg: ASbGncsPei2NyGff1rQd9YXREz1qI5bimHtqKALeIfx5JmMbCQAFVFxBas2AcADzjsD
	4fOKmgRb3ea49ezJ+wAAYEZb/A1TCDqEhCkFLmU3j4INPURSDGglEs0rgiOnN2ptBw3LcSNxwjF
	y8XSaoH3v1UYU3M/ldm9PwkDkVANxXKji7wSKnZ7bmp0EmtsUwUoBSJrqfUa7YiRCxPw9oLAb/f
	pwNRxrLVUHFd/SyNyUVdeow1tgQU4Q6QuYI2wdXFskTfsYYACJDOYA+ngDk0Q==
X-Google-Smtp-Source: AGHT+IHSaW0g4YpO769xUwsa4iNj202mqOPzRJ46LGO1j2gm27+8xePTXEdB7gctFN8wB6vE1Rr8nunFbpgl3JoXAJg=
X-Received: by 2002:a05:6512:a90:b0:55f:6759:a792 with SMTP id
 2adb3069b0e04-5906d8ed836mr1731541e87.34.1759994378341; Thu, 09 Oct 2025
 00:19:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com> <20251008-mtk-pll-rpm-v2-2-170ed0698560@collabora.com>
In-Reply-To: <20251008-mtk-pll-rpm-v2-2-170ed0698560@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Oct 2025 15:19:27 +0800
X-Gm-Features: AS18NWDNV8mYg3wiP9Z1G6zwejV94_0pr6WyN1XzhbiCP9cR62AhpDcipKqCy2M
Message-ID: <CAGXv+5GGSKVwvQihGVJNch6qxv88t03BcBhN9tgB=K-5VvN+Cg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] clk: mediatek: Refactor pll registration to pass device
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 12:06=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> As it stands, mtk_clk_register_plls takes a struct device_node pointer
> as its first argument. This is a tragic happenstance, as it's trivial to
> get the device_node from a struct device, but the opposite not so much.
> The struct device is a much more useful thing to have passed down.
>
> Refactor mtk_clk_register_plls to take a struct device pointer instead
> of a struct device_node pointer, and fix up all users of this function.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---

Actually,

> diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pl=
l.h
> index d71c150ce83e4bb2fe78290c2d5570a90084246d..0e2b94b9cd4b56adceee3b04e=
9ab24c2526471da 100644
> --- a/drivers/clk/mediatek/clk-pll.h
> +++ b/drivers/clk/mediatek/clk-pll.h
> @@ -78,9 +78,9 @@ struct mtk_clk_pll {
>         const struct mtk_pll_data *data;
>  };

Please replace the |struct device_node| forward declaration at the top
of this file with one for |struct device|.

> -int mtk_clk_register_plls(struct device_node *node,
> -                         const struct mtk_pll_data *plls, int num_plls,
> -                         struct clk_hw_onecell_data *clk_data);
> +int mtk_clk_register_plls(struct device *dev, const struct mtk_pll_data =
*plls,
> +                         int num_plls, struct clk_hw_onecell_data *clk_d=
ata);
> +
>  void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_pl=
ls,
>                              struct clk_hw_onecell_data *clk_data);
>
>
> --
> 2.51.0
>
