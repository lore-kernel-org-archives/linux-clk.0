Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5A1C83F01
	for <linux-clk@archiver.kernel.org>; Thu, 31 Aug 2023 12:15:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242511AbjHaMPI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 31 Aug 2023 08:15:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241719AbjHaMPI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Aug 2023 08:15:08 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6405E71
        for <linux-clk@vger.kernel.org>; Thu, 31 Aug 2023 05:14:43 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31c479ede21so572703f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 31 Aug 2023 05:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693484082; x=1694088882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7H15GGgOOLbON3/iWgJJVm7fJYdeKXuSJEp4p1EF47M=;
        b=IV2elOH1gpSqdJ7ffTxrjO4nO8FMnXInBgjyeGZV5V7RzGwnUh0s5aCLjzh/i9sLGB
         UfuAIKHuAY/ZKs/W9CfWTqUEbn56YB7YolW8WJvHVte+dRfdzZBXqRZ+lYyUtUlBwRyW
         NZHDW+LFn7KzzWuMyxJfN1l6yLLzvhDKKfRLqgKpqInQaqi2FVK0Vp8K28v9ZUuxlwi/
         ptpPS0xJzXZOr81YR4qMkN53rYuCn8tcN1ygNkrctTOtCVRnrwgckxUSMKScTdCq9M5p
         FBlvU1xk+/0jub+YLBSAPTtw4/CeopFgzKOcW8nMZHzU39hbhLqoqGvdZisOYDs1R8oS
         6Mkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693484082; x=1694088882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7H15GGgOOLbON3/iWgJJVm7fJYdeKXuSJEp4p1EF47M=;
        b=Qa0vdPsI7bbsBXXfAf/t9SkmS4s3UBZI/VkGvieoRLNV/0qS+S7V52H5vi+U7gXK0G
         LGIEJ2uDmBnHhMovOdbbWqxzPOlJcjabu7AR55oMbJFiHzDDav5uQxu8wuDrDx13IuHg
         A9uz6SrXn4g6j0sqEveSFIxnrz2oSIdnVaos63H6Wzawt9KL7QmS361ziykPsWOtg9QQ
         oBHrBUuq8qelcTZ4IHDRo0QyPk/Ljqm5652Aky3Tr6OuBGUgHc6/VpDhyd5/P7XSTjL1
         HEB1u2tzv9kJT1s72bx2ifL1CwfxLgH8MxILVcI6iZ3OGJqABgmc9jm01muLZrHVU0ZU
         cr/w==
X-Gm-Message-State: AOJu0YyNis8JlD/Z6Q2xk7PEGaHEQUPn19Nq1NJ46YOV1w0Csnndt7P6
        w1VB1oHTvfovHcMAk9UvuKE55A==
X-Google-Smtp-Source: AGHT+IGzuc9t5U+jBBYlKTYO5mWRjFkAcO0WyHY3IcrVl5E26ucKZIcSsLqwziSynCwOmpKqJMQN+Q==
X-Received: by 2002:a5d:5450:0:b0:319:650f:60e2 with SMTP id w16-20020a5d5450000000b00319650f60e2mr3816436wrv.11.1693484082235;
        Thu, 31 Aug 2023 05:14:42 -0700 (PDT)
Received: from linaro.org ([84.232.191.193])
        by smtp.gmail.com with ESMTPSA id l4-20020a5d4804000000b0031c56218984sm2023427wrq.104.2023.08.31.05.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 05:14:41 -0700 (PDT)
Date:   Thu, 31 Aug 2023 15:14:40 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: gate: fix comment typo
Message-ID: <ZPCEMPqGw8+xsrst@linaro.org>
References: <7dfbd302399d8f0c1430151633bc734e64ee348b.1693478478.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7dfbd302399d8f0c1430151633bc734e64ee348b.1693478478.git.baruch@tkos.co.il>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-08-31 13:41:18, Baruch Siach wrote:
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---

Thanks for your patch.

But your commit needs a message, even if it is a trivial typo.

Maybe have a read thhrouh Documentation/process/submitting-patches.rst
first.


>  drivers/clk/clk-gate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
> index 64283807600b..f4f5b489a1f2 100644
> --- a/drivers/clk/clk-gate.c
> +++ b/drivers/clk/clk-gate.c
> @@ -15,7 +15,7 @@
>  #include <linux/string.h>
>  
>  /**
> - * DOC: basic gatable clock which can gate and ungate it's ouput
> + * DOC: basic gatable clock which can gate and ungate it's output
>   *
>   * Traits of this clock:
>   * prepare - clk_(un)prepare only ensures parent is (un)prepared
> -- 
> 2.40.1
> 
