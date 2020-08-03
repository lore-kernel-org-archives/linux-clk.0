Return-Path: <SRS0=ow3Z=BN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820A7C433E1
	for <linux-clk@archiver.kernel.org>; Mon,  3 Aug 2020 23:31:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AAF022CAE
	for <linux-clk@archiver.kernel.org>; Mon,  3 Aug 2020 23:31:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kLZPFNza"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbgHCXbW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Aug 2020 19:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727985AbgHCXbV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Aug 2020 19:31:21 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26418C061756
        for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2020 16:31:21 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id v15so16829534lfg.6
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2020 16:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fV01at6U179YYTkypCe1mjYEuoEGSoyCBx3vei1jsL8=;
        b=kLZPFNzaiLoIf37Ocp6yoJdmJakN2FAOgin1yWPmvyiqcRGfvkDyLIJwgFnR7SibjW
         eDY6+V7iRkT7GmQRC7Mtk5KyBDTfuD4CL/PYuTQzAyQQrWqL/YynpbMpKEODLM1f/W4J
         tTGBCULVUmvrDKbcEgpiT565Jo4ros0QWA0bYpY6RJDKjOiSUgsq1W+8rhBSuZCNVWm5
         ZvesqRzD3GSrQDRSgUP2N6M9Y3PZtprj4rkT3HM4EbsoGyagbd2z8n5C7uB4Afu2c6nU
         sWyQBZzktZkb9o84466l36KfybPylh8PrYGMkgKxsqc6rvL/aU1nDW78+MUAsnA8ldTx
         tOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fV01at6U179YYTkypCe1mjYEuoEGSoyCBx3vei1jsL8=;
        b=tQ2TB0e9roI/8h38wzCYQnR2nSw+djuREFt1fXZm8+b75i1fzDX9Yey5unX0lPJw8j
         2U/xzy674h44StUMVRZUK4rjw36rgDBxTd8+H1HsokBuMEsCTYAHgmpU7eImmolQZ15C
         fzkYb5gJxh7oCVTB4S25WyEBbOOAW0wZs4jhUeTX7N9NLvk6q7z2vQ94YAA97VA5NzAx
         mO+A2hT/+HQCjeLeoJtLAIOiyQy/Kr0SEXMlUbNq/ji2/JL9FANyvmhplw2n7jcbfpnK
         sg9a7J9EN3YAv4X1fQE0Q6wTswg7iGQllD2/0XqQFa0jgJGX34pM/CsSyVoxH4DbuA30
         pB6A==
X-Gm-Message-State: AOAM530LQz6LxRtZI065TGRxVprynn0WvfDGQbmOSWvkommqVXQEk43J
        a5ORVkZXXITHHFhawKH/IB5UWQ+wbA1vnpff3/Zeng==
X-Google-Smtp-Source: ABdhPJxWx+hfDk0lqptunggKbQMSvFYj4Ku0H41x8vXU6S8/mAV1QIwpU4LOkgKmpf8w7QdtsdTt1LUVSEoJbOHVisk=
X-Received: by 2002:ac2:5e26:: with SMTP id o6mr9486395lfg.194.1596497479493;
 Mon, 03 Aug 2020 16:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com> <1596115816-11758-2-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1596115816-11758-2-git-send-email-hanks.chen@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Aug 2020 01:31:08 +0200
Message-ID: <CACRpkdYP1EGemHtqO_vrUf-wUyimAs=tXM5WNBD-NcL-h15ZhQ@mail.gmail.com>
Subject: Re: [PATCH v10 1/3] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
To:     Hanks Chen <hanks.chen@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Andy Teng <andy.teng@mediatek.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jul 30, 2020 at 3:30 PM Hanks Chen <hanks.chen@mediatek.com> wrote:

> From: Andy Teng <andy.teng@mediatek.com>
>
> Add devicetree bindings for MediaTek MT6779 pinctrl driver.
>
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>

I pulled out the v9 version of this patch and applied v10 instead.

Yours,
Linus Walleij
