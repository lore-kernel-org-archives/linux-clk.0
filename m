Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0AA5ECAAD8
	for <linux-clk@archiver.kernel.org>; Thu, 22 Sep 2022 19:46:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbiIVTq0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Sep 2022 15:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232035AbiIVTqZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Sep 2022 15:46:25 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27CBBAF491
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 12:46:24 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id 13so23405207ejn.3
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 12:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=S/aQFIprMwOPTZ98QXTAGe3OrWBJeoAbdeTJ2dIQ9XM=;
        b=Rxk4zRd0J/PCW77JtuQHXHqyqup9EnBemXl3cWIA5l7VqVq2dvJw5VQogX2o1iQFp4
         XrFEZbgoQw+dXwnTXvGbSHBlTcm52w/Jgg6fh5x0VTIGasZ+iAJh6d+MHmwojRlGmU2e
         jGSyomSpTN4+/WsgSlXiUvH2zMtSf4FBzzhVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=S/aQFIprMwOPTZ98QXTAGe3OrWBJeoAbdeTJ2dIQ9XM=;
        b=J/AVu+ACjLOkZtxtaoimAw8isSn5L0xxT57wAM6hDAJ92heYj27unkBUJBx4/Dj4TT
         p3+Gdp8PLULsVcYzD7a/cA3ju27UYnnbjaexpHxkmCWhngQeQgWal3UnCibXUHkxH0us
         99rsmhnQQBxvPf5rOHcbu2WsWPJmkYkH8XgX9VF6KYGR/EA4WOM8e4eYIyfpX+G6TVSq
         9PF8KLupAKI2Nj68JeHHeSVGlXiHQCOEgAncr1ZNvw+BoSHnp+C80UxWelzPaJ01FHA1
         kfLwnNCwlG+4Vv5V9sSXLOcZnxHFRZR66hJg7IX8fQgYHGDwB84kx4S8THK/JvmDY9Bb
         vBrA==
X-Gm-Message-State: ACrzQf11lBA+dSFD4KLE1jxZuJdzCbzsZWE/hEJ1O91mQrK0zEdglZWz
        KAjdZ7rkClu4WfbyQfGuZ8B1+wr7hFaIzlZt
X-Google-Smtp-Source: AMsMyM69781bdRDWapTFa98fmmRlyn3Lj5YkIyH2M9BcDD0QOGnN+2m0MwPfYZZIJgvqdh3zWhIFpA==
X-Received: by 2002:a17:907:3f12:b0:77b:8d8:f353 with SMTP id hq18-20020a1709073f1200b0077b08d8f353mr4068273ejc.349.1663875982434;
        Thu, 22 Sep 2022 12:46:22 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id u17-20020a1709061db100b0077d6f628e14sm2991791ejh.83.2022.09.22.12.46.20
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 12:46:21 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id r3-20020a05600c35c300b003b4b5f6c6bdso2010464wmq.2
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 12:46:20 -0700 (PDT)
X-Received: by 2002:a05:600c:500d:b0:3b5:234:d7e9 with SMTP id
 n13-20020a05600c500d00b003b50234d7e9mr3338993wmr.57.1663875980646; Thu, 22
 Sep 2022 12:46:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220922154354.2486595-1-dianders@chromium.org>
 <20220922084322.RFC.1.Iaa18b24fef0c8e88f0b82502f7fa0a70565b64d2@changeid> <CAJZ5v0j+5ZJ3Za5pTiPe9NCRa3CV_KpaBX833vL=WH0tsTBF1g@mail.gmail.com>
In-Reply-To: <CAJZ5v0j+5ZJ3Za5pTiPe9NCRa3CV_KpaBX833vL=WH0tsTBF1g@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 22 Sep 2022 12:46:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UfuPu8nz5=DciusvGGko6we5s2VFf30BbEbONQNgwQoA@mail.gmail.com>
Message-ID: <CAD=FV=UfuPu8nz5=DciusvGGko6we5s2VFf30BbEbONQNgwQoA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] PM: runtime: Add pm_runtime_try_put_sync() and pm_runtime_try_get_sync()
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Linux PM <linux-pm@vger.kernel.org>,
        Len Brown <len.brown@intel.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Thu, Sep 22, 2022 at 10:38 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Thu, Sep 22, 2022 at 5:44 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > In some cases, a caller may wish to synchronously get or put the PM
> > Runtime state of a device but the caller may also be holding a
> > resource that the runtime suspend or runtime resume of the device
> > needs. Obviously this can lead to deadlock.
> >
> > A case in point is the clock framework. While running
> > clk_disable_unused() the clock framework holds the global clock
> > "prepare" lock. The clock framework then goes through and does PM
> > Runtime actions. It should be no surprise to anyone that some devices
> > need to prepare or unprepare clocks are part of their PM Runtime
> > actions. Things generally work OK because of the "recursive" nature of
> > the global clock "prepare" lock, but if we get unlucky and the PM
> > Runtime action is happening in another task then we can end up
> > deadlocking.
> >
> > Let's add a "try" version of the synchronous PM Runtime routines.
> > This version will return -EINPROGRESS rather than waiting. To
> > implement this we'll add a new flag: RPM_TRY.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  drivers/base/power/runtime.c |  7 +++++--
> >  include/linux/pm_runtime.h   | 28 ++++++++++++++++++++++++++++
> >  2 files changed, 33 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> > index 997be3ac20a7..67cc6a620b12 100644
> > --- a/drivers/base/power/runtime.c
> > +++ b/drivers/base/power/runtime.c
> > @@ -609,7 +609,7 @@ static int rpm_suspend(struct device *dev, int rpmflags)
> >         if (dev->power.runtime_status == RPM_SUSPENDING) {
> >                 DEFINE_WAIT(wait);
> >
> > -               if (rpmflags & (RPM_ASYNC | RPM_NOWAIT)) {
> > +               if (rpmflags & (RPM_ASYNC | RPM_NOWAIT | RPM_TRY)) {
> >                         retval = -EINPROGRESS;
> >                         goto out;
> >                 }
> > @@ -791,7 +791,10 @@ static int rpm_resume(struct device *dev, int rpmflags)
> >             || dev->power.runtime_status == RPM_SUSPENDING) {
> >                 DEFINE_WAIT(wait);
> >
> > -               if (rpmflags & (RPM_ASYNC | RPM_NOWAIT)) {
> > +               if (rpmflags & RPM_TRY) {
> > +                       retval = -EINPROGRESS;
>
> Returning -EINPROGRESS from here may be misleading, because the device
> may not be resuming.
>
> Besides, I'm not sure why a new flag is needed.  What about using
> RPM_NOWAIT instead?

Yeah, we can use RPM_NOWAIT if we land your patch [1]. I'll spin with
that if folks agree that the overall approach taken in this series
makes sense.

[1] https://lore.kernel.org/r/12079576.O9o76ZdvQC@kreacher

-Doug
