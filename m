Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88412C63797
	for <linux-clk@archiver.kernel.org>; Mon,  9 Jan 2023 11:03:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236610AbjAILDE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Jan 2023 06:03:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237075AbjAILCz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Jan 2023 06:02:55 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18FB3D2FE
        for <linux-clk@vger.kernel.org>; Mon,  9 Jan 2023 03:02:54 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id u9so19155450ejo.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Jan 2023 03:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HBmGJAH+7aJt8DSKtu2O0z38ADHM1dchiDSoaWBf4/o=;
        b=QTywWmaofqmn3sgz+ehF7Y5VHJrBCP/+i1B2iKO14rm2E9FqJd6DH7/U2Cy6rT5PYV
         hHOy8CYbetScZXi6Ya9ReWgrQmO7gt9s+GynLTuOn+4azudiiGQYFt6OdcOoYT8N2x9x
         v3LSt7fc5hPkSVaYEI8e5eYbhqni4LPyeuxaD2ldqQzv8pyQhxMsyoDG2zhzrxOtYU3g
         LzCY2n5LQnApRXoXC1eKaJn2/eiEgbbKtAHh8LzHnu5PxcsukdeuGk0LUd5smLe/u9sD
         3NzJ9QBcLmluFdi5sfSOtCnv2+Q2lwQEp6aW6Mfr02Fg1IL5NzLK4+qdHE3UvQLM5u9b
         jHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBmGJAH+7aJt8DSKtu2O0z38ADHM1dchiDSoaWBf4/o=;
        b=exvPWJjiz8rjJkAXOhkkVy9eRAI5VvQnhrRQmhKHR5sWitzQxs7+1YLAZaOaRO6nox
         VlcvOTtRhNNJGufiUFyhl/cwHwXqVYoe7qIA9DmqGqbrtZKkOEY5Y8SgVSQl0RS8Vpkx
         6dqp8leRPgrXR/DFcAnHHwstvelIaWN2hKQUjah6ZlS/Uk3S4MzYFcTYJe7ufczbWiXh
         lEf1m7v8zG+G9aXLAtCdohOZPNOc+BOwTA6zA3D8qzfDPR3e+vOJsoWBtPiAuxfBG1tA
         K5fGovF7fjmCbI7I4EjDnvfExp9KtObxZ6tE0CTp4F3L4D7gGfS2BT5bIjdirypL/A01
         VIsQ==
X-Gm-Message-State: AFqh2kqfj1whlT052msuIzB5RQDSJPZ/32pk769WAMnVRXNyQ9ISdWRI
        7nYSWYQfGeqn1Qq9XT+f5RVkog==
X-Google-Smtp-Source: AMrXdXs+6IL2HDhgSCRS6+vCNXEymA0KgUSWHwLB7jUQzJAUTbgM41ODQI9lapgRFyZRH8wnFbX+6Q==
X-Received: by 2002:a17:907:cbc9:b0:7ad:b6d8:c9d0 with SMTP id vk9-20020a170907cbc900b007adb6d8c9d0mr59672834ejc.53.1673262172644;
        Mon, 09 Jan 2023 03:02:52 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id nd38-20020a17090762a600b0084d1b34973dsm3582590ejc.61.2023.01.09.03.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 03:02:52 -0800 (PST)
Date:   Mon, 9 Jan 2023 13:02:50 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     sboyd@kernel.org, abelvesa@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, mturquette@baylibre.com, l.stach@pengutronix.de,
        peng.fan@nxp.com, alexander.stein@ew.tq-group.com,
        gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 2/3] clk: imx: imx8mp: add shared clk gate for usb
 suspend clk
Message-ID: <Y7v0WlL8EUO7KKDU@linaro.org>
References: <1664549663-20364-1-git-send-email-jun.li@nxp.com>
 <1664549663-20364-2-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1664549663-20364-2-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-09-30 22:54:22, Li Jun wrote:
> 32K usb suspend clock gate is shared with usb_root_clk, this
> shared clock gate was initially defined only for usb suspend
> clock, usb suspend clk is kept on while system is active or
> system sleep with usb wakeup enabled, so usb root clock is
> fine with this situation; with the commit cf7f3f4fa9e5
> ("clk: imx8mp: fix usb_root_clk parent"), this clock gate is
> changed to be for usb root clock, but usb root clock will
> be off while usb is suspended, so usb suspend clock will be
> gated too, this cause some usb functionalities will not work,
> so define this clock to be a shared clock gate to conform with
> the real HW status.
> 
> Fixes: 9c140d9926761 ("clk: imx: Add support for i.MX8MP clock driver")
> Cc: stable@vger.kernel.org # v5.19+
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> change for v4:
> - improve the commit log to explain why this is stable stuff.
>  
>  drivers/clk/imx/clk-imx8mp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index e89db568f5a8..5b66514bdd0c 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -17,6 +17,7 @@
>  
>  static u32 share_count_nand;
>  static u32 share_count_media;
> +static u32 share_count_usb;
>  
>  static const char * const pll_ref_sels[] = { "osc_24m", "dummy", "dummy", "dummy", };
>  static const char * const audio_pll1_bypass_sels[] = {"audio_pll1", "audio_pll1_ref_sel", };
> @@ -673,7 +674,8 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_CLK_UART2_ROOT] = imx_clk_hw_gate4("uart2_root_clk", "uart2", ccm_base + 0x44a0, 0);
>  	hws[IMX8MP_CLK_UART3_ROOT] = imx_clk_hw_gate4("uart3_root_clk", "uart3", ccm_base + 0x44b0, 0);
>  	hws[IMX8MP_CLK_UART4_ROOT] = imx_clk_hw_gate4("uart4_root_clk", "uart4", ccm_base + 0x44c0, 0);
> -	hws[IMX8MP_CLK_USB_ROOT] = imx_clk_hw_gate4("usb_root_clk", "hsio_axi", ccm_base + 0x44d0, 0);
> +	hws[IMX8MP_CLK_USB_ROOT] = imx_clk_hw_gate2_shared2("usb_root_clk", "hsio_axi", ccm_base + 0x44d0, 0, &share_count_usb);
> +	hws[IMX8MP_CLK_USB_SUSP] = imx_clk_hw_gate2_shared2("usb_suspend_clk", "osc_32k", ccm_base + 0x44d0, 0, &share_count_usb);
>  	hws[IMX8MP_CLK_USB_PHY_ROOT] = imx_clk_hw_gate4("usb_phy_root_clk", "usb_phy_ref", ccm_base + 0x44f0, 0);
>  	hws[IMX8MP_CLK_USDHC1_ROOT] = imx_clk_hw_gate4("usdhc1_root_clk", "usdhc1", ccm_base + 0x4510, 0);
>  	hws[IMX8MP_CLK_USDHC2_ROOT] = imx_clk_hw_gate4("usdhc2_root_clk", "usdhc2", ccm_base + 0x4520, 0);
> -- 
> 2.34.1
> 
