Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EC8351C36
	for <linux-clk@vger.kernel.org>; Fri,  3 Apr 2026 15:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775230192; cv=none; b=jl9eTq8uFPZ3WbOqLM0rGaKqwZrSM+oIE8VvGD6HJTX4DZiyESdftNzgv46T6ffxg8AxtkpDw+xbEYhfldvZzVqU+Yz/B67E3h7ozspIZE6/aEjn/grXLVkcuFr44Wyp+fKpPNvvf6Nzr5U+PH0sX87WOjs8zK4YuiTVb+MRbL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775230192; c=relaxed/simple;
	bh=azM1FxOBwJK1J6RwOxXGbo05i5gRwPzpoJYbOGaoUpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2bB2mNcg0dnH9v9DgBEelxjGOekhwth9GXn3pJ62E4Uo8NjuKf57Db9/wH4jEx6Kdxs7uoowfDNCIVmBHmUu9K1xK80PN0cB4e2d2zA8V4qZa713XhxQTGvOJNjTnd7QOEkf6diDvP3rid8DflLNTb0vQIpNATyAu5YNE/jw0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QkpNEEFa; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jP2qsSwD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QkpNEEFa";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jP2qsSwD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775230190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I9vnOEy2SnXABq64qUkV4dXXkUgE/P3rvcB6DgffOz4=;
	b=QkpNEEFaHXRxrNbT1G3LPZljfrbelcXqm3Oh2V9d40EYXs2RPXaOYMrdKZtMbLsf8jTVXl
	ePWrbHF4r24ALB6PxsChgRjthKhE4Iq+r+vVqxq/a5zFZmYBrECesRGcnolvpzxxkkD+Pu
	JR+e71cktmDQhCDCg5+8eUAKX782zoI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-6w8r9nhyNN-TbPmNvkbwJw-1; Fri, 03 Apr 2026 11:29:48 -0400
X-MC-Unique: 6w8r9nhyNN-TbPmNvkbwJw-1
X-Mimecast-MFC-AGG-ID: 6w8r9nhyNN-TbPmNvkbwJw_1775230188
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7de0e161so516057385a.2
        for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 08:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775230188; x=1775834988; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9vnOEy2SnXABq64qUkV4dXXkUgE/P3rvcB6DgffOz4=;
        b=jP2qsSwDJ11hBlRN66b2NTwRICMPcasyqMZWFX6TkvmPtpau0Tkto3FZytWraKdcuL
         Z8f9g7hdgLafy2Tks2cD6hcubUpu0VYhWxgOsUaPFjO7PsF2t+6z0Y2IWukE/pFadcen
         zTIptZAs4VERRso9aw0ZQOppqaJFM2DSRRsch7jsaPWRVtwU2OrdFxWYUU9VQ2ZzQw6k
         J4NP1sDqjGkOHqEJRh7wvCde1Vg7a6RHyg0hAv8cm2fSl00g+BKYkvmgmk5I2TPtAUYS
         GPtQVyahKltTF41W/X6T/Vg4NitNQoQvbI59P7nk3fD1gz+GgvI+8al9aChIBCRGh9RA
         tJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775230188; x=1775834988;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I9vnOEy2SnXABq64qUkV4dXXkUgE/P3rvcB6DgffOz4=;
        b=C/hscWb090WmJu0QSbqu5X5bZ2c4/V+UoUKrIpu+Y4PbL5viJzguELwmv7DFexUrzl
         l98OiL6V07KqbsS3syLNwaQ12qi+8XmGGefFnsGNi71oHTkNOXAMJgFyBc17FEpT1lw8
         TkcC9xGc30G79peklEh9HS9cZqxmai8/9LHypIZfuf7fZASOpfxfpiab/rIBMelN5cxV
         DR6svmv+DGqqVALoYNTII1dnN43Oeu6D4VAaDLfgsOJ4WZte7BC+jUEsspY9oXaZiFq2
         Xhpoj/93vr74fdBfq3VWPkEZsM4JplLtaTXn3SpwERzxUm46CzSsKlaF6dfkPOPjfyJc
         678Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTthZSckb//8e8T5pEPVxrT9JMRhrbvCGa9AjNcZbc9ipLgayZOj/gUmSO+lNEF3TjzUya3gENWbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwswzDhWuQl6eA4EXtUu1KK6uPrTSeAEeorfvPWQXAe4ziIz5KE
	UEpBf4NDJivSDWSFK4b9Em23SZ4m+2fIfYJnG4u01gMvyaADDZGkZ3+4dFviapcUSCxuYtGlQ+V
	gkUfK02YVI33TlWtc+CEzFIme6Z6RehIDgTl/bR+tOVC6lyLYvvm84CCM8uBJLw==
