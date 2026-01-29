Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C239378D8C
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 08:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769676644; cv=pass; b=ueJ8m5Xfb2ldCIe4rWCKpR/DOVo6s9uwJR170Zj2DHbTNlLandU5621ppwk9dxLbhxtBl3Y9WqjkfWhhy27cO9YjiUbm5BsDlW6eF+aAYe2oCu6XwRB+XK9Dwhw5qS+nmvAULeXfB3hV0hl3xfCWPbrCjQmFWZV9i4Q/e4AII68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769676644; c=relaxed/simple;
	bh=DTjqSLomGJLvJusWZVnjCMIBAVwdlzh1nRDiu1cGAsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3YTMb0fsTYfNjWcBS5yEmIfidwbqHzpU4WlFYaIecy7gtWyF5RYcanCBA3/YnBPAM0r/Mag0QY2GZSR8u9fJueESaQosrMzJv0Tc5RM/X1rHlvtoEZ/eQWvnDJ2kSF6N5qlsx0GQy70bTFzv4lQnQC+QhvqmBQEDThgut5xAFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQSebzn3; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQSebzn3"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-124a635476fso1013043c88.0
        for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 00:50:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769676638; cv=none;
        d=google.com; s=arc-20240605;
        b=lUXKCZNT0RizmHxRrsCcN7xo/imXQl3ZcOCH2LDJn+PbG5ANTiAI55wCsuFfvbiu9h
         vDDByu09fmRXC647tnMjBGCdH0aNdDXDMzwnqnBemIghxL9Zuj5UNFqrtfwLgVkYcDHU
         VP51a9+8v9gMMnxXdAywc2SoounNC/zQ7MvL4iGvqPGmdiUKclWpOkAhxfUISTyMhMna
         S6iG6vim6akgx94F63etgDDyFe7OujBPZEpluuWXhPnjZaE4rTEvUtVC5kpCGDHozMvt
         Itw9mORspbEOMGAAS//O1cDHlzAgipcqnfPRAtY1SnrihS+imGhbTzoNGkk2rJZCqFUv
         WzSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ZvWUh8GJpUOtP+DEysTJdxrRMiFKkExrw02tL0FdIs=;
        fh=MdlZ4zIneN23y+wp4+Y+xJrQz+P74I55ci3xCYD3V1Q=;
        b=ZjZr0mt0Vo5BUqSoBAuZjFA8Sq1y4FnJwFJAvfMz7sJpSJa+PxyR8ux0dOeBFHvujA
         v+CFiyLw6ngImMXSE9VwB7Ec2oqpgggT4F0LFcVASk/CJU1VfW4Xdyipby1AVD6Bi6Ke
         qbUyBOnSy7wkjm9whqusVVRKRcajydHip1qeY2Gx0Qlo61bTufBz0TD0/XA4eB6YXCvD
         fcrr6rYa7mIa5d/WVNoi1ubhJa6R56kUHHKWOW4uSNpfcqshe+/+nUUhdVTWiC91L/iX
         HvcYikJwgJwDg94eqDshx3QFFN0mXqOTRidVOHQ5sxUfpuMlnZsbdCkNcfJeL2uHIMGL
         ONUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769676638; x=1770281438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZvWUh8GJpUOtP+DEysTJdxrRMiFKkExrw02tL0FdIs=;
        b=ZQSebzn3XT57ROzzHuuXLDW0Df7UvAhGpvqPTCHFmCY+bAXj/385HoG4yVgxo1H4Pv
         zJ3L+7upFWoGV0pMGo+Zk6Ok3zmjCesPgmCi0aJIr/Gg7N2lzDsL8nCulumLx9FmeaP2
         Vv0Sfpy5AeKRrmd6uM4/aFINjqSSQOG3kkNynGxKFsyH81fH1owSqd3E0tvn4t4CAXix
         43keUrP7dOZfEhxNqJZ08bP589tKaAGYG5EMyNj6xtarSwFZI59NZbXXqGBPquvcjZqk
         M75fqSx2lMqXCcUTjCj1soZPu2y9pyi4aZ87ISY/jK/S/oJeONytE7IbLJ+ILDNZtWIN
         cNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769676638; x=1770281438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ZvWUh8GJpUOtP+DEysTJdxrRMiFKkExrw02tL0FdIs=;
        b=ViZYfWfHADbmt6IdSjMGOAdq5wQ9pdcXb/3DVpUviaIL33p9Jm/1iQcrSKkceQkQB8
         XedWFgJpVdCjhUAVeEJKQ0kpgxI9nvI7D3ZwVrQGnDT6ibHjbf6qyL8g7hN5U92NPOW/
         faLtI0dP/YwOyQBJki5fJO+EnMIeYhj3SYjANiXwIz9/uHHAfbwP1MCzSQP/W0sCBwft
         AYY+FfehTNgnH1RAcLjGgBgFN18HRcCN/DRQHM8AGFW23AMkq4BF4F/cI118g3jMZ8xz
         Y/izofgFzP7lSJfneuG55eBUakRZXiXwqCvsvVacYRCBx2/n0gOC3QOLZelYJeA6lW6i
         8WMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaWWNEOR6jVhmRmIMRQKgKKX/GdReC1d4ldLIVH+qWLBLDUy8bkt1dhcClpwOjdJJ8E1yBRkGqYFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsK00xhGwJFifq1Z4WsP0U9O5sD9EL6nhKplccvUMLT0zZW1Ue
	3JhyDAiKW4Ls9cnJxuFuvCIhLq1lqrWT7LAH3Wi3MX5rZfrP0j7ANQg/lc7szt6Ey8nG4SIVmqj
	8btFDN8s1+kT5fs3ZoVgKc5rdbdZQ07rSfTK9
