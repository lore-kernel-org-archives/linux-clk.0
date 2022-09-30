Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38342C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 08:34:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbiI3IeE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 04:34:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbiI3IeD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 04:34:03 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4FB184817
        for <linux-clk@vger.kernel.org>; Fri, 30 Sep 2022 01:34:00 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id hy2so7532763ejc.8
        for <linux-clk@vger.kernel.org>; Fri, 30 Sep 2022 01:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=zpubVR36akS3Npv0MEhp+71/irYCuHEE1UMxNS0pFeQ=;
        b=AXmy0ECatIW7X7saqCouPx5jCS/k+FxsqM1Oabkp5bdFgr4MLqKU12l9BGy8m3EGSG
         SOYRbC4Jyjr23fdAmM3KxKvteauoz5bIBjHnKxk7qzLAz7mQVi+EpZKR6Rtw8/r6JQn0
         Xk/Ut9ZwCnEbDDNY+j2FrvTAtmd8cTIDqzpycvfqrovhbDJOVQvL/q65pHz8iFhVN1vf
         zhyR2Y/75ZNRkViCbWexNrYitDZk8yn657+JgsI9MWGpn9aElrauytccW1lOta8ORgeV
         9HfZy91QRr/tV3/cgTCWyTuKkErJQQcX2jpGccpxHF2i9yypUKlC4iRjP2fIvIO7UVCG
         T44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=zpubVR36akS3Npv0MEhp+71/irYCuHEE1UMxNS0pFeQ=;
        b=L+riwxFIhlHWaxOR34YqHRPQdhJdMlPMhYqSoi8R8UE+qA+DMgzm53R9uED7Gb8k8f
         1pPCwS9cxnM6j2NmKm2dcneRep89+nVQik3Wnh1Tx8iwiuUBoqOsRo/gXdyh5w8/pEN8
         lL0U/F28HaW3a4eM7pOvH7mw0nCyBjjzvRpwt5a1CVYfqGRiCJztkugA45ghUdOJoRxF
         jWhaxZkAUBuOJ/fxfo4TRCo8Jm/8DzhYqRkBwS3BBiiL9qPtc2vysVuDo+CiDg6mOzIV
         4GXlRXbC8NwrI1i1ACKBJsz4iZpAi9i1o8DeFYvUtrYEe+E1khdAhNmpxkDj3CtJVv+j
         qLDg==
X-Gm-Message-State: ACrzQf3o0LDGpl7VkRO9YS+X4Wbll+QXlekUUAsFBEkaepMdzsYzvU29
        8m7pK5QZmew3nxgIVNd11WjqPQ==
X-Google-Smtp-Source: AMsMyM5i2deVFFXg/iT90BwccmJSsM6RxySs3C51OSMncVveyqyywH19GoCOiWgNOSIdRX8qb3BPvA==
X-Received: by 2002:a17:907:2bd8:b0:770:77f2:b7af with SMTP id gv24-20020a1709072bd800b0077077f2b7afmr5660781ejc.545.1664526839278;
        Fri, 30 Sep 2022 01:33:59 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id 6-20020a170906318600b0078116c361d9sm874085ejy.10.2022.09.30.01.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 01:33:58 -0700 (PDT)
Date:   Fri, 30 Sep 2022 10:33:57 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vfedorenko@novek.ru>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Vadim Fedorenko <vadfed@fb.com>, Aya Levin <ayal@nvidia.com>,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/3] Create common DPLL/clock configuration API
Message-ID: <Yzap9cfSXvSLA+5y@nanopsycho>
References: <20220626192444.29321-1-vfedorenko@novek.ru>
 <YzWESUXPwcCo67LP@nanopsycho>
 <6b80b6c8-29fd-4c2a-e963-1f273d866f12@novek.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b80b6c8-29fd-4c2a-e963-1f273d866f12@novek.ru>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fri, Sep 30, 2022 at 02:44:25AM CEST, vfedorenko@novek.ru wrote:
>On 29.09.2022 12:40, Jiri Pirko wrote:
>> Sun, Jun 26, 2022 at 09:24:41PM CEST, vfedorenko@novek.ru wrote:
>> > From: Vadim Fedorenko <vadfed@fb.com>
>> > 
>> > Implement common API for clock/DPLL configuration and status reporting.
>> > The API utilises netlink interface as transport for commands and event
>> > notifications. This API aim to extend current pin configuration and
>> > make it flexible and easy to cover special configurations.
>> 
>> Do you have the userspace part somewhere?
>> It is very nice to add example outputs of user cmdline of such tool to
>> the patch description/cover letter.
>
>Sorry, but we don't have any user-space part for now. It's still WIP and
>there are too many changes in the protocol to implement anything useful on

What protocol?


>top of it. Once we will get to a kind of "stable" proto, I will implement a
>library to use it.
>
>> 
>> Also, did you consider usage of sysfs? Why it isn't a better fit than
>> netlink?
>
>We already have sysfs implemented in the ptp_ocp driver. But it looks like
>more hardware is going to be available soon with almost the same functions,
>so it would be great to have common protocol to configure such devices.

Sure, but more hw does not mean you can't use sysfs. Take netdev as an
example. The sysfs exposed for it is implemented net/core/net-sysfs.c
and is exposed for all netdev instances, no matter what the
driver/hardware is.


>> 
>> Regarding the naming, is "dpll" the correct one. Forgive me for being a
>> syncE greenie, but isn't dpll just one algo to achieve syntonous
>> clocks? Perhaps "dco" as for "Digitally Controlled Oscillator" would be
>> somewhat better fit?
>> 
>
>We will discuss the naming too, thanks!
>
>> 
>> > 
>> > v1 -> v2:
>> > * implement returning supported input/output types
>> > * ptp_ocp: follow suggestions from Jonathan
>> > * add linux-clk mailing list
>> > v0 -> v1:
>> > * fix code style and errors
>> > * add linux-arm mailing list
>> > 
>> > 
>> > Vadim Fedorenko (3):
>> >   dpll: Add DPLL framework base functions
>> >   dpll: add netlink events
>> >   ptp_ocp: implement DPLL ops
>> > 
>> > MAINTAINERS                 |   8 +
>> > drivers/Kconfig             |   2 +
>> > drivers/Makefile            |   1 +
>> > drivers/dpll/Kconfig        |   7 +
>> > drivers/dpll/Makefile       |   7 +
>> > drivers/dpll/dpll_core.c    | 161 ++++++++++
>> > drivers/dpll/dpll_core.h    |  40 +++
>> > drivers/dpll/dpll_netlink.c | 595 ++++++++++++++++++++++++++++++++++++
>> > drivers/dpll/dpll_netlink.h |  14 +
>> > drivers/ptp/Kconfig         |   1 +
>> > drivers/ptp/ptp_ocp.c       | 169 +++++++---
>> > include/linux/dpll.h        |  29 ++
>> > include/uapi/linux/dpll.h   |  81 +++++
>> > 13 files changed, 1079 insertions(+), 36 deletions(-)
>> > create mode 100644 drivers/dpll/Kconfig
>> > create mode 100644 drivers/dpll/Makefile
>> > create mode 100644 drivers/dpll/dpll_core.c
>> > create mode 100644 drivers/dpll/dpll_core.h
>> > create mode 100644 drivers/dpll/dpll_netlink.c
>> > create mode 100644 drivers/dpll/dpll_netlink.h
>> > create mode 100644 include/linux/dpll.h
>> > create mode 100644 include/uapi/linux/dpll.h
>> > 
>> > -- 
>> > 2.27.0
>> > 
>
