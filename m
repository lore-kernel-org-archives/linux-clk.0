Return-Path: <SRS0=udJu=MK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63DEDC43143
	for <linux-clk@archiver.kernel.org>; Fri, 28 Sep 2018 21:13:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B63D206B7
	for <linux-clk@archiver.kernel.org>; Fri, 28 Sep 2018 21:13:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="quLFzC7l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B63D206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727201AbeI2Dif (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Sep 2018 23:38:35 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35969 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbeI2Dif (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Sep 2018 23:38:35 -0400
Received: by mail-lj1-f196.google.com with SMTP id p89-v6so7121837ljb.3
        for <linux-clk@vger.kernel.org>; Fri, 28 Sep 2018 14:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nMp4u7sYnhkUHethiKEkqOVVbXpUHsk+wasup6xslf8=;
        b=quLFzC7lwz+uR2s7n7cpOyZxDhKOPnBtFuI55HcwJzu2ZP9UM1sRxRd9QCjSzSkk0a
         HZk8X4e7P8msgIIp5WuS+3DUcoKmS06zKQOB6mmhlwe4QXfLh94+qTTtwiZIPeaINMfV
         +uQxlRL65h/YxNEUZEcKxMGCB8lszotGZO8H/3sE1cY6i6KjPJYs2lze+P3qjKjMQXEb
         xjq8+zOKST3MHM1IQrCdniD8fOsvf0FCesyFJbkwJ26hNQoIVaJsg5oa8H8h6sag8vp0
         MnS2/d/EJVphRQvlfSrstpmuPXrgytsPB1+6Lqz26I6gMIPEM1v3TcLRlfyqlqvOyhy1
         lQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nMp4u7sYnhkUHethiKEkqOVVbXpUHsk+wasup6xslf8=;
        b=YRQfIakXI87QQs7/4Q7TyH+IAbMYUpxsW5Ejauc6eoUSpnRpsEl3KfWJfewL6vVueX
         CdxJoF+NjgSCThDY64xQfIavl9Hn+vfRwhDs7uYc2Nck6B9SB70S3VmQZGz1wX/9PrEY
         E3KY6ic+HkqclfPeQFlbwezoKmD+Fa4kRDmAFoX7BE756wETrMmljDU3kDFKHqpvZZEe
         ir0SQfhBzbiFRIutIdgSO7LDhPEV8t19qZefx84Ceqw9iIorTuzNtdca08V2rzsKZqVk
         tSn6SWqG03T7wbp+taMXjz094V+qC3SLyekp/DFESHbZQtvm9RxuB8SJgQWq02vHl2TK
         uygA==
X-Gm-Message-State: ABuFfohGVI1QTBEnFlTkECHnbtyrpVzGlAuBKUpW03VX1EE8SLFcuscl
        ZuZMbif1Qo5Nrhd9xGdnFw4gNpMB98FjTttDVf8Bug==
X-Google-Smtp-Source: ACcGV60zV/+48W9QraPEdXVYAeGe92gT7oHj4F9hTQN0npd/H2trJuKS6ZI1sO2Z7o0/bQC9xpPy4VxesHeFnBbvi6k=
X-Received: by 2002:a2e:8257:: with SMTP id j23-v6mr206988ljh.49.1538169180419;
 Fri, 28 Sep 2018 14:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <1537985581-32164-1-git-send-email-jollys@xilinx.com>
 <1537985581-32164-3-git-send-email-jollys@xilinx.com> <CAOesGMhEcMB4caAPtCSq-m5zQBDc-8Z4f_xAkomnEwVaHyX2Mw@mail.gmail.com>
 <BL2PR02MB21308D0B6AF76A8094E70863B8EC0@BL2PR02MB2130.namprd02.prod.outlook.com>
In-Reply-To: <BL2PR02MB21308D0B6AF76A8094E70863B8EC0@BL2PR02MB2130.namprd02.prod.outlook.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Fri, 28 Sep 2018 14:12:48 -0700
Message-ID: <CAOesGMiUnVrnW1VDh1CKRKGpkwAC9G8tiHjpb+7bss6LpPWU-A@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] firmware: xilinx: Add zynqmp IOCTL API for device control
To:     Jolly Shah <JOLLYS@xilinx.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michal Simek <michals@xilinx.com>,
        ARM-SoC Maintainers <arm@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Rajan Vaja <RAJANV@xilinx.com>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Sep 28, 2018 at 10:15 AM Jolly Shah <JOLLYS@xilinx.com> wrote:
>
> Hi Olof,
>
> Thanks for the review. Pushed v4 with suggested fixes. Let us know if series looks good and we can create pull request for same.
>
> Thanks,
> Jolly Shah

I'm happy with this one, thanks for revising the patchset with the fixes.

Feel free to add:

Acked-by: Olof Johansson <olof@lixom.net>

to the patches.


-Olof
