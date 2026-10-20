Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488448;
	b=r0YqBOuQ00hlpa2Udwonc7JhnFeTKb5QdcGCwkDWcypbFFK9FAtRfK9BNZPRXV6m4kZ8
	 RGBpLaeobEBYcZynMMdtzu4otuMwC33WIv2u6a9BKRxTLOCcy3cIL/xBq9fI8q7u7ZRPg
	 U1NQ71e+MS0BSe2xFsKZeOpJWb34FbKtt6kNhajmbLA0nSCMaaA2HOoKEKKwjyv7N0fQ1
	 g97dx48z0TgFD9fOVo5MEUyWNwwvRxr3KG4xyU9hEftgQoJMwS4YAmNAIM7dAShP6BmcB
	 ELKPdMso3MtcuBv3gJ5HwNN85O0ni3yfPbioF4a5D/+GGwni/ZG3o9fC9WEjmoR/OmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488448;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=BDWYvpCyYNbdlYdFIyikLQLsNfMBmKmrC2Q4BgdAcQ4=;
	b=pJYCzKeFcQA5zkyAQCuOeFdEFYZ9gnvhjat4SgzljzinProrNheomIz/VDjScRcuHJ1Y
	 ArccPceYkCFUqck8h5rIq6DxNErBZz6TnIxj9kQ11oqOH0dXUxsTVV5dUia0BUHMzpORf
	 mwEWQ+KJD0bndWbyQ1H1NHvsfcW1lBeV9WNyBiu+Q7AALWifDFGk9fKJl9Hk3Ss2v1wSG
	 1LjX4bT8PENQp44U9AABFloTYWZCAdKcBvrWuAv8qAFDwv01R6+CYVDd9HZmXkqhd9Dsb
	 VqFoAkz2OmZOznPn4QUQCdKh5ZqFZUqjtFLNr9csIcDVen15bRFglrKAH9SzL1tL78g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABC3606A31C
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 09:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ABC3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eac48af23fso772757e0c.2
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 02:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792488447; x=1793093247;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BDWYvpCyYNbdlYdFIyikLQLsNfMBmKmrC2Q4BgdAcQ4=;
        b=TsdQisiNy5MhlK5Ts4k4z3hFdBvkSdd2ytrkRIYU7zS90KT33y2RezY38MH4ewK/FG
         j+Ob+ylnQojc+1ESEgJ6CFK/Bou1f92gJJ8kP6G53eM4x0czY1YrmcpgCo5GS4IsbQS/
         nGwM52eSWCzFaOZe9IV1sC1Go1AKuMvVIWBl1SiSafMAqB+DuVh4cCeLed4CReJyj1fE
         a84fx1ZKIDzF19obOGoT+i8V2o7st/b6mrCBKyVjMHUInxc25rTRQAz+3M4MHyZVspAN
         u8PzU2UCozIIM1K193Yd9rbefOaYVadXTsg7A2xqTw8faI4fBx6/hq9hmaV0+KQqI5Hu
         2FKw==
X-Forwarded-Encrypted: i=1; AKwUvBxmM7D0Z9okSoPaXCjJKkNzd6wu1vGe/wDl28jcm4+dJwkJZ0wMelLJ8Ss/w0knsCQjdCzYbZB8V6I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMdYeHXIGixxAJCJD+Go0o4zydeOD+Z2N0w49mQ2rlvxeE+yNY
	NSPfi4pS5FxbfG1MiX/qpCAUVkUfGtWsvFCoEBFkchiQSh049XjN8LX5szW7WBycTCA=
