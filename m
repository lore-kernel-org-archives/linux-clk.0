Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191725;
	b=gpnPKisdr+WkBEJ+g+fFkRvYB4dlW9Tkg3BWdumLdo/+UqYzI4pJ37yw6K5mg9U66u+0
	 6LedsdH4Xl7v1M3nvTPqegK7doHA3Wil+h/LxdeetynNks5NH64TqY6aj0+a0T7AelM/j
	 WJEcHesNwi3eRFA+eOuu/48kFtHiMLcPddgkYQvCEEPjW23FBIOOzDfUmZ51dE7w6yFDc
	 0LdfHJ5K61Otg8TQJWMrQLg6tGWx1PR6BS8sra0F2ltIUWUQmHUh83YXmaAghqSaxRrxJ
	 NdEwK/rQdpFzwewTSK2QTnBMkXT4UcKNhDKWIy71EMSphvo7gx5X0qOZ7IZjeEl8fjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/RwXlYMt9ERMWAYTjJyAVtWyMXXnKsIq0qrxgpPStpE=;
	b=0xCEROZLHg04NG0Y/fJQGB8cy8E4ooGp0peLIg2hCbeOFxJQEtLSLuNcRYAHjuNUonTk
	 JhqIVpzR4+6yekuGtiIJdZOPrjSM310N8yu2gcUdj0ZSOaL/LDzvXQMJIlsVKdf+tljgE
	 a0CAeFxHjl2IbYJFsdpAg1tajuOyE6OGcRau3bKFDmFi6p8dGJBPZuzt7hME5DlsJrNtl
	 7PCBHnvHai2aX9YspncUMVZehF6BPobvupLSof+HVpQYxs12BXVvlAK6Trm3Go7wiNRxy
	 ach3weEOEmiRumlLgoF9Si2iIkcXNC+jvLgtjkYaSbe2+I8IXvY+PjQA9ylozDMuGwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="MnFS/Kiw";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3D960A2607
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 16:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA3D960A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MnFS/Kiw
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so7734205e9.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 08:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795191722; x=1795796522; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/RwXlYMt9ERMWAYTjJyAVtWyMXXnKsIq0qrxgpPStpE=;
        b=MnFS/KiwR0FnhoOK4G0RQnbR+2+0YXyZxjepLV8qYke0Hmz6Wz9kmVmeisQA5vsBz4
         WYjrMP0AxWvKTbdK6oJ7xOXCdzMEBZ/BOLvUri3YmHLyaJzriLv/10GF2PoVTfF2NNeJ
         IxJxYpfjr2eby/dTXcXMcH8skvA5YXnaqCjuWYOYvLZvVhrPZQfLZM6EUx1KDUWmyiZB
         1b38VeDhHJOmftcrqbmOJTXs96mq9zAI9w+DlzcXGi+ArKvh6Gc/LuihRuD8ce5k/Dj9
         vS32jAh2KJwSumaGTQkW2pb51mzVmjV1QjKsxPyX7jmlHIB3TCfCIff97KfBdVzGUVKH
         AIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191722; x=1795796522;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RwXlYMt9ERMWAYTjJyAVtWyMXXnKsIq0qrxgpPStpE=;
        b=ulIcZykan29pHPVAHADMhOgyYO2xGC0IQZscOdxofNTKjRF6tZM2zsVARjn4pJxD8O
         yt9Lm1m5gS0GhzAPQWYniDjfe33d0wCx0PyRaMgXWpebICKaZo9Np2+LrOsuK4alXcNy
         wHh6xTkXRXUIVtGW9LMMBg81WHYe0KmVSesii+eK/Z3+woeD+tJKIC+ThqISpec9LUjh
         0N/j7ZU34CGFTQ16XVb0MWKHOaUPtRBPY0PTFqtafy15czCsQMhUEYHvB1whKbwMYDb/
         rjKX+QvjAA6h0gtABopIFknSRrlHSPEJOHhnrr230OsLVhhnBtk5s7rhA4uZKH6IHlE6
         NDNg==
