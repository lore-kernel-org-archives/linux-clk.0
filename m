Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B808C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 28 Oct 2021 21:25:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1856610FD
	for <linux-clk@archiver.kernel.org>; Thu, 28 Oct 2021 21:25:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbhJ1V12 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Oct 2021 17:27:28 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:39450 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbhJ1V1X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Oct 2021 17:27:23 -0400
Received: by mail-oi1-f172.google.com with SMTP id n11so2125926oig.6;
        Thu, 28 Oct 2021 14:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/+9j0oumdoKV8InadenLKw12l0iPTZFuQU7jD65clBY=;
        b=h9tb8XA8PWcN95QxRj99hStS3hrx0XyKglpgB6fpvml9RcgG1X5yFKd6Y8zs5ZLEQG
         QCzOZ87Niwp934h55ziEA34BPA5v3fgURMI3mV1dIPjVxPbh7Jy+Uzb75FgBLH+r9fbb
         OYA4Kdfo7VgDMlXlwDAzWD6qkwxby0Hi93PY97+VtZbS9ASnbo8BzqPnzYqQ9G3pElAG
         Q7YO3rqVdeDbpzQTSZd3PHB4PGHMTdsk7Pa7IX4SLQSdIgDPygWtWZeMpRYzHb86JX29
         B9ptH1XZeuxVNXDb79UwDbQUjZkrJ5j2TgwuPFCI6+KVm0IpWkTI3vbZag2uKWTCJP6L
         BF0w==
X-Gm-Message-State: AOAM532w7eMHaRzd3Szqsn3XTThxKKgpFyLnQ6VmrF6WNn+1LOc4BD6Y
        eqZs2b4q3ES2lxIRjeKVFg==
X-Google-Smtp-Source: ABdhPJyol7Yit1pUIy7/O5qZO+VYJE58ICg0rjn0sApJ5miSlwIo1r70+I6ulqza2tan5YOYq0HE7g==
X-Received: by 2002:a05:6808:158c:: with SMTP id t12mr10804924oiw.74.1635456287531;
        Thu, 28 Oct 2021 14:24:47 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 90sm1337639otj.70.2021.10.28.14.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 14:24:46 -0700 (PDT)
Received: (nullmailer pid 612214 invoked by uid 1000);
        Thu, 28 Oct 2021 21:24:45 -0000
Date:   Thu, 28 Oct 2021 16:24:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: rohm,bd71847-pmic: Document
 rohm,clock-output-is-critical property
Message-ID: <YXsVHRnzAWCFTPCo@robh.at.kernel.org>
References: <20211020084956.83041-1-marex@denx.de>
 <263da45f-d648-3c65-aed3-e4ba41927911@fi.rohmeurope.com>
 <4b3cc52c-a618-ea7d-6778-68060cfadf8e@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b3cc52c-a618-ea7d-6778-68060cfadf8e@denx.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Oct 20, 2021 at 01:06:13PM +0200, Marek Vasut wrote:
> On 10/20/21 12:14 PM, Vaittinen, Matti wrote:
> [...]
> 
> > I wonder if this really is something specific to ROHM ICs? Do you think
> > this would warrant a generic, non vendor specific property? I am Ok with
> > the ROHM specific property too but it just seems to me this might not be
> > unique to ROHM IC(s).

I imagine we debated the need for a DT property when critical clocks was 
added to the kernel.

> > By the way, the very same clk driver where you implemented the property
> > reading (patch 2/2) is used by few other ROHM PMICs. At least by
> > BD71837, BD71828, BD71815, BD9576 and BD9573. So the code change here
> > adds support for this property to all of those PMICs. I wonder if the
> > property should be mentioned in all of the binding docs... That could be
> > another argument for making this a generic property and describing it in
> > clk yaml ;)
> > 
> > Well, just my 10 Cents - I am ok with this change as you presented it
> > here if you don't think this should be generic one.
> 
> I think we need something like gpio-hog, except for clock. Some clk-hog
> maybe ? That would be useful not only here, but also for things where some
> output generates clock for random stuff which cannot be described in the DT
> for whatever reason (like e.g. the SoC is used as a substitute for CPLD XTAL
> and the CPLD isn't connected to the SoC in any other way).

The justification given in this patch was for an SoC input which should 
get described so that the clock is handled and kept enabled properly.

The CPLD case would be more interesting, but is there an actual need or 
just a possible case?

You could use the 'protected-clocks' property here. Maybe that's a bit 
overloaded between can't access and don't turn off. But what it means is 
really up the clock controller.

Rob
