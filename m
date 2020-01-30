Return-Path: <SRS0=on/j=3T=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324B5C2D0DB
	for <linux-clk@archiver.kernel.org>; Thu, 30 Jan 2020 18:17:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 00EA32082E
	for <linux-clk@archiver.kernel.org>; Thu, 30 Jan 2020 18:17:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BfQG+oTC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728847AbgA3SRv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Jan 2020 13:17:51 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:32833 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728845AbgA3SRv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jan 2020 13:17:51 -0500
Received: by mail-ua1-f65.google.com with SMTP id a12so1541116uan.0
        for <linux-clk@vger.kernel.org>; Thu, 30 Jan 2020 10:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CJPY+g/XzCm6UWO3D8mKRxGxfTcXSUIYOUXNI4GNTD8=;
        b=BfQG+oTCMVxlg4wY8DUnH37t9rAIzLS4W4kBKdZBWR+QzaPeVDDSBBXOCM5jcqS184
         7z/yo+l0hDOZzpC2ERgZFxmFpmjwHGcZ8UyGlvlgloFIb0V9DTOjRoWcGbjeL6/SP5o6
         5UvCzcjJvRoIprtS7ojhc5t5+b4RMuK+mt/xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CJPY+g/XzCm6UWO3D8mKRxGxfTcXSUIYOUXNI4GNTD8=;
        b=ZKX7iBcC8OJ8VzKIjoSgHilcmx0YgS45gDr4fdftfTbktn32B98VtaC5sHUHq0qkhJ
         3OI6P7SrMcZvpiMVhX9xezr05Y0xHc4zsidmK8gHnD7ootKSy1lPxIdhXbFcP/8MupGV
         fo3Ax5CFJSCuPgP6DN7vIbZNo5CCppBqOOZsfe0Lvjbmvi8ijKuHHS1qU/g6oJrDZmOY
         xOyMWBR9Bu08Wub73DHiOyu9SfkOCdOL3+J7UAI4e75Lv5UDKLoWERhZjAEpc9Wqlu7P
         aD0raprOe5rQ/ZnjRvZzt8RocNH30gidEgebZJO9hicXR2HDsCec6acaV1Z0Z1Ki/sws
         JNzw==
X-Gm-Message-State: APjAAAVR50cBvojpvkGxzfFORdQ9RM3zHeBSMyvh34pl/NLth44BVjik
        ZiidtEAWE/6BHLcx+tgFdNAO3t2vx1k=
X-Google-Smtp-Source: APXvYqyPftqHWZfh76xqa+u7D8mxjaAQtjQQfBqWJZjvBP4WVvFdD3u+Ki0FXFLKUSWV8jWb0ftfLw==
X-Received: by 2002:ab0:488b:: with SMTP id x11mr3435632uac.86.1580408270418;
        Thu, 30 Jan 2020 10:17:50 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id x22sm1564843vsq.6.2020.01.30.10.17.49
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2020 10:17:49 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id 59so1512864uap.12
        for <linux-clk@vger.kernel.org>; Thu, 30 Jan 2020 10:17:49 -0800 (PST)
X-Received: by 2002:ab0:254e:: with SMTP id l14mr3487338uan.91.1580408268842;
 Thu, 30 Jan 2020 10:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20200129152458.v2.1.I4452dc951d7556ede422835268742b25a18b356b@changeid>
 <20200130180404.6771A2083E@mail.kernel.org>
In-Reply-To: <20200130180404.6771A2083E@mail.kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 30 Jan 2020 10:17:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xvw+oA70+JG-5wMy+0v5M324idQRJsujVbNnBtEF2gvQ@mail.gmail.com>
Message-ID: <CAD=FV=Xvw+oA70+JG-5wMy+0v5M324idQRJsujVbNnBtEF2gvQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: clk: qcom: Fix self-validation, split,
 and clean cruft
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Taniya Das <tdas@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Abhishek Sahu <absahu@codeaurora.org>, sivaprak@codeaurora.org,
        anusharao@codeaurora.org, Sricharan <sricharan@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Thu, Jan 30, 2020 at 10:04 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> > Misc cleanups as part of this patch:
> > - sm8150 was claimed to be same set of clocks as sc7180, but driver
> >   and dts appear to say that "bi_tcxo_ao" doesn't exist.  Fixed.
>
> Someone will probably want to change this at some point.

I have no insight into sm8150, but I guess I assumed that since it
wasn't in the driver that maybe sm8150 just doesnt have this hookup?
I'm happy to add it back in.


> > +description:
> > +  Qualcomm global clock control module which supports the clocks, resets and
> > +  power domains on APQ8064.
>
> It would be great if this could also point to the
> include/dt-bindings/clock/qcom,apq8064.h file here. If you don't resend
> this patch then I will try to remember to make this addition to the
> binding docs.

You're saying that the top-level description for all these should
point to the header file?  Seems line a sane idea.  I guess we'd need
to do that for all of them?  I could spin with that if you want, but
we could also do a follow-up patch?

-Doug
