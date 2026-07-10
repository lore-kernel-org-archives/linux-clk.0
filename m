Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B863F39E0
	for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 15:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783698200; cv=none; b=U9sZAVBEiV2oRJPMjNYepcTy25M3mGBAI4eDoZKVGWrxA6QG6qKclxRFJihGCcXBKRG8SLQ4dsyCnFl7zscipS3DJJXxLlRCDDUchmKAqmESBWs1c6letCqWG5UEw2KLSJSwOn29pc+A/UnWFD1OasB2zzk/EWWKX6MVkC0ldUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783698200; c=relaxed/simple;
	bh=tPEuv7csDipdv9nhCylG4VLlHMY2sUgBrjYOhSXSxtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mgfL78fEqumy3dzuOjEDSuGI7Qoy5qxBUWXBhewZuGjNoYdTEzq/3S+NBhAspO/arXpJUdpKp/cWJl1EicdtL8JyyM1UZApn5OYX/o13Ej9XgFm8qjd0C+K/js1jkieS8IQx+FWhnQmLE3uC40u+jtnOIXLdYV5Adsdo/9WxmR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5bfa99f8ef8so551126e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 08:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783698198; x=1784302998;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=beio+ZM1BqNzXiuYoOgxpj8ydblvVw96dXPEBtyAT1Y=;
        b=YKai+3l3Dd6s8OFNo34QGqq/IOHaf4Yn1cRfXIXR7ri4VAQruArHsKKZBYg1kWDkz2
         bx22XOOMk9Y6m2gHl0srH4W8MW2d5Ra1b8toENvc8LbaMVXZ+njfqryxEA22YNom0N3w
         YuKxqFVHy6IJe8b7AcubZ8UcgdDUm5rEi51Lyx3ZE5XxCOyZznVoBabHP73uB+taf4LE
         AlHJk9MXk7DUp0ZekNJyFT56u73ZTxonXvzcf964WQ03AqoacNrJVHgG/GKs4Sn2ecLK
         xriG0Y1S3UQq2DQelP+VrApyRLRK6aw4WaeatKB4QDIk+8L3lEO0uTC5LlAPW8Y7yO4b
         b7ZA==
X-Forwarded-Encrypted: i=1; AHgh+Rrdi6IvHcJ05NMnV3Z4//Wki4RVFfCZjUhIEkcTrqhsaDPkO8AhFkWbcrCTNeUiZdEnKH+O2QVT0EU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEgsVDjh+Eyu8vdx0chXjUl/+/SNPcVZczreBqguTv7T86rHt3
	zDuuEL25zwU/FyiQvwnon92EG7P+8AFZRv+tbj1vS3zQjifP10uLT6kP5PKhNBBk
X-Gm-Gg: AfdE7cke03BtXpmQKSCMZajI84tqDVHW7urfeWtXWSCpDQ9CZfg4uRyCYuFxv8sd++Y
	II/mHWnnJ8YnslavymWMqC1eaxQ169/++N3EGDfCejdWj4c7+ZRMSCRZcSolB/RdnLyphFZzkG1
	ON+MnBIBdMGlZEfSA0Sr40CH4RV8TQiU5LgLEBIOFHgtB9zvGlGscru2ab811KWa/Y0rpONQfp9
	I0iuwFwS+aDget+la+FImX7ZKCF1LCNdwMyDDrt6hMR/RS+n6R7gOyIoq9iz8ZevQvSKEEAycaC
	xgBO9UiLsFitFaDNnhUpPVub1osOy1aSRJj0FXHK3u9lPtVTHnsOD+NTYuzDa0KYKTNbuoJavtj
	qGsp/4rm8x1N2PmbvONR+fYoMLdTs2YxysTUgs8Gk7qYmcnFPwdRy7Fth4yxGZoJBADaCK8bUVw
	uuXLt8IUwdKJRe+5jhqtJZoIYDgY7GCzA6LCiHHoioGF3cxtaTS10K4w==
