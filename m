Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA09BC433E0
	for <linux-clk@archiver.kernel.org>; Fri, 26 Feb 2021 11:32:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 712E664EDC
	for <linux-clk@archiver.kernel.org>; Fri, 26 Feb 2021 11:32:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbhBZLca (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Feb 2021 06:32:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbhBZLca (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Feb 2021 06:32:30 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 288F2C061756
        for <linux-clk@vger.kernel.org>; Fri, 26 Feb 2021 03:31:44 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id f17so8705610qkl.5
        for <linux-clk@vger.kernel.org>; Fri, 26 Feb 2021 03:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mtwGzwmXCwfuekrnY8Xp3zryCjWTaKAtQqWeYvJYHDI=;
        b=IpZdAGjjww2yK7Jevu2iUTH/1ORVnE1GP45V0gbBup5kNdvj7KGTGT20s2j0a5PZtW
         S+3HhSFd8XgHpdGE86R3GFavD+1+IKlCzk9xxeylY6NBEkcZWF0T3xfwrAY3/GhCmPak
         rN81Nja34w7f+LeSBMWGiVaoDguZpdo84SOQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mtwGzwmXCwfuekrnY8Xp3zryCjWTaKAtQqWeYvJYHDI=;
        b=VO3Rh7rnXZ9Rt0Ha7AKWuM/0W4IMvHKT8a6p26zWUr80HeHYKs6adeUqpQvkUrlqL9
         jwyLtdeKvN0I/0e4rLl0D5k819wSwpJyfS9wWHa4G1dqaSFeZmtd/vB0cxrR/Jxox03i
         G+aw5S7aQjRbyJHS2mrlJoQQHEBz4GAhXrEq1rZtqwE6CSWtso83b3qMwhXglSV36Gem
         ms5A1Y4Zq8WlDCRh7TMN6RPhFgx3ricnsN7WhwSWgJm3cDFcHxluJFdzRIf0eshY5im6
         cVHnHqbJc2ji1qYt6hi0Pczl/sBQvFHyRxc6i9jdpLaqzigSLiI+oetpDkfo4wD1i/zG
         ZpxQ==
X-Gm-Message-State: AOAM532I6Ddq+1gw5oE7SaeC+Jm7VljmAb3xGRFrkLAq5yO7Z8j0qa8Y
        vwcZeVHC4gPtqzmso8qrg80FXLVloMTTlvHlY5B1Bg==
X-Google-Smtp-Source: ABdhPJwnjTvOEGoaSYCM1w3lr13lrnyZmgopzVsHcWgIw+GBGh/ABGQCJHdvC5AWt09QvIxIIAVagq49zfIZLAi2Qh4=
X-Received: by 2002:a37:ef09:: with SMTP id j9mr659750qkk.390.1614339103306;
 Fri, 26 Feb 2021 03:31:43 -0800 (PST)
MIME-Version: 1.0
References: <20210223061830.1913700-1-daniel@0x0f.com> <20210223061830.1913700-2-daniel@0x0f.com>
 <1614108850.540354.4116103.nullmailer@robh.at.kernel.org>
In-Reply-To: <1614108850.540354.4116103.nullmailer@robh.at.kernel.org>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Fri, 26 Feb 2021 20:31:32 +0900
Message-ID: <CAFr9PX=h2JPdAwjYS2849ufH=wnxSti2Dj60fbq4bg8b8=xy_g@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: clk: mstar msc313 cpupll binding description
To:     Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     SoC Team <soc@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Willy Tarreau <w@1wt.eu>, linux-clk@vger.kernel.org,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Rob's bot

On Wed, 24 Feb 2021 at 04:34, Rob Herring <robh@kernel.org> wrote:
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.example.dts:19:18: fatal error: dt-bindings/clock/mstar-msc313-mpll.h: No such file or directory
>    19 |         #include <dt-bindings/clock/mstar-msc313-mpll.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:344: Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1370: dt_binding_check] Error 2

Looks like I sent this too early. I will try again later.

Thanks,

Daniel
