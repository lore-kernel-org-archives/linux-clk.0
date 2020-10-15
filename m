Return-Path: <SRS0=IVDQ=DW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA65C433E7
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 07:07:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF31E22247
	for <linux-clk@archiver.kernel.org>; Thu, 15 Oct 2020 07:07:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXrV4ZtR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbgJOHHz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Oct 2020 03:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727025AbgJOHHz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Oct 2020 03:07:55 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE600C061755
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2020 00:07:54 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id lw21so2043736ejb.6
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2020 00:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1kBMPwrsRtTtpL85vKyORBSjlZVBSWro1bYKWi5sSoY=;
        b=SXrV4ZtRTWZBx6nCrsO4/iccTgVnMMUFUt1xANSItx5agDtIdrWX6fuGmHJSBjcILr
         ZpPtWYoHFcLr6abYV8jbKi5x7GUuvZaJ7oP+kvIsav7RwmcVyJAW3+7uJ4oxIJWcXBC0
         4kAbBbkZVNUQ3IUvtRM/ZbVCOvzzi36ZwMvyctNmTRSz0FNh8t1OULIrCPf3xauJ/aK6
         DiQLjQAC6Y03NEHD4i4Q7wvyO5NLCWLAdtWClvFS/SgmxupVBqZKAxnoKXy6wdMRTFj6
         ItDnEWsRwHhrm64DcMXOB1WzMLD2uAOVS5jmrUsDcx2onQv+H6e5JNW/Y9oFdh0NmSRQ
         C01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1kBMPwrsRtTtpL85vKyORBSjlZVBSWro1bYKWi5sSoY=;
        b=mqkXydLvDUtvHa4n+jycXz1ApCqaf/Cq8kv0e2309DaNXYqvm7T7NqNdTQTuWecvNe
         LkZ/JmA8ycTkkkW+aUZIvaDQutRtkINYDS7lfiQqeXWS3DvSruQPvimJx42dMA3kb0ZI
         vrmTm1jN+5HnHMQtT17u1b9XJp2shRPNcaulzELvkdjOlrpYftI52m5p+RiYihpogQq7
         /yvlD44eRV/gcyLnEyx5ls+YK3EpSpD81cMBn8tdyjG8shRO4JpBMPUNaofpGUZjtiFi
         ij6Yjop+aKdPzik+/urRL9nzdmi5xyi2o6TzwATGdJjFQABO3byQCF9/v5JWbzM5+VY+
         1TsQ==
X-Gm-Message-State: AOAM533QOSmdmbyyQwEOFkRhFxQheYqZXhbHdH1pAfbHjF9mzoNuYo87
        nxf9uwEL5QbLo4ErGaYS9SIWcZqYshWw5m3Pd8A=
X-Google-Smtp-Source: ABdhPJwD2yPwK8S+cloaHlq2Wl4s0tGHxabny+9d/csYf+2/SXkY2yzxD5vWaFI5jpk2hJz9SzfuFQ7MDD9mrZoxGus=
X-Received: by 2002:a17:906:a119:: with SMTP id t25mr3149885ejy.67.1602745673533;
 Thu, 15 Oct 2020 00:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
 <CAA+hA=RjwtWLA1aSoNHakHDASrk0+EYy+ayPBw-7ninrYrWFJw@mail.gmail.com>
 <CAA+hA=Sa11AByUsKnsvhaH4HS_pdwfSv5P4192nnpRs_0vxk9w@mail.gmail.com>
 <CAA+hA=Qj5NV65N4pWJTCREkuxyw6GKKmSF8X4UXvr=Mmq9WpBA@mail.gmail.com>
 <AM6PR04MB4966AC7FCFB47A51A97D5C2980340@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <160253089964.310579.15879711282194567508@swboyd.mtv.corp.google.com>
 <CAA+hA=S_eO1orWerMPVCujgybFAcG0TCur8LumF5WtZF=zHg3w@mail.gmail.com> <160263606049.310579.2039950012647453863@swboyd.mtv.corp.google.com>
In-Reply-To: <160263606049.310579.2039950012647453863@swboyd.mtv.corp.google.com>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Thu, 15 Oct 2020 14:51:29 +0800
Message-ID: <CAA+hA=SSNZbXLynhJFbZQH1SkoNOA15GMvHJytPGW=HBNT5bZw@mail.gmail.com>
Subject: Re: [PATCH v7 00/11] clk: imx8: add new clock binding for better pm support
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Aisheng Dong <aisheng.dong@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Shawn,

On Wed, Oct 14, 2020 at 8:41 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dong Aisheng (2020-10-13 02:27:37)
> > On Tue, Oct 13, 2020 at 3:28 AM Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Aisheng Dong (2020-09-26 21:13:44)
> > > > Gently ping again...
> > > >
> > > > @Stephen Boyd
> > > > Could you kindly provide some feedback how we can proceed this?
> > > >
> > >
> > > Hmm I thought Shawn was going to apply this a while ago. Did that not
> > > happen? I guess I'll have to pile it in now.
> >
> > Now there's still one patch that does not have your R-b tags.
> > I guess Shawn is waiting for this.
> > Once you give the R-b tags, this series could go to Shawn's tree
> > as another DT patch set also depends on this.
> >
> > Would you help check this left one?
> > [PATCH v7 03/11] clk: imx: scu: add two cells binding support
> > All other patches already get yours R-b tags.
>
> Ok I see. Sent the tag now.

Thanks.

Shawn,
Would you apply this series?
Kindly let me know if you want a resend.

Regards
Aisheng
