Return-Path: <SRS0=zVdd=V5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A3FC19759
	for <linux-clk@archiver.kernel.org>; Thu,  1 Aug 2019 07:41:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 19E442087E
	for <linux-clk@archiver.kernel.org>; Thu,  1 Aug 2019 07:41:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LjWmtN+s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729704AbfHAHlu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Aug 2019 03:41:50 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44441 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729140AbfHAHlu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Aug 2019 03:41:50 -0400
Received: by mail-oi1-f194.google.com with SMTP id e189so53007525oib.11
        for <linux-clk@vger.kernel.org>; Thu, 01 Aug 2019 00:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eG9qaJAEsycpncNibnJ3D0KadM9MdWRWBUtPu4Q5FyA=;
        b=LjWmtN+snTGS8CH1IFDRQfyvcd0ADhKoPUoXTO0RbUWgOjySZB2X06Hmq18rQ1mZpR
         w5I5kEVF3Fj3WWWJMav0sD2j2ludB620UGItuJ4Q1gl0iygdmkByXrRJk1Ina8yENOhC
         TdvLSuOo4Zbf6MrM2KEdflthha9I4EdH5PMa45uksSlRrXF5gWDzc0XOHlbIXjHDevxq
         5ccGS2o9TrpucUiG39/BDObzn820j8MqD46Dr5KHdCdUowWbI1H5DekN7sYrMCjoVi87
         Zt/muaTctKHsRDYKRqmlYjSrx60K6wtVzJ6jmOpE6qLkvAp5Kd2tEtA7UAQLJYO8Y69d
         fS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eG9qaJAEsycpncNibnJ3D0KadM9MdWRWBUtPu4Q5FyA=;
        b=Tj6dnB9hcThrQ+c7BHY2kOy83hVeKdu2BfiMeIZSpYXyN7wDmUQ0tIfTfZ/S6YeL1Q
         nUL+w5Pxa9jZMNCgUSQHE5NUdF7ugW/zISpbj2TtpR+gWflY0nMkuozuUNjEYvNxEb6e
         5PO4XJHWfxvGOAFoE49fR9j3kF9QOvro6/JbkFpwSB7Hh4OCCnoRsnPGHuAyRpmZoh0E
         E9NVDI42mob+jQSPlO/mfWB1uyOUvmKR6xiUqCjuKud//SVuDMU5ZFPnpLFfpbeljqCm
         qukctmznDpj4+xUwN/x2LHyhpkELWbcgSvzihN3zq/KML1cA2HzTC6PhDCNHJc7MRmis
         87bw==
X-Gm-Message-State: APjAAAVRBIOqM4vCNmnSs5edy9PtU9Hp54dAk/3k/ieTRg79VydB29J6
        j0w4bPwl9VVOAzE9vjSVzKMS2W1eYRg80Ytq7fpRSw==
X-Google-Smtp-Source: APXvYqwohWcMdXZRgU9dGpeF/Azz4D9KB7FWI+mVQAR0hKsQ9Or4UsT0rZDaVo5hBXyEQy2uVA8KJSCZaCJafpSXAQ8=
X-Received: by 2002:aca:6183:: with SMTP id v125mr57331267oib.6.1564645309937;
 Thu, 01 Aug 2019 00:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190731193517.237136-1-sboyd@kernel.org> <20190731193517.237136-8-sboyd@kernel.org>
In-Reply-To: <20190731193517.237136-8-sboyd@kernel.org>
From:   Baolin Wang <baolin.wang@linaro.org>
Date:   Thu, 1 Aug 2019 15:41:38 +0800
Message-ID: <CAMz4kuJNzkevHi-Anf3=hyFmYnRVWe5p69K2cRbBtZU2+536cQ@mail.gmail.com>
Subject: Re: [PATCH 7/9] clk: sprd: Don't reference clk_init_data after registration
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org,
        Chunyan Zhang <zhang.chunyan@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Thu, 1 Aug 2019 at 03:35, Stephen Boyd <sboyd@kernel.org> wrote:
>
> A future patch is going to change semantics of clk_register() so that
> clk_hw::init is guaranteed to be NULL after a clk is registered. Avoid
> referencing this member here so that we don't run into NULL pointer
> exceptions.
>
> Cc: Chunyan Zhang <zhang.chunyan@linaro.org>
> Cc: Baolin Wang <baolin.wang@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
>
> Please ack so I can take this through clk tree

Thanks.
Acked-by: Baolin Wang <baolin.wang@linaro.org>

-- 
Baolin Wang
Best Regards
