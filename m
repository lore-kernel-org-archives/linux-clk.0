Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6B4800;
	Fri, 20 Dec 2024 01:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734659997; cv=none; b=pbA8wXX1x898yVXWyk99zJuxRt31+turm7usKLsrkfuOGhc62kyaEnzC2Y+m/QL2SHng8U6RBb1bccA31mT/GMODVHQKpEO9gNE6qMXwX7cmxKQSFSR8BkWwi4/eWcQULqo7OOCiM4nqxTjaAoItmGF+9qfb1gGtz2GAMW7NWMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734659997; c=relaxed/simple;
	bh=txGIzZDZ7emAst1jDCWk9iBkRM9m9iTw9c4HuFUPL+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lB3CojAr2nLUtK7ATXV/Ww5NIUqC9DHkK+SGxprp82Tw7BSpV6vCTuexjS9WPCJG3owsMrbfYPuFQZkTz23iwRV2eEELLC0/EfFv9sg6wW4cmudO5RKYGy1J7qSbZK5MATekaTkcb5FDjOhjY3zwqhpFeXPCuLPT8jRelFxyrw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPSDHZrX; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPSDHZrX"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-844e9b7e50dso125439839f.3;
        Thu, 19 Dec 2024 17:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734659995; x=1735264795; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w68OVCNKDRUYLbgJOcwMFHEvgy4OB2hhFbrartVXJTg=;
        b=QPSDHZrX/0E1nuGUU89wlaUQ/xL7SePg8/nl+EU3lqnQWfJGyhXMV2ZeIA5l2zFYwm
         QkzTha00CdWCm4xnjNnJJCUXMrI934vTo0WcBfKQooz/qaBs/dL/e6vOlVqq+LdnGNPi
         gpzY+PhxCVqTlGcp1YjZcWRl7uuOzqIcG0uLstMjMLlPQsrsk5FNr6V6mjEgbGRwtdaj
         Y2ZcOwf7oRidIwSYRpQQarJUi4Buw311PiMVrA0cb8XMxCO20bvzkHZ4PKXK1LCd1W6T
         w9mRq56o0cYViHYZtdL8es7I5ynz3W+wrNGktewb3rPw5hAu69MJFUfAptWbvoQoWj2O
         BZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734659995; x=1735264795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w68OVCNKDRUYLbgJOcwMFHEvgy4OB2hhFbrartVXJTg=;
        b=cBJbhwzNiCZGm3JUwBmzzvxcm1gG4vBMNu6E9qsMDdFthJpXiV52SsXDLel2x6Hnxd
         wHOOkW5mXInSJM9DAxik8yd/SEfxaNt5ctGRLLkhqR4NPK6w1voDK94qP7Vpr+8fbdyy
         gbkCkgQ6Ayu/aQzrwp5A79g2HsC92OJXVEWFoqpQ3Ioj4ibwQAq4qM/Bjo5NCyN/bHiX
         BkhbTE+TKH1kTYgUdXkJy/jaV7q4TpaBYCPPofSKZfTcrdWPV5ziMtFw6PfeKI9sbTbM
         cw7Ku7hbrD858lUYqRQaXOCByagnCKPbPznEXe3ExikP1lUK9u2iQ/9RlncDU29iaL8D
         r9Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUUaptWoPIrB6HzeqKTeyQGYrBtqKH3eqYryY+/5Fa4s5dYOGSRikltBdu2V4QNTF2CVkQ/aiYNetk=@vger.kernel.org, AJvYcCX/6JAb2zOHpy7MMOutFmZWpdz8LUVFMNhB6sOnkOd94svIVC9tnBQJjFbsIywr5/M+sdpaqI4m4Os7TjMc@vger.kernel.org
X-Gm-Message-State: AOJu0YwHPxkQk0I1i4JEfs4aNfQtPU4BNg/AaJ/sxS/wXdY4VigHycHA
	WYu9+oEjtr372QMAjYPD12CPrFl5sYP+3HeJFvTnADpcqU407xzWpnSM/r9YXBlAcaSARPoIYAl
	v27xKu+Fjyj8n9JSEdHX9maUm1MO6PCmp
X-Gm-Gg: ASbGncvQI8OAgA0TlRH07Mj7qYSYmXWlRlqNdO6M/CSpoatceinxgtuT2TuO2Sjevmu
	ZXf1CrinfPbMVH27LZ/smnikOwHVLXRrAPwbwxQ==
X-Google-Smtp-Source: AGHT+IGGWwEgfDagGWdRJ2sz9qd4EJDpuuMO//PocPQVWC4Le5q0Eh1GxoTcg1NZhKqs+MDGDTNUymTHBZPUut5L6BE=
X-Received: by 2002:a05:6e02:2687:b0:3a7:e83c:2d10 with SMTP id
 e9e14a558f8ab-3c2d5b37857mr16006015ab.24.1734659995420; Thu, 19 Dec 2024
 17:59:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219105447.889CB11FE@mail.steuer-voss.de>
In-Reply-To: <20241219105447.889CB11FE@mail.steuer-voss.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 20 Dec 2024 09:59:44 +0800
Message-ID: <CAA+D8AMO+ia5ztD8Z97TOn-NBbXKHfd+T65zBc6vJuNkeVdVhQ@mail.gmail.com>
Subject: Re: [PATCH] clk: clk-imx8mp-audiomix: fix function signature
To: Nikolaus Voss <nv@vosn.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 6:55=E2=80=AFPM Nikolaus Voss <nv@vosn.de> wrote:
>
> clk_imx8mp_audiomix_reset_controller_register() in the
> "if !CONFIG_RESET_CONTROLLER" branch had the first
> argument missing. It is an empty function for this branch
> so it wasn't immediately apparent.
>
> Fixes: 6f0e817175c5 ("clk: imx: clk-audiomix: Add reset controller")
> Cc: <stable@vger.kernel.org> # 6.12.x
> Signed-off-by: Nikolaus Voss <nv@vosn.de>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  drivers/clk/imx/clk-imx8mp-audiomix.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-=
imx8mp-audiomix.c
> index b2cb157703c57..c409fc7e06186 100644
> --- a/drivers/clk/imx/clk-imx8mp-audiomix.c
> +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
> @@ -278,7 +278,8 @@ static int clk_imx8mp_audiomix_reset_controller_regis=
ter(struct device *dev,
>
>  #else /* !CONFIG_RESET_CONTROLLER */
>
> -static int clk_imx8mp_audiomix_reset_controller_register(struct clk_imx8=
mp_audiomix_priv *priv)
> +static int clk_imx8mp_audiomix_reset_controller_register(struct device *=
dev,
> +                                                        struct clk_imx8m=
p_audiomix_priv *priv)
>  {
>         return 0;
>  }
> --
> 2.43.0
>
>