X-Gm-Gg: AYBFou1ybVQqhnC6wHmUPTrN5Px+cy06hxDOzCi3dwDGLq1+HYxPd6paNKnafWhcJhj
	a+94U/l+ZgDiQne74pgou43uZfU0sTrH0JbzOCgkgiGB/D1mds2jzR2mnEexEOwyKQ8vRNvvS7P
	SH0k5smBnYM7pHnL1Wagp1DmTYSATwci0cqyNz8+soTYnIdE/h56bjVTtRTJsAXdN0zeiUmIvDr
	wId8kVQrKTnVq2yXY1FHACPWjETwQBC7wg0gOeN8GrqARWuBPxyHSg4jdVqGvlMCKvIdWIrE3In
	4jliiHJrCo4teWCTcG5HXvRDJ2TjIsFEn04Cl+gprluQmKP1aTI+rAVHJRmq9YCuecvvmLZeSq6
	HEfzHFnmcOJVm+g+w47GoL/uzyRBxVTEH+Wd96N/dtldZl3RSef7YZL4xShTJBGjhyFeZdyANMg
	WI7uDMl4u1ZH3nAXXbaKOmE0cDmwu6RUpMgrWx+VPgFCDuDdBsTf/VYr8HoYwT4Xsn1x8mONlrd
	QwqRwhQUosp8zCp3dqfjqYm6mEQV6G8U0HhYL9T
X-Received: by 2002:a05:6122:83cf:b0:5ea:9a2c:27a8 with SMTP id 71dfb90a1353d-5eaaa8ad828mr3588169e0c.14.1792488447593;
        Tue, 20 Oct 2026 02:27:27 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eabba32fc6sm7931661e0c.14.2026.10.20.02.27.25
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 02:27:25 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5e9528732b4so2410696e0c.0
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 02:27:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxoQDE0u6FJDYUaXizadVdGSlq8YY3WG9Td9CtgtKli3naL4RtTSQ5mUMGfmNHt9OJKo2YC1noHawM=@vger.kernel.org
X-Received: by 2002:a05:6102:1625:b0:7af:fef2:8ecf with SMTP id
 ada2fe7eead31-7cc3691cf50mr3455060137.8.1792488445010; Tue, 20 Oct 2026
 02:27:25 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com> <20261020-divo-ssgrlpcsrc-2966-i3c-v1-1-30a47f25e515@renesas.com>
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-1-30a47f25e515@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 11:27:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWt8KV02C+N1dj=gcdJwX4s-_=+zRpsh+Za+f0HeHOkuw@mail.gmail.com>
X-Gm-Features: AclHuK-aAi-Edh8uIEyKFfeZ8ZpBiAefIme6DU1Cm8luHP5VW0oo3t3lyPOBTwA
Message-ID: <CAMuHMdWt8KV02C+N1dj=gcdJwX4s-_=+zRpsh+Za+f0HeHOkuw@mail.gmail.com>
Subject: Re: [PATCH 1/8] i3c: renesas: Fix zero I2C SCL rate on pure I3C buses
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Diogo,

On Tue, 20 Oct 2026 at 11:15, Diogo Ivo <diogo.ivo.sx@renesas.com> wrote:
> On a pure I3C bus there are no I2C devices, so the I3C core leaves
> bus->scl_rate.i2c at zero if i2c-scl-hz is not specified in DT.
> Deriving i2c_total_ticks from that zero rate programs a zero-width
> open-drain SCL into the STDBR open-drain fields, which are still used
> in pure I3C mode for example in DAA.
>
> Fall back to the 1 MHz FM+ limit instead, the fastest rate an I2C
> device could have, so that a sane open-drain timing is programmed.
>
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

Thanks for your patch!

> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -579,7 +579,18 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>         if (!i3c->rate)
>                 return -EINVAL;
>
> -       i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
> +       /*
> +        * A pure I3C bus has no I2C devices, so the I3C core leaves
> +        * scl_rate.i2c at zero if not explicitly defined in DT. The
> +        * open-drain SCL fields of STDBR, which are used for the DAA
> +        * pending read, are derived from it though, so fall back to
> +        * the 1 MHz FM+ limit instead of programming a zero-width clock.
> +        */
> +       if (!bus->scl_rate.i2c)
> +               i2c_total_ticks = DIV_ROUND_UP(i3c->rate, I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE);
> +       else
> +               i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
> +
>         i3c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i3c);

This looks like a good opportunity to use the shortened tertiary ?:-operator:

    bus->scl_rate.i2c ?: I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE

>
>         i2c_parse_fw_timings(&m->dev, &t, true);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
