Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288CCC83F14
	for <linux-clk@archiver.kernel.org>; Wed, 30 Aug 2023 20:19:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239215AbjH3UTG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Aug 2023 16:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239274AbjH3UTE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Aug 2023 16:19:04 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C4D30F5
        for <linux-clk@vger.kernel.org>; Wed, 30 Aug 2023 13:18:40 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d7ab8e1f27cso4690607276.3
        for <linux-clk@vger.kernel.org>; Wed, 30 Aug 2023 13:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693426611; x=1694031411; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XQLDwU/5nlJVkLKtn9y3pCNSu2CdyaBTamOi0p9fafo=;
        b=mgFm/UcEfXm5XlIf884UeLhKsItj/NvGLJcZ8m+VCu5I5SzrbUmwsKSUBKh8SfWUxz
         +KrC8dJpSItGaYUru9g8Rj22QotP0P1HNnouJLbGr/PI55nX0HKAYCjCuGk0i/jx/DqR
         jjgbkj91ja4jo+Xf2hD1OQGuuE8F0s2M7eGdWiIVD77VYA8kp6B2EZEY0DVTuk1ulVQ/
         p94r6pT/eENWFn0i6kh5xPHz3zJzkeZk1l70ENPc0l80c9+zbfvEDyYcnyzjoFulwXAq
         gevkLyXEJzyH7CUT6UzyxTgOZ6b5keCTFc80G+RJiyDHrSKMIBGhF++//oWYbd6K+Xkg
         apcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693426611; x=1694031411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQLDwU/5nlJVkLKtn9y3pCNSu2CdyaBTamOi0p9fafo=;
        b=IMtCHT3+H7R2/ITCtqp/C6wTGXcBh3aQeKz331U1lOhRLhjmHAlJpNQxBgfc57QdyU
         8f8Fm8T62edTNajIs/a+NLz/ykUwOEVZYfzRmeaaLw84rhI79QdOFIMWITfGw6Q1/9vf
         H+yU6uC1/boBRo75s1aaIxKgr1qedtIJlIl2WQ1q1pq/WLXt8CRKgDfNvP/8+5k7wKZD
         mX3YTECY2o5ZW7tYGXuyDHKzH/LSGi09pdlibTQmayavjIHWpkdlpKh6t467AhkfXQD/
         J51+kKXFjmkjtxyddcKzXL58t2qxZ/8GW1XiQeZMZX6sjx7Mkm9G4rIcc73s78pxafzj
         GePA==
X-Gm-Message-State: AOJu0YzP717aw0PcdVBraGZ9h2Kte+6OiVK+IwpZpxg2u4S2vNEqdab6
        nxYqrFV541/8Dbt5XSfHR1ZvaAoNKUSmbfJaxhCUBRqWruawJnHd
X-Google-Smtp-Source: AGHT+IFv7Iqz9PDMTBwkRWX43WVdyu1g8mi2iBNzTPeSuQLXbC3nxFiStH1X7rnhu4oe4LvGcutHKuy/2++Z3ItRKFI=
X-Received: by 2002:a25:d3ca:0:b0:d77:f99e:7b1e with SMTP id
 e193-20020a25d3ca000000b00d77f99e7b1emr3338959ybf.48.1693426610755; Wed, 30
 Aug 2023 13:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230816080113.1222352-1-yangyingliang@huawei.com>
In-Reply-To: <20230816080113.1222352-1-yangyingliang@huawei.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 30 Aug 2023 23:16:39 +0300
Message-ID: <CAA8EJpob4WsM6OyAYY5VKJ-TGixPmrHs38F+CT0xLNxq-ci07Q@mail.gmail.com>
Subject: Re: [PATCH -next] clk: qcom: gcc-ipq5018: change some variable static
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        konrad.dybcio@linaro.org, andersson@kernel.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_gokulsri@quicinc.com, quic_srichara@quicinc.com,
        quic_varada@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 16 Aug 2023 at 11:05, Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> lpass_axim_clk_src and lpass_sway_clk_src are only
> used in gcc-ipq5018.c now, change them to static.
>
> Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/clk/qcom/gcc-ipq5018.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
> index 313ff2281ca7..19dc2b71cacf 100644
> --- a/drivers/clk/qcom/gcc-ipq5018.c
> +++ b/drivers/clk/qcom/gcc-ipq5018.c
> @@ -826,7 +826,7 @@ static const struct freq_tbl ftbl_lpass_axim_clk_src[] = {
>         { }
>  };
>
> -struct clk_rcg2 lpass_axim_clk_src = {
> +static struct clk_rcg2 lpass_axim_clk_src = {
>         .cmd_rcgr = 0x2e028,
>         .freq_tbl = ftbl_lpass_axim_clk_src,
>         .hid_width = 5,
> @@ -844,7 +844,7 @@ static const struct freq_tbl ftbl_lpass_sway_clk_src[] = {
>         { }
>  };
>
> -struct clk_rcg2 lpass_sway_clk_src = {
> +static struct clk_rcg2 lpass_sway_clk_src = {
>         .cmd_rcgr = 0x2e040,
>         .freq_tbl = ftbl_lpass_sway_clk_src,
>         .hid_width = 5,
> --
> 2.25.1
>


-- 
With best wishes
Dmitry
