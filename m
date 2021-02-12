Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12FDC433E6
	for <linux-clk@archiver.kernel.org>; Fri, 12 Feb 2021 07:46:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70A3264DEC
	for <linux-clk@archiver.kernel.org>; Fri, 12 Feb 2021 07:46:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbhBLHqX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Feb 2021 02:46:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbhBLHqC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Feb 2021 02:46:02 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FAF5C061574
        for <linux-clk@vger.kernel.org>; Thu, 11 Feb 2021 23:45:22 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id a5so6473048otq.4
        for <linux-clk@vger.kernel.org>; Thu, 11 Feb 2021 23:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t5Rmihl3ZUqPFY+0XWkN11ZaPgqMVvxJiffTmBNGsCI=;
        b=m1Z8jW8F8k61Z40NAIYZOEf26z09pX7fBF2c3K6HPf9p/welO0JrjOPwIiiZv6D5W5
         +N5T+HIMAVSp1qypVM3WB+2u2ywKXACOpDsI4StMW8Kh+fsY96yqfmSx9BixP3Xae3lv
         MLq8mczMtMQKvmD7xplUQsJdqcdnmmql2vbuwdfJNMeTUK/uUJrhLQH9+dngPzt2f3Ee
         Z0ZFB4XGHBc7nYK41Lbf6CaGLIAus1hkqOTwJp9vAzS+2Yj2i5FHncjzimREPtwlHYDL
         Qns8gtMugDL0Q800yw11Rn+BEMzUzFaSYE7T6kiN1N/49W4uyy5J49MsBbhg/MzOn+DP
         XXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t5Rmihl3ZUqPFY+0XWkN11ZaPgqMVvxJiffTmBNGsCI=;
        b=RnGkFyndh1tHHLkqiGe7tSHTyZTKi/yzsMxuVrKyOSJYlcUsLdIsbUJpRg6HtqKafr
         af/+fBlMLe/gzLhUfpMME4NoazcCWGS7MO4/E7f6RRdfPl48lgyUDXp1zwcZa+fQVAed
         F7rr6mR2waCSC/nKhZHL6O6nG4by1bYw9lPOzTdSiFl1VElklai0uvWmsI4PPaDMBPgL
         DbBwEigYy/H+qeABQ+HZ3eoVjpmZCc+g9K9PP5KtJghxV9bUgHvkeP4/Qn5SQ3/Z5QMR
         RH9NWUv68+PUuk9cqqtz9xuvHL29QUfXt4hUn7VOhuvFnS6N0+YZr1/mLGSCUBQNRlwB
         q/Jg==
X-Gm-Message-State: AOAM531Ykx1odOUZRPtDHC+PAp4wkhXGkfpBa9J97Wf8XTJ55/UeDisR
        qAlavSCcgw/xXNpyibi3lc0qAH+TQRA+5Np2Ats=
X-Google-Smtp-Source: ABdhPJzDOW6UpUWOPHL4aDhfngKTY22nYybkNEb0SyuOAUQttgaru85FxN9LZfpCdDhHgUlXbDeUj8eQdTE+z/9oX3E=
X-Received: by 2002:a9d:a77:: with SMTP id 110mr1238249otg.74.1613115922114;
 Thu, 11 Feb 2021 23:45:22 -0800 (PST)
MIME-Version: 1.0
References: <20201220093724.4906-1-sergio.paracuellos@gmail.com>
 <CAMhs-H92MHRO9RqkBW-c_+dVEtVUF-eHH4-zVXO2wCpdX0A55g@mail.gmail.com> <161309979908.1254594.5215549085877905591@swboyd.mtv.corp.google.com>
In-Reply-To: <161309979908.1254594.5215549085877905591@swboyd.mtv.corp.google.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 12 Feb 2021 08:45:11 +0100
Message-ID: <CAMhs-H-35G98rL2qTE4b1npNwF-DXzapG-ZRwX64hNFKCS7Zdw@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] MIPS: ralink: add CPU clock detection and clock
 driver for MT7621
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Chuanhong Guo <gch981213@gmail.com>,
        Weijie Gao <hackpascal@gmail.com>,
        COMMON CLK FRAMEWORK <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, linux-kernel
        <linux-kernel@vger.kernel.org>, open list:MIPS
        <linux-mips@vger.kernel.org>, open list:STAGING SUBSYSTEM
        <devel@driverdev.osuosl.org>, NeilBrown" <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Fri, Feb 12, 2021 at 4:16 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Sergio Paracuellos (2021-01-17 06:19:36)
> > Hi all,
> >
> > On Sun, Dec 20, 2020 at 10:37 AM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> > >
> > >  - Hardcode "xtal" as parent in FIXED macro.
> > >  - Change 'else if' clause into 'if' clause since a return statement was
> > >    being used in 'mt7621_xtal_recalc_rate'.
> > >
> > >  NOTES:
> > >    - Driver is still being declared using 'CLK_OF_DECLARE' for all the
> > >      clocks. I have explored the possibility to make some of them available
> > >      afterwards using 'CLK_OF_DECLARE_DRIVER' for top clocks and the rest
> > >      using a platform driver. The resulting code was uglier since we only want
> > >      to use the same device tree node and the top clocks must be copied again
> > >      for the new platform register stuff to properly have a good hierarchy.
> > >      New globals needs to be introduced and in this particular case I don't
> > >      really see the benefits of doing in this way. I am totally ok to have all
> > >      the clocks registered at early stage since from other drivers perspective
> > >      we only really need to enable gates. So, I prefer to have them in that
> > >      way if it is not a real problem, of course.
> >
> > Any comments on this? Is ok to maintain this as it is done in this
> > version or should I change this to any other approach taking into
> > account my comments in device tree related PATCH? Nothing has been
> > suggested there yet.

> >
>
> Please resend. It seems to have fallen off of DT review list.

I have just resent the whole series as I was told here. Please, take
into account comment from Rob and my explanation of current device
tree here:
https://lkml.org/lkml/2020/12/20/47

Best regards,
    Sergio Paracuellos
