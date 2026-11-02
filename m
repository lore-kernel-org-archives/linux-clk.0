Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636183;
	b=aZh52YTV5lqYg6RHUEzx7dNJrIb928Ut+8fXxIU/R4B/xcAxsh390pl6KE9r/WveuMl2
	 Fz/EX7ziiyr6sIaGorcSMuWG1WJ+JpXLW9vt7Soe0iwvFX19qhlDanBqrepH0UT8UJ1Z5
	 RzcQh6ptm4uvfooRp28gRmY1dxtAmCd3ZWM7100uq6NL3PY7X6ITSQ3dl7bI288gsc8k+
	 b9pWvF//1mdDO26MxXFpSMiF6ihtrW4RTTBq0MkOUSQgoliq7ARz3quCvtqBZRc73Gubv
	 I8KUWb2/W8m5eH1vg+Z68yDevJKDzzBUk0abK3jP/9B6jXqubuDtniLVaYVoxTK0AUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636183;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Ch9JtC98wUdbnFiYgfve5cQZzyl0tJi9sgGxiR7zz1o=;
	b=sVQuSacrQnoRqXrNtaKjSZDDf38FmE38Y8Q/ZFcYKKVurvPhMuIdixuujtwi7DYZGxcu
	 Sd8p1RLAFucidlrdyw3g0RfetbVe7PBbDKnNEGLSGIKpyMgzqWewPyB+gpi8dNNjedpcP
	 7tKDWDY9AOSWyiCyubUFUgWz9vVS30TsSfOa+aNzLtsPMCSAzZScBBbcZq1P3DdfX8t6o
	 Oed3NxYz/qW1DOqA4f8wUCUN95NunL6R1M/KvxoS47MfbzcS9zPRSyKXE/IgqJvgwlg6Z
	 NY7m7zY9dTWjZoJ4fN3CF3cqlswDDBwNrADIJFx6b1vgT5usfoU4U9+cZANGIK54lYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6F76082C53
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 16:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F6F76082C53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9950a7530d9so766415241.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 08:16:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636182; x=1794240982;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ch9JtC98wUdbnFiYgfve5cQZzyl0tJi9sgGxiR7zz1o=;
        b=WkOpAdXM3lOGybfzgnEcvkp1HIK//Ipg+B0689wqoKfLHeT8bEKam3ItRt9RHmtoOU
         FwNNvvmGeuQ60cz31Q3BhhsGAcF4Q68aQk1eJnUulrWnxd7yJXeUJk3wQ6QaV4jsFPug
         wgaAP1EcC6em+WiRXPlyn4gE438Cj80Xk5CbnsJBCRWGlRjfJM3j2Bs+T/qkldrtdXy/
         QwES+Uz9AyqJN/SrliU1GD7SU7di3T+o6j2NRBWtiP3/RR/7A7ZEjOiGO9ZBsrfDgPn1
         EY/pbzRUMdLswmUEHIBfCVAIcZle6WWIUG1Qz7aVDvGbfiCUA1rALVvu94+gaz0ZUk0w
         T46g==
X-Forwarded-Encrypted: i=1; AKwUvBy+hWA8ZgwBQA7sqSBnCJm+wYHuLI0dJ29t83idthSatIjRXZ3mFCj5QI0zo+eOkzdF5DbCJ0pF8L8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gIChEDABcSDw80dl3tbO1fHfgogT1a9ZA+OCo4p9erY/PnR8D
	1CMoGTaW4pqMTRYSAOyErSQqxchu1kqGDOggP2aldVmRTEiTpJ8XQkhezYlwGRhxcmk=
