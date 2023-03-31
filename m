Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C2EAC76196
	for <linux-clk@archiver.kernel.org>; Fri, 31 Mar 2023 12:44:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231741AbjCaMoh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 31 Mar 2023 08:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231613AbjCaMof (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 31 Mar 2023 08:44:35 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 584A220607
        for <linux-clk@vger.kernel.org>; Fri, 31 Mar 2023 05:44:11 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id r29so22219037wra.13
        for <linux-clk@vger.kernel.org>; Fri, 31 Mar 2023 05:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680266645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U1Lfh9KietRk/SXmq2S1nzMw4qRuEmtosaggZBr7IbQ=;
        b=ArsnnvqYlwJA36eSfco0/UVrsiLjFOa78ZhyH3MvsXhJNcQOs6mpmMJT4zIhMaihFU
         1H30+CTYfJW8Vh5u0OTvEh+21kzpzoF2CjLRbiR0otPBbrve34+P6Fv9lC84BpjmWEFq
         x83e2L5ufu+2wQzBpvllCtUlqQ/C2MVz+xbzie/6tV96OkpGvDBdS2/sNrVIw1unOKYt
         4HX8R9W34b5oHsHvIB6wbnqdCVbHFswLMX3eGbTRd3X471dB6F+yUKUfli0gdSKoeMCy
         6kRk3DIRug3Fq1iqs/NQNTEYLoQ2lJUi3r+i2toHLCOLJnIqQSxt5ft/Zb52MKe7cc+q
         Dkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680266645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1Lfh9KietRk/SXmq2S1nzMw4qRuEmtosaggZBr7IbQ=;
        b=W4UVAjCPDELSeP38IdoT1HDCE3w9diHIxpH+BksLUT5vCMrGo4GdiUc7LtZtqk9vWW
         +5YDKQPotVVqZ9x0EphdRY+gF25PPCqw380H6nM8EmbQaqLjs8XwcX77Lm2nqt8KQqpq
         W+iNulSHOl0PN3qdTbb2E3teFfM0Fv+gJ1Qja8NP9vJzDLxuuvaencQYlsozQ/kENgAs
         WqJlGCxW6GalMeyFAeu9ZTAZITxNtSr87Ld9i4rbkNIjT/gDJ1ERWZcZjy6dsi3xBwrn
         lVG3eA+A6+Ru1HuKh66NR1y67LI5dmDa2WaZRcE5oEHmbvIt5O+6hrqEdsLyIr/TNVbH
         3e+w==
X-Gm-Message-State: AAQBX9eSTgZsmnNb1y/ReICzcp+QvdfeS/xWZLKlYvY9IsziKhhKewbp
        duRx1jOYxSYUEy98ApdEpY0OuQ==
X-Google-Smtp-Source: AKy350Zgt+E2U4cmPtWUflobeN/+f2uimL/ABursN18vXWggXQLr+CvySB2bTeAJUcWkd1kF6H6C0w==
X-Received: by 2002:a5d:490d:0:b0:2cc:4e58:f6d0 with SMTP id x13-20020a5d490d000000b002cc4e58f6d0mr18389913wrq.54.1680266645514;
        Fri, 31 Mar 2023 05:44:05 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id l12-20020a5d560c000000b002cfe685bfd6sm2086617wrv.108.2023.03.31.05.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 05:44:04 -0700 (PDT)
Date:   Fri, 31 Mar 2023 15:44:03 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: imx: clk-gpr-mux: Provide clock name in error
 message
Message-ID: <ZCbVk1hFMVVTq1h/@linaro.org>
References: <20230308184603.10049-1-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308184603.10049-1-stefan.wahren@i2se.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-03-08 19:46:03, Stefan Wahren wrote:
> In error case the error message doesn't provide much context:
> 
> imx:clk-gpr-mux: failed to get parent (-EINVAL)
> 
> So additionally provide the clock name in the message, in
> order to simplify the further analyze.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>


Applied, thanks!

[1/1] clk: imx: clk-gpr-mux: Provide clock name in error message
      commit: f47a669ffa11c6c14b463d762562fe9681345c6e

Best regards,
--
Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-gpr-mux.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-gpr-mux.c b/drivers/clk/imx/clk-gpr-mux.c
> index c8d6090f15d6..0b5a97698b47 100644
> --- a/drivers/clk/imx/clk-gpr-mux.c
> +++ b/drivers/clk/imx/clk-gpr-mux.c
> @@ -48,7 +48,8 @@ static u8 imx_clk_gpr_mux_get_parent(struct clk_hw *hw)
>  	return ret;
>  
>  get_parent_err:
> -	pr_err("failed to get parent (%pe)\n", ERR_PTR(ret));
> +	pr_err("%s: failed to get parent (%pe)\n",
> +	       clk_hw_get_name(hw), ERR_PTR(ret));
>  
>  	/* return some realistic non negative value. Potentially we could
>  	 * give index to some dummy error parent.
> -- 
> 2.34.1
> 
