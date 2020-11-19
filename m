Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE4EC6369E
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 17:45:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B42EC246E4
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 17:45:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZeiNnut"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729457AbgKSRpZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Nov 2020 12:45:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728649AbgKSRpZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Nov 2020 12:45:25 -0500
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2552CC0613CF
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2020 09:45:25 -0800 (PST)
Received: by mail-yb1-xb42.google.com with SMTP id 2so5946217ybc.12
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2020 09:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lDetejknLaUSSovij4ZnX5R4PCEm+d0eGVcmHX8A0CA=;
        b=RZeiNnutMY9tVL33BOXr/9+E3REQinUPqNhcOqCsNGQ6oAOt5wH5WjpvAMrYmoJsRO
         YAbyjzIyQviIFAT7hEUknzdCH6cpP2PUvuBcVFPbdLcSN4oj6U5gudx2zUK9cK2+rtXv
         96M2RN3jCqlQJn+w4uK48IjPomQaYeWP3FzfQqsNHApRAaIUyRafuoFAleu7G+mAAGWo
         T5ZiqgtGbeaLpnogg/ITO0XjpoL1L0mVRcsteM/GnwROIUn6JD7R1ZDhUNdhi5gTrM1d
         u68VsPDW7E/s+ImNRLKoSoxXp3/5Gv9AQWE7VuOWzqqmH+oUyo7twbgvMT6qmfCrMKMd
         VqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lDetejknLaUSSovij4ZnX5R4PCEm+d0eGVcmHX8A0CA=;
        b=fnixJzgsfTIuBQhVHu3c4zOlFrEnQzKeyVSg2nFNTtEkMYPk3KQ/aoxp3oFj5EVsC4
         vNCzxc31mtG76bpURSYmpYET0yoaZPpfXajLZKn4Kxy0r1T+F1ulZACxmwOCoGGDiSJs
         +F62mF5hrtHH2hCAMIB72MNgESz+8UXyYqW70HDeaqPeS+tkBZXK35r7LZ8k0t27hJxq
         aQgT8vRnVk8rY4BrMUvfDUvcMBpBvm3yWXYlNRl1CJrYNn2yRHIBGhnX1spGhh6GJ5qJ
         iDxs0KGxTP4YgXBdXKiBjUsjk4cGtwtVTldNnK/ExPx/uN7d/saAocryN480OpjXjfW8
         MAFA==
X-Gm-Message-State: AOAM530iHfsRxJpvtilvuFQ71ajyHPn33fif2pRVydDUstvgeQbRNzHZ
        KpDxkyBPZYM6NBUgXz01AhDN/F87qkd9BIeHn1E=
X-Google-Smtp-Source: ABdhPJxPm5fxE9uupf75b/arHPlZiey7tjDcCG/rljf78bWzlWsildCPx+xpeO24XY0gC4B7c1bLuB3G2UC34R2ETqM=
X-Received: by 2002:a25:d18c:: with SMTP id i134mr15322305ybg.448.1605807924097;
 Thu, 19 Nov 2020 09:45:24 -0800 (PST)
MIME-Version: 1.0
References: <20201119114302.26263-1-aisheng.dong@nxp.com> <20201119130800.boyqn4rtczq4wcvn@debian>
 <AM6PR04MB49667ACF83F057E5591E676080E00@AM6PR04MB4966.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB49667ACF83F057E5591E676080E00@AM6PR04MB4966.eurprd04.prod.outlook.com>
From:   Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date:   Thu, 19 Nov 2020 17:44:48 +0000
Message-ID: <CADVatmNW6L4xH99DVDK_T2y-DcDZQ0YtdpyQvTEK5kGRPOV9Pw@mail.gmail.com>
Subject: Re: [PATCH 1/1] clk: imx: scu: remove the calling of device_is_bound
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Nov 19, 2020 at 3:30 PM Aisheng Dong <aisheng.dong@nxp.com> wrote:
>
> > From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> > Sent: Thursday, November 19, 2020 9:08 PM
> >
> > Hi Dong,
> >
> > On Thu, Nov 19, 2020 at 07:43:02PM +0800, Dong Aisheng wrote:
> > > The device_is_bound() is unvisable to drivers when built as modules.
> > > It's also not aimed to be used by drivers according to Greg K.H.
> > > Let's remove it from clk-scu driver and find another way to do proper
> > > driver loading sequence.
> >
> > Greg was asking to use device_link for this issue. Have you tried something like
> > the following: (untested as I dont have the hardware).
>
> It can't work as expected because it requires supplier devices (scu pd) to be probed first.
> and if scu pd was probed first, then there're already no issues.

hmm.. thats odd. I was expecting that if "scu-pd" has not registered
then device_link_add() will return NULL and then imx_clk_scu_init()
will return -EPROBE_DEFER.


-- 
Regards
Sudip