X-Gm-Gg: AYBFou0raXMEgvdOyG8WQZlHETaIc6SG8WSMoo9YJXY3IWWEmE7luyDqn1xTB/yS7M3
	/1vqNDSk1pEGAqZPc1DBgwHIE2/MsYglEw+NldfVhvGUoX6PZ8S2ZjOcWi9brryea884rtAhgRa
	Ul0+ZIBItY9qYpsuX5Q8xJkcyMcAgBFICv5M8jOAssEt2V2rhW5+vizrFunLtAPv/Ph5aEbEHGE
	TJcNMe5bgtCCZ+WXuGk3PhnS+MGh3ggXeNHv9NKIWwWXeaWS/+2SRGtWth8sQSYOMDtaov3pPot
	fOaeateFGg+58j2FbPwX+sm1CU1w0+7j/Lx2pN95wpclhUDgquk9VdK+GqTX1N/aRsBWNdDxg1V
	eGdCBL85gft1dRRSH9hBit9DXP8wKp2jV/k/zz6iWXBLAJVLlJ7ZmngTv3mQy5yVs5zNaBwJ/uS
	lSRvTiRjBSh6ciGw4V8bcECzu5+CfbsvMCel9ziB8bMP9M6peXZsYQTBX6p0Ghc4Nt0LuyuW31p
	wnnILWdB+PRtc7fssqgWqNl0syS1d735B4Yn7UJ7Ig6IobSyyWiQnoB4hIpUxyUBZDT8wFd6nfZ
	iri4Z8ZwZWWHERW2fd6Og55y5ojbllQYdfw3MchJk6n79ZDOuTdLKdzjFtwCYAzYDJsd3Xw+G5i
	a3mW+TUnZl7VonsU=
X-Received: by 2002:a05:6102:3ec7:b0:7cc:1967:5e3a with SMTP id ada2fe7eead31-7d072740592mr4441091137.32.1793636181481;
        Mon, 02 Nov 2026 08:16:21 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d077606b7asm9843569137.8.2026.11.02.08.16.20
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:16:20 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eafb65e169so2193205e0c.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 08:16:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwl+jxBxWBpyIH0iWim5z7aMjR9/q+XHOUTSF+M6/qazYd07CFsia+9c7j65gycJuhtREyRBSMKWcw=@vger.kernel.org
X-Received: by 2002:a05:6123:2eb:b0:5e8:c908:d60a with SMTP id
 71dfb90a1353d-5ec6883a419mr4465957e0c.9.1793636180228; Mon, 02 Nov 2026
 08:16:20 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-0-47f23de6bdb1@bp.renesas.com>
 <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-2-47f23de6bdb1@bp.renesas.com>
In-Reply-To: <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-2-47f23de6bdb1@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 17:16:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX5XuDpdmcUhPHU_uNggpXq_L=6DRSN3ftWEApubu+VMw@mail.gmail.com>
X-Gm-Features: AclHuK8jrseFCU3Itfq84vW-XdE0TqbVlqwmURK0nQgZ-nx23dm7hkxRm8PcLJM
Message-ID: <CAMuHMdX5XuDpdmcUhPHU_uNggpXq_L=6DRSN3ftWEApubu+VMw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: rzv2h: Report the DSI duty cycle from
 the LVDS divider
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, tomm.merciai@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

Thanks for your patch!

On Thu, 29 Oct 2026 at 15:26, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The 4/7 duty cycle of the LVDS path comes from the division by 7, not from
> the PLLDSI mux, as an odd divider cannot produce a 50% duty cycle.

Note that the latter is not true in general: if an odd divider looks
at both edges of the parent clock signal, the output will have a 50%
duty cycle (assumed the parent has a 50% duty cycle).
If an odd divider looks only at rising or falling edges, the output
will indeed have a non-50% duty cycle.

