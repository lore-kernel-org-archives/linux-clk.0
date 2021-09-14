Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA4AC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 04:00:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08611610A6
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 04:00:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbhINEBn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 00:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbhINEBm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Sep 2021 00:01:42 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C18C061574
        for <linux-clk@vger.kernel.org>; Mon, 13 Sep 2021 21:00:25 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id s3so21168779ljp.11
        for <linux-clk@vger.kernel.org>; Mon, 13 Sep 2021 21:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mOD/GRIKs+hdPdAcXN0XW4GSnCbiUQLX2JXAm1ArSmE=;
        b=niRWh4tvD3GcDqSTvNOxaxHwf05e+17mw+nVqh3ev2PMzFLop2wDcz1nYhqXjbvI17
         hiN7nMUA1/nY+yL5plpLJ3XjDo8HUd3Rfrjd0z6RCIyD5VwiXRLoeo0r6D3U1b+SCfp3
         AI/cYnJYcWtT831QQfVa5JwSQGx+qBsJ33AMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mOD/GRIKs+hdPdAcXN0XW4GSnCbiUQLX2JXAm1ArSmE=;
        b=XSlq2Cw5px49CJtZL91AlN7VXgZzvaMp2IkHVFZBvESzhH43KMiCnoza0IkCa5n+Yz
         5ubApYoyiX5PBG8TWkyhyElfpDC4HD7Dy37LPUHGHtstyCLjOIAB7of7b/HEtfl5vwV2
         qrjK5V0RUGuLskSF9XU0KK7B6EdsU/vpcnyx1jT+57jb3YgcJWF9axOrWeF/x0QLWJ8M
         +jWfLwF2WFiCU8CsdDxLNMva4TTkCOTrwVpNWqARqDAWMo0QzlSz0SoZCj1n4aaGLRTY
         Cd2m5CZ8SP84OjsZ1kO5HglQhEz9fUGChLzZVQeoK6dFsFMJN7BEz8sQdXZ3ee1YjO6c
         AxJA==
X-Gm-Message-State: AOAM531UybQZCL63SMPfuFL9RPBiAqnlvsVsGZPRxNgvjj8VDFNMN80K
        dJYFJ/yudjExrJctLyWkTCkBV0j78AnPETqkIPUz218gxiXtuw==
X-Google-Smtp-Source: ABdhPJy+jSeXIvVMpE3aPsW4efziT8vLzw757JkH3TL5SFxgsB9djnQwYrYG3UxmJzgmTf/m5e2RGTHorMfuES6fSuU=
X-Received: by 2002:a2e:4951:: with SMTP id b17mr13688387ljd.414.1631592023693;
 Mon, 13 Sep 2021 21:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com> <20210914021633.26377-18-chun-jie.chen@mediatek.com>
In-Reply-To: <20210914021633.26377-18-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 14 Sep 2021 12:00:12 +0800
Message-ID: <CAGXv+5GE4RaDxJ4oVDgmebG0GbBCiWGWD=-UikOHupn0Ojew=g@mail.gmail.com>
Subject: Re: [v3 17/24] clk: mediatek: Add MT8195 vdosys0 clock support
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

On Tue, Sep 14, 2021 at 10:18 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 vdosys0 clock controller which provides clock gate
> control in video system. This is integrated with mtk-mmsys
> driver which will populate device by platform_device_register_data
> to start vdosys clock driver.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