X-Gm-Gg: ATEYQzx7o4Gxbn05XDyxBZj03kin7p5wSCNg3LGGeIW/Z7PHfFS8eI0pK4PVt0eLxve
	hDa1ugQg+QoFD16BDv97VKudRH3GMvh3vabAck4GDeCQwjkU/k1Fmwqx8KYRxuRseV35afmq81j
	hsY9kYctIWGa4y4zv1BYJPuIBQ7NamBbfx+E8F+nzum7wws3lX9uH6DlboYVfP8xmdJIQ8RLDMS
	w3Stntvm7yy39sHx3dfXh6154mhXnxyCwcXpEcl2qBCbBniETN8KmV6pE0M0srD6O5LZ7/Mgaxx
	GsnME9xVpHFUVA3ZdjfQRdQZiyM3FdLaPxU5eOW+eVuc8hTe1XLlcMHcFDNhaOcwOi749uw1cfT
	D8a4uRv9LqxiZ4QIevP244D46y2DjMlIV2wQ88RNqahsAl/iMn/auJwOs
X-Received: by 2002:a05:620a:44d3:b0:8cd:93b7:ebbd with SMTP id af79cd13be357-8d41e9206a4mr465043985a.60.1775230187610;
        Fri, 03 Apr 2026 08:29:47 -0700 (PDT)
X-Received: by 2002:a05:620a:44d3:b0:8cd:93b7:ebbd with SMTP id af79cd13be357-8d41e9206a4mr465040385a.60.1775230187049;
        Fri, 03 Apr 2026 08:29:47 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d43e17d30esm188410185a.6.2026.04.03.08.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:29:46 -0700 (PDT)
Date: Fri, 3 Apr 2026 11:29:44 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v6 09/10] clk: realtek: Add RTD1625-ISO clock controller
 driver
Message-ID: <ac_c6BkBQyvvOpeq@redhat.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
 <20260402073957.2742459-10-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402073957.2742459-10-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Yu-Chun,

