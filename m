Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3DBC77B61
	for <linux-clk@archiver.kernel.org>; Sun,  9 Apr 2023 13:34:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjDINeu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 9 Apr 2023 09:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjDINet (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 9 Apr 2023 09:34:49 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C48DE30FA
        for <linux-clk@vger.kernel.org>; Sun,  9 Apr 2023 06:34:47 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id qb20so6522966ejc.6
        for <linux-clk@vger.kernel.org>; Sun, 09 Apr 2023 06:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681047286; x=1683639286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jzxzqpZbAjDJdbncApIxT8iAAAWuupx0hnMwQzqrpmE=;
        b=AI4mv/ZxGEBJ7d8tmjsSLh9ulGuHg/zrvn3wctYSoWCCDkJL+kEObIgQQEmdACi2wr
         3b/yPgEXV656X4iA4mOQekqSsCMkLgbLaftQpVgkEAu/60+a7J3z2FOPb//K5UwLVuDR
         FbF4YTl10qI/XNKNqourgpUjv8XZ1pRmH/nNK9KEWBl20sBSiuNgajn5V7AmOtzDFe35
         eZvGwX2qHpWfMikQx7fhOK1hyrc9Av4qrFPVoOiNodJPvEM3AVtTNt+G2wybyEoKJNsv
         9LPZplfbIKctepxcCoD0xoBSIt1sqSRHuUkrv40N8mfZ+0QBLZjyJ8RWS8fu9j1hrBvI
         TpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681047286; x=1683639286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzxzqpZbAjDJdbncApIxT8iAAAWuupx0hnMwQzqrpmE=;
        b=zN6RsJj0rheyq7iiizYc6VJc3vHAEQ+mOdaKOfIrDTKYl+8fJeoDc+hZyxnVvezVV4
         mYaMa0L5TG5cWZuiHz2mK3Fj/k+sH+fXGkM2Gq6mSqB0L/KEkRG2y+GcUvur3KZCb9Za
         ke48asSF+R7ZVAZP9Y6dOP3pSEfTPF6HOvdkG+kXFl+gMY0N064vweahUCgkW6A4Oz4i
         penW2+uNGH2PeIXdM04Aajcnh6MHR2QhsMAHzzMh37w7koRflhF4MkKmM8O9p/CkdnPM
         imDxRmV5hMH4g89ziaEm+ggG3yyHM3hkH71UOnqvucRxLzAkTeOqC6AVyeNX0+/qv3ov
         Ag/A==
X-Gm-Message-State: AAQBX9cUBKXXqVgcvUe0SG6G2s87OOO9is/OyRJzJBocNdbUNxRVN5Lz
        zYJZe7oROecEisJ709FxLPoi+Q==
X-Google-Smtp-Source: AKy350ZwDQ745/TT9pPEPK8LGlYJXMbk7SZ9DMZP00fxS3KOHZ6DlJLwxkcN9zi9PHWXICkhswNCBg==
X-Received: by 2002:a17:906:24d7:b0:941:1cf6:dbea with SMTP id f23-20020a17090624d700b009411cf6dbeamr6405243ejb.55.1681047286260;
        Sun, 09 Apr 2023 06:34:46 -0700 (PDT)
Received: from linaro.org ([188.25.26.161])
        by smtp.gmail.com with ESMTPSA id k6-20020a50cb86000000b00501d73cfc86sm3811756edi.9.2023.04.09.06.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Apr 2023 06:34:45 -0700 (PDT)
Date:   Sun, 9 Apr 2023 16:34:44 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V3 2/4] dt-bindings: clock: imx8mp: Add LDB clock entry
Message-ID: <ZDK+9LNc8m/F/GuY@linaro.org>
References: <20230403094633.3366446-1-peng.fan@oss.nxp.com>
 <20230403094633.3366446-2-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403094633.3366446-2-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-04-03 17:46:31, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add LDB clock entry for i.MX8MP
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> 
> V3:
>  update subject prefixes
> 
>  include/dt-bindings/clock/imx8mp-clock.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
> index ede1f65a3147..3f28ce685f41 100644
> --- a/include/dt-bindings/clock/imx8mp-clock.h
> +++ b/include/dt-bindings/clock/imx8mp-clock.h
> @@ -334,8 +334,8 @@
>  #define IMX8MP_CLK_SAI6_ROOT			326
>  #define IMX8MP_CLK_SAI7_ROOT			327
>  #define IMX8MP_CLK_PDM_ROOT			328
> -
> -#define IMX8MP_CLK_END				329
> +#define IMX8MP_CLK_MEDIA_LDB_ROOT		329
> +#define IMX8MP_CLK_END				330
>  
>  #define IMX8MP_CLK_AUDIOMIX_SAI1_IPG		0
>  #define IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1		1
> -- 
> 2.37.1
> 
