Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB154C07E94
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 07:26:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1EB16141B
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 07:26:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhFDH1u (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Jun 2021 03:27:50 -0400
Received: from mail-lf1-f43.google.com ([209.85.167.43]:43521 "EHLO
        mail-lf1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbhFDH1u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Jun 2021 03:27:50 -0400
Received: by mail-lf1-f43.google.com with SMTP id n12so5613770lft.10
        for <linux-clk@vger.kernel.org>; Fri, 04 Jun 2021 00:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m8ATfzPqY7GqysToFJb3WK63gzrrYA8XxBMGOJX8heM=;
        b=fPOnTgCtmbbaK4CDTHEqBMbRVg2o7mPRXgJjfWxPw+TnrNF+2Llu0d8TcFZwESKpXm
         avLQL8IfgdVWwS5+Nu9xVBahKCY4EMYw9JSxrln8w2Np+gJqqtGRLBeeOPugLJxneF0U
         SYncLUDsOQXiOmtRN/Q83uKD2hnf04XZT6mSFw9UuTdzHGM6goeNv0YK0eRyybsqCsV6
         NuZfkRoQT5Aj3/WFbolZvX6qq/oNhQvWE1WcU37qkif5f3XkBa3atJj8fNnmIWao4TwM
         oUSmjYvNNNH+mW3nSwF9wyPQCKTnPOabQaLVp1zmdgxSHg1xkdDuZijh9Q1rdRgvSXb6
         1xBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m8ATfzPqY7GqysToFJb3WK63gzrrYA8XxBMGOJX8heM=;
        b=CREn9KX5sKMgh65mWDO9943Q0y9f2lp4jBZ3pN30j9Zu2TtYaONQckTOiLKwdLws1+
         e33eo6F+8Ay/KFOc2aM57g8WbXLZfcOQ0C/e7YfgUu/DB1O40hntTt4Oir6D0bTx1D1D
         FGWRvYck9whVh9jznWWxUycbzmM+96+L95LBE11j/9Z/A56W8Gl8bChVHlBhtOr5P2xK
         tnFcrcdBJrES9MBSWuBQ4GPGpASnZNPI1Gq5bwv02MwDC/Jk/3WdJYdovaKhqPbPPDc5
         Q//64nWz3GmfwUQStG/aPsKqG9pXazCiFg8paFjdmRqdBr7WlR14A0U453oB+6vb8dvE
         3DWQ==
X-Gm-Message-State: AOAM533RZYm188s79MN+fnFS14MmA/hshsMCHwsKxfjNZ/f+plxzfs5L
        Pc5iggjonDfryEjxQZDQRGS3ZJepgHl5s5PuuvnBsA==
X-Google-Smtp-Source: ABdhPJxgPsVOc8qj+iVUicmkuoyZtvp3Ry4V7hIL2K1nWglkPMEgxrCVihzD4xA/QEOX59qZzhFtLOVnf31bejn/wxk=
X-Received: by 2002:a19:f616:: with SMTP id x22mr1816951lfe.291.1622791493465;
 Fri, 04 Jun 2021 00:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <202106032204.RmTRwUJD-lkp@intel.com> <162275070593.1835121.5721436755445700602@swboyd.mtv.corp.google.com>
In-Reply-To: <162275070593.1835121.5721436755445700602@swboyd.mtv.corp.google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Jun 2021 09:24:42 +0200
Message-ID: <CACRpkdaX7vY0DYToGOY_KBbAzr7W6c8ZurGThpCk3GsTFtK89g@mail.gmail.com>
Subject: Re: [clk:clk-versatile 1/1] clk-versatile.c:undefined reference to `of_iomap'
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Peter Collingbourne <pcc@google.com>,
        kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jun 3, 2021 at 10:05 PM Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting kernel test robot (2021-06-03 07:58:13)
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-versatile
> > head:   419b3ab6987f2a108cc4710030184365b17467ac
> > commit: 419b3ab6987f2a108cc4710030184365b17467ac [1/1] clk: versatile: remove dependency on ARCH_*
> > config: s390-allmodconfig (attached as .config)
> > compiler: s390-linux-gcc (GCC) 9.3.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?id=419b3ab6987f2a108cc4710030184365b17467ac
> >         git remote add clk https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
> >         git fetch --no-tags clk clk-versatile
> >         git checkout 419b3ab6987f2a108cc4710030184365b17467ac
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=s390
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
>
> Probably ought to depend on HAS_IOMEM. Linus or Lee?

Probably! Not that I know how S390 access it's IO (Arnd knows)
I bet it has big iron port-mapped IO or something.
Acked-by: Linus Walleij <linus.walleij@linaro.org>
for the patch.

Yours,
Linus Walleij
