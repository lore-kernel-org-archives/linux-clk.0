Return-Path: <SRS0=Dsg5=MG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B41C433F4
	for <linux-clk@archiver.kernel.org>; Mon, 24 Sep 2018 11:44:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F83121486
	for <linux-clk@archiver.kernel.org>; Mon, 24 Sep 2018 11:44:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="d+YBLdu+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F83121486
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729085AbeIXRqM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Sep 2018 13:46:12 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:35087 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728530AbeIXRqL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Sep 2018 13:46:11 -0400
Received: by mail-it1-f196.google.com with SMTP id 139-v6so10033440itf.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Sep 2018 04:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=I+neKOGaIfxkYLq7/KSb4qMUPj20qwsj/r39saWB6Z0=;
        b=d+YBLdu+otmsClkcGAkVQ373X4hsv1d7iH/yPqg3qy8+Hsx+Lz7XcirFMQfiqZITwN
         iLRkUM+EpWCrPiycJhAPs1kSXjQRu9ctiibeRD7QbLc7MFj+R9Zz9ziQxZpiSODcy/Q7
         0n4ryC6qXYbA8BPI3kO9X6trp/1mcj68BiGx+1ZygcEcRWFb8Vq4W3b7LRZevfFuIneO
         LyeCp3P/+/r6hNx5TWpQVxlkL1XLU0rU/qJjTfwPmTzKPs/BZhXhJt8NGdorHlzsMYO2
         wyg2hILCB+qWHMKNAz68xGqje7Msx/pXKXkb73bjQTUpFsWn2NUOJ7/JKmGNIhfVPjrn
         d90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=I+neKOGaIfxkYLq7/KSb4qMUPj20qwsj/r39saWB6Z0=;
        b=TVMBCUqWXK15EOZkaE6comcFvzqtkvry2Ov+1nAii8GmCpE4qXdCDIKRRPSjKXp/yi
         uwuEJ/PzuaBJY1QLHizGT/Q46Qw95rsVXKXIPlNZF2mkhI3E5fUY7igKFYUZT5sZPPI4
         VufiBwupUApjOD/+X3RI6CRqs8uD4+XdsTBs43Z0faY73F2rRWH3bfxFacZ9d3UI0HG7
         pvbcgI9gQKw3IaHJPljuudaRgwWYMOUiLACsz3F8cOTdaHLfplaeHoblyK6ElMu4WEWB
         YAM7VwjoY+1xAVdUi0rEAqN4w8kllIRXfuufqv6RS5UMt5ws/S3e9jDhQTxUTQJ2o2xj
         dbgA==
X-Gm-Message-State: ABuFfohw1TqCRiE3TU0E32NXN11CrW1ygmkrV3bGj0XITQ1oFMFw93ts
        L39d0wTt6CIYBMv3yW+pNv1QJz/TjwV+k4on42ljBA==
X-Google-Smtp-Source: ACcGV61zi4ItSsWn4lkh7i+858CSyStGIW6aMzEWXbsgnDdjHC+HGJ57EwyWzdpNSfZQiWMg0OC0hEA7CM7+Ne6daqg=
X-Received: by 2002:a24:a20f:: with SMTP id j15-v6mr2121558itf.125.1537789470555;
 Mon, 24 Sep 2018 04:44:30 -0700 (PDT)
MIME-Version: 1.0
References: <20180924101150.23349-1-brgl@bgdev.pl> <20180924101150.23349-5-brgl@bgdev.pl>
 <20180924112303.GM15943@smile.fi.intel.com>
In-Reply-To: <20180924112303.GM15943@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 24 Sep 2018 13:44:19 +0200
Message-ID:
 <CAMRc=McegRtV88BfYja5wdKZuNDEMG3dqWjG7xHoyo6EHhyEqg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] clk: pmc-atom: use devm_kstrdup_const()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Arend van Spriel <aspriel@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joe Perches <joe@perches.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Michal Hocko <mhocko@suse.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>, Roman Gushchin <guro@fb.com>,
        Huang Ying <ying.huang@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180924114419.JYFpZT0LRtwhgX1cIop2LpPWEdEd4hOnduHtiulGADE@z>

pon., 24 wrz 2018 o 13:23 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> On Mon, Sep 24, 2018 at 12:11:50PM +0200, Bartosz Golaszewski wrote:
> > Use devm_kstrdup_const() in the pmc-atom driver. This mostly serves as
> > an example of how to use this new routine to shrink driver code.
> >
> > While we're at it: replace a call to kcalloc() with devm_kcalloc().
>
> > @@ -352,8 +344,6 @@ static int plt_clk_probe(struct platform_device *pd=
ev)
> >               goto err_drop_mclk;
> >       }
> >
> > -     plt_clk_free_parent_names_loop(parent_names, data->nparents);
> > -
> >       platform_set_drvdata(pdev, data);
> >       return 0;
>
> I don't think this is a good example.
>
> You changed a behaviour here in the way that you keep all chunks of memor=
y
> (even small enough for pointers) during entire life time of the driver, w=
hich
> pretty likely would be forever till next boot.
>
> In the original case the memory was freed immediately in probe either it =
fails
> or returns with success.
>
> NAK, sorry.
>
>

I see.

I'd like to still merge patches 1-3 and then I'd come up with better
examples for the next release cycle once these are in?

Bart
