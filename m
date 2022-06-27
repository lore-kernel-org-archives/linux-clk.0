Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97EE2C43334
	for <linux-clk@archiver.kernel.org>; Mon, 27 Jun 2022 20:15:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241132AbiF0UPX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Jun 2022 16:15:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236356AbiF0UPX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Jun 2022 16:15:23 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B2491D30B
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 13:15:22 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-101e1a33fe3so14317154fac.11
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 13:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3blwfZZTMRBH390nLectWFhgIDm492Spnq2Xbbt6JLs=;
        b=WwMLVEADRqo0P379S218zDtekCtrer/BHLyL1Q2GaVLMcC5xK9GWWt7DxKFdvVZVnZ
         FejS5WV95S3MzGXd57qtDbBRWVd/tn+PYMXOlPxV48dS0NOa4SjR1EffahaZGmf1Jhcr
         eziLCY/lyiwqwkZYBgZkxclzxmmrH9tRF7uyCDs4xsFD+1LMMGG7LFpoEI+RvldIqm3e
         09xfsDIVVV6s/cWINSeGZi9zUrbBZF08G2i2qTyvOOmst+4WJg9Sq6ePf8noRA5QB1AE
         2xVqZ7v6vPUmbVC73zoANim7if9CR/SVuolDXeVO+Kxd5SP7VZLyM0TRkIuVPhdt/ZhO
         H3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3blwfZZTMRBH390nLectWFhgIDm492Spnq2Xbbt6JLs=;
        b=HVyZKkFczrIJYwYB3TAZhMoJnt21DfmBYN0G5y6DSQ2V9gP606n7nCgI3ZKz+aSHGG
         DskWv6zButtc65hEoM9BcMze0ZxjtnfanJWmWWtVQzoTqg6WhKfzJw3epdiWQMYtKR8s
         jlhz1HfbcPGEuull9SLPCQYw5S4wMiwdhKJoORxKrtlyIrTx+RE2hWF3/3XAPjp4ILid
         fOw6tFWRGhVrdAB6iSjkhM3T7K16guhystIW+kou1vtDItldp3D9bn4Oj/1BoXI1ILDW
         cQ5UxMhQak92LIFNW0NqhRQ8g4NfpcT/A7dXJkwO1++reRrKgn+UZkB6J5L9eX3CUpzU
         hkoQ==
X-Gm-Message-State: AJIora8mcsVtchTd8W9SqW40vG5UjHkf4Yp8SbzestCm8ud4VJU4Zoog
        M4a+Ga6pKzxLKodrH7y9tW0StQ==
X-Google-Smtp-Source: AGRyM1s6/0wpqNUDQhjiqZ+M7gqbWaoTWXguFmAH0NmwWfEtd/aNBLP+yimen/s314Wj9uF8MuPn7g==
X-Received: by 2002:a05:6870:430c:b0:101:f886:3760 with SMTP id w12-20020a056870430c00b00101f8863760mr8002029oah.88.1656360921523;
        Mon, 27 Jun 2022 13:15:21 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a18-20020a9d3e12000000b006168dbb001fsm6731199otd.7.2022.06.27.13.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:15:20 -0700 (PDT)
Date:   Mon, 27 Jun 2022 15:15:18 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Li kunyu <kunyu@nfschina.com>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: the return value statement of the
 gcc_sm6350_probe function has an extra semicolon
Message-ID: <YroP1pW3dzoV9F4D@builder.lan>
References: <20220627020500.135125-1-kunyu@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627020500.135125-1-kunyu@nfschina.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun 26 Jun 21:05 CDT 2022, Li kunyu wrote:

> I think this semicolon could be deleted.
> 

Thank you for the patch Li.

Please look at the git log for suggestions about the prefix for your
commit subject (clk: qcom: gcc-sm6350: in this case).

I've updated the commit message and picked up the patch.

Regards,
Bjorn

> Signed-off-by: Li kunyu <kunyu@nfschina.com>
> ---
>  drivers/clk/qcom/gcc-sm6350.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
> index a4f7fba70393..69412400efa4 100644
> --- a/drivers/clk/qcom/gcc-sm6350.c
> +++ b/drivers/clk/qcom/gcc-sm6350.c
> @@ -2558,7 +2558,7 @@ static int gcc_sm6350_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	return qcom_cc_really_probe(pdev, &gcc_sm6350_desc, regmap);;
> +	return qcom_cc_really_probe(pdev, &gcc_sm6350_desc, regmap);
>  }
>  
>  static struct platform_driver gcc_sm6350_driver = {
> -- 
> 2.18.2
> 
