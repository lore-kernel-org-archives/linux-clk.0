Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0833554729
	for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 09:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706519672; cv=none; b=JtsBhnnaNU1nmNO5iz1d+1DahHtj/QUFIjRm5ZrMCYq1HxY4ToGAb3wKc3+TCrebNR8EiArqCzGRtyuTpotfh0ZVmCQWj/rAejtkZSMr015TlypZkjrlP1YAd1y9CetezqgoUfsYQV0Z40tH7ZBoYTgokfkza5EtmVKB9jlhxvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706519672; c=relaxed/simple;
	bh=vuRFhnAb0QvxdIswU7JMO3BMfaGNmH0kJhYkDLBQUeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dOI6ONl3XTKEounh3DXBZsGKdkjXUdHP6l68isC0apR6tNgao0N41UNCzsPJY0UsLzEnAv86F74/mvVQTnPwoTdD2bQPH2ByARPszHmG63vPYZonZ0CFrcad6DFK5WCZw4YDyOMya/y2isPMYbkI9Kut3QiBkhqty1sncYLzJ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jlJYNiyT; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jlJYNiyT"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-680b1335af6so33351806d6.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 01:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706519670; x=1707124470; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIls3X+c7u3FdSJgCYO346X8vHVfzQy7RDRpONBzCs8=;
        b=jlJYNiyTVvtCtg+W42yTvBOR+eF7IDtXW19YrGQoYR0fz9hYHWLMTooGXy68RIDP4O
         9L7diEFLbNwW8nEBkDTPXGR7SnXPSpb2dMhVcz1D5no8zUvizefhkfAmVYrsQKYs6gQm
         0UrZxQD7bHWBg0on7Ew3ftl+YiZ1ToVuQazzemK20U23e/fSi31AGCdeZqxepDoB4Yxo
         0grg5qzjVXXFl7lARcVN5qbqAU1T0AZHDYiQtZcDIsHQJnqkrWLeTXFhHrwROPR4CYhW
         OiHoiO2RN8E5nepxFGIAn7rEBFydbg1mP4UjVPKn8DeFPxvYbY6+46yD6V0I1Rwzp6JH
         y6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706519670; x=1707124470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIls3X+c7u3FdSJgCYO346X8vHVfzQy7RDRpONBzCs8=;
        b=CkYVz45PsqJyRFF9Yiuwv8c57kKNRAGQO2b2+mG1t7oEBii500C6uC2jiv2AWiyYEf
         HtHXgone+/98TRFbM40zogey0vYtXHz+hFkzZQR8TzOji18KmBaZj4XT+2fK/8wSF3Mq
         AMn1OSlBQqRx5pnB99XcfI9nojeaGNuC/MO8YG2pWnA1ufyx3Ar2+v2Xj/1ea2tP/RQg
         MQcfaaCOW+9OflsvKxI3guTTu+D/gwtFrIOfoPGHc91lZww44+2yZTtQIrSqIM38O99Z
         VfrG+B9wk+4WgiBwuHc19e41B7kHwnRd4mTPLwwOnor7tB9ykNg5J2z8pE8JpYle9xD1
         wpvg==
X-Gm-Message-State: AOJu0YwqZzv6JwCxzF12TFxtf5oeyjzZKq1GXjhRfdrifmM5P0XQB4PE
	PZ6IGLEePrrvnW0VXA6PpThGYOY9AA4fp686zLIl5UG4P8mND7VbpneRMjLOVlDd9tTuFmmTjCe
	JcRZikwGB1vNyQkdvwHu0WeLn6on9DDWK+GIWpQ==
X-Google-Smtp-Source: AGHT+IFOcIWuTItyZKqMTQd4K9HAAjevtLTdNnIelgtBGxUq4gOyJJ5yPRFVzaiTjsZLBGg/m4xqzyKcXshN7qzswkE=
X-Received: by 2002:a05:6214:1927:b0:68c:4523:cb74 with SMTP id
 es7-20020a056214192700b0068c4523cb74mr2758364qvb.21.1706519670005; Mon, 29
 Jan 2024 01:14:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127001926.495769-1-andre.draszik@linaro.org> <20240127001926.495769-2-andre.draszik@linaro.org>
In-Reply-To: <20240127001926.495769-2-andre.draszik@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 29 Jan 2024 09:14:18 +0000
Message-ID: <CADrjBPpOrxczkLxeo7QpaOGy31SUriKUQmQe9QcRQKniEXg99g@mail.gmail.com>
Subject: Re: [PATCH 1/9] clk: samsung: gs-101: drop extra empty line
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, semen.protsenko@linaro.org, 
	alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 27 Jan 2024 at 00:19, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> There is an extra empty line here which doesn't exist in any of the
> other cmu code blocks in this file.
>
> Drop it to align cmu_top with the rest of the file.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

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
