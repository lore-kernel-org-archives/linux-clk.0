Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61162C433B4
	for <linux-clk@archiver.kernel.org>; Fri, 16 Apr 2021 23:57:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C8416115B
	for <linux-clk@archiver.kernel.org>; Fri, 16 Apr 2021 23:57:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbhDPX5b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Apr 2021 19:57:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:35652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235084AbhDPX53 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 16 Apr 2021 19:57:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A3DF61152;
        Fri, 16 Apr 2021 23:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618617424;
        bh=+AJHAJB6/OcXWHmor2QJm+5al3mQBTCwb2ckRG3xbE0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=e+MsQUO1GRmm8SQEy0Oj+p62WX5A4N8bEiseOlcmi5MjhtamnwCZSFmKs4QVsx05R
         XglWfpMZymLPrzuQbSUlepoi0P3BQ6y7ocWDWZJjaTIv524MDF1Ua4B1wcYC9NdMd2
         ZyfU/YEU67U9N3RpI9znCI4GL1qL/0+bJfcFu0pqTYViyNznE/piPcHXEPbEbEOb7X
         N1CPjMerHq9wfY59WncFm1ycv06YHUUSDOFUW3WnCpDzxzPtpww3PqeIWgk3hViRZT
         AwynhHOGdAOz47GIkAuzyI/Km8sjsG/8xTHtBPsk6mD5sFkmxxyKqJYhDikQWmysfJ
         uy+ocn2JGUIbA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210416073703.1037718-2-ping.bai@nxp.com>
References: <20210416073703.1037718-1-ping.bai@nxp.com> <20210416073703.1037718-2-ping.bai@nxp.com>
Subject: Re: [PATCH 2/2] clk: imx: Remove the audio ipg clock from imx8mp
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     festevam@gmail.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-imx@nxp.com
To:     Jacky Bai <ping.bai@nxp.com>, abel.vesa@nxp.com,
        robh+dt@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
Date:   Fri, 16 Apr 2021 16:57:03 -0700
Message-ID: <161861742323.46595.18103968329383725805@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jacky Bai (2021-04-16 00:37:03)
> diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindin=
gs/clock/imx8mp-clock.h
> index 43927a1b9e94..235c7a00d379 100644
> --- a/include/dt-bindings/clock/imx8mp-clock.h
> +++ b/include/dt-bindings/clock/imx8mp-clock.h
> @@ -117,7 +117,6 @@
>  #define IMX8MP_CLK_AUDIO_AHB                   108
>  #define IMX8MP_CLK_MIPI_DSI_ESC_RX             109
>  #define IMX8MP_CLK_IPG_ROOT                    110
> -#define IMX8MP_CLK_IPG_AUDIO_ROOT              111

Maybe just add a comment saying it isn't there? Or remove it in three
months time once DTS no longer references it?

Removing this here means that it has to merge whenever the DTS doesn't
reference it anymore which causes a cross tree dependency.

>  #define IMX8MP_CLK_DRAM_ALT                    112
>  #define IMX8MP_CLK_DRAM_APB                    113
>  #define IMX8MP_CLK_VPU_G1                      114
