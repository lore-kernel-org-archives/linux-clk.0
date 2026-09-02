Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D523E92AC
	for <linux-clk@vger.kernel.org>; Wed,  2 Sep 2026 08:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338588; cv=pass; b=s0RQu0b9VQyZltudSa/L5U/lkMhjvBDre0MXBhtNBzdZVIfbx0dAWM45ApTbH4mHO5dSLYH1CvVV/zyFGKHoU72jI4GsRioPR13tnXVOBqLnJi/sqRUWkpUW5UUSHCVLvT9rQSnRUT24uHiimhrcB2Mhu5lsfZQq6si+ZqnP0Hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338588; c=relaxed/simple;
	bh=b4pWNzMFWSV8XpBLGhSp49rU6RnJJSCCzasr+WSRvDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Clg18+LKFC4I8IZl7CgiXkU7eTwaVf3IPi4h9Ff+yolnUo20z74iajwi4h6z2iQgUEL+JxSHYxujMlipZ7//aDBdbVcrCSoruXA7D0+tvs+UynVizMjiXt76BHcj6cX909nxLvP7gty/Mc0LDznLLwDz2tcNy82Tvhh4vstqIAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=rCHLylZ3; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="rCHLylZ3"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a68ca482e2so147386a12.0
        for <linux-clk@vger.kernel.org>; Wed, 02 Sep 2026 01:43:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788338585; cv=none;
        d=google.com; s=arc-20260327;
        b=UtLuktYmFRkKYrtHKeGnqnidQNvHClsIhTplVlG9FWYKHL/zpA+Ji/D2iXDrNIq/9V
         HucXAHRX9TZXE2p8xQPgfvkgx6IPcl/E9G46WAyA1RJAPrc8dXc2CuUxqn0/0SD5ZKiG
         u3o57m7FJSSJFMzG+cqS33xUfkfJ5opet72soYfahSB4qyVQmixIGY+aO72HRB1nG1PO
         LECvYSx5je0Fj0zb6w/jEltouoTZ56rJcTf+bPZjGrl5cIjQoraCqO4j7E8yWa2NLG6x
         121iwlWwPGHB0dwtk1wWTyHov3O/Hi7LHM5S2DDAKp+qxALFmQ9lFmxyKORqpC9uBumt
         yacA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/501w4jjREjvvsgS+ZOz+uCZPO58x///HL9BUvCfOWM=;
        fh=rHOEeCs8dF1GQu/XrQzFMaUCh4GOYxmjTApNZrQ+Ovg=;
        b=aRX2MVs3pYz41paQa9QYY80bChua9C5flmznZz29Fd1us+l2vEXgNhRlgtHDoi4g/w
         hBpGwDZRWyDfW5nQvkUewAfN1fPeUlieqgwe/oIjo6sIzZ7MSy4Frg1y88+RnYpUcTSy
         EIHNg2CY8utPXa/YRpCzxohS3SqXsr6BWw+Gdv04m8xfqCxj7qWulaUH5ytCDwq680D3
         WARDR98P5t3e4vE2TNHD/Klwb/ZYd1vvPjK/9g0Jo4RKRsggIVnhMO6DwEtXZS3T+sMI
         653daKpxbK6dKaDetehAUfosu6J5VRvARJlDzA9IjejZaICk6cZOMzTXhrQVLn8l7aZF
         2SHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788338585; x=1788943385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/501w4jjREjvvsgS+ZOz+uCZPO58x///HL9BUvCfOWM=;
        b=rCHLylZ3uxFvPWDeB4WYm74Sd/O//JRlAocrbI2chx9vimSiTTldU0BzAAYFlhAqAE
         Ks4rU52oRk07OOcKPBA6Z1KF578ZUrHNk23gY9XVyAZvGi3paYky1gfQWlOZ31yHPfgE
         7dllv6pH9jH15WXE8kOd1KchqnsUvS1hMn1vJc8Znru9o41WRTVzeZLI7qUNz6GZbaP/
         5wzYFypa9rV5n0HuOP3jLUNwLSAMQ22zQuWp1U/1SmeiKRa9ZCktUSVBbbxVlzZRhpBz
         wktLE/L+YXStPlrPNRGmh3Cfqc4bBeY3uVc56tWQQLMsuh0Nqsebw338xiRdb7YGlJ4/
         Cw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338585; x=1788943385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/501w4jjREjvvsgS+ZOz+uCZPO58x///HL9BUvCfOWM=;
        b=WoQzDR4MeLwsbrhJANG2R9EesNECyjcA5U480ZBB4OZMuaN7Af7FVXM4oKkTTMvtYa
         oCP+th2n3z7ZUOafedAT5UmRvMKLgj2jZ4qm93KL8HsACkQMVOqMU34lM/Yo050DFguK
         hahXB0tM7toCZy0MAQjvLyPMqFc7F5RMx0rnjZRZtU2HXrAgYp8zWSJK3QcKisBflTwr
         3qPKneiKH5BuuQoYWpW0KJzKIWLlIBn5LTh1CKFg0ig6ez7fRCHEtf7MOLt8NkyMYvVa
         DZAlhgBJMJ++jsiUr4bL9o5ufJtIGZb6Fj/GZ+lWFDUC6tAnXWYTQ+A2kMtvJMMgJi0a
         Bf8A==
