Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA988E95A97
	for <linux-clk@archiver.kernel.org>; Mon,  9 Oct 2023 11:40:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346205AbjJILkm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Oct 2023 07:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346270AbjJILkl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Oct 2023 07:40:41 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4C2FB4
        for <linux-clk@vger.kernel.org>; Mon,  9 Oct 2023 04:40:39 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-65b162328edso25439646d6.2
        for <linux-clk@vger.kernel.org>; Mon, 09 Oct 2023 04:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696851638; x=1697456438; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q4M24u5c2mIJQDQiMwOb8MtlSQ2KBQ+vRSI2cRNWj+w=;
        b=UsQuL4EojiALkkOPNy9HDk2LolC5kpTP2F0tGHsVgwWl5XsX6aZ0TYxbSbm6j2SQNP
         6DrGX7dAd7qiv456uy/ttKGzTsY+zGXAyJ0m9Hw0gVf1F+YMHSZ6itsPFBWcJeV/znPX
         df6nJVPDLsVMNN2ZSoQzlCOr1zi7Vy96+TxkMlVd1IHECWf8V4+5WBAqZP+mETIImWMJ
         JUT12E8tVflnMJhq7HHPweXRo9ZnCJn2S2EHnR/n1q00EKcD4NgdFOoFeeAtjuP9g+Np
         fOhduJ0L7Zltauh2NIZTjHaf+haXOoHdSmlqk0pH4dL1byeO3CvTrATUeoOduW5LJ4KL
         2chQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696851638; x=1697456438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4M24u5c2mIJQDQiMwOb8MtlSQ2KBQ+vRSI2cRNWj+w=;
        b=qZzf1oqlG/aeYe0jpBnOxvjhzkPCR+r315bc8GMTD+gmN07gvsVVflUZpbhYdwzmoQ
         XDDFhPtGt8WSohOod99NC4D03/ytWsx4tlo9Fy8BR5TOUk9SfdHamQ4ETe/JxIsvtTuz
         1Ypv0LZXfIyHNRJ+bo/+7Xz/yhLtayP/kWvE96y6zGvenquHGU29j2E2uL3gYLlkylIB
         xrLS629wYcNDUxpmAc2753afaHQCJDNsK+RA10/iwTHy5rQ8Z7hF7CdTco6fggAJrmPE
         HWLc7mK0NSOA0b4pj0FsYgA+1nXxyXh01sX+O0YRgLLzivcIA9b32T7CQN0m71KGFtRf
         umGQ==
X-Gm-Message-State: AOJu0Yx4Q/KhcmYdh3WSN9g7Cy8kRlKDKOYsrUFMNEIztOyJ4Wvn//6V
        WRZzkDXDyn3/3L0hTfB52ZEBR+9NZ8HX6LzW0TMfhw==
X-Google-Smtp-Source: AGHT+IH045QZ313I4M7U9emKN/7xR9yaSooBxYXFWmE0YLkCD87Aj1O2LQLydzEOSpGL58hTKcngPZSWcU91EJAFVkA=
X-Received: by 2002:a0c:f38f:0:b0:64f:56fd:b7db with SMTP id
 i15-20020a0cf38f000000b0064f56fdb7dbmr14447725qvk.27.1696851638703; Mon, 09
 Oct 2023 04:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231005155618.700312-1-peter.griffin@linaro.org> <5c9cc513-c826-4493-8255-1ec45047c403@linaro.org>
In-Reply-To: <5c9cc513-c826-4493-8255-1ec45047c403@linaro.org>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Mon, 9 Oct 2023 12:40:27 +0100
Message-ID: <CADrjBPrOPEBHcQC7csCV4WeKyZT9jU-kM=a+1GGJjpopG6m08Q@mail.gmail.com>
Subject: Re: [PATCH 00/21] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Krzysztof,

On Mon, 9 Oct 2023 at 12:10, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/10/2023 17:55, Peter Griffin wrote:
> > Hi folks,
> >
> > This series adds initial SoC support for the GS101 SoC and also initial board
> > support for Pixel 6 phone (Oriole).
> >
> > The gs101 / Tensor SoC is also used in Pixel6a (bluejay) and Pixel 6 Pro (raven).
> > Currently DT is just added for the gs101 SoC and Oriole.
> >
> > The support added in this series consists of:
> > * cpus
> > * pinctrl
> > * some CCF clock implementation
> > * watchdog
> > * uart
> > * gpio
>
> Hi Peter,
>
> Heads up, in case you are not aware Arm SoC timeframes: we are at rc5,
> so it means that anything targeting v6.7 should be applied this working
> week, before rc6. At least as ARM SoC is concerned.

Thanks for the heads up! I'm just working on v2 now incorporating all the
review feedback. I'm hoping to have that sent out by the end of today or early
tomorrow.

Thanks,

Peter.
