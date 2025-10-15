Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117392D6E4A
	for <linux-clk@vger.kernel.org>; Wed, 15 Oct 2025 14:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760540190; cv=none; b=bKa/f2mVLu/0TxfbqSGGaNGebt9ifk4pzBeqFERd+mYfWF0y3ckCRQ3uO4AEd5YxvAXxCCgF/WUg8xvtYy50LkZTG7mhJSNGimKuyqbT9Kpr8CNphX4w7xkC1VV87XowbcGTV6vYgRWASRIeLhjeV3rMZhlH9hQtqZzqKi2rDe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760540190; c=relaxed/simple;
	bh=cAVu1Ez4yYUTuEc8XdVelIPzH5j9qezO1CIAHTlUR1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YaJtcSXi6INL74z1psAR3ldJrQ0vteAC8fQjxEkOYvlrmTOqo1VYluqFneGb1N0oUyejyVdURKRvgysk+hVVtRyB0pSe/lXYzjgGvfh9oYUniTpvDee6to5GfkhtqgNkFm6M/zf0eaeO89HIlEbgboBIyMMsqDMN7p6kYsLoBHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfiKFUsF; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfiKFUsF"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee1381b835so4459058f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 15 Oct 2025 07:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760540185; x=1761144985; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GI9CaA/4ITOkaOZyH+29H11i4BVtBD/Oo8oTodLjamo=;
        b=DfiKFUsFIHEIez+fvibFeKf7Yqv2B/m5F9vC5tRPDAc5mQSJpdrniDg8Z018NIc/S3
         ybkZ4hBUnrJi1euEjkQfiXh6olXVMR7rBRGvuQnS9VUdArqEEZVVxCUkmcjE229PZnPE
         RiDLmVdHKFs5UK0P+HJ+RGRE7NMyD+PFnmZus52WMzZy7bebO6NuwPLQSPPm8exZihfw
         Aa4cNhqUcQhDJpR/6KI5t7r5WpfkVzhvbW4e+h4FPzUWuu9xDmXdXTBnVZBF6UG5DyuP
         9O9gYlVHwb70omAZoKcXzQTHJAv0CkD0Y4Lvgy7nfLZvrra7ebvJwcXJkaowJq6XWiQp
         +jiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760540185; x=1761144985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GI9CaA/4ITOkaOZyH+29H11i4BVtBD/Oo8oTodLjamo=;
        b=Y804QJU+5un6aDx9nigrEm3YVaqxnu2EvUTBrl+yIqBVfii91oqcyutGVwxW90aEPY
         FnUgk6qOiyyvLj4sYOSNZZLj9+UxW0yvh/19NSJnolWj5rdhd24nPwDlB7riijha0gWd
         1V3ccRLw/CJSPg/BzjOtMh1JalCB7Q1W3FE9B+DwRXLBN8iLCcx96eW4+zDYuH1DiT66
         ShpSwcnCize83hMBBkr71Gesh6AYYYGkszWpVEh28kH4XlAYYSJhLzC67HQ/2qEex8Vj
         oDJHgJwnxY3ViB/mwbxPGSFv43hUcb/IYosbOOAlgaCN/8iQjrgcDEKUVuy6B5dQwpjp
         on8w==
X-Forwarded-Encrypted: i=1; AJvYcCUkMOJdP7HeOT2eGIcLxzevziscPKxEdQqwQRD65hj0abRZngujDNan2hXfM8nPNrGhAThMuLQ8mAw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb7rCaE/JwaWLp5fkyHi7W6TXrQK3cbrmCZdwspSg1L5qQNiNg
	5U7pB1fxVoO3Mj3e84rp4JAhCKxTWCjlUPjVslsomDILwq3biUvEn4NtEyGJ7g4Nl5vonJrBNeQ
	X0ddDS8ybqf+XoUnXYknXcchjDRwA5og=
X-Gm-Gg: ASbGncvOE65SiYa5Ey0G5YXI94bOOkgbFsfBerr6GCEvbnIp2LArvtkuCbzwdwsEG04
	yEsXySZsIb+NMTK/v9WtB+X881gahs/6rpKvyvWlfpiGtNQYq09cd8tBvzViTD37g5swktEN0aQ
	m8WiAUzb7xOHUeujLUSzk4p9ZYRO5iqcpVizQYMeSmFJeiIsdifS8A9Suf8xkPmcBuvQ1/IoZkT
	q2B9RcDuY0mbrifbosXIFgxeXklmpIM1dwq/lYs0NEZxX5KH1K4gDw0KElo
X-Google-Smtp-Source: AGHT+IH5L1Mo7xLa57k+5KugvuK+N+9eSJpkUwgo4LQeKXBhJMy9CjFuhGIGVQ+i6zqQoqwOUPriVfL9xrycTyM9beg=
X-Received: by 2002:a05:6000:43d6:20b0:426:f391:1968 with SMTP id
 ffacd0b85a97d-426f3911a30mr3441482f8f.35.1760540185079; Wed, 15 Oct 2025
 07:56:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009160732.1623262-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251009160732.1623262-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV2-YrktT+=D2LVFw5oR+6EOLcPB_Yuh5wnos099W9YHQ@mail.gmail.com>
