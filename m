Return-Path: <SRS0=O2Xu=MN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F60C43143
	for <linux-clk@archiver.kernel.org>; Mon,  1 Oct 2018 17:27:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9FBB2089A
	for <linux-clk@archiver.kernel.org>; Mon,  1 Oct 2018 17:27:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="uhCqOhzm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9FBB2089A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbeJBAGD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 Oct 2018 20:06:03 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38564 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbeJBAGD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 Oct 2018 20:06:03 -0400
Received: by mail-lf1-f65.google.com with SMTP id g89-v6so10471462lfl.5
        for <linux-clk@vger.kernel.org>; Mon, 01 Oct 2018 10:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NGfp6kTD9Rw80/EU6U7v/UozKVn65gT9RZLlrTNE+Dw=;
        b=uhCqOhzmMMcIB5zw8kkXjkyeenUlyBXc2+Bapqkv/xYWE4KJApkRKsytBC2KnWsDh0
         Vlrj+UKq0wZZxutUOcYGGISebuFoxfTIzqYA8SiAJGOzvwG5dMBa+Apanp2wdBX8R454
         PTuJnMcAnq2zdDW0z/A2dCspzGDNNYUGYt8FGlGgj8Rvz8zjuz2dujP0b1QmWdf+LLCA
         SqiS2x6k6mY2XKcS/L5TeIt7Xmih/nsCmWJFTQcQpdsM4F+xHr7CVPwS/a+kZ4vwlWqY
         8G67kQ6yhI5qzcAWlJP9TAF+7QxzslqWC4T1WRuJTMfXQVkSfmH9n++kSpumtX4T5BRa
         Mwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NGfp6kTD9Rw80/EU6U7v/UozKVn65gT9RZLlrTNE+Dw=;
        b=RdAaF8CeC3s1Dxjfnl8m+4FRf2vkDIg9ou0Da2b9e0/utATRlV3WofzGnh5pY5kz+J
         jVUuP9BkBq6tLoAHoisEjgPAJRNCCai0u/87Rua7e6YW7ixFjlbIoZg6WuU2YLOxruwQ
         KWlHsgnAwJVRgCSdO4ZUUOCAWKg5KdKDgtlg+T+BTpejxRbOWjVV8EhQhtKp2HV34w5f
         OK6Eyp4W7CR6GY+8j/QqHbsH3mL4iS0SoiH4rtakyVwQ07/j3H1GUYRaEyOUVdejGvpe
         gH7FS+uqTjNiCMSZg9PwsAj48Q8Zhi+qUAB/7k9oVK5pgWoTTmk3gVu/sv2sDvLorWqX
         1PUw==
X-Gm-Message-State: ABuFfojpkTQp+/JPDmHP82g+++Ge3FYtxjf+TuSeQkECtDgkceM+OiSO
        tZKRlXdq7iHFDv8YTW+Nqyal1x01zPsy5xbUN0jxTg==
X-Google-Smtp-Source: ACcGV606KPAJvNFTqvxkJEdwC3VtccaJZ8dQDEeGjpVxgD7f7PJuHHUTh/ts6DRlAe4z/fiHpEr5gvjbihbdP9Xj5QI=
X-Received: by 2002:a19:d0c2:: with SMTP id h185-v6mr6519542lfg.87.1538414831591;
 Mon, 01 Oct 2018 10:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <1537985581-32164-1-git-send-email-jollys@xilinx.com>
 <1537985581-32164-3-git-send-email-jollys@xilinx.com> <CAOesGMhEcMB4caAPtCSq-m5zQBDc-8Z4f_xAkomnEwVaHyX2Mw@mail.gmail.com>
 <BL2PR02MB21308D0B6AF76A8094E70863B8EC0@BL2PR02MB2130.namprd02.prod.outlook.com>
 <CAOesGMiUnVrnW1VDh1CKRKGpkwAC9G8tiHjpb+7bss6LpPWU-A@mail.gmail.com> <2350f5c3-b59e-b37b-c679-5b0a36f9a79c@xilinx.com>
In-Reply-To: <2350f5c3-b59e-b37b-c679-5b0a36f9a79c@xilinx.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Mon, 1 Oct 2018 10:26:59 -0700
Message-ID: <CAOesGMixcQS605kmpW+n-yWBGWu4Dz5SXH396mrWCUfQjfcWcQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] firmware: xilinx: Add zynqmp IOCTL API for device control
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Jolly Shah <JOLLYS@xilinx.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
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

On Mon, Oct 1, 2018 at 6:17 AM Michal Simek <michal.simek@xilinx.com> wrote:
>
> Hi,
>
> On 28.9.2018 23:12, Olof Johansson wrote:
> > On Fri, Sep 28, 2018 at 10:15 AM Jolly Shah <JOLLYS@xilinx.com> wrote:
> >>
> >> Hi Olof,
> >>
> >> Thanks for the review. Pushed v4 with suggested fixes. Let us know if series looks good and we can create pull request for same.
> >>
> >> Thanks,
> >> Jolly Shah
> >
> > I'm happy with this one, thanks for revising the patchset with the fixes.
> >
> > Feel free to add:
> >
> > Acked-by: Olof Johansson <olof@lixom.net>
> >
> > to the patches.
>
> Just for clarification. I have checked driver/clk and patches should
> still go via Michael or Stephen.
> Firmware code is already in arm-soc tree that's why I would expect
> Michael/Stephen should review it and then it shouldn't be a problem to
> take this via arm-soc tree.
>
> Olof: Please correct me if I am wrong and you are happy to take it via
> arm-soc directly.

Honestly it might be easiest for you to prepare one branch and send to
all parties in case you have contents you expect to go on top, but
besides that I'd be fine with merging through either tree.


-Olof
