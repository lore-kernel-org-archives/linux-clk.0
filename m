Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF84BA38
	for <linux-clk@vger.kernel.org>; Sat, 27 Jan 2024 02:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706323367; cv=none; b=iXeKqP6a6T3uhgVEqT/5ZrGDqpPFTl26yPf+snUC+a+4FNtjictSovzMcoZsYddG4LZ3jgH+gGD4epr0DRPwQB8wDVQNyo9AkPYxpmRKOV456zeACaDs25uu6uiTklOqIlFhZ5IihC6w7rQDegZ1WRxd8BUCaDEwsuGhmWTfAPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706323367; c=relaxed/simple;
	bh=TnRkg9YGAMzV36PzYApm/o0Nz4O0TWszbHDaIw2yvJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TqRxivoKBUOMpYSC7PR5SlgekjqLzCiqcKoLlz3riaDa0qliuTbojZA3UPHyEIFFkjzen8RxZfOuKrGR+UIKy2XSO+pUMrBE+huzHQr+cweYbenKFpc10xqgjSXBYT70+ZO43Oa6WiP8zCMV9LFyz1dNEFQ1ubUAqaLTHFRrnvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bd6hJAUn; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bd6hJAUn"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-602c91a76b1so11526067b3.2
        for <linux-clk@vger.kernel.org>; Fri, 26 Jan 2024 18:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706323364; x=1706928164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zf45TsL/1FBpc+V5HKmqZ7dALipphhxtwIfGvzGgYB0=;
        b=bd6hJAUnRGvIKdCIzdDvoeg+h+kfjaOTHi+ig6VAcMMQzb7J8LDoFsnwqVhw/Hw6KI
         MiSodAVPB486QpCup7R0SJgbtwb9XHC8Jm0ceKyiT9zb7EhDOhpHSSZNV0MC0/iclIMQ
         Xe9tr3SXTIq9c8Y+YiSAE2IeIVcR1tmE3Nz++Tq7Tte3GbTQXGuyNhKwIIeUu3BM1Vx8
         n3zSBGnSi0ajp6T2aRZJ90AQDIycUDfyrgu3VUI9hSJXrJIS9eotwXWXkucg9ghF0+ij
         fGaCuI85y35BLj85jwza7eEJvYtmRyl73mv1k4QoFpYlxzoLdzV6C3nQLOa9JT2M8LET
         TrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323364; x=1706928164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zf45TsL/1FBpc+V5HKmqZ7dALipphhxtwIfGvzGgYB0=;
        b=Yxmk3H9iVx1iPEKPO+w4YHT5mFfK8Sc/SArmKZiSKUnO3qC0xpTCZtM25iEMiInysd
         OR//Uh2dSc8KPH5WDc4Wd5issXtKGOqwHSs127aiADYZ4O0KfxbZZnZT1JIatiB1XDSD
         Kc7C0cA8OUv9I6tHg3LJKWoKKXAkV+3sThOXcfq6wNTw5j2mzbKaeeMPrWYdc8o1eAsi
         OD05BAXJi9xylxtg50lmcdwgePkTPr0QGUbEdTTuJZ8wCE48Dc5TZ5s346mFOfuPjexL
         sqfk03wlNyObookGIA/Ukiu+Fort3s0ERSq+vstCRSzucS33R1zJyex6kdqxebw1uSso
         DNmQ==
X-Gm-Message-State: AOJu0YzzFMDZDq/F55ABfkuP5K3wdt0173rxpCRwkzJwBGXxP23iS7p8
	9ZPQFwlK4YC0tkl3hDkI0zz66nx5+L7He87YJeS0+vXtBHt/CZSjeV0e8sfYSVTxpBI1nQ/qAlX
	L8t0QD7GOKpj376PAU+L/j1Kd9+25BSCjXvbPUg==
X-Google-Smtp-Source: AGHT+IHRZPdhgUs/BZGvmVBOvQRD+JgpezMtVZsrlzFangPEP9tjCbmnm9ccToRn0csAj1ZBk6Dz9HZ3cZhVHRwsFEo=
X-Received: by 2002:a81:7e08:0:b0:5f6:eb69:5e1e with SMTP id
 o8-20020a817e08000000b005f6eb695e1emr932145ywn.57.1706323364675; Fri, 26 Jan
 2024 18:42:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127001926.495769-1-andre.draszik@linaro.org> <20240127001926.495769-2-andre.draszik@linaro.org>
In-Reply-To: <20240127001926.495769-2-andre.draszik@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 26 Jan 2024 20:42:32 -0600
Message-ID: <CAPLW+4mcTHyoX85pTCEkNf5ZonJm62NLSg7Q+wBKPrr1QV7hbQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] clk: samsung: gs-101: drop extra empty line
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, alim.akhtar@samsung.com, 
	s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 6:19=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> There is an extra empty line here which doesn't exist in any of the
> other cmu code blocks in this file.
>
> Drop it to align cmu_top with the rest of the file.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/clk/samsung/clk-gs101.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs=
101.c
> index 4a0520e825b6..27debbafdce4 100644
> --- a/drivers/clk/samsung/clk-gs101.c
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -25,7 +25,6 @@
>  /* ---- CMU_TOP --------------------------------------------------------=
----- */
>
>  /* Register Offset definitions for CMU_TOP (0x1e080000) */
> -
>  #define PLL_LOCKTIME_PLL_SHARED0                       0x0000
>  #define PLL_LOCKTIME_PLL_SHARED1                       0x0004
>  #define PLL_LOCKTIME_PLL_SHARED2                       0x0008
> --
> 2.43.0.429.g432eaa2c6b-goog
>
