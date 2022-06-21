Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755B1CCA481
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jun 2022 17:17:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353122AbiFURRB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Jun 2022 13:17:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353149AbiFURQ6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Jun 2022 13:16:58 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 540882CDEC
        for <linux-clk@vger.kernel.org>; Tue, 21 Jun 2022 10:16:56 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id p31so21325771qvp.5
        for <linux-clk@vger.kernel.org>; Tue, 21 Jun 2022 10:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E5ccaIvRIXteqVNt2w/oxW2Vfyr34lOQhBiY70Y2LiY=;
        b=ukzNEN/xGYg9ZwWaTaxi/CYWjN1UXK+IY2/TKjL+wloNxlUdoJRzLvkMCVkfEwO4aN
         1bWcy9Y90TS3+x/R6MmfLOOFVTaFDVhWAjHcJ8ev3cFJJ095ei0I5lZHgebIJo2zR0WR
         j35TfRnQ6d4deWqqSgVHNkHo9a1iOswMR5v0Xji6rJ1ZtgSguQnGO2XALyfIBdDGTIdQ
         55D7s7HuF8FzXaL/0pRZG07Nt4ubghd70zGZRxL088Gwh6un2jjdGz83AWbiW2bUgBi1
         LCXonnOQhnGePzt3elAb7pz/8JJ52pnBNhSlsGnM2PmyTeEQAeN+yoC0f/Osyj2Lp49l
         Yirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E5ccaIvRIXteqVNt2w/oxW2Vfyr34lOQhBiY70Y2LiY=;
        b=idC4k8l/lQ5zUiOtuFX0gUqYABNYVEUzrkARS3GeZ6Dzd7aTNl2f94Desa4/pi9AkH
         7avWofrstuTWdmy1KAW0ycIXtvdxRmsthxl8BVO/596RouiCR/BlfnP/XL/0aFPQhFl5
         FG2ABonL/FOMxT8EKLJnLqiAd2udvalI4D7PooRTlwYxtvB1Fkc8/xpEuMR1Tgu2KNCs
         64v273N3igwcu6KstlMDtx63gfFSKZDqukF4z7d1LR7rZKyDYo63/65AGP13EcpmWoyU
         0WYmNgBCo+FXtZ3eBhwoDZJjW5zym2VSyHv2tCxMXEG3cLA15dSIWY3kvNWkqWFiHtrG
         42yw==
X-Gm-Message-State: AJIora/strkukPUh8xTynz4riJi9WZIMJ33rQVxfaVHAeRMs1uMlQnoK
        Nbnp7a8qVzEZpCe+kWOiQCQSdWPyYyliTnrE2R0wcQ==
X-Google-Smtp-Source: AGRyM1szZM/xn2oBTLu0KT0Kma3pFng6DiJJW2zHeQ49W5OAaSbei+2IZa+4TPCPwzTRPns55/vkxr0LiQy3eLxlUaE=
X-Received: by 2002:a05:622a:487:b0:304:fbfc:9933 with SMTP id
 p7-20020a05622a048700b00304fbfc9933mr25369800qtx.682.1655831815253; Tue, 21
 Jun 2022 10:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220621163326.16858-1-ansuelsmth@gmail.com> <20220621163326.16858-2-ansuelsmth@gmail.com>
In-Reply-To: <20220621163326.16858-2-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 21 Jun 2022 20:16:44 +0300
Message-ID: <CAA8EJpo2cfWz6ph1BQLjkQ5HEvG3HWqmxN273dpDxg-aoHXzVw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] clk: qcom: lcc-ipq806x: add reset definition
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 21 Jun 2022 at 19:33, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> Add reset definition for lcc-ipq806x.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> v2:
> - Fix Sob tag
>
>  drivers/clk/qcom/lcc-ipq806x.c | 7 +++++++
>  1 file changed, 7 insertions(+)

-- 
With best wishes
Dmitry
