Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4410EE7D0AA
	for <linux-clk@archiver.kernel.org>; Thu, 21 Sep 2023 21:12:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbjIUVM4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Sep 2023 17:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbjIUVMS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Sep 2023 17:12:18 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 463FE44A6
        for <linux-clk@vger.kernel.org>; Thu, 21 Sep 2023 10:07:11 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9ada609bb62so142758166b.2
        for <linux-clk@vger.kernel.org>; Thu, 21 Sep 2023 10:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695316029; x=1695920829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yoJ9BAqIakkIRBck4+c6D512CvwPivJvBbrFNArEblQ=;
        b=a19/BBewSGeXPRh1hN2JH/Gf1NK25Ri0PAkyb0PF+8PqAJiLWY+yNaDBs7KPOTMHHR
         B8pQL32/I12XWcUj4q1yDWGyhimAbxU2Se72SzM5/vAoMOhDCCLo06bC+KtbUb1ro092
         Xaqb7QUPK7po1nRzxnGOWhUSP1fwiqgUb1xFYC8b7otuqzBRr9JclWJTRExoE3Wt0hS+
         Nu/yCeUOtqrOiet/UflEqtdpJK7LtgPWMS39sGgDLpA7tqWNX5kZP8PS9XR+Cgtgo2Ym
         XqA8qImi2dRAA7gNq4zZITELTjsX7nsXaitb5Dzp/atnTO0JZGPDCvctzMd6DZ3WmVpU
         aEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695316029; x=1695920829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yoJ9BAqIakkIRBck4+c6D512CvwPivJvBbrFNArEblQ=;
        b=AW/UK75JvCpn0XCl0Zqw/M1tkuhosc5/j8jJu1vK6szJZwn1in7yaNotNNkwC1tKqd
         lpB6TaDayp0Uu9NfCUwG3rKuiLwNSk2xpUu+wXts7LcrKvWcRuU6yJknfRH4TD/m0gBg
         OHLsWTlx7UJcGBCTt4t/COLnyJIhA2HZ5vzpBogdBZiZ1Z5cj2GvxSt02rNpDD6O0s4/
         +ULJpcT+zoJISkK4+pe0bRoYb01vZYk5YHM6+GztQJes0xNf538KG1iLhBVVnuMo9N9+
         XwXiqd81rmrKmTAsAVB1x4T1cbz7lFFjvXHqZuVqQ24yhw+wJlzDrm1mvcJEb91kTlkP
         Do9g==
X-Gm-Message-State: AOJu0YySfqQlM+tNVOScRfEbqrPCRSV3jWYEWuVF/qOvs5+rlTOaSwfL
        AjmTHNSln9x01CsnfqqKCJMQP4wxwOdRb303KSSNzQ==
X-Google-Smtp-Source: AGHT+IG9uHccNQRNfWrPU8ZX/D7XdOZck/6xT2lynqeRJ6EkLfvPB7KBcTTCDBPgEMaA+RDkpFh+bw==
X-Received: by 2002:a17:906:2cc:b0:99e:f3b:2f78 with SMTP id 12-20020a17090602cc00b0099e0f3b2f78mr4284625ejk.67.1695289173321;
        Thu, 21 Sep 2023 02:39:33 -0700 (PDT)
Received: from linaro.org ([86.120.16.169])
        by smtp.gmail.com with ESMTPSA id s4-20020a170906168400b009ad829ed144sm751272ejd.130.2023.09.21.02.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 02:39:32 -0700 (PDT)
Date:   Thu, 21 Sep 2023 12:39:31 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: linux-next: Tree for Sep 12 (drivers/clk/imx/clk-imx8-acm.o)
Message-ID: <ZQwPU23VTdkLVHDR@linaro.org>
References: <20230912152645.0868a96a@canb.auug.org.au>
 <8b77219e-b59e-40f1-96f1-980a0b2debcf@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b77219e-b59e-40f1-96f1-980a0b2debcf@infradead.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-09-12 15:28:29, Randy Dunlap wrote:
> 
> 
> On 9/11/23 22:26, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20230911:
> > 
> > New tree: bcachefs
> > 
> > The bcachefs tree gained a semantic conflict against Linus' tree for
> > which I applied a patch.
> > 
> > The wireless-next tree gaind a conflict against the wireless tree.
> > 
> > Non-merge commits (relative to Linus' tree): 4095
> >  1552 files changed, 346893 insertions(+), 22945 deletions(-)
> > 
> > ----------------------------------------------------------------------------
> 
> on arm64:
> 
> aarch64-linux-ld: drivers/clk/imx/clk-imx8-acm.o: in function `imx8_acm_clk_probe':
> clk-imx8-acm.c:(.text+0x3d0): undefined reference to `imx_check_clk_hws'
> 
> when
> CONFIG_CLK_IMX8QXP=y
> CONFIG_MXC_CLK=m
> 
> Should CLK_IMX8QXP select MXC_CLK?
> I'll leave that patch up to the maintainers.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>

Thanks for reporting this.

Sent a patch for it:
https://lore.kernel.org/all/20230921093647.3901752-1-abel.vesa@linaro.org/

> -- 
> ~Randy
