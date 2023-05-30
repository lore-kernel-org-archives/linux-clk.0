Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4271C77B73
	for <linux-clk@archiver.kernel.org>; Tue, 30 May 2023 08:17:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjE3IRd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 May 2023 04:17:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjE3IRd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 May 2023 04:17:33 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F9DAB2
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 01:17:30 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-96f5d651170so1035696966b.1
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 01:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685434648; x=1688026648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Dej/FFOhlE209KZmIstjtLDQxOMnp2DLbpIJPYah0A=;
        b=rEufenXkmE+fxdBlKUC1YtyC9X07+Ci2rPmXRsV3WUV9jRjRbQuIrPDnNZvxSM2mxf
         X3RNTWjoWWpRxl8BL/JW5dYXMmPsneBLDl1Dmc6BP2bPa1lDf2bE33qwb4Prv3FsTbML
         /71z6JhU30309RGtVFkstiUwREa1kJ5ofNQ6vN5Dlh/dhVBM23xvaiD/ufCjCYPAjBF3
         XI4+MVi9AXdyxrFKwYuvqgdQ96YEo1lXf5Xs7b+rTjAiHGiy8iOscayzY2bWxOH5iwrW
         pLzGv8SgZ58jXBhoR0tSMtOHn3g+APVxq/t6A9dCV+PFv/YPhbCNsejnl+LzPM1udCKI
         1dZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685434648; x=1688026648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Dej/FFOhlE209KZmIstjtLDQxOMnp2DLbpIJPYah0A=;
        b=CXDmEKPB6fHSo34dZ//lzTgu7boQqR+F2+/e/sh5VJOLbpzMSaYkfZnCH3nvLMWBqH
         nJTpJO6jpSL/q6ULAmjacGzda1xFriD9fXy2rdt71TuYMlsEliTZoSqEmA1S7SS+b5nI
         +bEyIyi99cBtXFO1Gn4XlXP6OocmoHA9viWEIeRvIoEW+Tn+nnqOEcpqa2W41hyjnnSg
         NEKhhdNGGmcOBTqxQcvkx2K2lZ/2wyq864APFBr3dX9K30wuvDndspC73DpGKMdwUbqx
         1DQyJUu33a07D3/rZzr8wJ5Lso8xh/t/ZXjhQcmhiOS4xReRiNcd7Uj64QL9lS5J4uMW
         xQgQ==
X-Gm-Message-State: AC+VfDycDIzMkTXuBlic2Tq7f6HSiwB+RNID7J011qF91YVxc8R6aGUI
        FUJM7gwPd/jVgPNqL5uK+HkA37Q4fQRH35iUGsY=
X-Google-Smtp-Source: ACHHUZ4yZU/IUfHWVCAaHSvVKWusYU73uAxcR1RUnuf/v1Ip6xt3HYUd1Y/9cpLkPOB1X4DLiH0K1A==
X-Received: by 2002:a17:907:784:b0:96f:a412:8b03 with SMTP id xd4-20020a170907078400b0096fa4128b03mr1486035ejb.5.1685434648674;
        Tue, 30 May 2023 01:17:28 -0700 (PDT)
Received: from blmsp ([2001:4090:a245:802c:bc2b:8db8:9210:41eb])
        by smtp.gmail.com with ESMTPSA id f7-20020a170906494700b0095807ab4b57sm7116229ejt.178.2023.05.30.01.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 01:17:28 -0700 (PDT)
Date:   Tue, 30 May 2023 10:17:27 +0200
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Alexandre Mergnat <amergnat@baylibre.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] clk: mediatek: mt8365: Fix index issue
Message-ID: <20230530081727.br3fm6zombgipjer@blmsp>
References: <20230517-fix-clk-index-v3-1-be4df46065c4@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230517-fix-clk-index-v3-1-be4df46065c4@baylibre.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, May 26, 2023 at 03:10:43PM +0200, Alexandre Mergnat wrote:
> Before the patch [1], the clock probe was done directly in the
> clk-mt8365 driver. In this probe function, the array which stores the
> data clocks is sized using the higher defined numbers (*_NR_CLOCK) in
> the clock lists [2]. Currently, with the patch [1], the specific
> clk-mt8365 probe function is replaced by the mtk generic one [3], which
> size the clock data array by adding all the clock descriptor array size
> provided by the clk-mt8365 driver.
> 
> Actually, all clock indexes come from the header file [2], that mean, if
> there are more clock (then more index) in the header file [2] than the
> number of clock declared in the clock descriptor arrays (which is the
> case currently), the clock data array will be undersized and then the
> generic probe function will overflow when it will try to write in
> "clk_data[CLK_INDEX]". Actually, instead of crashing at boot, the probe
> function returns an error in the log which looks like:
> "of_clk_hw_onecell_get: invalid index 135", then this clock isn't
> enabled.
> 
> Solve this issue by adding in the driver the missing clocks declared in
> the header clock file [2].
> 
> [1]: Commit ffe91cb28f6a ("clk: mediatek: mt8365: Convert to
>      mtk_clk_simple_{probe,remove}()")
> [2]: include/dt-bindings/clock/mediatek,mt8365-clk.h
> [3]: drivers/clk/mediatek/clk-mtk.c
> 
> Fixes: ffe91cb28f6a ("clk: mediatek: mt8365: Convert to mtk_clk_simple_{probe,remove}()")
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>
Tested-by: Markus Schneider-Pargmann <msp@baylibre.com>

Best,
Markus