X-Gm-Gg: AZuq6aIN/44HOoceJDzomA6fqQHUm8obByz2XPkNTpRM5BbgE0RMZT4Xnk8LWVG6b1b
	87Cf+2m3n7emGMKdVh6ZS/UJyOg3H9X42VlWGhyFzExRt7Ro7fWwsuW7dKaUQxVehhCkNHMRBnJ
	osUoaXeH5p/ft//QvFrecd5ZkYJliD3zEPo3pWFTyHsDKjhr0XiRm+KGUJw1va1+ric3LftJJvt
	rygrVO/XfC56Zwqw2wqPApVmRZVEZaotJY2/qNpnoxNN83UjJbCwTGj8z1mVdT8FPTysYSeuH/C
	XqyQr2wm3Z8sOtonCzTm46QvvXdWHmVEQNM25aKbCPv6cHUrx2XtLqf1hsT8SX9RqSOCugjm51W
	UJmfwoZU2dmF2mCMdBotR/FlT
X-Received: by 2002:a05:7022:24a9:b0:119:e55a:9c08 with SMTP id
 a92af1059eb24-124a0114330mr4531675c88.36.1769676638430; Thu, 29 Jan 2026
 00:50:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128-ops-parent-enable-fix-v1-0-ff39cc37f98d@collabora.com> <20260128-ops-parent-enable-fix-v1-2-ff39cc37f98d@collabora.com>
In-Reply-To: <20260128-ops-parent-enable-fix-v1-2-ff39cc37f98d@collabora.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 29 Jan 2026 10:53:22 +0200
X-Gm-Features: AZwV_QiJoPjxBlGc_n241-eebqcvpnHRLF4wcryqHdHTimEnsnf5j3OD_trI938
Message-ID: <CAEnQRZCSQ2o-P8ABCf257UzcYhojfg1m4d=oCmCxcCYWZ1AsGg@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: imx8mp: Mark arm_a53_div as critical
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, "S.j. Wang" <shengjiu.wang@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

