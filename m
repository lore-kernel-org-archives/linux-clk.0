Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43EDDC6FD18
	for <linux-clk@archiver.kernel.org>; Fri, 31 Mar 2023 12:36:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbjCaMgO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 31 Mar 2023 08:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231853AbjCaMgM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 31 Mar 2023 08:36:12 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D6F720616
        for <linux-clk@vger.kernel.org>; Fri, 31 Mar 2023 05:35:47 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id i9so22241226wrp.3
        for <linux-clk@vger.kernel.org>; Fri, 31 Mar 2023 05:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680266141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=swOeWot85GIaEePp91l98DkNomzcOh+V2vppc9loIuU=;
        b=BkF/FqSsbVjbR1KVsiSpp7SQNoMqEdlMojmSrjeDo+9LbCdA3wvvUQ2FqFFr4Z1N+R
         CqvWeyyswgPkG4UhnYDxHpGST9/tVFnwd96DXgIG09uDl11pUyymaTp6BErulwzQCzS9
         LIX3VrPMQTBXcHtZss4xxMBJeUUWPwCH5qAfyRhPj9kLH+T+B7MEsnt6YD6Cyjv10KxI
         sdNVD328u7TA54082Z2OjMePKjVajcHwBGjsI3stsu3m+FyrqMwMlBxWuq76N8mgry6n
         Sni/ScuRCDhOSWwvi2IYqsRGLekiVM+jOxz7cWEgYpgLannbfs8iknnC5J2uwsNQtqhD
         9b7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680266141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swOeWot85GIaEePp91l98DkNomzcOh+V2vppc9loIuU=;
        b=h+6bAnSP9X8AWsb4qYBB6F7qOjFhJ1E7HQStNHLV/hkBTTdFrWD7fCPAHcMkLm6gQD
         QJ7XqKcYCivnlyoh+Jyzoq7F3xptGuSbUfhmgsdbhpOT6Cp6JaNIIAOE960hK2rxUEis
         PVR2s8hBevRPmG3RUVFGXTvt03rKwO0dGTL8qlpNXbY3gGbYqEXuhSLZK1taiIdc54X2
         x3RJmBzMLTZnRaAlh7BiVpAEqvK5QLm1Mdp9A4z6b9+Ex7nkZZXTiG5puqP7Kiu7oRzh
         bj9yWXkEmvegiQ1hQ+DS0PahYrqlMyyIPPhRtwK8R2P2PyTichjlOn7T0Hoifm019oP5
         M15A==
X-Gm-Message-State: AAQBX9fIzvni6Zja165kqYhlplqZDlAYzcLIFY4QRsxjBbNZffLEKnDD
        3Em5/fdr1f8oxGY8GSI/MRl3yA==
X-Google-Smtp-Source: AKy350b9EDA4FRXrfvd4zTIm9hwFtXN5pA+QlBIcWSVxOH0R42o/XjmxtvUN+8Tr/9+SP05WzOhqIA==
X-Received: by 2002:adf:dd87:0:b0:2ce:aa62:ff79 with SMTP id x7-20020adfdd87000000b002ceaa62ff79mr20600624wrl.40.1680266140773;
        Fri, 31 Mar 2023 05:35:40 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v12-20020a5d4b0c000000b002cfed482e9asm2109776wrq.61.2023.03.31.05.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 05:35:40 -0700 (PDT)
Date:   Fri, 31 Mar 2023 15:35:38 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-clk@vger.kernel.org, aford@beaconembedded.com,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 0/4] clk: imx: Improve imx8mm/imx8mn LCDIF clocks
Message-ID: <ZCbTmitvBTQu26PX@linaro.org>
References: <20230323230127.120883-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323230127.120883-1-aford173@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-03-23 18:01:23, Adam Ford wrote:
> Both the i.MX8M Mini and Nano have a video_pll which can be used 
> to source a clock which feeds the lcdif interface.  This interface
> currently fixes video_pll and divides down the clock feeding LCDIF.
> However, when connected to an HDMI bridge chip that supports a
> variety of video resolutions and refresh rates, the only settings
> that properly sync are ones that evenly divide from the video_pll_out
> clock.
> 
> This series adds the ability for the clk-compolsite-8m to
> request a better parent clock rate if the proper clock flag is
> enable and sets that flag in the corresponding imx8mm and 
> imx8mn video_pll clocks to increase the number of resolutions
> and refresh rates timings that the LCDIF can produce.
> 
> This also has a side benefit of allowing the video-pll to run
> at a lower clock speed which can potentially save some power
> depending on the requested resolution and refresh rate.
> 

Applied, thanks!

[1/4] clk: imx: composite-8m: Add support to determine_rate
      commit: 156e96ff2172518b6f83e97d8f11f677bc668e22
[2/4] clk: imx: Add imx8m_clk_hw_composite_flags macro
      commit: 784a9b3916e949c00666588fd167c4ab245ec9d6
[3/4] clk: imx8mm: Let IMX8MM_CLK_LCDIF_PIXEL set parent rate
      commit: 5fe6ec93f10b0765d59e0efb6ecba419a6a49d48
[4/4] clk: imx: Let IMX8MN_CLK_DISP_PIXEL set parent rate
      commit: 46a974433ea7fa468b45db70536f7cea81feb87c


Best regards,
--
Abel Vesa <abel.vesa@linaro.org>



> v4:  Sorry for the noise.  I forgot to 'git ammend' so V4
>      is what V3 should have been.
> V3:  Change the name of clk_divider_determine_rate to
>       imx8m_clk_divider_determine_rate
> V2:  Split off the new imx8m_clk_hw_composite_flags definition
>      into its own patch and re-order to fix build error.
>       
> Adam Ford (3):
>   clk: imx: composite-8m: Add support to determine_rate
>   clk: imx8mm: Let IMX8MM_CLK_LCDIF_PIXEL set parent rate
>   clk: imx: Let IMX8MN_CLK_DISP_PIXEL set parent rate
> 
>  drivers/clk/imx/clk-composite-8m.c | 7 +++++++
>  drivers/clk/imx/clk-imx8mm.c       | 2 +-
>  drivers/clk/imx/clk-imx8mn.c       | 2 +-
>  drivers/clk/imx/clk.h              | 4 ++++
>  4 files changed, 13 insertions(+), 2 deletions(-)
> 
> -- 
> 2.34.1
> 