In-Reply-To: <CAMuHMdV2-YrktT+=D2LVFw5oR+6EOLcPB_Yuh5wnos099W9YHQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 15 Oct 2025 15:55:57 +0100
X-Gm-Features: AS18NWDborL4rX4hqJjZmtwrGarJ9O0NBNJ1OthS7bueNWRfQx925JxPvOSaoZs
Message-ID: <CA+V-a8s9v5QmU=vrHM6wkFbEwdzp_+eE6kxEN53JfhnpA2KOUg@mail.gmail.com>
Subject: Re: [PATCH v10 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Oct 13, 2025 at 3:26=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> On Thu, 9 Oct 2025 at 18:07, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for PLLDSI and its post-dividers to the RZ/V2H CPG driver a=
nd
> > export a set of helper APIs to allow other consumers (notably the DSI
> > driver) to compute and select PLL parameter combinations.
> >
> > Introduce per-PLL-DSI state in the CPG private structure and implement
> > clk ops and registration for PLLDSI and PLLDSI divider clocks. Implemen=
t
> > rzv2h_cpg_plldsi_determine_rate and rzv2h_cpg_plldsi_set_rate to drive
> > PLL programming via the new per-PLL state and add a plldsi divider clk
> > with determine/set/recalc operations that cooperate with the PLL
> > algorithm.
> >
> > Centralize PLL parameter types and limits by moving definitions into a
> > shared header (include/linux/clk/renesas.h). Add struct rzv2h_pll_limit=
s,
> > struct rzv2h_pll_pars and struct rzv2h_pll_div_pars, plus the
> > RZV2H_CPG_PLL_DSI_LIMITS() macro to declare DSI PLL limits.
> >
> > Provide two exported helper functions, rzv2h_get_pll_pars() and
> > rzv2h_get_pll_divs_pars(), that perform iterative searches over PLL
> > parameters (M, K, P, S) and optional post-dividers to find the best (or
> > exact) match for a requested frequency. Export these helpers in the
> > "RZV2H_CPG" namespace for use by external drivers.
> >
> > This change centralizes DSI PLL rate selection logic, prevents duplicat=
e
> > implementations in multiple drivers, and enables the DSI driver to
> > request accurate PLL rates and program the hardware consistently.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v9->v10:
> > - Dropped rzv2h_get_pll_div_pars() helper and opencoded instead.
> > - Dropped rzv2h_get_pll_dtable_pars() helper and opencoded instead.
> > - Added dummy helpers rzv2h_get_pll_pars() and rzv2h_get_pll_divs_pars(=
)
> >   in renesas.h for !CONFIG_CLK_RZV2H case.
> > - Updated commit message.
>
> Thanks for the update!
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
> > +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> > +                                              struct clk_rate_request =
*req)
> > +{
> > +       struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> > +       struct pll_clk *pll_clk =3D to_pll(clk_hw_get_parent(hw));
> > +       struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > +       u8 table[RZV2H_MAX_DIV_TABLES] =3D { 0 };
> > +       struct rzv2h_pll_div_pars *dsi_params;
> > +       struct rzv2h_pll_dsi_info *dsi_info;
> > +       const struct clk_div_table *div;
> > +       u64 rate_millihz;
> > +       unsigned int i;
> > +
> > +       dsi_info =3D &priv->pll_dsi_info[pll_clk->pll.instance];
> > +       dsi_params =3D &dsi_info->pll_dsi_parameters;
> > +
> > +       rate_millihz =3D mul_u32_u32(req->rate, MILLI);
> > +       if (rate_millihz =3D=3D dsi_params->div.error_millihz + dsi_par=
ams->div.freq_millihz)
> > +               goto exit_determine_rate;
> > +
> > +       div =3D dsi_div->dtable;
>
> This belongs inside the for-initializer below.
>
Agreed.

> > +       i =3D 0;
>
> Ditto; or better: in the variable declaration at the top of the function.
>
Ok, I will move to the top.

> > +       for (; div->div; div++) {
> > +               if (i >=3D RZV2H_MAX_DIV_TABLES)
> > +                       return -EINVAL;
> > +               table[i++] =3D div->div;
> > +       }
> > +
> > +       if (!rzv2h_get_pll_divs_pars(dsi_info->pll_dsi_limits, dsi_para=
ms, table, i,
> > +                                    rate_millihz)) {
> > +               dev_err(priv->dev, "failed to determine rate for req->r=
ate: %lu\n",
> > +                       req->rate);
> > +               return -EINVAL;
> > +       }
> > +
> > +exit_determine_rate:
> > +       req->rate =3D DIV_ROUND_CLOSEST_ULL(dsi_params->div.freq_millih=
z, MILLI);
> > +       req->best_parent_rate =3D req->rate * dsi_params->div.divider_v=
alue;
> > +       dsi_info->req_pll_dsi_rate =3D req->best_parent_rate;
> > +
> > +       return 0;
> > +}
>
> The rest LGTM, so with the above fixed, and the field changes factored
> out into a separate patch:
Ok, I will move the field changes into a separate patch.

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Cheers,
Prabhakar
