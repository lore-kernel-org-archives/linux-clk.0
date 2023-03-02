Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9465AC678D4
	for <linux-clk@archiver.kernel.org>; Thu,  2 Mar 2023 13:01:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbjCBNBI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Mar 2023 08:01:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjCBNBI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Mar 2023 08:01:08 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8756D30E96
        for <linux-clk@vger.kernel.org>; Thu,  2 Mar 2023 05:01:06 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id f13so67239918edz.6
        for <linux-clk@vger.kernel.org>; Thu, 02 Mar 2023 05:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677762065;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K4QoTz9DpqbVp4zpknnogFeZwdcBodoo4uaWIYStOvU=;
        b=zRVfWRkaE2ak9ymlzElvkLVV6qmTXCu2Tz0DHQ4hGQR4a9a7ZhTADSiPEbGnKUC+Jg
         3vxuF3ANtg1pFVdEnFQMKlhCYoUqa2c8//qbdWPFiIVZvvcIuUJGHUHUt0IB5HDxxOWj
         SrKseRHxbqjAcwa/L6WHM1Q4AUD3TjFvEb49VAfuOQRl6S5pGiXHZ78bSigMUaVJdzHP
         Fuyao9LUx5iR7QynBrETRpFCZShSSA/ZerFiBz7WK3UpYB+QAsa9f7zXQZE16OA4QjWM
         dE+dEsGaeDIJsK0nusJu75VuGD6uUHWcTKaPXirEylT+bNWlk71xjm9ECNamS4qfKfo2
         LHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677762065;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K4QoTz9DpqbVp4zpknnogFeZwdcBodoo4uaWIYStOvU=;
        b=pvsEF9HlJmuJ6T1oikOYlO4mzsv+5GsgL9Tp1g7dxrEBINj+v0QbLdEBQZhKkaZWqR
         4YNWyo9f55iNWeKSbkp/A4/bFdKNFuMaKtxZt0lgNPzLOVsoRiMXV/xPeTSfADUCsbq4
         nmp7Pob1t5ZA8QweABJguyvoR0y8jBgjG5TfTmOPpgm6Dt3EYKEo0w43jlMJPRI+ZTDl
         tO66t7RGQx4LKVXfDGX5QBmmIhwocG9j0ibhaWnpUjd1YbWeZ7yinaEALn48kte36WTQ
         7fXyMXn8e+bkwzMx+aoTrkV7rSfbeVzSwp+uf1wcZei31mTwaUdZpfxE/O6efu+M6y3K
         k5hQ==
X-Gm-Message-State: AO0yUKW+NSX/8glCPIYzLeFxgqU/3qOuFsCVpJn92u7cMbKq0OCZg25c
        4uc+e0i8bM5GYl6aDEwM4yFdpA==
X-Google-Smtp-Source: AK7set+bBsxxlAKccFXuciR/5NfM47WWOIGPgy35GwJikRDbmNJG1mM0VdoLoyCGIe79fOy/SKWuVw==
X-Received: by 2002:a50:ee18:0:b0:4c3:6d95:7337 with SMTP id g24-20020a50ee18000000b004c36d957337mr190782eds.25.1677762065002;
        Thu, 02 Mar 2023 05:01:05 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u27-20020a50d51b000000b004af5001c7ecsm6800116edi.12.2023.03.02.05.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 05:01:04 -0800 (PST)
Message-ID: <3bc36b09-d23a-2fd8-0ca7-5ebb9267a414@linaro.org>
Date:   Thu, 2 Mar 2023 14:01:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 3/5] dt-bindings: clock: imx8mp: Add audiomix block
 control
Content-Language: en-US
To:     Richard Leitner <richard.leitner@linux.dev>,
        Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Abel Vesa <abelvesa@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230301163257.49005-1-marex@denx.de>
 <20230301163257.49005-3-marex@denx.de> <ZACNrbVDU/4ucU51@g0hl1n.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZACNrbVDU/4ucU51@g0hl1n.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02/03/2023 12:51, Richard Leitner wrote:
> On Wed, Mar 01, 2023 at 05:32:55PM +0100, Marek Vasut wrote:
>> Unlike the other block control IPs in i.MX8M, the audiomix is mostly a
>> series of clock gates and muxes. Add DT bindings for this IP.
>>
>> Reviewed-by: Fabio Estevam <festevam@gmail.com>
>> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
>> Reviewed-by: Peng Fan <peng.fan@nxp.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
>> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> Hi Marek,
> I've successfully tested this patch on a custom i.MX8MP board. Therefore
> please feel free to add:

How can you test a binding patch on a board?

Best regards,
Krzysztof

