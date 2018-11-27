Return-Path: <SRS0=WhJS=OG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE1EC43441
	for <linux-clk@archiver.kernel.org>; Tue, 27 Nov 2018 19:26:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D5AB6208E4
	for <linux-clk@archiver.kernel.org>; Tue, 27 Nov 2018 19:26:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="irsWlRL2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5AB6208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbeK1GZk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Nov 2018 01:25:40 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:40724 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbeK1GZj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Nov 2018 01:25:39 -0500
Received: by mail-ua1-f68.google.com with SMTP id n7so8022073uao.7
        for <linux-clk@vger.kernel.org>; Tue, 27 Nov 2018 11:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fT92pSQBkH2Kacv5dZWsTSHpUZMrE0kewaDsRcZSiu8=;
        b=irsWlRL2tt7r8w+QiQ/VULh6PG9bDa7DSELPb7rfeihLiX6Cywt/HEk//FQ+gOFSm1
         K/qbYwH2jJr3OrzGalalVksxUtn8xlBCUh3+S6II5x+h9FX+kV/zqvcc5I8rzm9ZtUlV
         xfHRhq1mrPBsCrv7VePEgRetKTXZBywy10USg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fT92pSQBkH2Kacv5dZWsTSHpUZMrE0kewaDsRcZSiu8=;
        b=uOZQ+apMYXeq58UXJ4wi0KnrBSCwfXreH39K/8HgcLbZnOhS6F+Eufs0Z9M8dNoFgf
         XI/khxipjI/Fje5fRLdS5Ohhdp2r9eK7q1e6bnZs4lFqdgPg0CW/+b6kRBR+MYQ5LWP0
         IcWuWJs6xwDuG/g56OUS/lAe5DiCeaJU3uF/Rrjpf47DFWjLJOHTz75p0zhYdYAz05P6
         VR18+xn/r/Z1zxSspVLH4Hyix6/vETnIpkDxv8M9CriEOEM0z4ocahax92fSQ6pRJh0P
         lSYj5U/DtAFy2u8OfyvP7GT3ytPSx4Liy7bgHqnBRG7xvW7bZlVuCOmyPGC2j3w7k3OR
         m1ew==
X-Gm-Message-State: AA+aEWb49IVb3ZZaVEPaSAgaJEIO+imJ2Go2UbwuzpiDzlAzsIuTopTV
        m+fCuu6WOTIWm9NVVoc8tTofFYk8o0M=
X-Google-Smtp-Source: AFSGD/VOSIUpwQnIY71uWT9eFzUKZ+8QeQfxVAt0XYATsf5W3xk2eUdBN38EhF+kXTwyRLGkexi4Pg==
X-Received: by 2002:ab0:5b9b:: with SMTP id y27mr14237342uae.30.1543346803175;
        Tue, 27 Nov 2018 11:26:43 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id g14sm1584398uah.10.2018.11.27.11.26.42
        for <linux-clk@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Nov 2018 11:26:42 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id j3so8031186uap.3
        for <linux-clk@vger.kernel.org>; Tue, 27 Nov 2018 11:26:42 -0800 (PST)
X-Received: by 2002:a9f:2bc6:: with SMTP id f6mr13743866uaj.52.1543346801602;
 Tue, 27 Nov 2018 11:26:41 -0800 (PST)
MIME-Version: 1.0
References: <1541414117-27864-1-git-send-email-tdas@codeaurora.org>
 <CAD=FV=X3C=oKep1kPWjasLDZdFKfhCs0JMWTOensgYDj=apvuQ@mail.gmail.com> <154330186815.88331.12720647562079303842@swboyd.mtv.corp.google.com>
In-Reply-To: <154330186815.88331.12720647562079303842@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 27 Nov 2018 11:26:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XoriDM2Dmj0bYwbqZ+ej6Ybf_XX5DOTSW1_X3eGRkohQ@mail.gmail.com>
Message-ID: <CAD=FV=XoriDM2Dmj0bYwbqZ+ej6Ybf_XX5DOTSW1_X3eGRkohQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: sdm845: Add videocc node
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <andy.gross@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Mon, Nov 26, 2018 at 10:57 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> > > +               videocc: clock-controller@ab00000 {
> > > +                       compatible = "qcom,sdm845-videocc";
> > > +                       reg = <0xab00000 0x10000>;
> > > +                       #clock-cells = <1>;
> > > +                       #power-domain-cells = <1>;
> >
> > Any reason not to include "#reset-cells = <1>;" here?  The bindings
> > list it as optional but I see no reason why we should leave it off.
> > The file "include/dt-bindings/clock/qcom,videocc-sdm845.h" seems to
> > include some #defines for resets.  Even though the driver doesn't seem
> > like it supports it yet, it still should be fine to list it here.
>
> We should update the binding to make it a required property. It doesn't
> make any sense why that property would be optional given that the
> hardware either has support for resets or it doesn't.

Patch sent for the bindings change.

https://lkml.kernel.org/r/20181127192443.136158-1-dianders@chromium.org
