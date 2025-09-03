Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A613217A2E6;
	Wed,  3 Sep 2025 04:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756873276; cv=none; b=sK16WnhOXonI7U79k35qd3s/lfMqECp62g1yDGUEuQuAk12cHXoZ+MDz2Hw9KwERW8hr2OVUFFFdFEHXFTFsc+zhp2ooItZ2mJcGui3xlanzY9qDFMP68XunvK+yZ1SADTvm2He8YhzDxeTs3s3YgXzQgxMbEofAS//i8UeBt0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756873276; c=relaxed/simple;
	bh=ZoXxCHWqaro5pXtAU4oVQfP5mp8AkjK8NRJcUqEzsiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kp0jUo1gVcYb69SnA36jj+gX8p26CdrK55kXAAeekmiGqyxm9VgG0PcDR4c0vWhlyEBgwnJXpJx5/c8x6eCFcimm6EUFeGHyEYsJJQBSQvHku9MgFz308LhALM4Wr4BIscYM6gB6FZTIR2VkXO+e1KLa7rP+y5gAqsKbsWqKgCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55f76277413so3633438e87.3;
        Tue, 02 Sep 2025 21:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756873270; x=1757478070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ADtwGUks5/GGWfb4oIFPF0C8f7SmDwE61v3oi+KH4+E=;
        b=nfUlBMWefwchqSdkZ4+EqzudDE3SzXU0YEQlA7FdLKy9s9ntZdAA7VYIhaxJILmIeu
         Y5a/ZFAgDtCbo+OTuNF98PPxalRnGyZ8vyRXkcnzbZipsxPbtQ8WmA2Od+xhgXtxsU1h
         E6PERtY8oDCLpMZxeDuWXT0MeuKpPaagiqhMc8TbKJuoeOUTY0kLloMSzKmKKrUC8w1F
         88aguQ/krpOD2c52ssh5UOHItptgULWi8Pr3ZMq06pa30UYy4hqex+ZRBPLr3YzxXIJq
         llVyrn5EuPv/h4ptIiP+JmkQxxaKdKh/uL3EGg9O/iJzg22b9fETlOiii55vJq36n/vP
         npJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJnG3PLsx2/WMDZqGDO/U912qGgrVAoijytP/I/FLjSpHqJ2iPTpVjvBVhjiKVfq4Z8k9pGNON+jV7@vger.kernel.org, AJvYcCXiwhCSN0u2xnGt1zUJcTIdr9d/GP/Q9OM1oZ6vUOr88SlqrmMxJ7+MoSSnH8j+si2U0dKtJz6wv45J@vger.kernel.org
X-Gm-Message-State: AOJu0YyFn3lCxfXLV659J6EE/3I+8yWXvQsfUTHwe7FFyyV/hq6Qlufo
	c5JlKUjRrUZX34Vr2PNZzdnrroFU5TuJJNHdwGBDSMNf+K6aqvt8jYaXOLkW3bRM
X-Gm-Gg: ASbGncsyegWq6rFYuv57DRs4D9Z7aA8k3bLo570meFFOECMGM9NJwfYxwKccwLtdKjl
	g1VpCMP7Pl5b5rLmqHpHlZAYcS9ZmpchXhoOciINlyP5J3FqGhVCUvesqIwXE/SN4eHST+oQKKx
	zpig7079Q/jTTC1AhXJGMQqKBiKKeBnYLjgAT2d1vv3t9RSnzWXCuq+Nap16TaXhxwFggFYfGxp
	+DNR9J/q/InYZvsA/4mwU2v2dwUTGiHMdTpZC3zOd4qgFM4AItjeg4tVFI+Q+BXaWWeAlxi0LrN
	Wsoi0ClIY+p7I/MYycJPBdtXJd5aOxCupF39gNPAgEEc8iHcZDmUhiRbMmYli7OvmnBy5gk+AKH
	jY4vEiiBJT9LjJhE2YgLKIuPRTaIA2RccAeLrohc1konO5Vs/XzpWiu9dWBaejw==
X-Google-Smtp-Source: AGHT+IGKpurOeaAlRPQn5kLQGQbzlNMRAHGJW2qM/CfCp67QxWWRMC3vy6peed0odjLeqRt7SNC3zg==
X-Received: by 2002:a2e:be09:0:b0:338:7f3:a757 with SMTP id 38308e7fff4ca-3380802eda9mr1550911fa.10.1756873270201;
        Tue, 02 Sep 2025 21:21:10 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c4ed3csm7714101fa.4.2025.09.02.21.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 21:21:08 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so5280207e87.0;
        Tue, 02 Sep 2025 21:21:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6to7P1iTy4R+ERR/zfgya5/Fnw0Tr9Br9D8cG/TcbERncfeyS/fR3VjkmQQBUzZo3sERMROleYQii@vger.kernel.org, AJvYcCVKpfRxN8g2gTvNO3yieG7AX4tvLLV0E/H3F1gB5Dw+vIMa9Q7cGTsoKFArhKO1dsCljAYLViQJ+WT2@vger.kernel.org
X-Received: by 2002:a05:651c:551:b0:336:e102:9611 with SMTP id
 38308e7fff4ca-336e1029af0mr33033101fa.36.1756873267878; Tue, 02 Sep 2025
 21:21:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903000910.4860-1-andre.przywara@arm.com> <20250903000910.4860-4-andre.przywara@arm.com>
In-Reply-To: <20250903000910.4860-4-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 3 Sep 2025 12:20:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v66DHvE5gcWDvHwoiiCgNEnPiGjB6ash407PwJr8oMwyhw@mail.gmail.com>
X-Gm-Features: Ac12FXwDJPiA6-F7YvlIel1VqSOtkOlXCU1uqZBll3biFaGOGyU1Aw_g7q5-Q7Y
Message-ID: <CAGb2v66DHvE5gcWDvHwoiiCgNEnPiGjB6ash407PwJr8oMwyhw@mail.gmail.com>
Subject: Re: [PATCH 3/5] clk: sunxi-ng: mp: support clocks with just a shift register
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Mikhail Kalashnikov <iuncuim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 8:09=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> The "mp" clock models a mod clock with divider and a shift field. At
> least one clock in the Allwinner A523 features just a power-of-2 divider
> field, so support an initialisation of the clock without providing an
> actual divider field.
>
> Add a check whether the "width" field is 0, and skip the divider
> handling in this case, as the GENMASK macro will not work with a zero
> length.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---

In my series I have a patch that adds this to the divider clocks,
thus adding a P-clock type to the M-clock bits.

Maybe use that instead? I prefer we use actual matching types instead
of disabling one part of a complex clock type.

ChenYu

>  drivers/clk/sunxi-ng/ccu_mp.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.=
c
> index 354c981943b6f..a03dac294d048 100644
> --- a/drivers/clk/sunxi-ng/ccu_mp.c
> +++ b/drivers/clk/sunxi-ng/ccu_mp.c
> @@ -236,9 +236,11 @@ static int ccu_mp_set_rate(struct clk_hw *hw, unsign=
ed long rate,
>         spin_lock_irqsave(cmp->common.lock, flags);
>
>         reg =3D readl(cmp->common.base + cmp->common.reg);
> -       reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shift);
> +       if (cmp->m.width)
> +               reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m=
.shift);
>         reg &=3D ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);
> -       reg |=3D (m - cmp->m.offset) << cmp->m.shift;
> +       if (cmp->m.width)
> +               reg |=3D (m - cmp->m.offset) << cmp->m.shift;
>         if (shift)
>                 reg |=3D ilog2(p) << cmp->p.shift;
>         else
> --
> 2.46.3
>
