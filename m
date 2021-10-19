Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA2AC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 19 Oct 2021 06:47:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A7A16115B
	for <linux-clk@archiver.kernel.org>; Tue, 19 Oct 2021 06:47:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234334AbhJSGt5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Oct 2021 02:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233986AbhJSGt4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Oct 2021 02:49:56 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DA5BC061745
        for <linux-clk@vger.kernel.org>; Mon, 18 Oct 2021 23:47:43 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id t9so5209493lfd.1
        for <linux-clk@vger.kernel.org>; Mon, 18 Oct 2021 23:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rIzFACJIOpTQkxZxEQoVxUHikCOaXX5FiqyLZ4CJEJI=;
        b=D533wtAg6MrSlzGb2m0tVWHI61UjUFYeOl1HPbpj5hqt3RLRUDWWVtApHy4D2J+aP1
         ONelR9FGEn/13NL+fiJ81oINAfFU+CApUep3dA+zOEupFG/7rtNmr/hhqV3eEoYVtY4l
         8wrGa2U67U/szUjNrL1ozs8VcSahMon2mGPio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rIzFACJIOpTQkxZxEQoVxUHikCOaXX5FiqyLZ4CJEJI=;
        b=w9r9RBuvsxU9uJZdHtZyL5uxi+FANds8oPNZNfn7mbJoD22v3u3Fn/ld/zEzcLD3bl
         tfMvvNqO2K8OIKDhTT0QnBL+4w+vuT/dthVr8yPT4PkCe2hDXYtEe4bcIuie0VBs5snQ
         rqjj66+2DKOYxfDis7WZEfCXXKET1Vd2kQNblIm9IPahRTdP79R+i4jhMn20OEfDktZX
         9fGLneil+g/96oORjRBhVR8pW+14e7unn1aN0sypJDVobD//IZGGGyb0AULUhZ/tv5B8
         gTLrPQAcos5gyYsEj+jKmcf/tJXEUW2BHlIizEom51H2kGB2Q5GlhZQfkLqNEMtasBb+
         QCyQ==
X-Gm-Message-State: AOAM532c+pTzXcdKuEzZJMb71bhEMCNbnaKOOvhnW3NP3lHHJ9fc6s7E
        0IEk9nS9upoIRKMHVVLs6+oeo36crdgypayOY34Yag==
X-Google-Smtp-Source: ABdhPJycbpCqB76HftgbC5KmrjMQOESzRPPGqSgE0BVuqBTQdyZiIcpoDSVMLlxtC7lx8QtzCJJIrO4vxxahverRcLE=
X-Received: by 2002:ac2:4e07:: with SMTP id e7mr4491623lfr.308.1634626061968;
 Mon, 18 Oct 2021 23:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211019062939.979660-1-ran.jianping@zte.com.cn>
In-Reply-To: <20211019062939.979660-1-ran.jianping@zte.com.cn>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 19 Oct 2021 14:47:31 +0800
Message-ID: <CAGXv+5Ex-R-LQZJhT_nDwntPjCE72OKS3YNSp+no_0xYkFbDEg@mail.gmail.com>
Subject: Re: [PATCH v2 clk:mediatek] clk:mediatek: remove duplicate include in clk-mt8195-imp_iic_wrap.c
To:     cgel.zte@gmail.com
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        ran.jianping@zte.com.cn, linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Zeal Robot <zealci@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Oct 19, 2021 at 2:29 PM <cgel.zte@gmail.com> wrote:
>
> From: Ran Jianping <ran.jianping@zte.com.cn>
>
> 'dt-bindings/clock/mt8195-clk.h' included in
> '/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c' is duplicated.It is
> also included on the 13 line.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Ran Jianping <ran.jianping@zte.com.cn>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
