Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8DA28980E
	for <linux-clk@vger.kernel.org>; Sat,  8 Nov 2025 08:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762590848; cv=none; b=qSD7FyCSBtR4c0G8FnNZW9HPgPVDyRhRFhr8hUjqhihxXghT8hhhqODf4osa5mQcjo4NwWFexJShx30jiyfQjht0gu+yuQrfjh1C/aIq2c3j7eDN4jjB4NwoynOzvgsqIyMzNe77cdSpRS8MYOWQdzDGHeJh2RfCzX3V20Rotrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762590848; c=relaxed/simple;
	bh=HnNwRPXSXIr3vPDeNssiY+D+lEiNX4tnPtl5uSUQBAU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ibadn6zZr9kCfiWUSWyG7Zn2kyKDuhnixgIDeiy9JyhcXlapnDu2uk5ANOXX/oTO4rntvB3vb6Xe9lG1rua6bWNpNgdg1OxoNS2qxFBCe52HNn//f8FXjo50xHg0kk0CE77W8X/ym0N7SCbq1v/rxOLdAme0T9EMZbXG9R6GwmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hA8LpOsK; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hA8LpOsK"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-640b4a52950so2300123a12.1
        for <linux-clk@vger.kernel.org>; Sat, 08 Nov 2025 00:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762590844; x=1763195644; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S2bAn/z92LSkt2g9/ex7wXFtatjYpsStSn9cf/zplSc=;
        b=hA8LpOsKe/gvz4kYfgxkwVMkNzYfJMY/xcOQxvHuOQAR6qJPTDRcbY7K5Bd0ef4ctH
         amSYwBozQikGXBDEVQTQQeT9PtM9lt+SVO2A3UMiHsiVDT2IylhEhjmxQPEkjXP1mDTt
         I23uK/RtiqC1Vm11L466ObJWVcbP/5B52Skq4dxYhQFR+5QOACjTo/WSbflr4RfVo7FT
         bKjKclVC+qXAF6uOZyK5Sn8x2LZrEAD3Dxna46ZzFOxJm+Hnnkh8wpOmrioNrrQOrtmk
         8ryPLtf3rN2B0GZ+RVXZ4jgTTL4z4pw6ZJW/iNi5knqrxFWEzTkLYWkF26Ms6MqJrI8T
         kr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762590844; x=1763195644;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S2bAn/z92LSkt2g9/ex7wXFtatjYpsStSn9cf/zplSc=;
        b=ki25szIj0+8TMQ+JHacuqwDSOBKDTm2Tki30na+P4v5EDrgZEgOCeINDLhQGBhxyJY
         Je8LBAGbG89/0Ohb1cxiHV9cvnZZfDcWwTrp8a/uA0eu5TyqEXIWVbIpORhaS8rvHTat
         lQ75lnzp2KkwMr1itJf+tsfHLWUGHgnDIaoLAgoswivO0uGVBUd9CCybll2IghWXM1GS
         wVjEm6dPjeL+fuMi6dpoY8967CwSsKEeXYguvsayW/2CQ1ayV735YZip+nZysPdi4jt7
         db7czQ2rArRbXCDNBzRsUJL/qxEWw6TMIlTdFTnYK+2GGPlUfxk3itn331p7eQgid4sm
         zaPw==
X-Forwarded-Encrypted: i=1; AJvYcCXSD1i/JDP27Xl/SYcyMqDQ6+18K9+U1grXbPyYJL33R1DsbWcDcf6sFTrL/g4g/eYXANFG0rp8tHc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhR06JaZj+/kq/yr4t4WXkwRdr/xbbPlq2rGyKjJOIDoq2WO8P
	+lvLor1GnZo4xaPYBj2bpsf1kLdZbUU2M/i2rqpsRShlmz/T9CKWpj5o++K4cJB2hM5myWcddR8
	s2wYU0InkmBh7+vD2S0d9QUMIwqURJxw=
X-Gm-Gg: ASbGncs1n9nrrHjclOVGqhVETm9R6Hl5aUXyxK/VdaNCu54rRuR/d7Mpt1e3Xye+JSq
	ljoPPMGBHqOp18z2i+IzSBzDR0nV0w5qIT7Wp3mpSSu5uoCM5jaeEnJCL+qXqe4Nkn/sXWWBPnR
	DD8JaImR4lCP0mKwZ5m/Zd0rzMwedemnL1pR2biDp5LS4sNWI0hbBE6NfHu2/wQ/g/21YZIgwtL
	faFTVpsAWYxILgdsxcK7XpzYK3donedFcQUkqCqUjmXYxWestVHTLlrjiIrVw==
X-Google-Smtp-Source: AGHT+IFbr8D70I5Hh0mnS7XVwXHbLqUGTeP+fYZpSbGy0noG5yKzFl2DcNr86SrLZ7RYVuNvP7KnNxLcSVBXZ7AYddg=
X-Received: by 2002:a17:907:2daa:b0:b46:6718:3f30 with SMTP id
 a640c23a62f3a-b72e04c75bcmr186480266b.51.1762590844332; Sat, 08 Nov 2025
 00:34:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Biju Das <biju.das.au@gmail.com>
