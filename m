Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF64C4332F
	for <linux-clk@archiver.kernel.org>; Thu,  3 Nov 2022 18:19:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbiKCSTN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Nov 2022 14:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbiKCSTM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Nov 2022 14:19:12 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11DFD13D50
        for <linux-clk@vger.kernel.org>; Thu,  3 Nov 2022 11:19:11 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id f37so4210056lfv.8
        for <linux-clk@vger.kernel.org>; Thu, 03 Nov 2022 11:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkYzItvrSUXCjUZclqVlz4B1VRMJvcHSmP7Vz+/CqCc=;
        b=Ql3Wst5IDeTBu02tDij8+8WotMSKPkvfwkpBGQrs5DCDmlReH9R39/cKMIGZ9nQTw4
         CTNpSr+1rRsxJju1xOVWyv58dG7vruDtKj2QiyrwZZlt55RVpxRZMSd1GUviTtWFTlQt
         bE6yo4OanX1qxxPqrtbBfkv3g2/e5P7r/JJ4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkYzItvrSUXCjUZclqVlz4B1VRMJvcHSmP7Vz+/CqCc=;
        b=787MrhTtWZszAdyE6okaLCB7dG7fUAYnHE/Pb/ZmywuXi3HUqq6UPpVreIC8CZgqC4
         TWfLDMJUxR0hc4rP01Ci3GAQms0S4u0Ym0L9j/Z+FnvR0/ErDOzKQoZfpHDwlTsQHEiS
         IfDsVVBEwEO0cFVhFprF3zeQG/O0TxYul+SI0Lc+N6mEYbXNU+GFDdXM4P2AUFgimpht
         OZokaqSkOt+7OPbf7aZMEYYKKxF+U3bus0GlKJ7HoYyYBg/RLSNr5XsjF8TR0gUTBAS8
         F/Ebg7DNdzCeIZSQtWX7Vp5X607JKrLZW7BK/irjcUSpe8bO9FRFe35d2x58GrXi0ReI
         bEBw==
X-Gm-Message-State: ACrzQf1SgTpMrRSevf2lxzaQG4ILO6fhh1XcJXtF+4TEl7ci8pD9UEfV
        qIWxB7ERko/Kt+0ZQu4R8soEEtu1WJb4y6Ms+6YVRg==
X-Google-Smtp-Source: AMsMyM50DKyuqpFk3z0RRrS/jQXXsTcb+YgJ2uT1ZBFhUVkjX0OEggksGtq8mwZhheS/vIGyWyzlrWJVtBWPTzBnqNs=
X-Received: by 2002:a05:6512:3403:b0:48c:9727:50b0 with SMTP id
 i3-20020a056512340300b0048c972750b0mr11849146lfr.309.1667499549321; Thu, 03
 Nov 2022 11:19:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Nov 2022 11:19:08 -0700
MIME-Version: 1.0
In-Reply-To: <Y2PAXX2oYL6iFTlB@hovoldconsulting.com>
References: <20221101233421.997149-1-swboyd@chromium.org> <Y2JL9/HFrb3E+CYY@hovoldconsulting.com>
 <CAE-0n51Wuc6gVmsTOu4Nf4yx+6Wp-Oi3XZy06syhCMVmePWPEw@mail.gmail.com> <Y2PAXX2oYL6iFTlB@hovoldconsulting.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Nov 2022 11:19:08 -0700
Message-ID: <CAE-0n5319JSX16Z3H5vKQSL9UDetOdfb38zo_vp0C=uX1jddWQ@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gdsc: Remove direct runtime PM calls
To:     Johan Hovold <johan@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, patches@lists.linux.dev,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Johan Hovold (2022-11-03 06:21:33)
> On Wed, Nov 02, 2022 at 09:53:49AM -0700, Stephen Boyd wrote:
> > Quoting Johan Hovold (2022-11-02 03:52:39)
>
> > > > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > Cc: Johan Hovold <johan+linaro@kernel.org>
> > > > Cc: Ulf Hansson <ulf.hansson@linaro.org>
> > > > Cc: Taniya Das <quic_tdas@quicinc.com>
> > > > Cc: Satya Priya <quic_c_skakit@quicinc.com>
> > > > Cc: Douglas Anderson <dianders@chromium.org>
> > > > Cc: Matthias Kaehlcke <mka@chromium.org>
> > > > Reported-by: Stephen Boyd <swboyd@chromium.org>
> > >
> > > We typically don't add Reported-by tags for bugs we find and fix
> > > ourselves.
> >
> > Heh, I didn't see anything like that in Documentation/ so it seems fine.
> > I debugged my problem and reported it.
>
> I'd say the documentation is pretty clear on this matter:
>
>   Reported-by: names a user who reported a problem which is fixed by this
>   patch; this tag is used to give credit to the (often underappreciated)
>   people who test our code and let us know when things do not work
>   correctly.
>
>   - Documentation/process/5.Posting.rst
>
>   The Reported-by tag gives credit to people who find bugs and report
>   them and it hopefully inspires them to help us again in the future.
>   Please note that if the bug was reported in private, then ask for
>   permission first before using the Reported-by tag.
>
>   - Documentation/process/submitting-patches.rst

I don't see anything above that says I can't add this tag if I reported
(by sending an email about the problem to the list), debugged, and
solved the problem by sending a patch.

>
> Just like you don't add a Tested-by tag for every patch you submit, it
> is implied that you found the issue you fix unless you explicitly
> attribute that to a third party using Reported-by.

I don't see how this is the same. It certainly is not explicit, as you
say.

I wouldn't have added the tag if I didn't send an email to the list with
the lockdep splat and follow that up with a bisection report for
suspend/resume being broken. Shouldn't we value those sorts of bug
report emails? I will add a link to the report in the commit text to
clarify.

>
> This is the first time I see anyone trying to use Reported-by this way,
> and even if you think the documentation isn't clear enough on this, our
> praxis is.
>

Ok, so is it just a shock to see this for the first time? What is the
problem with the tag? Can you elaborate on your concerns? I would like
to understand.
