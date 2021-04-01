Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F6DC433B4
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 11:09:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B59D6108F
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 11:09:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234089AbhDALI2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Apr 2021 07:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233553AbhDALHc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Apr 2021 07:07:32 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1232EC061788
        for <linux-clk@vger.kernel.org>; Thu,  1 Apr 2021 04:07:31 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id o19so810699qvu.0
        for <linux-clk@vger.kernel.org>; Thu, 01 Apr 2021 04:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5hr4EJfC6Dy4LxB2ks0ND142hkf8rNwvgR5bFJx1My8=;
        b=IwfvFudKaG7ulKrhClM3/mRjUThVsffOd8fFnuhBPUkS35EDofF6DoNmO2uJl0ZJe5
         w9rFM1Svm6WR0jHPftrVEjfPU1eMR2oS0EwmA/dpM000mgQHQyWSWOa00XbSoRkoTy9a
         AmV8tA/1UITRcKRQzP+3RAU311ay+sDi2dTLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5hr4EJfC6Dy4LxB2ks0ND142hkf8rNwvgR5bFJx1My8=;
        b=EkzzcCezjTCwkJSgvIYItacfNwbiAct3hqwS7rjVU/gptHDu5P/Mk587JUpo++UsTP
         Awrwy+CCw4VnYq+8HpyVj0xk+Bx1r9zdGhbHyvyAh2laI2yC+W7dCqHVcGf31kFKcREP
         6qM95MY81mPdBMIwuxDlpCpOOyZ8eZVuHUSI6o6RgRl7Wco3XD3dMcRnSQKDTEk5mosq
         UgvWawIsVfX9frnMqnbUcpq1Kl5MOe1uZG1jQLQGymSGQ/0jVV2ctDdqMU5PyLDMzF68
         bPt4xOd1cNnLfDmSlGK7zmthbcQ1CyLMyXtc+Sp69mz/gH57Uriendz8ZixSZoS5TB2v
         5zPA==
X-Gm-Message-State: AOAM533FZ+SgBvIdrdEHHjoOXjnG3BA2ZNd5JM93/eg/lI7iVy9CLZLM
        d4XOd3C4M+QQEJ6m5BlXhDRO6lKzwHssHLlygRsW4g==
X-Google-Smtp-Source: ABdhPJxPeLgGNYuUVol7wcn3UD700JCejRwjzkrn+bZT/fTLQdwdf0L0H88XiIRNF+6k69uJk/9V3D5PfwQ6HMp9Q6E=
X-Received: by 2002:ad4:56e1:: with SMTP id cr1mr7615297qvb.25.1617275251088;
 Thu, 01 Apr 2021 04:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210223061830.1913700-1-daniel@0x0f.com> <20210223061830.1913700-2-daniel@0x0f.com>
 <1614108850.540354.4116103.nullmailer@robh.at.kernel.org> <CAFr9PX=h2JPdAwjYS2849ufH=wnxSti2Dj60fbq4bg8b8=xy_g@mail.gmail.com>
 <CAK8P3a1L62YT1WUxmmfLNmvERo7DbeVwfCHCxuKvxs7Uap+iXg@mail.gmail.com>
In-Reply-To: <CAK8P3a1L62YT1WUxmmfLNmvERo7DbeVwfCHCxuKvxs7Uap+iXg@mail.gmail.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Thu, 1 Apr 2021 20:07:20 +0900
Message-ID: <CAFr9PXmT-FUUu-yMBWCe52KDHUSF2+Zhr8wk-NdC+cW+_8prKw@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: clk: mstar msc313 cpupll binding description
To:     Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc:     Rob Herring <robh@kernel.org>, SoC Team <soc@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Willy Tarreau <w@1wt.eu>,
        linux-clk <linux-clk@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Arnd,

On Thu, 1 Apr 2021 at 20:04, Arnd Bergmann <arnd@arndb.de> wrote:
> I found this is still in patchwork as not merged, and I have not
> seen a replacement. Marking all eight patches as 'changes requested' now,
> please resend.

Understood. I will resend.

Thanks,

Daniel
