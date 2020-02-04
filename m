Return-Path: <SRS0=s2jw=3Y=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E109C3524D
	for <linux-clk@archiver.kernel.org>; Tue,  4 Feb 2020 20:49:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2FD7E21741
	for <linux-clk@archiver.kernel.org>; Tue,  4 Feb 2020 20:49:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Jvi8QbyK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727451AbgBDUth (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Feb 2020 15:49:37 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:43827 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727412AbgBDUth (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Feb 2020 15:49:37 -0500
Received: by mail-ua1-f68.google.com with SMTP id o42so7243407uad.10
        for <linux-clk@vger.kernel.org>; Tue, 04 Feb 2020 12:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JDMn7tspiLbabREBPncdwnRL1LH/yW4VpIem+eMXcdY=;
        b=Jvi8QbyK+alPjB3i+rU2Ydb52K2Cr2ER4rlq6Ohk4VOaRNp3T+BkEDdEzkvR4yW9F0
         +3q3G2bto22tSH/jvMKXTBNdgwvUKeL72DKrAg8Lrd7M0vBvUcj6nT1GAMCxqtVlvVMD
         J97ugqLNv8AVmQrF7E6TIbQNA8POEkoe1hiak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JDMn7tspiLbabREBPncdwnRL1LH/yW4VpIem+eMXcdY=;
        b=kL5DMsVegGEaLN1r1CVr8JFGHR5Y9+Fb4+/5qfYlsgUi6laBe5vV3zwjaudjB7/Azf
         X/kX1Bv0gHf85WNURO8pCk/j2t72a9Gai+u5z0sMCRNXWpJUZDArKK75rAbUYLD6q+ke
         Mcp3MZYtz6pEcKnkGuNDZpLJJAbQ1Sfr2BLSdWlsfaHY+8trumgaDL+yg87EHMJGD10T
         yRQcNiRtnGpdlkpPZzDjA1Iis50TKO/oYLfT8igOnZHU+uuiP0iUgYPfK0ktyZngJfHm
         Ub+0QiOXNd+fmobaO3XyLiBinC8xYQRvqCrkYr/MQEcpkFyXafX/iY4PDQvVJBwB/PJV
         l1CQ==
X-Gm-Message-State: APjAAAUDpxmRNsDO1/clczbdx0zhrFpxFIupXVzpXTEvTuIDWk9lTMnM
        NpiGDJzOlWxl8llfJhIxQvWMrBU4qLc=
X-Google-Smtp-Source: APXvYqy/Z2LUZVYmhZir2wasgzgIU0fE5uLne7Fh0sd0yaBPKn1Cldg0hNnfyh+cBfUPjjmr235P3g==
X-Received: by 2002:ab0:21cb:: with SMTP id u11mr18070480uan.16.1580849376048;
        Tue, 04 Feb 2020 12:49:36 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id g140sm7803964vkf.18.2020.02.04.12.49.34
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 12:49:34 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id o200so5603163vke.4
        for <linux-clk@vger.kernel.org>; Tue, 04 Feb 2020 12:49:34 -0800 (PST)
X-Received: by 2002:ac5:c807:: with SMTP id y7mr18261663vkl.92.1580849373967;
 Tue, 04 Feb 2020 12:49:33 -0800 (PST)
MIME-Version: 1.0
References: <20200203183149.73842-1-dianders@chromium.org> <20200203103049.v4.11.I27bbd90045f38cd3218c259526409d52a48efb35@changeid>
 <20200204174900.45A5420674@mail.kernel.org>
In-Reply-To: <20200204174900.45A5420674@mail.kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 4 Feb 2020 12:49:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VaK6faWiAC1CHd081UzWCLEE42dHBq22ZyaSaUu8CXhA@mail.gmail.com>
Message-ID: <CAD=FV=VaK6faWiAC1CHd081UzWCLEE42dHBq22ZyaSaUu8CXhA@mail.gmail.com>
Subject: Re: [PATCH v4 11/15] dt-bindings: clock: Cleanup qcom,videocc
 bindings for sdm845/sc7180
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Tue, Feb 4, 2020 at 9:49 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Douglas Anderson (2020-02-03 10:31:44)
> > This makes the qcom,videocc bindings match the recent changes to the
> > dispcc and gpucc.
> >
> > 1. Switched to using "bi_tcxo" instead of "xo".
> >
> > 2. Adds a description for the XO clock.  Not terribly important but
> >    nice if it cleanly matches its cousins.
> >
> > 3. Updates the example to use the symbolic name for the RPMH clock and
> >    also show that the real devices are currently using 2 address cells
> >    / size cells and fixes the spacing on the closing brace.
> >
> > 4. Split into 2 files.  In this case they could probably share one
> >    file, but let's be consistent.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v4:
> > - Added Rob's review tag.
>
> I don't see it. I guess I should add it?

Whoops.  I knew I'd mess something like this up.  Looks like it got
pushed without his tag but I don't think it's a big deal.  For
reference, he added his tag in:

https://lore.kernel.org/r/CAL_Jsq+_2E-bAbP9F6VYkWRp0crEyRGa5peuwP58-PZniVny7w@mail.gmail.com

I did manage to remove the "/bindings" from the ID as he requested, so
at least I didn't mess up the important part...

-Doug


-Doug
