Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB49C433DB
	for <linux-clk@archiver.kernel.org>; Sun, 31 Jan 2021 15:24:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0D4B60234
	for <linux-clk@archiver.kernel.org>; Sun, 31 Jan 2021 15:24:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbhAaOPg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 31 Jan 2021 09:15:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbhAaNaB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 31 Jan 2021 08:30:01 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D6BC06174A;
        Sun, 31 Jan 2021 05:29:46 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id c127so10874816wmf.5;
        Sun, 31 Jan 2021 05:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pzUvnTsmRn7ml0OrNfQpniU+oTGsrCS6esGHuZOTH8s=;
        b=L557cGhtxkDN8C9EtIcQ/9vYvLcqdppHHcUfLQnTjd/uckvEwi5k6N6BxxQagd0goG
         56utDpDv9BgV+ygp39YpmZ0msJ+F2qZDwfIOcTSKmfy1F9Ql6E/iYWXW4CAQdjtu0OIU
         b59vLhqAf0nINqeOgoDmzdtZwf9pzf3hMRo9I9M3f8hhOGBqsrIFX949otQfWVfkTcku
         E94u51GXUB1veSwMjd2OZnjZbXIDTrBoPJpc8f4OIjYR/9tzB+pQ98hg740KWDAhcTbh
         NtGhDnVHMVWanssN7v2/DZXn6zhwrqGDloXwwQHB3l+xOihggQ+e4VnIpHSGDVxT/V79
         z1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pzUvnTsmRn7ml0OrNfQpniU+oTGsrCS6esGHuZOTH8s=;
        b=PMgw59V72B9n7KoCbENPKJBvRJbp9bWL/fUE3OlHY2YGqBMdvD9NBrIrBCnHm0EAAI
         r2/DYhGko5sBtv1EL6qs5FT1C6YSqtvUu28N/kZgp/+SmS5qZtBMXSxxJPcGNp1IZ/cL
         2mEg52vlvwbBkPlUrJ8FsMdIC3deRBScTTe/OqUom7KMQo83tKJTPPaBZz8B7ZwhtWn1
         W8PeBdIHeE0BZpwAlbA24UR//cwkRrU9drmdRjQNQFe8GfZQA0jiBJuQGaPvIjscRKp2
         kII9VhmkaRN/3drUQ+u61/YESeq+EFa/gW7zbUp1/BCwgcZsgZBCnBFQ3QesAGT767eT
         6u9Q==
X-Gm-Message-State: AOAM5301gvIDrMZV6+8I0xvSgLdvYkdacb9ygmxqpyrnp+NrMBG6QvPa
        N21fYFmXSuxCcNObE/bTIVQ=
X-Google-Smtp-Source: ABdhPJxQbhBmUChvKQ7o8BTTQKnHCY2h5RYRuTik6SsUFN6z3ry/+UiBFIzMiUzX3vp9zGgC93yDBw==
X-Received: by 2002:a7b:c217:: with SMTP id x23mr11408326wmi.170.1612099784877;
        Sun, 31 Jan 2021 05:29:44 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id c5sm23297408wrn.77.2021.01.31.05.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Jan 2021 05:29:44 -0800 (PST)
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: Correct UART0 bus clock of
 MT8192
To:     Weiyi Lu <weiyi.lu@mediatek.com>, Rob Herring <robh@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-clk@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1608644414-17793-1-git-send-email-weiyi.lu@mediatek.com>
 <1608644414-17793-3-git-send-email-weiyi.lu@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <03eed306-c9f3-96ed-208d-24a2017b2d3d@gmail.com>
Date:   Sun, 31 Jan 2021 14:29:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1608644414-17793-3-git-send-email-weiyi.lu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 22/12/2020 14:40, Weiyi Lu wrote:
> infra_uart0 clock is the real one what uart0 uses as bus clock.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 92dcfbd..ac5dca6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -283,7 +283,7 @@
>  				     "mediatek,mt6577-uart";
>  			reg = <0 0x11002000 0 0x1000>;
>  			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks = <&clk26m>, <&clk26m>;
> +			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART0>;

Please update the clocks for all nodes to use the clock driver, not just uart or
uart0.

Thanks,
Matthias

>  			clock-names = "baud", "bus";
>  			status = "disabled";
>  		};
> 
