Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD8BC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 03:54:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53319610A2
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 03:54:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239170AbhIND4A (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Sep 2021 23:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239028AbhINDz7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Sep 2021 23:55:59 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7329C061762
        for <linux-clk@vger.kernel.org>; Mon, 13 Sep 2021 20:54:42 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id i4so8590753lfv.4
        for <linux-clk@vger.kernel.org>; Mon, 13 Sep 2021 20:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V3UGDU81U9TWNu+b+RTtkfUp8lpGdcxhRFiSbeAytI0=;
        b=CqVgi5LN+VU9Lng3wgwCbs8J7/30XsJBr33Rnghx1IM/UnhrmUqVsI0nK8UMkkTr7v
         ArllR5WC8kHE946ELuMIy4wldZrau3NxjIQLzgxEzl0dU5ttCX4IxMT0v9pYDvtRd4gI
         gnuXV3F+191DgI51Qf07etXbbLodoicx8aIQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V3UGDU81U9TWNu+b+RTtkfUp8lpGdcxhRFiSbeAytI0=;
        b=B0P4WuWW597J+trLBdK6vSx2Pk69HHoXsy8gPza1AQgYOQ0fqsQUrTPf+K6Uhfkw9X
         ar0PFpt5LhcYAl39+0NGsdiyxn0lDu0Z9HXB5rK4LEDxFK5iYLezrVVANAZHLQRJPZFW
         LX2hmuJKt5F4WsA1NDXdhcCmURFyG7wPelwCUviYLIbsQGQSRzTdEJsr22tpnj1hd+FS
         jDBLrtKaXmb8R3NJc+UKi1+xPoC3OivaQhVCEIYdaPcP4pAptQH38Iz5Y02mN+4c/1Me
         R123+cVfcqUUNy5Ai6iSv2YYcXHqgVyy4Aqe2flaX5dItqD3vuKaADoxWv0+rE6QrPDY
         CKlg==
X-Gm-Message-State: AOAM5333ksQPqK2MbJlAhfZP2FCYo6DUHOZ7g6QCXfw8aYnhLsvnyRhw
        cBd/k988ZXFrxklIYEZYDlpyu4sbNxw0WlxzgOFM0w==
X-Google-Smtp-Source: ABdhPJz06wxSNftrXxbf9gQccwFZoT4p6vzzDgTrPH3HmQOLPaulrUefmGD48EIhURQIzkD+/6vrYZupUg2JBcfAYEQ=
X-Received: by 2002:a19:c3d3:: with SMTP id t202mr9045097lff.678.1631591681299;
 Mon, 13 Sep 2021 20:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com> <20210914021633.26377-8-chun-jie.chen@mediatek.com>
In-Reply-To: <20210914021633.26377-8-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 14 Sep 2021 11:54:30 +0800
Message-ID: <CAGXv+5FcTbaR2yXK3OB+iTgYy1OUpDt2FKQw7bA3nGdk4jKxZg@mail.gmail.com>
Subject: Re: [v3 07/24] clk: mediatek: Add MT8195 topckgen clock support
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Sep 14, 2021 at 10:17 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 topckgen clock controller which provides muxes, dividers
> to handle variety clock selection in other IP blocks.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