On Thu, Apr 02, 2026 at 03:39:56PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add support for the ISO (Isolation) domain clock controller on the Realtek
> RTD1625 SoC. This controller manages clocks in the always-on power domain,
> ensuring essential services remain functional even when the main system
> power is gated.
> 
> Since the reset controller shares the same register space with the ISO
> clock controller, it is instantiated as an auxiliary device by the core
> clock driver. This patch also includes the corresponding auxiliary reset
> driver to handle the ISO domain resets.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v6:
> - Add the headers used in c file to follow the "Include What You Use" principle.
> - Move struct rtk_reset_desc arrays from the clock driver to the dedicated reset driver.
> - Implement and register a dedicated reset auxiliary driver.
> ---
>  drivers/clk/realtek/Makefile              |   1 +
>  drivers/clk/realtek/clk-rtd1625-iso.c     | 144 ++++++++++++++++++++++
>  drivers/reset/realtek/Makefile            |   2 +-
>  drivers/reset/realtek/reset-rtd1625-iso.c |  96 +++++++++++++++
>  4 files changed, 242 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/realtek/clk-rtd1625-iso.c
>  create mode 100644 drivers/reset/realtek/reset-rtd1625-iso.c
> 
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index c992f97dfbc7..1680435e1e0f 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -10,3 +10,4 @@ clk-rtk-y += freq_table.o
>  
>  clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-pll-mmc.o
>  obj-$(CONFIG_COMMON_CLK_RTD1625) += clk-rtd1625-crt.o
> +obj-$(CONFIG_COMMON_CLK_RTD1625) += clk-rtd1625-iso.o
> diff --git a/drivers/clk/realtek/clk-rtd1625-iso.c b/drivers/clk/realtek/clk-rtd1625-iso.c
> new file mode 100644
> index 000000000000..027a131363f9
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtd1625-iso.c
> @@ -0,0 +1,144 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <dt-bindings/clock/realtek,rtd1625-clk.h>
> +#include <linux/array_size.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include "clk-regmap-gate.h"
> +
> +#define RTD1625_ISO_CLK_MAX	19
> +#define RTD1625_ISO_RSTN_MAX	29
> +#define RTD1625_ISO_S_CLK_MAX	5
> +#define RTD1625_ISO_S_RSTN_MAX	5
> +
> +static CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_p4, 0, 0x4, 0, 0);
> +static CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_p3, 0, 0x4, 1, 0);
> +static CLK_REGMAP_GATE(clk_en_misc_cec0, "clk_en_misc", 0, 0x4, 2, 0);
> +static CLK_REGMAP_GATE_NO_PARENT(clk_en_cbusrx_sys, 0, 0x4, 3, 0);
> +static CLK_REGMAP_GATE_NO_PARENT(clk_en_cbustx_sys, 0, 0x4, 4, 0);
> +static CLK_REGMAP_GATE_NO_PARENT(clk_en_cbus_sys, 0, 0x4, 5, 0);
> +static CLK_REGMAP_GATE_NO_PARENT(clk_en_cbus_osc, 0, 0x4, 6, 0);
> +static CLK_REGMAP_GATE_NO_PARENT(clk_en_i2c0, 0, 0x4, 9, 0);
> +static CLK_REGMAP_GATE_NO_PARENT(clk_en_i2c1, 0, 0x4, 10, 0);
> +static CLK_REGMAP_GATE_NO_PARENT(clk_en_etn_250m, 0, 0x4, 11, 0);
> +static CLK_REGMAP_GATE_NO_PARENT(clk_en_etn_sys, 0, 0x4, 12, 0);
> +static CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_drd, 0, 0x4, 13, 0);
> +static CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_host, 0, 0x4, 14, 0);
> +static CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_u3_host, 0, 0x4, 15, 0);
> +static CLK_REGMAP_GATE_NO_PARENT(clk_en_usb, 0, 0x4, 16, 0);
> +static CLK_REGMAP_GATE_NO_PARENT(clk_en_vtc, 0, 0x4, 17, 0);
> +static CLK_REGMAP_GATE(clk_en_misc_vfd, "clk_en_misc", 0, 0x4, 18, 0);
> +
> +static struct clk_regmap *rtd1625_clk_regmap_list[] = {

static const? Same for some others below as well.

> +	&clk_en_usb_p4.clkr,
> +	&clk_en_usb_p3.clkr,
> +	&clk_en_misc_cec0.clkr,
> +	&clk_en_cbusrx_sys.clkr,
> +	&clk_en_cbustx_sys.clkr,
> +	&clk_en_cbus_sys.clkr,
> +	&clk_en_cbus_osc.clkr,
> +	&clk_en_i2c0.clkr,
> +	&clk_en_i2c1.clkr,
> +	&clk_en_etn_250m.clkr,
> +	&clk_en_etn_sys.clkr,
> +	&clk_en_usb_drd.clkr,
> +	&clk_en_usb_host.clkr,
> +	&clk_en_usb_u3_host.clkr,
> +	&clk_en_usb.clkr,
> +	&clk_en_vtc.clkr,
> +	&clk_en_misc_vfd.clkr,
> +};
> +
> +static struct clk_hw_onecell_data rtd1625_iso_clk_data = {
> +	.num = RTD1625_ISO_CLK_MAX,
> +	.hws = {
> +		[RTD1625_ISO_CLK_EN_USB_P4]      = &__clk_regmap_gate_hw(&clk_en_usb_p4),
> +		[RTD1625_ISO_CLK_EN_USB_P3]      = &__clk_regmap_gate_hw(&clk_en_usb_p3),
> +		[RTD1625_ISO_CLK_EN_MISC_CEC0]   = &__clk_regmap_gate_hw(&clk_en_misc_cec0),
> +		[RTD1625_ISO_CLK_EN_CBUSRX_SYS]  = &__clk_regmap_gate_hw(&clk_en_cbusrx_sys),
> +		[RTD1625_ISO_CLK_EN_CBUSTX_SYS]  = &__clk_regmap_gate_hw(&clk_en_cbustx_sys),
> +		[RTD1625_ISO_CLK_EN_CBUS_SYS]    = &__clk_regmap_gate_hw(&clk_en_cbus_sys),
> +		[RTD1625_ISO_CLK_EN_CBUS_OSC]    = &__clk_regmap_gate_hw(&clk_en_cbus_osc),
> +		[RTD1625_ISO_CLK_EN_I2C0]        = &__clk_regmap_gate_hw(&clk_en_i2c0),
> +		[RTD1625_ISO_CLK_EN_I2C1]        = &__clk_regmap_gate_hw(&clk_en_i2c1),
> +		[RTD1625_ISO_CLK_EN_ETN_250M]    = &__clk_regmap_gate_hw(&clk_en_etn_250m),
> +		[RTD1625_ISO_CLK_EN_ETN_SYS]     = &__clk_regmap_gate_hw(&clk_en_etn_sys),
> +		[RTD1625_ISO_CLK_EN_USB_DRD]     = &__clk_regmap_gate_hw(&clk_en_usb_drd),
> +		[RTD1625_ISO_CLK_EN_USB_HOST]    = &__clk_regmap_gate_hw(&clk_en_usb_host),
> +		[RTD1625_ISO_CLK_EN_USB_U3_HOST] = &__clk_regmap_gate_hw(&clk_en_usb_u3_host),
> +		[RTD1625_ISO_CLK_EN_USB]         = &__clk_regmap_gate_hw(&clk_en_usb),
> +		[RTD1625_ISO_CLK_EN_VTC]         = &__clk_regmap_gate_hw(&clk_en_vtc),
> +		[RTD1625_ISO_CLK_EN_MISC_VFD]    = &__clk_regmap_gate_hw(&clk_en_misc_vfd),
> +		[RTD1625_ISO_CLK_MAX] = NULL,
> +	},
> +};
> +
> +static const struct rtk_clk_desc rtd1625_iso_desc = {
> +	.clk_data = &rtd1625_iso_clk_data,
> +	.clks     = rtd1625_clk_regmap_list,
> +	.num_clks = ARRAY_SIZE(rtd1625_clk_regmap_list),
> +};
> +
> +static CLK_REGMAP_GATE_NO_PARENT(clk_en_irda, 0, 0x4, 6, 1);
> +static CLK_REGMAP_GATE_NO_PARENT(clk_en_ur10, 0, 0x4, 8, 1);
> +
> +static struct clk_regmap *rtd1625_iso_s_clk_regmap_list[] = {
> +	&clk_en_irda.clkr,
> +	&clk_en_ur10.clkr,
> +};
> +
> +static struct clk_hw_onecell_data rtd1625_iso_s_clk_data = {
> +	.num = RTD1625_ISO_S_CLK_MAX,
> +	.hws = {
> +		[RTD1625_ISO_S_CLK_EN_IRDA] = &__clk_regmap_gate_hw(&clk_en_irda),
> +		[RTD1625_ISO_S_CLK_EN_UR10] = &__clk_regmap_gate_hw(&clk_en_ur10),
> +		[RTD1625_ISO_S_CLK_MAX] = NULL,
> +	},
> +};
> +
> +static const struct rtk_clk_desc rtd1625_iso_s_desc = {
> +	.clk_data = &rtd1625_iso_s_clk_data,
> +	.clks     = rtd1625_iso_s_clk_regmap_list,
> +	.num_clks = ARRAY_SIZE(rtd1625_iso_s_clk_regmap_list),
> +};
> +
> +static int rtd1625_iso_probe(struct platform_device *pdev)
> +{
> +	const struct rtk_clk_desc *desc;
> +
> +	desc = of_device_get_match_data(&pdev->dev);
> +	if (!desc)
> +		return -EINVAL;
> +	return rtk_clk_probe(pdev, desc, "iso_rst");

Add newline before return.

> +}
> +
> +static const struct of_device_id rtd1625_iso_match[] = {
> +	{.compatible = "realtek,rtd1625-iso-clk", .data = &rtd1625_iso_desc},
> +	{.compatible = "realtek,rtd1625-iso-s-clk", .data = &rtd1625_iso_s_desc},
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver rtd1625_iso_driver = {
> +	.probe = rtd1625_iso_probe,
> +	.driver = {
> +		.name = "rtk-rtd1625-iso-clk",
> +		.of_match_table = rtd1625_iso_match,
> +	},
> +};
> +
> +static int __init rtd1625_iso_init(void)
> +{
> +	return platform_driver_register(&rtd1625_iso_driver);
> +}
> +subsys_initcall(rtd1625_iso_init);
> +
> +MODULE_DESCRIPTION("Realtek RTD1625 ISO Controller Driver");
> +MODULE_AUTHOR("Cheng-Yu Lee <cylee12@realtek.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("REALTEK_CLK");
> diff --git a/drivers/reset/realtek/Makefile b/drivers/reset/realtek/Makefile
> index 8ca1fa939f10..26b3ddc75ada 100644
> --- a/drivers/reset/realtek/Makefile
> +++ b/drivers/reset/realtek/Makefile
> @@ -1,2 +1,2 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -obj-$(CONFIG_RESET_RTK_COMMON) += common.o reset-rtd1625-crt.o
> +obj-$(CONFIG_RESET_RTK_COMMON) += common.o reset-rtd1625-crt.o reset-rtd1625-iso.o

Some comment as the previous patch. CONFIG_RESET_RTK_COMMON is expected
to be common, right? If so, a SoC-specific driver shouldn't be listed
here.

> diff --git a/drivers/reset/realtek/reset-rtd1625-iso.c b/drivers/reset/realtek/reset-rtd1625-iso.c
> new file mode 100644
> index 000000000000..f2a0478382ae
> --- /dev/null
> +++ b/drivers/reset/realtek/reset-rtd1625-iso.c
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Realtek Semiconductor Corporation
> + */
> +
> +#include <dt-bindings/reset/realtek,rtd1625.h>
> +#include <linux/auxiliary_bus.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>
> +#include "common.h"
> +
> +#define RTD1625_ISO_RSTN_MAX	29
> +#define RTD1625_ISO_S_RSTN_MAX	5
> +
> +static struct rtk_reset_desc rtd1625_iso_reset_descs[] = {

static const?

> +	[RTD1625_ISO_RSTN_VFD]                 = { .ofs = 0x88, .bit = 0 },
> +	[RTD1625_ISO_RSTN_CEC0]                = { .ofs = 0x88, .bit = 2 },
> +	[RTD1625_ISO_RSTN_CEC1]                = { .ofs = 0x88, .bit = 3 },
> +	[RTD1625_ISO_RSTN_CBUSTX]              = { .ofs = 0x88, .bit = 5 },
> +	[RTD1625_ISO_RSTN_CBUSRX]              = { .ofs = 0x88, .bit = 6 },
> +	[RTD1625_ISO_RSTN_USB3_PHY2_XTAL_POW]  = { .ofs = 0x88, .bit = 7 },
> +	[RTD1625_ISO_RSTN_UR0]                 = { .ofs = 0x88, .bit = 8 },
> +	[RTD1625_ISO_RSTN_GMAC]                = { .ofs = 0x88, .bit = 9 },
> +	[RTD1625_ISO_RSTN_GPHY]                = { .ofs = 0x88, .bit = 10 },
> +	[RTD1625_ISO_RSTN_I2C_0]               = { .ofs = 0x88, .bit = 11 },
> +	[RTD1625_ISO_RSTN_I2C_1]               = { .ofs = 0x88, .bit = 12 },
> +	[RTD1625_ISO_RSTN_CBUS]                = { .ofs = 0x88, .bit = 13 },
> +	[RTD1625_ISO_RSTN_USB_DRD]             = { .ofs = 0x88, .bit = 14 },
> +	[RTD1625_ISO_RSTN_USB_HOST]            = { .ofs = 0x88, .bit = 15 },
> +	[RTD1625_ISO_RSTN_USB_PHY_0]           = { .ofs = 0x88, .bit = 16 },
> +	[RTD1625_ISO_RSTN_USB_PHY_1]           = { .ofs = 0x88, .bit = 17 },
> +	[RTD1625_ISO_RSTN_USB_PHY_2]           = { .ofs = 0x88, .bit = 18 },
> +	[RTD1625_ISO_RSTN_USB]                 = { .ofs = 0x88, .bit = 19 },
> +	[RTD1625_ISO_RSTN_TYPE_C]              = { .ofs = 0x88, .bit = 20 },
> +	[RTD1625_ISO_RSTN_USB_U3_HOST]         = { .ofs = 0x88, .bit = 21 },
> +	[RTD1625_ISO_RSTN_USB3_PHY0_POW]       = { .ofs = 0x88, .bit = 22 },
> +	[RTD1625_ISO_RSTN_USB3_P0_MDIO]        = { .ofs = 0x88, .bit = 23 },
> +	[RTD1625_ISO_RSTN_USB3_PHY1_POW]       = { .ofs = 0x88, .bit = 24 },
> +	[RTD1625_ISO_RSTN_USB3_P1_MDIO]        = { .ofs = 0x88, .bit = 25 },
> +	[RTD1625_ISO_RSTN_VTC]                 = { .ofs = 0x88, .bit = 26 },
> +	[RTD1625_ISO_RSTN_USB3_PHY2_POW]       = { .ofs = 0x88, .bit = 27 },
> +	[RTD1625_ISO_RSTN_USB3_P2_MDIO]        = { .ofs = 0x88, .bit = 28 },
> +	[RTD1625_ISO_RSTN_USB_PHY_3]           = { .ofs = 0x88, .bit = 29 },
> +	[RTD1625_ISO_RSTN_USB_PHY_4]           = { .ofs = 0x88, .bit = 30 },
> +};
> +
> +static struct rtk_reset_desc rtd1625_iso_s_reset_descs[] = {
> +	[RTD1625_ISO_S_RSTN_ISOM_MIS] = { .ofs = 0x310, .bit = 0, .write_en = 1 },
> +	[RTD1625_ISO_S_RSTN_GPIOM]    = { .ofs = 0x310, .bit = 2, .write_en = 1 },
> +	[RTD1625_ISO_S_RSTN_TIMER7]   = { .ofs = 0x310, .bit = 4, .write_en = 1 },
> +	[RTD1625_ISO_S_RSTN_IRDA]     = { .ofs = 0x310, .bit = 6, .write_en = 1 },
> +	[RTD1625_ISO_S_RSTN_UR10]     = { .ofs = 0x310, .bit = 8, .write_en = 1 },
> +};
> +
> +static int rtd1625_iso_reset_probe(struct auxiliary_device *adev,
> +				   const struct auxiliary_device_id *id)
> +{
> +	struct device *dev = &adev->dev;
> +	struct device *parent = dev->parent;
> +	struct rtk_reset_data *data;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	if (of_device_is_compatible(parent->of_node, "realtek,rtd1625-iso-s-clk")) {
> +		data->descs           = rtd1625_iso_s_reset_descs;
> +		data->rcdev.nr_resets = RTD1625_ISO_S_RSTN_MAX;
> +	} else {
> +		data->descs           = rtd1625_iso_reset_descs;
> +		data->rcdev.nr_resets = RTD1625_ISO_RSTN_MAX;
> +	}
> +	return rtk_reset_controller_add(dev, data);

Newline before return.

> +}
> +
> +static const struct auxiliary_device_id rtd1625_iso_reset_ids[] = {
> +	{
> +		.name = "clk_rtk.iso_rst",
> +	},

I would combine the { .name } all on one line.

Brian


> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, rtd1625_iso_reset_ids);
> +
> +static struct auxiliary_driver rtd1625_iso_driver = {
> +	.probe = rtd1625_iso_reset_probe,
> +	.id_table = rtd1625_iso_reset_ids,
> +	.driver = {
> +		.name = "rtd1625-iso-reset",
> +	},
> +};
> +module_auxiliary_driver(rtd1625_iso_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("REALTEK_RESET");
> -- 
> 2.34.1
> 

