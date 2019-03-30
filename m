Return-Path: <SRS0=tl1f=SB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652ECC10F00
	for <linux-clk@archiver.kernel.org>; Sat, 30 Mar 2019 18:35:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 344B52082C
	for <linux-clk@archiver.kernel.org>; Sat, 30 Mar 2019 18:35:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VIIfiyoq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730606AbfC3SfY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 30 Mar 2019 14:35:24 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:42247 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730619AbfC3SfY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 30 Mar 2019 14:35:24 -0400
Received: by mail-ua1-f68.google.com with SMTP id s26so1764263uao.9
        for <linux-clk@vger.kernel.org>; Sat, 30 Mar 2019 11:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qyMnXtcKZ/HM1mv9TCWX24zE0lvzBmv6gz9AMjyZ3U8=;
        b=VIIfiyoqm4Mn+PMKjqo9jQUvwHi3CyXfTrqKNj6+X+jHQFj2Oifa7TvHYZznCm14Rv
         yBWAtax5h4eUdfI3Hmow8eYNzgi7s7Unt9l63XsQMfypBi//Z2xv1i3f4dLB/3lNODf8
         pkt3TX2NTnF/n+T219n4kIQrnX5000ecV1Sws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qyMnXtcKZ/HM1mv9TCWX24zE0lvzBmv6gz9AMjyZ3U8=;
        b=qKLZ5TvafRI7Hf7hMK0j35rC5LaatiBgVMYmaMjokj3CKQyr8mE+HRnVJl8apmHPaQ
         WXkrEweMCqR1/z1o4eD8UrQQxshITq+rN6SJabBrpdjLDVm4E3axjhQPUFaCWgWz9rQo
         pVCXyI/IV0ktrQBKJ/7Bu1Y9qJQG7/VzJQ+sU6ZTDzN4KExYnJX8SfVRdHD6ccNYJDXY
         KVoOvqJvr4aHkeDDkl9ZtGvA0ph3xRpmcGDwLrSbyo2uwZf7SezSRHWdCjDL6vVclskG
         f7VgO+PlWA9/ay8RZB20dfcLCuU/AKocPSVVqxiOrvfPIRRgYDb5g7V+8nBk+5EvaW6W
         zIwA==
X-Gm-Message-State: APjAAAUwbZ3mMOflX+2wioK3c5RHmh0EnJEKLSVOtpchoJCwC/9doUjz
        y9qiX4dGv2ocbHRCQTQdtxO7fRY2Zm0=
X-Google-Smtp-Source: APXvYqxX75U3hZOrpcV34Fpw5j1kJlIKwWGd6Uspck78V8AcGNaQVODLLDe3tMj7nV1oj6UXyfXewA==
X-Received: by 2002:ab0:7003:: with SMTP id k3mr8539965ual.0.1553970921775;
        Sat, 30 Mar 2019 11:35:21 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id u10sm2935466vku.34.2019.03.30.11.35.20
        for <linux-clk@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 30 Mar 2019 11:35:20 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id t15so1213907uao.5
        for <linux-clk@vger.kernel.org>; Sat, 30 Mar 2019 11:35:20 -0700 (PDT)
X-Received: by 2002:a9f:3c01:: with SMTP id u1mr33110438uah.19.1553970919782;
 Sat, 30 Mar 2019 11:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190329215455.159717-1-dianders@chromium.org>
 <CAAEAJfCvZ_y-No6vQbf_3kUSyuPYujTjW8XhZHiB=-GU2_NWHQ@mail.gmail.com> <CAAEAJfCmY+bv5A7+-wgQN+X60r61PzOjWsYCkJ-imW-uvHVKmw@mail.gmail.com>
In-Reply-To: <CAAEAJfCmY+bv5A7+-wgQN+X60r61PzOjWsYCkJ-imW-uvHVKmw@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Sat, 30 Mar 2019 11:35:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uau6_u2DZAOEfdaAWQtoXPiwqcN2fg4ohQZRb1KopqvA@mail.gmail.com>
Message-ID: <CAD=FV=Uau6_u2DZAOEfdaAWQtoXPiwqcN2fg4ohQZRb1KopqvA@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: Fix video codec clocks on rk3288
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tfiga@chromium.org>,
        Ziyuan Xu <xzy.xu@rock-chips.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Ryan Case <ryandcase@chromium.org>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Sat, Mar 30, 2019 at 7:25 AM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> On Fri, 29 Mar 2019 at 20:28, Ezequiel Garcia
