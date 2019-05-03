Return-Path: <SRS0=gieW=TD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73117C004C9
	for <linux-clk@archiver.kernel.org>; Fri,  3 May 2019 18:26:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 468312087F
	for <linux-clk@archiver.kernel.org>; Fri,  3 May 2019 18:26:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jukmNt5K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbfECS0m (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 May 2019 14:26:42 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:36522 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbfECS0m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 May 2019 14:26:42 -0400
Received: by mail-it1-f193.google.com with SMTP id v143so10488366itc.1
        for <linux-clk@vger.kernel.org>; Fri, 03 May 2019 11:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=m5kmd11ubDHH1HewU/387yrI6xXuVNir/39BbjOjwYQ=;
        b=jukmNt5KJt5IuJ7udL/j3gODOUg+hDKAhLZ/bhshiuVm8TFhtuqHsjqr9UwmrO2f8S
         NXiE/RTnH1LeUr/VBZzzKtfRvJbnLT3deZsEBpHUzpFDfMOv0Ve/DO412v0GieRxwz1P
         Fv9/RBBd1laXGJXW5afroutKYrM1WY8Bad6VuQqTVsdXHUFYeTSGc01yqJThZV62BBaC
         v90W2uPZqeJpJLhNe6x5lN7X0OJ0UbP31LHSDY3K51aylYmjPaJsQjqNeenJucTBPqP/
         rw+upvm12bVtk4/jbyThssVqPeHGGXty4x+CI1kCILYsN9A/DgiSlsQXFgGMEEgFl5F3
         ahSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=m5kmd11ubDHH1HewU/387yrI6xXuVNir/39BbjOjwYQ=;
        b=f1aq7eEOByhecMWCPdWENWpFNdEumDVptUE2uFQb/gBoFJikPkikwLKZJf9fYZAGO+
         ksM2j+dHfgZ1ip0WHNYEquN0adcFKbzxgyKZfbNS69Fzr+YCT/Kj1ebodHwoBQUSYBBh
         JdEcXXMZNbUswYdfjF5IzDAkYDbHd8eYRrPAiqsI7Z4oGAay4i+szcbxEC/9ZWgKePTb
         LvUgGQ4rSy3M+Ank+YtwxVVye0QXxvNsmN9qjv/BZ/+xSLJj8UawL/mChwMxhgRYTRvi
         xWx7O7tC/135LKR74eIH2ZVP8GXaXr+xqN4gdsy7hTnilL9aoqqXcaW1OYnSEKdivVv7
         Fi1w==
X-Gm-Message-State: APjAAAUfAUYEKQXzjV8v3SamGEk/276oNX4a1CxRXPW0B3vpcz6OEeIT
        ZHQXegRmcUExP42PYQZU33gzJiok2Mhq4w==
X-Google-Smtp-Source: APXvYqyda5mEqX/Cfym5qPzwkj3KHnAba0EJj2kf5Vz5txRvRPkKjQ3i0kz6PY3yy3JhzOu/n9odjA==
X-Received: by 2002:a02:cb4e:: with SMTP id k14mr8487413jap.20.1556908001869;
        Fri, 03 May 2019 11:26:41 -0700 (PDT)
Received: from localhost (74-95-18-198-Albuquerque.hfc.comcastbusiness.net. [74.95.18.198])
        by smtp.gmail.com with ESMTPSA id 7sm1040675iog.26.2019.05.03.11.26.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 May 2019 11:26:41 -0700 (PDT)
Date:   Fri, 3 May 2019 11:26:40 -0700 (PDT)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To:     Stephen Boyd <sboyd@kernel.org>
cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        kbuild test robot <lkp@intel.com>, kbuild-all@01.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [clk:clk-sifive-fu540 3/3] drivers/clk/sifive/fu540-prci.c:534:41-42:
 WARNING: Use ARRAY_SIZE
In-Reply-To: <155689947835.200842.14950816155129185642@swboyd.mtv.corp.google.com>
Message-ID: <alpine.DEB.2.21.9999.1905031126040.4777@viisi.sifive.com>
References: <201905031619.nJ5l01Tg%lkp@intel.com> <155689947835.200842.14950816155129185642@swboyd.mtv.corp.google.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 3 May 2019, Stephen Boyd wrote:

> Quoting kbuild test robot (2019-05-03 01:21:21)
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-sifive-fu540
> > head:   85ed1c299cca9beb5df6006361cf18bfa2305836
> > commit: 85ed1c299cca9beb5df6006361cf18bfa2305836 [3/3] clk: sifive: add a driver for the SiFive FU540 PRCI IP block
> > 
> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
> > 
> > 
> > coccinelle warnings: (new ones prefixed by >>)
> > 
> > >> drivers/clk/sifive/fu540-prci.c:534:41-42: WARNING: Use ARRAY_SIZE
> 
> I had a review comment about this on the previous version... I'll go fix
> it myself.

Thanks; I had intended to make that change.  Sorry about that,

- Paul
