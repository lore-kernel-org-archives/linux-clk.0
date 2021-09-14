Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEF3C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 03:57:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE0E360F58
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 03:57:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239271AbhIND6m (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Sep 2021 23:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239257AbhIND6l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Sep 2021 23:58:41 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35882C061762
        for <linux-clk@vger.kernel.org>; Mon, 13 Sep 2021 20:57:24 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id r3so21199119ljc.4
        for <linux-clk@vger.kernel.org>; Mon, 13 Sep 2021 20:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Icmlo36/WeDJHtaQFlCSDhUmVMRzwC9n0IjehX7KX8s=;
        b=Q+Stt1KegkfalX84XgzXINRwOGd0RpR+6QUTPx0SZHBmm4C5qOIaMMChUxb/bvCa/q
         N+DnQnqm6E/I1cAep4msngrWAuY/dX3dTkfMWmKokV1THByzRpZo7loo3t9Et69P1DBW
         dYZRLPWhY699/X9g0RM5J+LuCSKCWqELM3ITE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Icmlo36/WeDJHtaQFlCSDhUmVMRzwC9n0IjehX7KX8s=;
        b=gRsblQpMKmFT+TvhYTfTEdoYq0VFB+6t/BJ8ejS/BcXFD2Fn9hFuMnpFg1VF8VtNl1
         XMbj/zD1sSY+unRGiK2z349H91SHAMg6jTPCUsAAPNL7gzzczW5Tyjvud+0DFTWNudET
         lwNcPVSqr2FAU83p6hhB3JxKbpNHpXb69YKi7sQXduwUBCBo/XgvMaqTeiSUQE5NJMgB
         /lCQpN4lQeYuWmRxLrQOdTPFZogOSLmpmIUrGpz8XDcGroC0GNklTY8pP2c8bQC2FhvY
         5iy1qRRAeiQ7J+oHTJKPLc56frQUwp2fTBnTUiZ/LCNq9h1fGLeWBW3YjKkrbKr+KxEw
         gqZw==
X-Gm-Message-State: AOAM532nwi0oIoYfITZGEdF5RYO0lKeigFApGWFY1USXsjxqsgB5AFow
        fBCa0g8ty+dQbCQTatWUGppwlxIMYPxzeOyvHo/a+g==
X-Google-Smtp-Source: ABdhPJwVMLw+Xt7TAjoKUbHM819dKKR5E2dhZV4AvzPSxkF4HY0R4Bdi6S4aV7q+wxGbdhSIIgrROZ0tkvu1zHQV7/k=
X-Received: by 2002:a2e:b52d:: with SMTP id z13mr13262840ljm.376.1631591842613;
 Mon, 13 Sep 2021 20:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com> <20210914021633.26377-10-chun-jie.chen@mediatek.com>
In-Reply-To: <20210914021633.26377-10-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 14 Sep 2021 11:57:11 +0800
Message-ID: <CAGXv+5EeaodgMroPF==9ov3nNKNHs1WWHk3DqNWDRmb=Du+-Bg@mail.gmail.com>
Subject: Re: [v3 09/24] clk: mediatek: Add MT8195 infrastructure clock support
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
> Add MT8195 infrastructure clock controller which provides
> clock gate control for basic IP like pwm, uart, spi and so on.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
