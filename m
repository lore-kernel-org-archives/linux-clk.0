Return-Path: <SRS0=uxtc=SM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D6DEC282CE
	for <linux-clk@archiver.kernel.org>; Wed, 10 Apr 2019 15:46:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D78520830
	for <linux-clk@archiver.kernel.org>; Wed, 10 Apr 2019 15:46:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LWqo7Qid"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387427AbfDJPqG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Apr 2019 11:46:06 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:43038 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727057AbfDJPqE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Apr 2019 11:46:04 -0400
Received: by mail-vs1-f67.google.com with SMTP id i207so1633386vsd.10
        for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2019 08:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7rM2Xb5bvaCYqv/GYA2T4EsMhLOKel6c4Pw0xAVHAFw=;
        b=LWqo7QidHmF1YBjaNV21+LPNMH9dYea9L4eLRMdT0wXBjt813SxTTOE3Zvr6eozrkb
         Nw+arz7aUJ0jTWNgOfIpuOW67HsY11jZzmR3pCAjc63Z+eDSnj4RUHuL6D7J8nN71HGh
         DG5CNUsiS3VdGepWvvJDhL4E8TvTSlUyuG6uE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7rM2Xb5bvaCYqv/GYA2T4EsMhLOKel6c4Pw0xAVHAFw=;
        b=Z3qGEBejCMSh2PUeOC7bqqkmT8zbgz6tuLl7A87PqHF7V+M6aFQfiIJoJnNcQLk4Wr
         DdHlxKAgI+RPXEAHtTE2E8H22WQXTDemwuggGZCzq/1vauSxgC8hdDVXTg+ZyOdf/jPb
         hHb9ReWnnpOW7jrrQhw0hIcOWe29sqkLg0+wX5F5xDMp/o2hwHYXcT/bDB+RxbEV4dX3
         67xzlRQpQgj0XyIA2rBfjMIK72oDdqD+efU4tYDtvb30d3OAvaClg8IXoDWtos2K/G5r
         K5CnGbt6c7ORGG4nlcxZQPiUTq6NmIY6Uq7YLBoAqq4vYyPwyHKW4acxCSKvKuEsiqkn
         iv+w==
X-Gm-Message-State: APjAAAUO1c3eytGXVb4LyDqp0ZxPEiINmKv/rXgIBPayZZvox5KDhpXU
        3TN+BoI1K6mLeXmfz8/bMTgGNsE3htE=
X-Google-Smtp-Source: APXvYqz9JW5Wfllozq9xMpqUXp/GxwQoMVAMzV0/GbVu2+gHnKyxBuFvSAlFQegsZf0skPSvc69KQw==
X-Received: by 2002:a67:cf84:: with SMTP id g4mr24458431vsm.67.1554911163528;
        Wed, 10 Apr 2019 08:46:03 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id m39sm13362802uae.14.2019.04.10.08.46.00
        for <linux-clk@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Apr 2019 08:46:01 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id w13so1649195vsc.4
        for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2019 08:46:00 -0700 (PDT)
X-Received: by 2002:a67:ed84:: with SMTP id d4mr2160365vsp.207.1554911159811;
 Wed, 10 Apr 2019 08:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190329215455.159717-1-dianders@chromium.org>
In-Reply-To: <20190329215455.159717-1-dianders@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 10 Apr 2019 08:45:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V22Z2ziNZs5syzd1wpT4AwpXtTHP52wKvN5drgf06Z8Q@mail.gmail.com>
Message-ID: <CAD=FV=V22Z2ziNZs5syzd1wpT4AwpXtTHP52wKvN5drgf06Z8Q@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: Fix video codec clocks on rk3288
To:     Heiko Stuebner <heiko@sntech.de>,
        Elaine Zhang <zhangqing@rock-chips.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Ziyuan Xu <xzy.xu@rock-chips.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Ryan Case <ryandcase@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Fri, Mar 29, 2019 at 2:55 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> It appears that there is a typo in the rk3288 TRM.  For
> GRF_SOC_CON0[7] it says that 0 means "vepu" and 1 means "vdpu".  It's
> the other way around.
>
> How do I know?  Here's my evidence:
>
> 1. Prior to commit 4d3e84f99628 ("clk: rockchip: describe aclk_vcodec
>    using the new muxgrf type on rk3288") we always pretended that we
>    were using "aclk_vdpu" and the comment in the code said that this
>    matched the default setting in the system.  In fact the default
>    setting is 0 according to the TRM and according to reading memory
>    at bootup.  In addition rk3288-based Chromebooks ran like this and
>    the video codecs worked.
> 2. With the existing clock code if you boot up and try to enable the
>    new VIDEO_ROCKCHIP_VPU as a module (and without "clk_ignore_unused"
>    on the command line), you get errors like "failed to get ack on
>    domain 'pd_video', val=0x80208".  After flipping vepu/vdpu things
>    init OK.
> 3. If I export and add both the vepu and vdpu to the list of clocks
>    for RK3288_PD_VIDEO I can get past the power domain errors, but now
>    I freeze when the vpu_mmu gets initted.
> 4. If I just mark the "vdpu" as IGNORE_UNUSED then everything boots up
>    and probes OK showing that somehow the "vdpu" was important to keep
>    enabled.  This is because we were actually using it as a parent.
> 5. After this change I can hack "aclk_vcodec_pre" to parent from
>    "aclk_vepu" using assigned-clocks and the video codec still probes
>    OK.
>
> Fixes: 4d3e84f99628 ("clk: rockchip: describe aclk_vcodec using the new muxgrf type on rk3288")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I currently have no way to test the JPEG mem2mem driver, so hopefully
> others can test this and make sure it's happy for them.  I'm just
> happy not to get strange errors at boot anymore.
>
>  drivers/clk/rockchip/clk-rk3288.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Any thoughts about this patch?  I'm 99.9% certain it's correct and
it'd be nice to get it landed.  Heiko: I assume you're still
collecting Rockchip clock patches and would be the one to apply it and
(at some point) send a pull request to the clock tree?

-Doug
