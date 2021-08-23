Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C084BC432BE
	for <linux-clk@archiver.kernel.org>; Mon, 23 Aug 2021 12:20:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82C79613A6
	for <linux-clk@archiver.kernel.org>; Mon, 23 Aug 2021 12:20:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233895AbhHWMVV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Aug 2021 08:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236754AbhHWMVU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Aug 2021 08:21:20 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67299C06175F
        for <linux-clk@vger.kernel.org>; Mon, 23 Aug 2021 05:20:37 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id p38so37612149lfa.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Aug 2021 05:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J/9lMngJdsO39utn1rnBXQpLcoAkKWd+nQfEyzAGaq0=;
        b=A93zXOcuEP4Kz+850M7QkS6YIvg0xSj1PenNxv1W64YmPWMa57DygFf75G6oclbkYa
         ffnVJQo3HSz4vUCXNF61F9MhY2o4RIijteGevGpyGLcXGRH637WleRHHheLDBRu0qYHH
         CnitHEo+t/IibGAfmbAcyFWPiLoUu5omC1EaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J/9lMngJdsO39utn1rnBXQpLcoAkKWd+nQfEyzAGaq0=;
        b=hvFQ6viBUzrk5HGB+sJekEsoPXaZxkA5GThFy1uyrbGEk4E3mBoDAf5GSwYNB3JHxS
         XQW1Y0E6llneeHRv/gAJRqRCtP6MKPrczh/IXN1wtmz+mpeTY3djrmCdneTgdgUVP8gB
         II0k5H0DawelD+zAg2qFVn19A2rWMMWTTkEF0/R4P5d4ESjpnEXWJ77e6tvT6d5Vaiys
         wKMOu3nKDbjFPYhPETVmrwGP/HOu+y5ECusfsBGi5O8+9WNxaOnjm8L+NJ2fUra7i0Vu
         yps3a3MtCa6d6aBASov1R34SWNXpSCPKhfEIH2dUfaW2BXbWpC8Oth8tv3khX+Kow/eC
         YvOQ==
X-Gm-Message-State: AOAM532HoCYM2j2BHY525qTnBom0XZ9ENVcN8bY3Qh7OB/4fFyqV3IJo
        a5sEr3sqrHf8NMZ3yXMs0HP6PfClyM4nHl8hVnjUhw==
X-Google-Smtp-Source: ABdhPJzZV+X+GD9FTgIY+7KEoZ0aRWDNfvAX10pwPbA9Jx1RGnfwwCvySJdrhtlRgTZ1eoaOFCpMJ/yt+XRo3rHFWRE=
X-Received: by 2002:ac2:4116:: with SMTP id b22mr25323200lfi.587.1629721235847;
 Mon, 23 Aug 2021 05:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com> <20210820111504.350-14-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-14-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 23 Aug 2021 20:20:24 +0800
Message-ID: <CAGXv+5Fj69MQroMZV5ecpEg7cBcin0rA7C6XNCZcvcHebV-HQg@mail.gmail.com>
Subject: Re: [v2 13/24] clk: mediatek: Add MT8195 ipesys clock support
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org,
        Devicetree List <devicetree@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Aug 20, 2021 at 7:25 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 ipesys clock controller which provides clock gate
> control for ipe IP block.

Could you describe "ipe" in generic terms?

ChenYu