X-Forwarded-Encrypted: i=1; AL+hErFcQ2SPhxTEK0IlzIvgBN82c7ZuTTcRelZ7n75Y6MXL/efFOidmalCAq9v/vs6NLur9SNioWX3+3U4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AGVaQGriTlTx5sYtF6HCIP1/EEZiOckN9O4c6xAxkH14ouwAW
	rz/hJG3gYr4Dn5JIacqtQmqn2F8YLb0R3zEkCgcU9o3yWOYA+WTYdG58FN9H5afwn+M=
X-Gm-Gg: AYBFou1nBqd9eyU3VEkK5tXBfmUvuHOgFN7IUV66ItLQkpgXUqCCQIb/qWfhkdThN0u
	RPZssfd1uUFnLGxXAB5SEipRV/+6YxLd04S+BH/aFBE0GABBZK07UAo0CJIiNXRxOMPhQGLSwH4
	k7KW/yXwR3OX/HVTT97Z047P//Rok74Y5jITxGibTfgJfurCUwSMg6Rs233XqT86mg/DnYdsNWM
	oiMPJEOuF+akElNVu+RSPkBMteJpIiP9kehonzwgJekpMFm3h57BrsEraeVQj7h3Ul9B62JYZ9b
	3N8MOF3rAQvM+8H7lqnLMXSDUWUzCHWAZoBVzo+a2bgZkewopPXzGbgs8OAjr/Z+MLyO6Ms4ByQ
	mpa+zpzKorcV8ntYkDq9B5LAMySWWbnfAGCj2kxPYL7Kvr6OcrCwnPuzGs1XyKpSgS7FeKdvjeA
	gowtZUltsmDJ6M+MqGoU4OfPbr2bYL7G6rotaua9tcrCN5gAfwPvmXSIiXSLLArFYtzc+XjIvAz
	qkM+ZI9lpGyDENZR7WmC7hXWab/lOKS7f9U4vJhBh0GBoz/yTwps0+99FdFi7g6gWZTocn4Ba8z
	oJ4RU7bpZNKAOSv4yYxvJmPgBercR+y6XjhSx2B0q+DCwzeZ
X-Received: by 2002:a05:600c:5246:b0:4bb:60ba:49e0 with SMTP id 5b1f17b1804b1-4bb88930707mr87878585e9.26.1795191722209;
        Fri, 20 Nov 2026 08:22:02 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm202623845e9.4.2026.11.20.08.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:22:01 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v12 02/10] clk: nuvoton: ma35d1: Use clk_hw pointers as
 mux parents
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, stable@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-2-bee2c8dad4e1@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
 <20261118-perso-ma35d1-upstream-clk-v12-2-bee2c8dad4e1@bootlin.com>
Date: Fri, 20 Nov 2026 17:21:57 +0100
Message-Id: <179519171774.3795820.3637822831411003847.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=21680; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=DMIkjnYMdPi5PyCQ7RLGRqmc6HG3et9tIjQSFKOZqbc=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkMxcv11/kWmc0t9flmZsgu5M97tqqF0bXK+6qwTJDnA
 unIXR4dpSwMYlwMsmKKLDXc1eLvJLW+zJqucxtmDisTyBAGLk4BmIhGDSPDi8AH2RWZio3MdydP
 vPzM9PjL6NNa5WnvIg+bitYe/V7JwfBP5cmf+0a3buzvddyU8WSlqNK3SRPyzx0UlnwnHWp84Lw
 jEwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The MA35D1 clock provider registers its muxes with parent data
