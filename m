Return-Path: <SRS0=uYlR=DU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C6ADC433E7
	for <linux-clk@archiver.kernel.org>; Tue, 13 Oct 2020 09:43:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 620982072D
	for <linux-clk@archiver.kernel.org>; Tue, 13 Oct 2020 09:43:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sCnGnsO5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727744AbgJMJnz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Oct 2020 05:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbgJMJny (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Oct 2020 05:43:54 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A8E1C0613D0
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2020 02:43:54 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id g4so20239523edk.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2020 02:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qNDcMDWtQ0sTEVWyZLkGjwcbJnpHDXbpA/QreJVbZfc=;
        b=sCnGnsO5W/n6wuA9IPLR4KnqzFLqwvhfCtvPxpqup/sBwnKxS5kS7HS7otg53wsm1K
         daQmiA15sYiKPuKYTbHtnUlxRu3x51XMqzCZvns5Qj9ShPUQy+j7W+BWH1zQ7cZjsAIb
         zZi/MvDntDvFVgCwpK2vB+hC8yTTyuxCmPifLMHxkAtJ+XfPJdTdchXuNjjXDMsLjMIL
         BeT5roYt3iqsrpgCQsOSowQUxCSg/Spa/MNyy415P07KeSLrsCH+PiOUNRLonHKQo7Ck
         3DHUgTE5eJUUWrPmAwWCsc1yPG0W4G4nvcO/D0Fyjts0ScXrzvxHjjFCIXWqFzR4ZlaN
         Hxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qNDcMDWtQ0sTEVWyZLkGjwcbJnpHDXbpA/QreJVbZfc=;
        b=NGFwpOLjCQP7XMWw4NX3zVB/iIOqi5TNaB4MtXb3HR/k0+DwrI7DM0dkSQTWxdoe3L
         L7KKDT4gupVTwhs8HWmY4VhTuOFVAzB3HuHt8keH15xEfbOyYV6eybYP3Mcrc8zibClZ
         Ug+NvA/8Iu+0UMWF+SLBW5FFvFjCdCyAqCxKwKEx+j6xAXLceUWDSIXXc+L3QkBXm66e
         SdDroBoe6gLBwbeC/tVvs/b54izH/96uzKr4uZw/Nfj/YmFcgqR4DiQOdquOdxFtqSyi
         PS6gNIKOP7p6ugrjz8FDncrhyJd+XxA5v483gVvY0gFIDHWjIi0Y1bkkaDT8C052HIfs
         UXyw==
X-Gm-Message-State: AOAM530Za11+Cvca64p2Aw3rowBFeuUGoA9yYe+V8SrzuNZZR17uMivo
        zrU7eIHq7cywiUaRohwXpBbJSUOsQDQ4xADansI=
X-Google-Smtp-Source: ABdhPJy8oKROqzX2cl21txfaU4ZYFq/daDddaS26zdH8EHNTZvE2dr36z8AbMLNEHfC191M4f2Qi9M6yyqYAuAaT6Jo=
X-Received: by 2002:a50:d5d8:: with SMTP id g24mr18700219edj.119.1602582233341;
 Tue, 13 Oct 2020 02:43:53 -0700 (PDT)
MIME-Version: 1.0
References: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
 <CAA+hA=RjwtWLA1aSoNHakHDASrk0+EYy+ayPBw-7ninrYrWFJw@mail.gmail.com>
 <CAA+hA=Sa11AByUsKnsvhaH4HS_pdwfSv5P4192nnpRs_0vxk9w@mail.gmail.com>
 <CAA+hA=Qj5NV65N4pWJTCREkuxyw6GKKmSF8X4UXvr=Mmq9WpBA@mail.gmail.com>
 <AM6PR04MB4966AC7FCFB47A51A97D5C2980340@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <160253089964.310579.15879711282194567508@swboyd.mtv.corp.google.com>
In-Reply-To: <160253089964.310579.15879711282194567508@swboyd.mtv.corp.google.com>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Tue, 13 Oct 2020 17:27:37 +0800
Message-ID: <CAA+hA=S_eO1orWerMPVCujgybFAcG0TCur8LumF5WtZF=zHg3w@mail.gmail.com>
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

Hi Stephen,

On Tue, Oct 13, 2020 at 3:28 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Aisheng Dong (2020-09-26 21:13:44)
> > Gently ping again...
> >
> > @Stephen Boyd
> > Could you kindly provide some feedback how we can proceed this?
> >
>
> Hmm I thought Shawn was going to apply this a while ago. Did that not
> happen? I guess I'll have to pile it in now.

Now there's still one patch that does not have your R-b tags.
I guess Shawn is waiting for this.
Once you give the R-b tags, this series could go to Shawn's tree
as another DT patch set also depends on this.

Would you help check this left one?
[PATCH v7 03/11] clk: imx: scu: add two cells binding support
All other patches already get yours R-b tags.

Shawn,
are you fine with this patch series to go through your tree?

Regards
Aisheng