> Report it from a dedicated LVDS divider clock type and let the core walk up
> to the selected parent through CLK_DUTY_CYCLE_PARENT. The reported values
> do not change, the mux keeps selecting the path, and its duty cycle
> constants go away.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.5.

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> @@ -890,6 +863,94 @@ rzv2h_cpg_fixed_mod_status_clk_register(const struct cpg_core_clk *core,
>         return &clk_hw_data->fix.hw;
>  }
>
> +static int rzv2h_cpg_plldsi_div_lvds_get_duty_cycle(struct clk_hw *hw,
> +                                                   struct clk_duty *duty)
> +{
> +       struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
> +
> +       /*
> +        * An odd divider cannot generate a 50% duty cycle: the output stays
> +        * high for (div + 1) / 2 input clock cycles out of div, e.g. a divider
> +        * of 7 gives a duty cycle of 4/7.
> +        */
> +       duty->num = DIV_ROUND_UP(fix->div, 2);
> +       duty->den = fix->div;
> +
> +       return 0;
> +}
> +
> +static int rzv2h_cpg_plldsi_div_lvds_determine_rate(struct clk_hw *hw,
> +                                                   struct clk_rate_request *req)
> +{
> +       return clk_fixed_factor_ops.determine_rate(hw, req);
> +}
> +
> +static int rzv2h_cpg_plldsi_div_lvds_set_rate(struct clk_hw *hw,
> +                                             unsigned long rate,
> +                                             unsigned long parent_rate)
> +{
> +       return clk_fixed_factor_ops.set_rate(hw, rate, parent_rate);
> +}
> +
> +static unsigned long rzv2h_cpg_plldsi_div_lvds_recalc_rate(struct clk_hw *hw,
> +                                                          unsigned long parent_rate)
> +{
> +       return clk_fixed_factor_ops.recalc_rate(hw, parent_rate);
> +}
> +
> +static unsigned long
> +rzv2h_cpg_plldsi_div_lvds_recalc_accuracy(struct clk_hw *hw,
> +                                         unsigned long parent_accuracy)
> +{
> +       return clk_fixed_factor_ops.recalc_accuracy(hw, parent_accuracy);
> +}
> +
> +static const struct clk_ops rzv2h_cpg_plldsi_div_lvds_ops = {
> +       .determine_rate = rzv2h_cpg_plldsi_div_lvds_determine_rate,
> +       .set_rate = rzv2h_cpg_plldsi_div_lvds_set_rate,
> +       .recalc_rate = rzv2h_cpg_plldsi_div_lvds_recalc_rate,
> +       .recalc_accuracy = rzv2h_cpg_plldsi_div_lvds_recalc_accuracy,
> +       .get_duty_cycle = rzv2h_cpg_plldsi_div_lvds_get_duty_cycle,
> +};
> +
> +static struct clk_hw * __init
> +rzv2h_cpg_plldsi_div_lvds_clk_register(const struct cpg_core_clk *core,
> +                                      struct rzv2h_cpg_priv *priv)
> +{
> +       struct clk_init_data init = { };
> +       struct clk_fixed_factor *fix;
> +       const struct clk_hw *parent;
> +       const char *parent_name;
> +       int ret;
> +
> +       WARN_DEBUG(core->parent >= priv->num_core_clks);
> +       parent = priv->clks[core->parent];
> +       if (IS_ERR(parent))
> +               return ERR_CAST(parent);
> +
> +       parent_name = clk_hw_get_name(parent);
> +
> +       fix = devm_kzalloc(priv->dev, sizeof(*fix), GFP_KERNEL);
> +       if (!fix)
> +               return ERR_PTR(-ENOMEM);
> +
> +       init.name = core->name;
> +       init.ops = &rzv2h_cpg_plldsi_div_lvds_ops;
> +       init.flags = CLK_SET_RATE_PARENT;
> +       init.parent_names = &parent_name;
> +       init.num_parents = 1;
> +
> +       fix->hw.init = &init;
> +       fix->mult = core->mult;
> +       fix->div = core->div;
> +
> +       ret = devm_clk_hw_register(priv->dev, &fix->hw);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       return &fix->hw;
> +}
> +
>  static struct clk_hw
>  *rzv2h_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
>                                void *data)

Since there are now two copies of this code (see rzg3l_cpg_lvds_div_*),
perhaps the time is ripe to add odd duty cycle support to
clk_fixed_factor?  As duty->num can be rounded up or down, I am
envisioning two new mutually-exclusive fixflags parameters, e.g.:

    CLK_FIXED_FACTOR_ODD_DUTY_DOWN
    CLK_FIXED_FACTOR_ODD_DUTY_UP

What do you think?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
