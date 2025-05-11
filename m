Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FCC1D54C0
	for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 17:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746985116; cv=none; b=PZQbuiSFWMfb8ix8AKJDsHxWnppAwm/caI/azdPMWXAENQtOH9w76O3z7xL+6yp4yywg+AwHBGv1cXYucJdEHdGpoJoDBPhQNx0lEzVSnq8nuCdlLB6nXG6iyGYRY55mqDYNmCP7ZjiZvfVghGV0mh9iLbmZ/+ZUWi8Xx96A1+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746985116; c=relaxed/simple;
	bh=eBBZG/T8tWp3lz/GI9IwiMI7jMFA+cT2hqHx+2FpoNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JNncsV33ij/Aek7+V5fjx6Ck8n3Ry7SPaSxVF75sRnGqvt4bZ65ft/Xw0zPLgGING+2EvHvqVBoD4a+oxtTIUG1Gn4hMpjR4x1xJQWq9H2DJvLlCyZ7KXyc7pTYweW23emE90Qshh4xCodu+/Zzlolrq66lhctduYOcSUKyfdTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lessconfused.com; spf=pass smtp.mailfrom=lessconfused.com; dkim=pass (1024-bit key) header.d=lessconfused.com header.i=@lessconfused.com header.b=L3qIKz4V; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lessconfused.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lessconfused.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lessconfused.com header.i=@lessconfused.com header.b="L3qIKz4V"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22fb6eda241so36407745ad.1
        for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 10:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1746985113; x=1747589913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htpdGgGE0WJqHpqKCEDMnW5Vc8YelVzDOmwa66AXTRc=;
        b=L3qIKz4Vo0pKj8AjefDb3UDmmoQFDUkbGSPC98p2fgrAwaz162TyheWO/UnuETzf4M
         q/D3+uyzImAvT/rqyijHH8B/OxaCE0kuRhPfny/YISLvKj2a64ZU6KbKtAjRG7Jw3BNT
         PjdLXl36zv3QU5PLioDu/fnLA3bq91/7tysDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746985113; x=1747589913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htpdGgGE0WJqHpqKCEDMnW5Vc8YelVzDOmwa66AXTRc=;
        b=AJjp0x0sz4cunfbRkYUnZsHLlD8MoBlH8sFIO8WxeqXltDJTQryZKoDf+kwWCtQj6l
         rbjQYBnKSjrmUKZJGifGZeumFLc9k8bGLVTTQwioRA0V84UIrMmggZ0WPJyER/ooWfT0
         ASEJb1yhpM+OWvnQ0b+ddJmPLDGD1ScHp6y9tNkWD+d7/W3xVNpJSl15YFVovhfEzySC
         DiUwgy7I1l+2qVFPH9RCydBvYOAMjorOiP7/Tdxjp1BFd3Y/1T0xCo3FyD49PyiXLw/Q
         v5jCNZlKsbQTjBZbQ2EZFyjSlbviw+72HN1w/O1/gMPcS4sxvW+aGex1EgTTQ+Bt1c44
         iaVA==
X-Forwarded-Encrypted: i=1; AJvYcCXLtzRp8podDe7A6bBRWpWOTEYn3srCb+vzZgrMQAZSYM5xWXSrSnNcfhj+jBL28Xw014VDE7OCDmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOi/nnVRpJoR+dZd7IVYulNyE7nKoCReY8XydpwnQFIW2F7ouv
	xQUrv/ulZNCAbHLCpM3+vvCPAQ1ndnz3VGVthsBE3IPzLDDMCh1Nrq4zDYOanwMNfUPYyViM5cJ
	G5TwXAR1fAZSbfzZYlRQQchxKzYinhlBfiWpNHQ==
X-Gm-Gg: ASbGncsaYZYACX87SebtGPpBO2GRnIULaeqT9EnMOKx6n3gBvi4ioFjbJqlgCHh8DOv
	iCmAWM1k1hBJ98FrkKIz9GeV2ue6eQSgAcYaZN887LLE08lMx04M8jI6evSdVGVL1Qje744/kUo
	zj/ioM68R7N6qKtPvhAwMmbyZnzRJbEUVM6mApmAkPvgr8kJspggbFsCKe5lHkYi15cG17YwgYi
	d7Q
X-Google-Smtp-Source: AGHT+IGlWFjDOSR6LptznPfsrBGcmLqTeFU1+S1/2WDCbsxyxoLwah/czQtlkvxYzoeR/HfJw2W1NJ3/is38sxpCk0Y=
X-Received: by 2002:a17:902:e94d:b0:224:24d5:f20a with SMTP id
 d9443c01a7336-22fc91c2cdcmr176733505ad.48.1746985113315; Sun, 11 May 2025
 10:38:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511172732.1467671-1-da@libre.computer>
In-Reply-To: <20250511172732.1467671-1-da@libre.computer>
From: Da Xue <da@lessconfused.com>
Date: Sun, 11 May 2025 13:38:22 -0400
X-Gm-Features: AX0GCFtg3EgdoWRuH-CkzemoXtkQsOI76TednUqqH8u_ZIuzhBzf52QSqYFsAO0
Message-ID: <CACdvmAiqQj4NjazMvdwQtB5zX+SQs7bwXEchT5thNM83=bQBhA@mail.gmail.com>
Subject: Re: [PATCH] clk: meson-g12a: fix missing spicc clks to clk_sel
To: Da Xue <da@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, stable@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, this is an older version of the patch without Fixes tag from a
mv error. I'm sending a v2, ignore this one.

On Sun, May 11, 2025 at 1:28=E2=80=AFPM Da Xue <da@libre.computer> wrote:
>
> HHI_SPICC_CLK_CNTL bits 25:23 controls spicc clk_sel.
>
> It is missing fclk_div 2 and gp0_pll which causes the spicc module to
> output the incorrect clocks for spicc sclk at 2.5x the expected rate.
>
> Add the missing clocks resolves this.
>
> Cc: <stable@vger.kernel.org> # 6.1.x: a18c8e0: clk: meson: g12a: add
> Signed-off-by: Da Xue <da@libre.computer>
> ---
>  drivers/clk/meson/g12a.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 4f92b83965d5a..892862bf39996 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -4099,8 +4099,10 @@ static const struct clk_parent_data spicc_sclk_par=
ent_data[] =3D {
>         { .hw =3D &g12a_clk81.hw },
>         { .hw =3D &g12a_fclk_div4.hw },
>         { .hw =3D &g12a_fclk_div3.hw },
> +       { .hw =3D &g12a_fclk_div2.hw },
>         { .hw =3D &g12a_fclk_div5.hw },
>         { .hw =3D &g12a_fclk_div7.hw },
> +       { .hw =3D &g12a_gp0_pll.hw, },
>  };
>
>  static struct clk_regmap g12a_spicc0_sclk_sel =3D {
> --
> 2.39.5
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