I've tested this series on i.MX8MP and unfortunately it doesn't fix the iss=
ue.
This is the serial console output: https://pastebin.com/dvJQ0HBy

We can talk privately and can help you test if you have debug patches.

Reverting:

669917676e93 ("clk: Respect CLK_OPS_PARENT_ENABLE during recalc")

Makes everything work again.

thanks,
Daniel.

On Wed, Jan 28, 2026 at 8:40=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> It appears the i.MX8MP does not like when arm_a53_div, or rather the
> parent it depends on, sys_pll2_500m, is briefly turned off during
> __clk_core_init.
>
> In the past, this clock driver could get away with not declaring the
> clock as critical, as nothing ever fiddled with its parent that early
> on. However, after Commit 669917676e93 ("clk: Respect
> CLK_OPS_PARENT_ENABLE during recalc"), this changed.
>
> In order to guarantee that it keeps its parent enabled during
> __clk_core_init if it sets the flag CLK_OPS_PARENT_ENABLE, the clock
> must be marked as critical.
>
> Fixes: 669917676e93 ("clk: Respect CLK_OPS_PARENT_ENABLE during recalc")
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Closes: https://lore.kernel.org/r/6239343.lOV4Wx5bFT@steina-w/
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/clk/imx/clk-imx8mp.c | 4 +++-
>  drivers/clk/imx/clk.h        | 4 ++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index fe6dac70f1a1..ee10f845faff 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -655,7 +655,9 @@ static int imx8mp_clocks_probe(struct platform_device=
 *pdev)
>         hws[IMX8MP_CLK_CLKOUT2_DIV] =3D imx_clk_hw_divider("clkout2_div",=
 "clkout2_sel", anatop_base + 0x128, 16, 4);
>         hws[IMX8MP_CLK_CLKOUT2] =3D imx_clk_hw_gate("clkout2", "clkout2_d=
iv", anatop_base + 0x128, 24);
>
> -       hws[IMX8MP_CLK_A53_DIV] =3D imx8m_clk_hw_composite_core("arm_a53_=
div", imx8mp_a53_sels, ccm_base + 0x8000);
> +       hws[IMX8MP_CLK_A53_DIV] =3D imx8m_clk_hw_composite_core_critical(=
"arm_a53_div",
> +                                                                      im=
x8mp_a53_sels,
> +                                                                      cc=
m_base + 0x8000);
>         hws[IMX8MP_CLK_A53_SRC] =3D hws[IMX8MP_CLK_A53_DIV];
>         hws[IMX8MP_CLK_A53_CG] =3D hws[IMX8MP_CLK_A53_DIV];
>         hws[IMX8MP_CLK_M7_CORE] =3D imx8m_clk_hw_composite_core("m7_core"=
, imx8mp_m7_sels, ccm_base + 0x8080);
> diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
> index aa5202f284f3..97cac1d623ca 100644
> --- a/drivers/clk/imx/clk.h
> +++ b/drivers/clk/imx/clk.h
> @@ -454,6 +454,10 @@ struct clk_hw *__imx8m_clk_hw_composite(const char *=
name,
>         _imx8m_clk_hw_composite(name, parent_names, reg, \
>                         IMX_COMPOSITE_CORE, IMX_COMPOSITE_CLK_FLAGS_DEFAU=
LT)
>
> +#define imx8m_clk_hw_composite_core_critical(name, parent_names, reg)  \
> +       _imx8m_clk_hw_composite(name, parent_names, reg, \
> +                       IMX_COMPOSITE_CORE, IMX_COMPOSITE_CLK_FLAGS_CRITI=
CAL)
> +
>  #define imx8m_clk_hw_fw_managed_composite(name, parent_names, reg) \
>         _imx8m_clk_hw_composite(name, parent_names, reg, \
>                         IMX_COMPOSITE_FW_MANAGED, \
>
> --
> 2.52.0
>
>