> <ezequiel@vanguardiasur.com.ar> wrote:
> >
> > On Fri, 29 Mar 2019 at 18:55, Douglas Anderson <dianders@chromium.org> wrote:
> > >
> > > It appears that there is a typo in the rk3288 TRM.  For
> > > GRF_SOC_CON0[7] it says that 0 means "vepu" and 1 means "vdpu".  It's
> > > the other way around.
> > >
> > > How do I know?  Here's my evidence:
> > >
> > > 1. Prior to commit 4d3e84f99628 ("clk: rockchip: describe aclk_vcodec
> > >    using the new muxgrf type on rk3288") we always pretended that we
> > >    were using "aclk_vdpu" and the comment in the code said that this
> > >    matched the default setting in the system.  In fact the default
> > >    setting is 0 according to the TRM and according to reading memory
> > >    at bootup.  In addition rk3288-based Chromebooks ran like this and
> > >    the video codecs worked.
> > > 2. With the existing clock code if you boot up and try to enable the
> > >    new VIDEO_ROCKCHIP_VPU as a module (and without "clk_ignore_unused"
> > >    on the command line), you get errors like "failed to get ack on
> > >    domain 'pd_video', val=0x80208".  After flipping vepu/vdpu things
> > >    init OK.
> > > 3. If I export and add both the vepu and vdpu to the list of clocks
> > >    for RK3288_PD_VIDEO I can get past the power domain errors, but now
> > >    I freeze when the vpu_mmu gets initted.
> > > 4. If I just mark the "vdpu" as IGNORE_UNUSED then everything boots up
> > >    and probes OK showing that somehow the "vdpu" was important to keep
> > >    enabled.  This is because we were actually using it as a parent.
> > > 5. After this change I can hack "aclk_vcodec_pre" to parent from
> > >    "aclk_vepu" using assigned-clocks and the video codec still probes
> > >    OK.
> > >
> > > Fixes: 4d3e84f99628 ("clk: rockchip: describe aclk_vcodec using the new muxgrf type on rk3288")
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > > I currently have no way to test the JPEG mem2mem driver, so hopefully
> > > others can test this and make sure it's happy for them.  I'm just
> > > happy not to get strange errors at boot anymore.
> > >
> >
> > I won't have access to this hardware for a few days, but I am happy
> > to provide a simple test tool.
> >
> > Still haven't reviewed this, but thanks for chasing it down!
> >
>
> Here's a simple tool that tests JPEG encoding. There are two branches,
> with request API and without request API:
>
> https://gitlab.collabora.com/ezequiel/v4l-jpeg
>
> Usage is fairly simple, there's a test.sh that runs three tests,
> writing three JPEG images.

Didn't work for me.  I got:

unable to allocate media request 25

===

OK, after a bunch of debugging, I realized that I needed your series
from <https://patchwork.kernel.org/cover/10838323/>.  I applied that
together with my patch to the to of Heiko's current for-next tree and
I see:

destination plane sizeimage 76800 bytes
source plane 0 sizeimage 76800 bytes
source plane 1 sizeimage 19200 bytes
source plane 2 sizeimage 19200 bytes
src plane 0 mapped 76800 bytes
src plane 1 mapped 19200 bytes
src plane 2 mapped 19200 bytes
capture buffer size: 76800
capture bytes: 6385
bars-i420-320_240.jpeg written, 6385 bytes
destination plane sizeimage 76800 bytes
source plane 0 sizeimage 76800 bytes
source plane 1 sizeimage 38400 bytes
src plane 0 mapped 76800 bytes
src plane 1 mapped 38400 bytes
capture buffer size: 76800
capture bytes: 6385
bars-nv12-320_240.jpeg written, 6385 bytes
destination plane sizeimage 76800 bytes
source plane 0 sizeimage 153600 bytes
src plane 0 mapped 153600 bytes
capture buffer size: 76800
capture bytes: 6385
bars-yuy2-320_240.jpeg written, 6385 bytes


-Doug
