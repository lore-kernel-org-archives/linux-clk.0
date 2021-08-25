Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD74C4338F
	for <linux-clk@archiver.kernel.org>; Wed, 25 Aug 2021 11:00:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9600B611C9
	for <linux-clk@archiver.kernel.org>; Wed, 25 Aug 2021 11:00:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240311AbhHYLBA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Aug 2021 07:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240185AbhHYLA6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Aug 2021 07:00:58 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D73C0613CF
        for <linux-clk@vger.kernel.org>; Wed, 25 Aug 2021 04:00:13 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id o10so52054092lfr.11
        for <linux-clk@vger.kernel.org>; Wed, 25 Aug 2021 04:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IMU+pM2QBZzK/mBgD18/2ldTcz6xSYAlm4VwhZW8Xds=;
        b=ZxFTXedcdzgllV0BdZVAIOcwxqUf0UzSNt0l9AgbF7OR686cjSpK+aNfAaHRtMelvk
         yUfJPVebJxXrzWgcVmO85ibd7OEJT1lw3qtrjt58s4CRZLvKL5IFje38BqnLzn3VxGbv
         eums4LevWEoHBjGmer+gWDYX6gm6FxLIvVpYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IMU+pM2QBZzK/mBgD18/2ldTcz6xSYAlm4VwhZW8Xds=;
        b=qAk1n/l9omqt5Jgn3MSX9Lhsi1JzZFwZANvpFVRW8Z7tIrFu0P7FzU9vK/e1AtHE9B
         3jmolfYe9Fao8m1C4gfPzejsiZUVOsNVzOA3A8JEwvvEFlTQwhTePgsQSy6XpZgrXO5j
         Zsotiv5visnqFrRK9XDf27zlDkASY0bOozyK5a1L9ZwQVbxSagdf0hlomicXlwwtT7jx
         HN5ZmGp/+8aowyhh96e8XZ/BKNBtrKNeLT9HNZSYWjKOY7hf5z2VMPQt2shQDqV2ImbS
         rMFfuWtCx91xodXTrocq1Alpvr2jBwcxU/HCpyUW8ZQX5As2x/Gv/GrIpvJco8f9HZZx
         vAwA==
X-Gm-Message-State: AOAM532exu45GXDjA7oTrR9zKArS4/FPd0qUBM/AgUGxei/5CB4Zo18P
        JGT3xWr1GEc5Cm8nTHjWMrTFK+tXEum6f9U8daGP3A==
X-Google-Smtp-Source: ABdhPJz0Tnwq+6r0A94ST8UOV01W0Dny2Y9nLZLBesdNACuORbZBRKjlyxU3vEMbYXzhNU3c/9h+wD8v+Hnzoymsh68=
X-Received: by 2002:a19:ca09:: with SMTP id a9mr17326764lfg.342.1629889211438;
 Wed, 25 Aug 2021 04:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com> <20210820111504.350-22-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-22-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 25 Aug 2021 19:00:00 +0800
Message-ID: <CAGXv+5G6wKOZhBRq9J-Jesd1_vHn7Tt4eYo3acTK8-wK8-KjVw@mail.gmail.com>
Subject: Re: [v2 21/24] clk: mediatek: Add MT8195 vppsys1 clock support
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

On Fri, Aug 20, 2021 at 7:33 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 vppsys1 clock controller which provides clock gate
> controller for Video Processor Pipe.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