X-Received: by 2002:a05:6122:218e:b0:5bd:8dd8:146e with SMTP id 71dfb90a1353d-5bfa5452ff8mr2069907e0c.4.1783698192927;
        Fri, 10 Jul 2026 08:43:12 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bfb10285c8sm828226e0c.9.2026.07.10.08.43.12
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 08:43:12 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bfbbe5220dso100521e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 08:43:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rra0abNJGbELRpZN2e5IxyWTJfbkRjCWCCyCqqmFYIKJZu8ADHvr3EJqIZwBk2+wxsWZGi8GYpOycQ=@vger.kernel.org
X-Received: by 2002:a05:6122:e010:10b0:5bf:7812:3e4a with SMTP id
 71dfb90a1353d-5bfa464b9d7mr1794594e0c.2.1783698192577; Fri, 10 Jul 2026
 08:43:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com> <20260619164030.380098-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260619164030.380098-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 17:43:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW7=NEJJV0k1vLjLT9FBA7MSj=wm3J0-roTpsA9azhwrw@mail.gmail.com>
X-Gm-Features: AUfX_mxIJvDWFvMMXoxDbvprSmwcHbW78Ry-V250yy9HG4EgUM4X_R9k7-dLQF4
Message-ID: <CAMuHMdW7=NEJJV0k1vLjLT9FBA7MSj=wm3J0-roTpsA9azhwrw@mail.gmail.com>
Subject: Re: [PATCH 4/6] clk: renesas: rzg2l: Add support for RZ/G3L DSI mux
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 19 Jun 2026 at 18:40, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add support for RZ/G3L DSI mux that supports 2 duty cycles.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -120,6 +120,11 @@
>  #define RZG3L_PLL7_FSTD_DIV_MR_MIN     (8 * MEGA)
>  #define RZG3L_PLL7_FSTD_DIV_MR_MAX     (16 * MEGA)
>
> +#define CPG_PLLDSI_SMUX_LVDS_DUTY_NUM          4
> +#define CPG_PLLDSI_SMUX_LVDS_DUTY_DEN          7
> +#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM       1
> +#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN       2
> +
>  /**
>   * struct clk_hw_data - clock hardware data
>   * @hw: clock hw
> @@ -741,6 +746,20 @@ struct dsi_div_hw_data {
>
>  #define to_dsi_div_hw_data(_hw)        container_of(_hw, struct dsi_div_hw_data, hw)
>
> +/**
> + * struct rzg3l_dsi_mux_clk - PLL DSI MUX clock
> + *
> + * @priv: CPG private data
> + * @mux: mux clk
> + */
> +struct rzg3l_dsi_mux_clk {
> +       struct rzg2l_cpg_priv *priv;
> +       struct clk_mux mux;
> +};
> +
> +#define to_plldsi_clk_mux(_mux) \
> +       container_of(_mux, struct rzg3l_dsi_mux_clk, mux)
> +
>  static unsigned long rzg2l_cpg_dsi_div_recalc_rate(struct clk_hw *hw,
>                                                    unsigned long parent_rate)
>  {
> @@ -1402,6 +1421,116 @@ static const struct clk_ops rzg3l_cpg_pll_ops = {
>         .recalc_rate = rzg3s_cpg_pll_clk_recalc_rate,
>  };
>
> +static u8 rzg3l_cpg_dsi_smux_get_parent(struct clk_hw *hw)
> +{
> +       return clk_mux_ops.get_parent(hw);
> +}
> +
> +static int rzg3l_cpg_dsi_smux_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       return clk_mux_ops.set_parent(hw, index);
> +}
> +
> +static int rzg3l_cpg_dsi_smux_determine_rate(struct clk_hw *hw,
> +                                            struct clk_rate_request *req)
> +{
> +       req->best_parent_rate = req->rate;
> +
> +       return 0;

Why no forward to clk_mux_ops.determine_rate()?

> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