Date: Sat, 8 Nov 2025 08:33:53 +0000
X-Gm-Features: AWmQ_bmFChOZ2gWu0OVmeSTfILZt9gLDEULm0nND2RwOlaUkwhuiTXJouqHTspM
Message-ID: <CADT+UeB9_as1=Prxsx+DWJLCrdH=tGG9OfW4_5foXzte=6f=Ug@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate restrictions
To: "chris.brandt@renesas.com" <chris.brandt@renesas.com>
Cc: "airlied@gmail.com" <airlied@gmail.com>, 
	"biju.das.jz@bp.renesas.com" <biju.das.jz@bp.renesas.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, 
	"hien.huynh.px@renesas.com" <hien.huynh.px@renesas.com>, "hugo@hugovil.com" <hugo@hugovil.com>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, 
	"nghia.vo.zn@renesas.com" <nghia.vo.zn@renesas.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"simona@ffwll.ch" <simona@ffwll.ch>, "tzimmermann@suse.de" <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"

On Wed,  5 Nov 2025 17:25:29 -0500
Chris Brandt <chris.brandt@renesas.com> wrote:

> Convert the limited MIPI clock calculations to a full range of settings
> based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from external
> sources before calculations, expose a new API to set it.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> ---
> v1->v2:
> - Remove unnecessary parentheses
> - Add target argument to new API
> - DPI mode has more restrictions on DIV_A and DIV_B
>
> v2->v3:
> - Removed Empty lines (Hugo)
> - Add dummy for compile-testing CONFIG_CLK_RZG2L=n case (Geert)
> - Renamed label found_dsi_div to calc_pll_clk (Hugo)
> - Renamed label found_clk to clk_valid (Hugo)
> - Removed 'found' var because not needed
> - Move 'foutpostdiv_rate =' after if(foutvco_rate > 1500000000) (Hugo)
> - Move PLL5_TARGET_* for new API to renesas.h (Hugo,Geert)
> - Convert #define macros PLL5_TARGET_* to enum (Geert)
> - static {unsigned} int dsi_div_ab; (Geert)
> - {unsigned} int a, b;  (Geert)
> - Change "((1 << a) * (b + 1))" to "(b + 1) << a"  (Geert)
> - Change "foutvco_rate = rate * (1 << xxx ) * ..." to " = rate * ... * << xxx (Geert)
> - Move (u64) outside of modulo operation to avoid helper on 32-bit compiles (Geert)
> - Change DIV_ROUND_CLOSEST_ULL() to DIV_ROUND_CLOSEST() (Geert)
> - void rzg2l_cpg_dsi_div_set_divider({unsinged} int divider, int target)
> - Change "dsi_div_ab = (1 << AAA) * (BBB + 1)" to " = (BBB + 1) << AAA (Geert)
> - Added Reviewed-by and Tested-by (Biju)
>
> v3->v4:
> - Changed <,> to <=,>=  (Hugo)
> - Removed duplicate code bock (copy/paste mistake) (Hugo)
> - Fix dummy for rzg2l_cpg_dsi_div_set_divider when CONFIG_CLK_RZG2L=n (Geert)
> - Remove comment "Below conditions must be set.." (Hugo)
> - Remove +1,-1 from pl5_intin comparison math (kernel test robot)
> - Remove default register settings (PLL5_xxx_DEF) because makes no sense
> - If any calcualtion error, print a message and return a rate of 0
> - Rename global var "dsi_div_ab" to "dsi_div_ab_desired"
> - Check the range of hsclk
> - The correct clock parent is determined by if the divider is even/odd
> - Add in all the restrictions from DIV A,B from the hardware manual
> - No more need to be a recursive function
> - DPI settings must have DSI_DIV_B be '0' (divide 1/1)
> ---
>  drivers/clk/renesas/rzg2l-cpg.c | 147 +++++++++++++++++++++++++++++---
>  include/linux/clk/renesas.h     |  12 +++
>  2 files changed, 146 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
> index 07909e80bae2..1a552ea1c535 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -74,6 +74,17 @@
>  #define MSTOP_OFF(conf)          FIELD_GET(GENMASK(31, 16), (conf))
>  #define MSTOP_MASK(conf)      FIELD_GET(GENMASK(15, 0), (conf))
>

>

> +       if (dsi_div_target == PLL5_TARGET_DPI) {
> +               /* Fixed settings for DPI */
> +             priv->mux_dsi_div_params.clksrc = 0;
> +             priv->mux_dsi_div_params.dsi_div_a = 3; /* Divided by 8 */
> +         priv->mux_dsi_div_params.dsi_div_b = 0; /* Divided by 1 */
> +             dsi_div_ab_desired = 8;                   /* (1 << a) * (b + 1) */
This block is duplicated may be add a helper function(), if you are
planning to send another series.
> +       }

> +      /* Default settings for DPI */
> +  priv->mux_dsi_div_params.clksrc = 0;
> +  priv->mux_dsi_div_params.dsi_div_a = 3; /* Divided by 8 */
> +      priv->mux_dsi_div_params.dsi_div_b = 0; /* Divided by 1 */
> +  dsi_div_ab_desired = 8;                        /* (1 << a) * (b + 1) */
>

Cheers,
Biju
