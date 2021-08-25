Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0374C432BE
	for <linux-clk@archiver.kernel.org>; Wed, 25 Aug 2021 10:55:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8E46610E5
	for <linux-clk@archiver.kernel.org>; Wed, 25 Aug 2021 10:55:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240125AbhHYK4Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Aug 2021 06:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240118AbhHYK4Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Aug 2021 06:56:24 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B85A0C0613CF
        for <linux-clk@vger.kernel.org>; Wed, 25 Aug 2021 03:55:38 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id d16so42874207ljq.4
        for <linux-clk@vger.kernel.org>; Wed, 25 Aug 2021 03:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8KtXsyPEoSgHBdmGP1qFsGT9RrscqrYn9YkfTv0ST8I=;
        b=F1U0ijMoJ+uQkTH7EAGMMDLpHekxkUXM+2SD8yUcKEs25h6R3TBXPRpl/5AbyiDFMp
         BFiGIYWwKmLgkr9pLHomKG//38jV5N+4G7knhte6u3A4z5PoYFAOhV9QzGB3RZKU0xRy
         oxZW4VlFokPe8hvZzOhJllirIQ4qcX5ZLBsY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8KtXsyPEoSgHBdmGP1qFsGT9RrscqrYn9YkfTv0ST8I=;
        b=BNk5c2f9AiQgYgAJrPJ5Xc7Rs7pmWbPCTn09QBSH8m/B7FPCQVmZzGXN997I6kPxQj
         7EvqzMIj0bBcRWD5vOOMX7u4esxfVlR1fJJUrGMgNrNtMj8yznkjjVYHM3lNVXy3MDGq
         LMNeQ/ME7xeh9/eLCNZHYr8uekPHa/+1NhCB1RAAytxsAaJuaJep9kRHwB6LDPpK10d5
         nO3HL0x/muVbl+S+HdYIMWn0T0B2vjbs7/b5yi6YckmXm8Usv9NtOsqUTmxkNkwJZCV8
         SfX8hZ/GE5KEMNWfNyjOJjRy6VmlPdND+VQyg7wsBta6ggpoDVwpv8UHzpxoV3e8mJMq
         u36Q==
X-Gm-Message-State: AOAM533Ua8Eswa/e1wxkXN2JE9E9YaWa4Z/AfrCQb2MeiJtNjBgn5kQx
        CIVk+LgdwjW5a0Lbg+7Zco455hPRatvsGR8FkjGyUQ==
X-Google-Smtp-Source: ABdhPJwSu+M1YeQxqLDZauUzq/Ihy/yhcPvX547+XWxq7oIDLMi7xFitdF7gXGp8kzYgBiuJeidB8DE6eyVKJQequNg=
X-Received: by 2002:a05:651c:211a:: with SMTP id a26mr22213894ljq.305.1629888937124;
 Wed, 25 Aug 2021 03:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com> <20210820111504.350-19-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-19-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 25 Aug 2021 18:55:26 +0800
Message-ID: <CAGXv+5Eu1f+Mp5WE_BDRioqiZ1LPAyE=3SB5D8nNaHfposDHXA@mail.gmail.com>
Subject: Re: [v2 18/24] clk: mediatek: Add MT8195 vdosys1 clock support
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

On Fri, Aug 20, 2021 at 7:31 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 vdosys1 clock controller which provides clock gate
> control for video system.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
> Integrate with mtk-mmsys driver which will pupulate device by
> platform_device_register_data to start vdosys clock driver

Same thing about the commit message. The reason behind such a design
should be documented and shared, so that other people looking at the
code will have the same context.


ChenYu
