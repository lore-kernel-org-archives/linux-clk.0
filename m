Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EC9EB64D8
	for <linux-clk@archiver.kernel.org>; Wed, 14 Jun 2023 14:06:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245166AbjFNOGx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Jun 2023 10:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235420AbjFNOGw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Jun 2023 10:06:52 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70750CD
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 07:06:51 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-30fba11b1ceso3995239f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 07:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686751610; x=1689343610;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=eATVzpknI9vc12mAnk+3E8tRwnRlRtGyRp8XCmtZkaM=;
        b=jV+FuvFr57hMTM6OFjSFLXVbjzQAfmXySdUUckZXro/5AOsBR6XEcc8i2kSttpnEJT
         x53AGbhlgp+es3Jfipn2qsyzL1hkJX6wFEsYVQtObJ4/5i6SqhbWUL+8UA6tNlKRrumv
         zl7xgnXzMIONm1mNdNnsK/yZSIB20bONCQPJB6/VANLqqPrjSkqQ9Zmql/b7X3U3w+2q
         hOZ5XxQhFtTwmwLdIJKnhSIKFK4KC/Idu3x8tK3CzSvPSaHAwaLGaLib2AlStBCWWaSF
         RBEzxVISbq5FUFDjwx7VJiZ+iL5mD9HckqTm+ErLOAEEfLZQPh3msSLthRwcBFOAa54R
         FDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686751610; x=1689343610;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eATVzpknI9vc12mAnk+3E8tRwnRlRtGyRp8XCmtZkaM=;
        b=KrwStw2g0Kx1GIP0Pvu3TSCuO3TSPHoKhsk6q3C4G8nWgN206Xx1lx6lwgsM21Q44K
         ZAmZGn5jk0kbYv+eEoe4krn8jPnhcuVlWTRDbNcQmAB3g9m29CXrjUnBmdqIs4bhTUfL
         JIGJvIHxEzqdsXIaFdf30Zg+VXxe/tEta+6VMV2O1KH4NJEzbbVCMQ3iHYBZ6PJyuv4M
         E6Lbv80LbIRr/mAPzBb8XThC6FxX8DxmucYuQVPn7mRRGYCR7B1ZCrWumF4nxmRCBR2N
         Eel6TMq89z7lEvLFBaSQ2446v1g5VQMoYz+asbh8BIoyljSem0VEDzdeKbYL8xiFoZLl
         2dxg==
X-Gm-Message-State: AC+VfDyKY+i9AYRVCVIzLIO01lbfOaZp34MGXidMtzW2QF70kTAVvMd2
        l2eihddKgrTAchRWsCdzyXVoLg==
X-Google-Smtp-Source: ACHHUZ6a4exHUhNfyj26R+XQpCs0IWFQfsm1S2MG5jN8npheMWegY7/+qYhEIR4M6d2x6nbpM3+wkw==
X-Received: by 2002:a05:6000:1814:b0:310:b979:d00f with SMTP id m20-20020a056000181400b00310b979d00fmr2362939wrh.45.1686751609916;
        Wed, 14 Jun 2023 07:06:49 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o17-20020adfe811000000b0030fafcbbd33sm12673191wrm.50.2023.06.14.07.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 07:06:49 -0700 (PDT)
References: <20230614084808.98819-1-jiapeng.chong@linux.alibaba.com>
User-agent: mu4e 1.8.13; emacs 28.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        neil.armstrong@linaro.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH] clk: meson: pll: remove unneeded semicolon
Date:   Wed, 14 Jun 2023 16:05:30 +0200
In-reply-to: <20230614084808.98819-1-jiapeng.chong@linux.alibaba.com>
Message-ID: <1jr0qef893.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Wed 14 Jun 2023 at 16:48, Jiapeng Chong <jiapeng.chong@linux.alibaba.com> wrote:

> No functional modification involved.
>
> ./drivers/clk/meson/clk-pll.c:373:2-3: Unneeded semicolon.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5533

Not sure this tag is relevant

> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Apart from this

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  drivers/clk/meson/clk-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 56ec2210f1ad..8fef90bf962f 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -370,7 +370,7 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  		usleep_range(10, 20);
>  		meson_parm_write(clk->map, &pll->current_en, 1);
>  		usleep_range(40, 50);
> -	};
> +	}
>  
>  	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
>  		meson_parm_write(clk->map, &pll->l_detect, 1);