X-Forwarded-Encrypted: i=1; AKwUvBxZArMAhZISVcJ+nz0aTO/OykLNgND8R03A76Li1oLjNOyZwIUVp9fgyVF2g/A/75u1ErgBYoOAzBc=@vger.kernel.org
X-Gm-Message-State: AFuF++lRxFe0VzNOSsSJKWO5AgVifwJHqS4iS81mYbhAZaG2As3mFlfY
	bmCNMx+M3s20X/Gnjz5xLzXZJznSVzGNMgIhJCji4vR/a6QxlBu7oOT25rVYHJHnRofmY0pDI04
	zuJNWMKMcDa6flUB6lzUEEwPuO1ZjH5+8BN/Fp62X7Q==
X-Gm-Gg: AYBFou2tvYuEwe+5+g/Jdm/Is5CmQjKU4uVX2EWPywmCNHdhCIlftl2NxTihvcfkGT9
	L+0Jk0VkWYy8axYEFlXe3muzqmtjoS3aBkvTZP78cRPZD/PCgOP0bFRzYTIgNJo1vTTJxh53QB1
	U7Zq7XkJJi27JgYj85NNAkJgaOdXadK8PxTGdSQASUVepcT/QHDJcIcwOuBwiqhGFF63qFQBRZt
	gr4pRPsD1SUf3AaKpckgT1Aiwkp+a/9o5uNT9Nt3PLW6rkh+o7mvcbiARaw0Ggv3SBD1/tTlIO0
	FE0Stsg3yZM8I+ihz7L+JimMQwerZ5M+YZtr5Fxh8PWRkdZ4sUnNHB1F2sWKedC8i1DtZssa6NQ
	C
X-Received: by 2002:a17:907:9625:b0:c25:4f7c:8ec5 with SMTP id
 a640c23a62f3a-c25d5505c79mr194261566b.23.1788338585138; Wed, 02 Sep 2026
 01:43:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901234351.190506-1-anarsoul@gmail.com>
In-Reply-To: <20260901234351.190506-1-anarsoul@gmail.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 2 Sep 2026 12:42:57 +0400
X-Gm-Features: AcwNN1VBSx96Am5bMyza-3Z81_49VCDlB0IsZHW5X9pTU9Oq40nOjzgNhihFkBM
Message-ID: <CAKTNdwFqSBt4QVCuYJxTyEDsxkW96JbUirFNAgJYWVLHzGpk4A@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: rockchip: rk3399: add 85.5 MHz rate to PLL rate table
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vasily,

On Wed, Sep 2, 2026 at 3:42=E2=80=AFAM Vasily Khoruzhick <anarsoul@gmail.co=
m> wrote:
>
> 85.5 MHz is the pixel clock of the standard DMT 1366x768@60 mode,
> which is the native mode of many cheap HDMI panels.
>
> Use a 1368 MHz VCO (24 MHz * 57, already used by the existing
> 1368 MHz entry) with postdiv1 =3D postdiv2 =3D 4 to hit 85.5 MHz
> exactly in integer mode.
>
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  drivers/clk/rockchip/clk-rk3399.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk=
-rk3399.c
> index c2b243d7a5e2..db241d2df625 100644
> --- a/drivers/clk/rockchip/clk-rk3399.c
> +++ b/drivers/clk/rockchip/clk-rk3399.c
> @@ -98,6 +98,7 @@ static struct rockchip_pll_rate_table rk3399_pll_rates[=
] =3D {
>         RK3036_PLL_RATE( 148500000, 1, 99, 4, 4, 1, 0),
>         RK3036_PLL_RATE( 106500000, 1, 71, 4, 4, 1, 0),
>         RK3036_PLL_RATE(  96000000, 1, 64, 4, 4, 1, 0),
> +       RK3036_PLL_RATE(  85500000, 1, 57, 4, 4, 1, 0),

There is already an entry for 1368000000, which is 16x your rate, and
the 16x divisor should fit comfortably into the downstream clock's
8-bit divisor field. Do you really need a separate PLL rate? Have you
checked what the hardware arrives at with the unmodified PLL table -
e.g. via /sys/kernel/debug/clk/clk_summary?

Best regards,
Alexey
