Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48DFC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jun 2022 14:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232912AbiF2O7g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Jun 2022 10:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbiF2O7f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Jun 2022 10:59:35 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C99C18B26
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 07:59:34 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id sb34so33077942ejc.11
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 07:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TsyG4q/xF+q4jrUA2VTKKCJE7zAVddwGIb9EBb8KNxw=;
        b=SYRgzqNQfoKncnUD3dWD1qMgms4bsuZ/5NN0MsNS6AGn0mU0OknapuhDsq6Mq+rYRH
         6WQn8HKu1xZM3ZaR3WUXALau7JBXqcKWEECExvUDBjOOeWC9slJkssCMLH4pd01cUzqw
         xXdBKho7RzvleJlpQvH+78mXybQzoGd//YYcJT8WaPDzMQl+UC3ii1HNLOqNcJHOiq/9
         dOp53GZtW6270f4o4FsXdFbBOjgGnNezsTaYNaAmjUEFIVQXOtl8WySKI9morMytvbOm
         D5tZ3fnOzTqln83Wud59vIEEoUp7JjYjeIaJ22q0RlnBy+S3Jl/byqZ343ZLu/uMl7MF
         I+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TsyG4q/xF+q4jrUA2VTKKCJE7zAVddwGIb9EBb8KNxw=;
        b=vtBgvLvEu5KoD50iR+DPXFwPlSBTnSZByUIcQJn+tyjGpsF7VKvpHZyNkfZPq8P3fI
         05h1E/DuH7pppMQMpHxZ6TOFptb+9h2bv1eD2D1nEZNqsKoM8R3DFQ/zKjN7BsxlcSbM
         WCmfc/Bg8WXg5o6ym3tMILtrPcDx18upLB/8rBojV0lfT2V9G3nCvUeW4j2PFhu1L+wx
         Ds0Dp+eWbfqRk2InzDv24jGW6NGLjsxOAfGzfNb8aAOxM+Tim1b4C2hINwrWM8VnsMNz
         9TZ6efhQIS3gvWDKbuNTjDVHwvsjjpAccygmBLyGPynLpGlalOW19myo6vM7YqowGDDf
         W6+A==
X-Gm-Message-State: AJIora+XHWKmI3xvrx2EqX0Zh1juF+l2tmRWRKQdVP1aA99vmABzpdFD
        PwbUI+Q5qdZt/CP7iLx5DUTXwMcqihiwXwpIcae5SBbF22A=
X-Google-Smtp-Source: AGRyM1sVQxNfUe8lk7CTdDAdBuh1kYb6B7kaLrg51MwdW1PWgV3C0umHoVyIz//DYgaRToGiLYTe0MpQH+WyqoaSsZM=
X-Received: by 2002:a17:906:7a0e:b0:722:e8c5:ee96 with SMTP id
 d14-20020a1709067a0e00b00722e8c5ee96mr3754828ejo.147.1656514773127; Wed, 29
 Jun 2022 07:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220628141038.168383-1-windhl@126.com>
In-Reply-To: <20220628141038.168383-1-windhl@126.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Wed, 29 Jun 2022 16:59:22 +0200
Message-ID: <CAFBinCBPcrJZMXAtOjRZ6rJ0H2u7aa6=_kr2=Zb+TRroR6cdQg@mail.gmail.com>
Subject: Re: [PATCH v2] clk: meson: Hold reference returned by of_get_parent()
To:     Liang He <windhl@126.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
        mturquette@baylibre.com, sboyd@kernel.org, khilman@baylibre.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.co>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jun 28, 2022 at 4:12 PM Liang He <windhl@126.com> wrote:
>
> We should hold the reference returned by of_get_parent() and use it
> to call of_node_put() for refcount balance.
>
> Fixes: 88e2da81241e ("clk: meson: aoclk: refactor common code into dedicated file")
> Fixes: 6682bd4d443f ("clk: meson: factorise meson64 peripheral clock controller drivers")
> Fixes: bb6eddd1d28c ("clk: meson: meson8b: use the HHI syscon if available")
>
> Signed-off-by: Liang He <windhl@126.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  changelog:
>
>  v2: change the name of 'tp', change the title format, keep reverse christmas tree
>  v1: hold reference returned by of_get_parent()
Thank you for these changes in v2!
