Return-Path: <SRS0=5IOi=M5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC72C5ACCC
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 02:57:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4538D214C4
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 02:57:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="XvMwPKnF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4538D214C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727353AbeJQKuq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 06:50:46 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40372 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727357AbeJQKul (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Oct 2018 06:50:41 -0400
Received: by mail-pl1-f195.google.com with SMTP id 1-v6so11937565plv.7
        for <linux-clk@vger.kernel.org>; Tue, 16 Oct 2018 19:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ff12+Pu8Xbp0aBuOhuiDomuzkIHYVm2v0rQ8Xhsd4+c=;
        b=XvMwPKnFPObnC32yMzHQq7IPMmERPn+pEBp906KJKbUv0+l2KcS9M3PC2UmMtkPRU2
         O6fHZR5uQ6wk3QLNuVsxB/yc0A2T2VVXU4yZMMFmIb1PbsGaGzmWOCH+vFNMGh8nemot
         RkBKyOuPceh3byoHD0oyzpYAe82I7kwASNIJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ff12+Pu8Xbp0aBuOhuiDomuzkIHYVm2v0rQ8Xhsd4+c=;
        b=fTgVxwLiiw1jul3sYWhpzY6iGn/2z9bIk4i1hqyIWx4ZS4mkzLZNYj0ZiNWmod69yt
         32Y0QFCAew/hZzJdlBJmgXuDqOgXUgCd7LaJmoHUPXcOsrP4GVM8qn9G8L/brmurb2WI
         YXoCArLZUxuJ0sAb4TedBC9nxY3q4iotmg6JaXT33SO7YEeSMXyYZy0euqHwWo4gGhcx
         RzqLHWs2gomHh2kvpHBnGNuWlxqDuiVkFNKowxBHZVZhcKfJwFbA2NxIkpxpUFWpzApz
         1btcqDtAZTqQ9z0kSmgRP9h/f3wDwjPFVirV9G56JeXOAYffJCi7Hgg1G5C+ba/5Omkl
         utTw==
X-Gm-Message-State: ABuFfoi9bU33KGITXMMyerIbIMCQRkWRbxQmonnRc/GyDCN5pbLHj6Pe
        8zq6ss0v7Pc7jsDPbx5SuGRg
X-Google-Smtp-Source: ACcGV61v2G9TKHELQyqtyj3XYVzTaiDZfULapX3pgiO8Zacyh178/FI/FWUeEFhIpRsQjPodlcdy2w==
X-Received: by 2002:a17:902:4103:: with SMTP id e3-v6mr23945355pld.236.1539745032171;
        Tue, 16 Oct 2018 19:57:12 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6305:1a9d:4c38:eda8:7f99:11d3])
        by smtp.gmail.com with ESMTPSA id a1-v6sm24399721pfj.38.2018.10.16.19.56.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Oct 2018 19:57:11 -0700 (PDT)
Date:   Wed, 17 Oct 2018 08:26:55 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     afaerber@suse.de, mturquette@baylibre.com, p.zabel@pengutronix.de,
        robh+dt@kernel.org, linux-clk@vger.kernel.org,
        liuwei@actions-semi.com, mp-cs@actions-semi.com,
        96boards@ucrobotics.com, devicetree@vger.kernel.org,
        daniel.thompson@linaro.org, amit.kucheria@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        hzhang@ucrobotics.com, bdong@ucrobotics.com,
        manivannanece23@gmail.com, thomas.liau@actions-semi.com,
        jeff.chen@actions-semi.com, pn@denx.de, edgar.righi@lsitec.org.br,
        sravanhome@gmail.com
Subject: Re: [PATCH v3 6/9] arm64: dts: actions: Add Reset Controller support
 for S900 SoC
Message-ID: <20181017025655.GA2888@Mani-XPS-13-9360>
References: <20180810095113.25292-1-manivannan.sadhasivam@linaro.org>
 <20180810095113.25292-7-manivannan.sadhasivam@linaro.org>
 <153972613980.5275.10581925529054373344@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <153972613980.5275.10581925529054373344@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Oct 16, 2018 at 02:42:19PM -0700, Stephen Boyd wrote:
> Quoting Manivannan Sadhasivam (2018-08-10 02:51:10)
> > Add reset controller property and bindings header for the
> > Actions Semi S900 SoC DTS.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> 
> Are these DT patches necessary for me to apply the clk patches? I'd like
> to apply the clk patches without these dts bits.
>

Not necessary, you can just apply the clk and bindings patches. DTS patches
will go through Actions tree.

Thanks,
Mani

> >  arch/arm64/boot/dts/actions/s900.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/actions/s900.dtsi b/arch/arm64/boot/dts/actions/s900.dtsi
> > index aa3a49b0d646..4fbb39fd7971 100644
> > --- a/arch/arm64/boot/dts/actions/s900.dtsi
> > +++ b/arch/arm64/boot/dts/actions/s900.dtsi
> > @@ -6,6 +6,7 @@
> >  
> >  #include <dt-bindings/clock/actions,s900-cmu.h>
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/reset/actions,s900-reset.h>
> >  
> >  / {
> >         compatible = "actions,s900";
> > @@ -172,6 +173,7 @@
> >                         reg = <0x0 0xe0160000 0x0 0x1000>;
> >                         clocks = <&hosc>, <&losc>;
> >                         #clock-cells = <1>;
> > +                       #reset-cells = <1>;
> >                 };
> >  
> >                 pinctrl: pinctrl@e01b0000 {
> > -- 
> > 2.17.1
> > 
