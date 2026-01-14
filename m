Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCC0349B0A
	for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 13:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768395941; cv=none; b=rkzFA/xFfh+VR/6SdTuHCVJvisV7waK0rzP2tJQ2DB0M3HnPJSVE+gv1KKsrET4qzhib0unrCjuvyZoTZ/qe5IKyhAKCAveiLrEh0iLymomXfXB3+2/uuUUuLY1/yyzlAPoKsZne0x3vQJxZqPaJYTkRf/Q7OHj+yEW7kV8uSbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768395941; c=relaxed/simple;
	bh=/5eWFDEf6KwzasaJ03bBW4Tg2xk5g+Pd7eH2QVdydoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VmOoaTyrnBULjxGQ4nPUsM1ReAOiWqGiNtmtUCCuN9URB9scHlDF1KjbDm7UscLIG6qKHbWly6CRcQtsnHodeS8P5A/JJW84LsgjqmJmiGL4VKjKeUSEuyVTFePLUr1fLXikUe6yOD7TpfrrG50PHokBxQn+w93aaU7+KC0Qv5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7c71cca8fc2so5729967a34.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 05:05:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768395939; x=1769000739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOi1xuIgOKeNmhtu/zXsVbi5AW8T0pSjiAWSdoOenWg=;
        b=Hsp6crn3Viz8fSlVVA1ruCE4KMLoG0IWq1QoYtzQRhdtNlO8/2QMB07ArJ4x0028xC
         xstgjjYofEN7bjDbv2o/QOji0UdKtRKRg/apKRfcwBa15RwlKV8jyli6X3WnI5mUf0HN
         94W6TVPsvdpTQjS27/okk0PQcqkIhlDyLVR046rERwvwwYLVy4s2Exbcl9iKsT+JR9Qj
         lW2KVPSRDDO/v+JEoMo4MQd7MuNIe0fekudSMSgO7psZFsR1abgdSUXAEngnlolNYILP
         EEETbCfEXiKkuDNzuPiXGepTSBq1tFyEfA/+WQp0489jaZN7T2BoW5jZVo+y1nocIWgc
         AFUg==
X-Forwarded-Encrypted: i=1; AJvYcCXar02OjuKzWfqCK5UeDRuu2bGqsqmuoigFLbpMh900qgJi53iGK6bgmvDJFzXttgj0XknkSmNSv0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYbk+nii/BtWtAfgyeFdSfN/VdHJcZ3ANHlhcFw0t1UuLXLl9T
	S4HPuEytFG7HjVlZs2yd18VPmbGt1pJsbTHkzw6hhJa+J1VJTlA6Y5ZtXpFUW2q3
X-Gm-Gg: AY/fxX7XX8QIVN9VXkiU994KUCm2qB2S6yV27BvLir3MG+asdZco2TrEXmDXIRFsVZ+
	CNAJYPGPtX6VL99nYUfTA+/LYVkaPYovEGFc3zGB60AptnNX2YVaN4RDtbOEuscqWCSXukWOKF1
	5dpA8DPYKR1b3RSY/QN1cj/Uzr4l6NOkzYnlv4or8G/DfvkLBi5HI4nuBPUkNje8JI3+WISeOoj
	56dd/W5pvENaMlj5APFfD4n1aMEWFd9Zyltr7TW8eXn8m2CwOqTjlAS4/Ifrv5wAUdHlY/FE0oR
	Gwp7+wHGb8sGFhYaHPJB8hTvAlT+gatMJ/7IghpX7dTuPlg6kIcXdVvwif1dsMskplcXLyOpj8G
	NTiXuQOljQwm1U5yOLye73Eapuq0bwgVzyGi+tuvs9UnIBfsa/qA5NCcBtxYgcLNClEypM6ab5U
	3slp5w7b2WuS9XLTeJCMR/PkW85+KnskGTAcDEM589aDQvqztq
X-Received: by 2002:a05:6830:925:b0:7cf:d1b7:40b6 with SMTP id 46e09a7af769-7cfd1b741f9mr223068a34.11.1768395939438;
        Wed, 14 Jan 2026 05:05:39 -0800 (PST)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com. [209.85.161.46])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa4de8cbfsm16191296fac.3.2026.01.14.05.05.38
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 05:05:38 -0800 (PST)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6610800b87fso229090eaf.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 05:05:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCepPVfkamxW8O13VEO/2EoXDMLbyVrz5bPXtNt6xayzNg4hLMfLcSajsGy3us9GmNyxHxXti8lM8=@vger.kernel.org
X-Received: by 2002:a05:6102:38c9:b0:5f1:555e:a0b4 with SMTP id
 ada2fe7eead31-5f183bdce22mr616871137.32.1768395587922; Wed, 14 Jan 2026
 04:59:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <3ab81490b7bdbd2dafd7a940ae242f07d30aaa17.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <3ab81490b7bdbd2dafd7a940ae242f07d30aaa17.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 13:59:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUBN0OKOOTw+j3XuWi+hVYBVRyzp=J-+0yMfem2BfT+Eg@mail.gmail.com>
X-Gm-Features: AZwV_QjCdG9CLFFvTy17z_yoeEbQmRYHkFE3zh-jRCvSjUp5PEJNAk_rO0NIbA8
Message-ID: <CAMuHMdUBN0OKOOTw+j3XuWi+hVYBVRyzp=J-+0yMfem2BfT+Eg@mail.gmail.com>
Subject: Re: [PATCH 01/22] clk: renesas: rzv2h: Add PLLDSI clk mux support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 26 Nov 2025 at 15:08, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add PLLDSI clk mux support to select PLLDSI clock from different clock
> sources.
>
> Introduce the DEF_PLLDSI_SMUX() macro to define these muxes and register
> them in the clock driver.
>
> Extend the determine_rate callback to calculate and propagate PLL
> parameters via rzv2h_get_pll_dtable_pars() when LVDS output is selected,
> using a new helper function rzv2h_cpg_plldsi_smux_lvds_determine_rate().
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> +
> +static int rzv2h_cpg_plldsi_smux_lvds_determine_rate(struct rzv2h_cpg_priv *priv,
> +                                                    struct pll_clk *pll_clk,
> +                                                    struct clk_rate_request *req)
> +{
> +       struct rzv2h_pll_div_pars *dsi_params;
> +       struct rzv2h_pll_dsi_info *dsi_info;
> +       u8 lvds_table[] = { 7 };
> +       u64 rate_millihz;
> +
> +       dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
> +       dsi_params = &dsi_info->pll_dsi_parameters;
> +
> +       rate_millihz = mul_u32_u32(req->rate, MILLI);
> +       if (!rzv2h_get_pll_divs_pars(dsi_info->pll_dsi_limits, dsi_params,
> +                                    lvds_table, 1, rate_millihz)) {

s/1/ARRAY_SIZE(lvds_table)/

> +               dev_err(priv->dev, "failed to determine rate for req->rate: %lu\n",
> +                       req->rate);
> +               return -EINVAL;
> +       }
> +
> +       req->rate = DIV_ROUND_CLOSEST_ULL(dsi_params->div.freq_millihz, MILLI);
> +       req->best_parent_rate = req->rate;
> +       dsi_info->req_pll_dsi_rate = req->best_parent_rate * dsi_params->div.divider_value;
> +
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