> structures filling .fw_name. This is not the ideal approach since that
> would require a massive amount of internal clock names declaration in
> the DT. Since the DT does not play the game of exposing all these names,
> none of the parent lookups performed when instantiating the muxes
> succeed. As a result, these muxes get registered as root clocks, leading
> to a sadly flat clock tree and no frequency assigned to most of the
> peripheral clocks:
> 
>                                  enable  prepare  protect
>    clock                          count    count    count        rate
> 
>  usbphy1                             0       0        0        480000000
>  usbphy0                             0       0        0        480000000
>     husbh1_gate                      0       0        0        480000000
>     husbh0_gate                      0       0        0        480000000
>     usbh_gate                        0       0        0        480000000
>     usbd_gate                        0       0        0        480000000
>  syspll                              0       0        0        180000000
>  lirc                                0       0        0        32000
>     lirc_gate                        0       0        0        32000
>  hirc                                0       0        0        12000000
>     gtmr_gate                        0       0        0        12000000
>     hirc_gate                        0       0        0        12000000
>  lxt                                 0       0        0        32768
>     rtc_gate                         0       0        0        32768
>     lxt_gate                         0       0        0        32768
>  hxt                                 0       0        0        24000000
>     vpll                             0       0        0        1224000000
>        dcup_div                      0       0        0        612000000
>     epll                             0       0        0        6000000000
>        epll_div8                     0       0        0        750000000
> 
>        epll_div4                     0       0        0        1500000000
>        epll_div2                     0       0        0        3000000000
>           emac1_gate                 0       0        0        3000000000
> 
>           emac0_gate                 0       0        0        3000000000
> 
>     apll                             0       0        0        6048000000
>     ddrpll                           0       0        0        266460000
>        ddr_gate                      0       0        0        266460000
>        ddr6_gate                     0       0        0        266460000
>        ddr0_gate                     0       0        0        266460000
>     capll                            0       0        0        2400000000
>     hxt_gate                         0       0        0        24000000
>  clk_hxt                             0       0        0        24000000
>  spi3_mux                            0       0        0        0
>     spi3_gate                        0       0        0        0
>  spi2_mux                            0       0        0        0
>     spi2_gate                        0       0        0        0
>  spi1_mux                            0       0        0        0
>     spi1_gate                        0       0        0        0
>  spi0_mux                            0       0        0        0
>     spi0_gate                        0       0        0        0
>  i2s1_mux                            0       0        0        0
>     i2s1_gate                        0       0        0        0
>  i2s0_mux                            0       0        0        0
>     i2s0_gate                        0       0        0        0
> ...
> 
> Apart from the wrong clock tree representation, it means that none of
> the device drivers (spi & i2c in the excerpt above) can actually query
> their clock rate, or they would get 0Hz.
> 
> Instead of declaring the parents in the clk_parent_data structure, use
> the actual HW clocks to lookup the parents directly: parents are
> described by an array of indices into the controller's main clock table
> (like in other clock controller drivers), which the "new" mux helper now
> resolves.
> 
> The WDT and WWDT muxes list the /4096 children of PCLK3 and PCLK4 among
> their possible parents. Those two clocks are now registered by the
> previous commit, so their entries in the parent tables are restored
> instead of being turned into invalid slots.
> 
>                                  enable  prepare  protect
>    clock                          count    count    count        rate
> 
>  usbphy1                             0       0        0        480000000
>  usbphy0                             0       0        0        480000000
>     husbh1_gate                      0       0        0        480000000
>     husbh0_gate                      0       0        0        480000000
>     usbh_gate                        0       0        0        480000000
>     usbd_gate                        0       0        0        480000000
>  syspll                              1       1        0        180000000
>     dbg_mux                          0       0        0        180000000
>     sdh1_mux                         0       0        0        180000000
>        sdh1_gate                     0       0        0        180000000
>     sdh0_mux                         0       0        0        180000000
>        sdh0_gate                     0       0        0        180000000
>     sysclk1_mux                      2       2        0        180000000
>        pclk4                         0       0        0        90000000
>        pclk3                         0       0        0        90000000
>           sspcc_gate                 0       0        0        90000000
>           ssmcc_gate                 0       0        0        90000000
>        hclk3                         0       0        0        90000000
>        pclk2                         0       0        0        180000000
>           eadc_div                   0       0        0        90000000
>              eadc_gate               0       0        0        90000000
>           qei1_gate                  0       0        0        180000000
>           ecap1_gate                 0       0        0        180000000
>           spi3_mux                   0       0        0        180000000
>              spi3_gate               0       0        0        180000000
>           spi1_mux                   0       0        0        180000000
>              spi1_gate               0       0        0        180000000
>           epwm1_gate                 0       0        0        180000000
>           i2c5_gate                  0       0        0        180000000
>           i2c2_gate                  0       0        0        180000000
>        pclk1                         0       0        0        180000000
>           qei2_gate                  0       0        0        180000000
>           qei0_gate                  0       0        0        180000000
>           ecap2_gate                 0       0        0        180000000
>           ecap0_gate                 0       0        0        180000000
>           spi2_mux                   0       0        0        180000000
>              spi2_gate               0       0        0        180000000
>           spi0_mux                   0       0        0        180000000
>              spi0_gate               0       0        0        180000000
>           epwm2_gate                 0       0        0        180000000
>           epwm0_gate                 0       0        0        180000000
>           i2c4_gate                  0       0        0        180000000
>           i2c1_gate                  0       0        0        180000000
>        pclk0                         1       1        0        180000000
>           adc_div                    0       0        0        90000000
>              adc_gate                0       0        0        90000000
>           qspi1_mux                  0       0        0        180000000
>              qspi1_gate              0       0        0        180000000
>           qspi0_mux                  1       1        0        180000000
>              qspi0_gate              1       1        0        180000000
> 
>           i2c3_gate                  0       0        0        180000000
>           i2c0_gate                  0       0        0        180000000
> 
> Note: while switching the API, let's use the devm_ alternative to manage
> the clock registration automatically.
> 
> Fixes: f50a000b4219 ("clk: nuvoton: Use clk_parent_data instead of string for parent clock")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/clk/nuvoton/clk-ma35d1.c | 626 +++++++++++----------------------------
>  1 file changed, 177 insertions(+), 449 deletions(-)
>
> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
> index e95f72bb8103..c65ceed2fd5e 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
> @@ -63,300 +63,49 @@ static DEFINE_SPINLOCK(ma35d1_lock);
>  #define PLL_MODE_FRAC           1
>  #define PLL_MODE_SS             2
>  
> -static const struct clk_parent_data ca35clk_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "capll", },
> -	{ .fw_name = "ddrpll", },
> -};
> -
> -static const struct clk_parent_data sysclk0_sel_clks[] = {
> -	{ .fw_name = "epll_div2", },
> -	{ .fw_name = "syspll", },
> -};
> -
> -static const struct clk_parent_data sysclk1_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "syspll", },
> -};
> -
> -static const struct clk_parent_data axiclk_sel_clks[] = {
> -	{ .fw_name = "capll_div2", },
> -	{ .fw_name = "capll_div4", },
> -};
> -
> -static const struct clk_parent_data ccap_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "vpll", },
> -	{ .fw_name = "apll", },
> -	{ .fw_name = "syspll", },
> -};
> -
> -static const struct clk_parent_data sdh_sel_clks[] = {
> -	{ .fw_name = "syspll", },
> -	{ .fw_name = "apll", },
> -};
> -
> -static const struct clk_parent_data dcu_sel_clks[] = {
> -	{ .fw_name = "epll_div2", },
> -	{ .fw_name = "syspll", },
> -};
> -
> -static const struct clk_parent_data gfx_sel_clks[] = {
> -	{ .fw_name = "epll", },
> -	{ .fw_name = "syspll", },
> -};
> -
> -static const struct clk_parent_data dbg_sel_clks[] = {
> -	{ .fw_name = "hirc", },
> -	{ .fw_name = "syspll", },
> -};
> -
> -static const struct clk_parent_data timer0_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk0", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data timer1_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk0", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data timer2_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk1", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data timer3_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk1", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data timer4_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk2", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data timer5_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk2", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data timer6_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk0", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data timer7_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk0", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data timer8_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk1", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data timer9_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk1", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data timer10_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk2", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data timer11_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk2", },
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "lirc", },
> -	{ .index = -1, },
> -	{ .fw_name = "hirc", },
> -};
> -
> -static const struct clk_parent_data uart_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "sysclk1_div2", },
> -};
> -
> -static const struct clk_parent_data wdt0_sel_clks[] = {
> -	{ .index = -1, },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk3_div4096", },
> -	{ .fw_name = "lirc", },
> -};
> -
> -static const struct clk_parent_data wdt1_sel_clks[] = {
> -	{ .index = -1, },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk3_div4096", },
> -	{ .fw_name = "lirc", },
> -};
> -
> -static const struct clk_parent_data wdt2_sel_clks[] = {
> -	{ .index = -1, },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "pclk4_div4096", },
> -	{ .fw_name = "lirc", },
> -};
> -
> -static const struct clk_parent_data wwdt0_sel_clks[] = {
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "pclk3_div4096", },
> -	{ .fw_name = "lirc", },
> -};
> -
> -static const struct clk_parent_data wwdt1_sel_clks[] = {
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "pclk3_div4096", },
> -	{ .fw_name = "lirc", },
> -};
> -
> -static const struct clk_parent_data wwdt2_sel_clks[] = {
> -	{ .index = -1, },
> -	{ .index = -1, },
> -	{ .fw_name = "pclk4_div4096", },
> -	{ .fw_name = "lirc", },
> -};
> -
> -static const struct clk_parent_data spi0_sel_clks[] = {
> -	{ .fw_name = "pclk1", },
> -	{ .fw_name = "apll", },
> -};
> -
> -static const struct clk_parent_data spi1_sel_clks[] = {
> -	{ .fw_name = "pclk2", },
> -	{ .fw_name = "apll", },
> -};
> -
> -static const struct clk_parent_data spi2_sel_clks[] = {
> -	{ .fw_name = "pclk1", },
> -	{ .fw_name = "apll", },
> -};
> -
> -static const struct clk_parent_data spi3_sel_clks[] = {
> -	{ .fw_name = "pclk2", },
> -	{ .fw_name = "apll", },
> -};
> -
> -static const struct clk_parent_data qspi0_sel_clks[] = {
> -	{ .fw_name = "pclk0", },
> -	{ .fw_name = "apll", },
> -};
> -
> -static const struct clk_parent_data qspi1_sel_clks[] = {
> -	{ .fw_name = "pclk0", },
> -	{ .fw_name = "apll", },
> -};
> -
> -static const struct clk_parent_data i2s0_sel_clks[] = {
> -	{ .fw_name = "apll", },
> -	{ .fw_name = "sysclk1_div2", },
> -};
> -
> -static const struct clk_parent_data i2s1_sel_clks[] = {
> -	{ .fw_name = "apll", },
> -	{ .fw_name = "sysclk1_div2", },
> -};
> -
> -static const struct clk_parent_data can_sel_clks[] = {
> -	{ .fw_name = "apll", },
> -	{ .fw_name = "vpll", },
> -};
> -
> -static const struct clk_parent_data cko_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -	{ .fw_name = "hirc", },
> -	{ .fw_name = "lirc", },
> -	{ .fw_name = "capll_div4", },
> -	{ .fw_name = "syspll", },
> -	{ .fw_name = "ddrpll", },
> -	{ .fw_name = "epll_div2", },
> -	{ .fw_name = "apll", },
> -	{ .fw_name = "vpll", },
> -};
> -
> -static const struct clk_parent_data smc_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "pclk4", },
> -};
> -
> -static const struct clk_parent_data kpi_sel_clks[] = {
> -	{ .fw_name = "hxt", },
> -	{ .fw_name = "lxt", },
> -};
> +#define MA35D1_MUX_MAX_PARENTS	10
> +
> +/* Mux parent selection, by index into the controller's clock table */
> +static const int ca35clk_parent_idx[] = { HXT, CAPLL, DDRPLL };
> +static const int sysclk0_parent_idx[] = { EPLL_DIV2, SYSPLL };
> +static const int sysclk1_parent_idx[] = { HXT, SYSPLL };
> +static const int axiclk_parent_idx[] = { AXICLK_DIV2, AXICLK_DIV4 };
> +static const int ccap_parent_idx[] = { HXT, VPLL, APLL, SYSPLL };
> +static const int sdh_parent_idx[] = { SYSPLL, APLL };
> +static const int dcu_parent_idx[] = { EPLL_DIV2, SYSPLL };
> +static const int gfx_parent_idx[] = { EPLL, SYSPLL };
> +static const int dbg_parent_idx[] = { HIRC, SYSPLL };
> +static const int timer0_parent_idx[] = { HXT, LXT, PCLK0, -1, -1, LIRC, -1, HIRC };
> +static const int timer1_parent_idx[] = { HXT, LXT, PCLK0, -1, -1, LIRC, -1, HIRC };
> +static const int timer2_parent_idx[] = { HXT, LXT, PCLK1, -1, -1, LIRC, -1, HIRC };
> +static const int timer3_parent_idx[] = { HXT, LXT, PCLK1, -1, -1, LIRC, -1, HIRC };
> +static const int timer4_parent_idx[] = { HXT, LXT, PCLK2, -1, -1, LIRC, -1, HIRC };
> +static const int timer5_parent_idx[] = { HXT, LXT, PCLK2, -1, -1, LIRC, -1, HIRC };
> +static const int timer6_parent_idx[] = { HXT, LXT, PCLK0, -1, -1, LIRC, -1, HIRC };
> +static const int timer7_parent_idx[] = { HXT, LXT, PCLK0, -1, -1, LIRC, -1, HIRC };
> +static const int timer8_parent_idx[] = { HXT, LXT, PCLK1, -1, -1, LIRC, -1, HIRC };
> +static const int timer9_parent_idx[] = { HXT, LXT, PCLK1, -1, -1, LIRC, -1, HIRC };
> +static const int timer10_parent_idx[] = { HXT, LXT, PCLK2, -1, -1, LIRC, -1, HIRC };
> +static const int timer11_parent_idx[] = { HXT, LXT, PCLK2, -1, -1, LIRC, -1, HIRC };
> +static const int uart_parent_idx[] = { HXT, SYSCLK1_DIV2 };
> +static const int wdt0_parent_idx[] = { -1, LXT, PCLK3_DIV4096, LIRC };
> +static const int wdt1_parent_idx[] = { -1, LXT, PCLK3_DIV4096, LIRC };
> +static const int wdt2_parent_idx[] = { -1, LXT, PCLK4_DIV4096, LIRC };
> +static const int wwdt0_parent_idx[] = { -1, -1, PCLK3_DIV4096, LIRC };
> +static const int wwdt1_parent_idx[] = { -1, -1, PCLK3_DIV4096, LIRC };
> +static const int wwdt2_parent_idx[] = { -1, -1, PCLK4_DIV4096, LIRC };
> +static const int spi0_parent_idx[] = { PCLK1, APLL };
> +static const int spi1_parent_idx[] = { PCLK2, APLL };
> +static const int spi2_parent_idx[] = { PCLK1, APLL };
> +static const int spi3_parent_idx[] = { PCLK2, APLL };
> +static const int qspi_parent_idx[] = { PCLK0, APLL };
> +static const int i2s_parent_idx[] = { APLL, SYSCLK1_DIV2 };
> +static const int can_parent_idx[] = { APLL, VPLL };
> +static const int cko_parent_idx[] = { HXT, LXT, HIRC, LIRC,
> +				      AXICLK_DIV4, SYSPLL, DDRPLL,
> +				      EPLL_DIV2, APLL, VPLL };
> +static const int smc_parent_idx[] = { HXT, PCLK4 };
> +static const int kpi_parent_idx[] = { HXT, LXT };
>  
>  static const struct clk_div_table ip_div_table[] = {
>  	{0, 2}, {1, 4}, {2, 6}, {3, 8}, {4, 10},
> @@ -375,24 +124,20 @@ static struct clk_hw *ma35d1_clk_fixed(const char *name, int rate)
>  	return clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
>  }
>  
> -static struct clk_hw *ma35d1_clk_mux_parent(struct device *dev, const char *name,
> -					    void __iomem *reg, u8 shift, u8 width,
> -					    const struct clk_parent_data *pdata,
> -					    int num_pdata)
> -{
> -	return clk_hw_register_mux_parent_data(dev, name, pdata, num_pdata,
> -					       CLK_SET_RATE_NO_REPARENT, reg, shift,
> -					       width, 0, &ma35d1_lock);
> -}
> -
>  static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *name,
>  				     void __iomem *reg, u8 shift, u8 width,
> -				     const struct clk_parent_data *pdata,
> -				     int num_pdata)
> +				     struct clk_hw **hws,
> +				     const int *parent_idx, int num_parents)
>  {
> -	return clk_hw_register_mux_parent_data(dev, name, pdata, num_pdata,
> -					       CLK_SET_RATE_NO_REPARENT, reg, shift,
> -					       width, 0, &ma35d1_lock);
> +	const struct clk_hw *parent_hws[MA35D1_MUX_MAX_PARENTS] = {};


It works but a little check to make sure we do not overflow the table here
would be nice.

-- 
Jerome

