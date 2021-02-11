Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC78C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 02:29:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9A0A64DDF
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 02:29:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbhBKC3d (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Feb 2021 21:29:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbhBKC3b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Feb 2021 21:29:31 -0500
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6FACC0613D6
        for <linux-clk@vger.kernel.org>; Wed, 10 Feb 2021 18:28:51 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id f18so1918443qvm.9
        for <linux-clk@vger.kernel.org>; Wed, 10 Feb 2021 18:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v/JR6cxBec2OO4AyQr8LqOFJlkaTALkaG4hkaa3+jH0=;
        b=tmRca4PB2kps0fAMgBJNaTQMArARvSx/SfChzgUdm89r1VOxPYGtgjUqVJbGvABQBi
         b1p0l2nSh7eJd4bBjJyqeqxxzLEQMSvO8U2c8yeds2A1CQZbqXlsRAzJKmGHJukytAFJ
         m/GJu+/zc7xAK2nEL38pW+FCnNngPCIIy0dc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v/JR6cxBec2OO4AyQr8LqOFJlkaTALkaG4hkaa3+jH0=;
        b=MD72eu/KiPcdzJkHNUHd/LxgL3YyvI+EXmsIPJIxjyxxM0SiZPC0mfF1Y01vXFMqmT
         JjzNst45ZMuL1EnET+1yWap+iWO9sKZlkMidylwIgOnEzB5wPOym0ZJeyx+CytHs5u+v
         f7eljWEaG3D3VnGpIlJMNqfmNkSqiVxcH+pMPgx5E65AkrLBgaOzPOJTByMV0JGJPTlo
         fnpSsnLJ9Eu0jWJgpjA4bHSwvw7H12u11fAmtpYAImBgcOSZtLqznseHcxpgbH2a/bGS
         2kbA2Yki3HfKrkQB2kAZH7ePH5IUnEUjucfDXszEIamuw77W1OzZqD+qfCksaJuYiDIb
         kknQ==
X-Gm-Message-State: AOAM531SCTuBl317HxYQTYiarlI5sBDwH35EPnAjkEPOtMZh8gMQVSuG
        VI1yVRzgR4XB6QcNMhUxZV+jH2EUQfhTnjVaSI6+FQ==
X-Google-Smtp-Source: ABdhPJwx4HM5jl8YL/e1RHuGN3F2Bjd7U1tHpztED7tcsPkI5wXPP1SMXIcnSHppZZwsNvyRd5ps9xcpcH8nuzQqmAQ=
X-Received: by 2002:a0c:ec83:: with SMTP id u3mr5631558qvo.55.1613010530875;
 Wed, 10 Feb 2021 18:28:50 -0800 (PST)
MIME-Version: 1.0
References: <20201114135044.724385-1-daniel@0x0f.com> <20201114135044.724385-3-daniel@0x0f.com>
 <160843556037.1580929.13575770228476494246@swboyd.mtv.corp.google.com>
 <CAFr9PX=f=HyHBk4s3e_vnMDC53R1X18m7sKFCLMMjitPm+8oEQ@mail.gmail.com>
 <160848984935.1580929.936824086681978646@swboyd.mtv.corp.google.com>
 <CAFr9PX=oLqQqvykiwOGAGg1H2CG0BTEqn0TuSrijodjxY52LxQ@mail.gmail.com> <161292417080.418021.13416197091150418216@swboyd.mtv.corp.google.com>
In-Reply-To: <161292417080.418021.13416197091150418216@swboyd.mtv.corp.google.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Thu, 11 Feb 2021 11:28:40 +0900
Message-ID: <CAFr9PXkGeFUyGCKZgYF+0uJT1ywad42RvPg39ggO8WRngY8uWw@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: clk: mstar msc313 mpll binding description
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Wed, 10 Feb 2021 at 11:29, Stephen Boyd <sboyd@kernel.org> wrote:
> The child clks should be using clk_parent_data to point to the parent
> clks through DT. That way the name of the clk doesn't matter except for
> debug purposes.

I think I get it now. I was using of_clk_parent_fill() to get the
parent clocks sourced
from the mpll but I seems like I should be filling out an array of
struct clk_parent_data
with the indices of the parents and using
clk_register_composite_pdata() etc instead.

Thanks!

Daniel
