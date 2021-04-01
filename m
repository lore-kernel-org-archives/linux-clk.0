Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 312E8C433B4
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 20:58:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C009610F9
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 20:58:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233710AbhDAU6l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Apr 2021 16:58:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234389AbhDAU6l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Apr 2021 16:58:41 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5695DC061788
        for <linux-clk@vger.kernel.org>; Thu,  1 Apr 2021 13:58:40 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id q26so3605019qkm.6
        for <linux-clk@vger.kernel.org>; Thu, 01 Apr 2021 13:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NvVk82m6hhIQriolRhQ8Z203iWxsgnrRsbJQOs66SaI=;
        b=Jp6vxVF8jtCYHT4xhyRLT1pBqz5GDZNABKErvGUTqaBEXVjovp2SdU6MbpSSRBmjcH
         gJ8hOJzEpvdOYZkV/hWKf40idl3T2ENatYEuD06xHrmvb27MsmEUFsqs1bhGOrCJDhhK
         fRtp8DUGhB4LRYsOA3XZqP9y9cAls0RiuNzZmnH8Q4+TNtYNxxL/L3ZaCsHUJZasXHO4
         a1Le0gjAvp/ZH5vvlpWedEtVlNsh7YMBAi+Gl2i3ap+nhtMe5wr6+lq+FZfvnuKeJ5Vt
         KlcIQa4rA9F1mZwjsjEQvrLtxvXwSVU7hF9govFej0Uh+/k/5nkGCsJr0eeh5LGMfsxL
         HmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NvVk82m6hhIQriolRhQ8Z203iWxsgnrRsbJQOs66SaI=;
        b=DY+m/4hpMpO3i8UU1IkbsYmBSxdjBrToGTHW3uSu4EihmCILKFNHqV/GkHhrUUcRve
         rrkr9MgOltT83F+skqBYSusEBOqgCw9nBTQYeF1YZXQ+4UCOxYbtP4E30hKXNcx52AIY
         KJ4pWSbFKoNoRlW9VI9E5YzWA6QKF2hF4SIoX7irhlRWMg40AY2e9QJhc1TOwgCkYNb+
         j6l6iqbH2FlZvcKGd4gjw0wTCfbRv07uMO0J2NCiAmEPnDWeFSbrAyK0DjiObvNL+DA5
         qTYjHEpz8I11CsGu4oV2UDuFQX5eCJ9XKLLBLEEIpZPZ5ezoBgFNt9IO0EMcoC6ofizP
         JRgA==
X-Gm-Message-State: AOAM530Oi+bnPg9WLvx0eZoPF2Qk6bEjTlBN4pH0wJiVxIj8UwHumxy5
        ZdzDiIUcCLwIiDPLpKBPyTfinaVbLGyZPMRXHQiV4w==
X-Google-Smtp-Source: ABdhPJx1rpyYOOJdxKZQYFzQB+5i85Rx/659TiPzXswfiJPztzBFR+4XKyLpkO9bQ2aHwsg+kn8kW/Pj6TKqMaeS2mU=
X-Received: by 2002:a37:a016:: with SMTP id j22mr10434149qke.486.1617310719561;
 Thu, 01 Apr 2021 13:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
 <20210325111144.2852594-7-dmitry.baryshkov@linaro.org> <4217c4a2-cb15-ef08-8c39-9a5f164d2b41@codeaurora.org>
 <CAA8EJpoNThCf-R8+CmjNWC9bGin8x60v-AjZrsm2x=ZE+UDjgw@mail.gmail.com> <161730706709.2260335.8947402948263904863@swboyd.mtv.corp.google.com>
In-Reply-To: <161730706709.2260335.8947402948263904863@swboyd.mtv.corp.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 1 Apr 2021 23:58:28 +0300
Message-ID: <CAA8EJprOTzjoN_Yz8M5qsdg-7FEsLaVnhN+xP3iwXxp5p6_2-A@mail.gmail.com>
Subject: Re: [PATCH v1 06/15] clk: qcom: videocc-sc7180: drop unused enum entries
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        DRM DRIVER FOR MSM ADRENO GPU 
        <linux-arm-msm@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 1 Apr 2021 at 22:57, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2021-03-27 01:13:56)
> > Hi Tanya,
> >
> > On Sat, 27 Mar 2021 at 04:49, Taniya Das <tdas@codeaurora.org> wrote:
> > >
> > > Hi Dmitry,
> > >
> > > Thanks for the patch for cleanup.
> > > It is okay to remove TEST source, but you can still keep the sleep clock
> > > source as it could be still connected to certain RCGs and could be used
> > > to derive low frequencies if required.
> > >
> > > As these sources are generated from the HW plans it would be good if we
> > > keep them as they are except the TEST source.
> >
> > Please note that I've barely removed the unused enum entry, which is
> > not used in any of clock parent maps. So I'd suggest to either add it
> > to relevant clock parent maps and to the videocc bindings or to drop
> > unused enum entry.
> >
>
> Is this going to be resent?

Is there a reason to resend the patches?
I'm not removing any actual clock sources, only unused(!) enum entries
are removed. No functional changes.


-- 
With best wishes
Dmitry
