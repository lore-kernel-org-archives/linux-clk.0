Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333FBC43334
	for <linux-clk@archiver.kernel.org>; Thu,  9 Jun 2022 13:49:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239635AbiFINtU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Jun 2022 09:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239721AbiFINtT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Jun 2022 09:49:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5A2F61CB14
        for <linux-clk@vger.kernel.org>; Thu,  9 Jun 2022 06:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654782557;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lOewZ2eDzpAjQpR88n3nji2pXFHQbP97PrCw1r3vUWo=;
        b=FN63XaoPASw3CIWlVPhfGiFiQG6uuNh91pCJcagVpgZLnddkrBN2MmOc3RIGov9wp6ve91
        lPZ/unYXjWd6sB/3juksM6kvH4m0lV83Ge2sUbI2Fc9YrvWoJj98cTMlu84LSka6Tx3DNY
        n0b3S5WnRxNc4YZ3/Bf5U5Sra01uBN0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-VNszZQDSOBy2W_vBdx3iJQ-1; Thu, 09 Jun 2022 09:49:14 -0400
X-MC-Unique: VNszZQDSOBy2W_vBdx3iJQ-1
Received: by mail-qk1-f200.google.com with SMTP id j11-20020a37c24b000000b006a6bd97578aso9567433qkm.15
        for <linux-clk@vger.kernel.org>; Thu, 09 Jun 2022 06:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lOewZ2eDzpAjQpR88n3nji2pXFHQbP97PrCw1r3vUWo=;
        b=pNDW+6i3LkFWDF1KsxpR+T0codu/owIWKiWC/pKuiia9obF2hMRelXDuPCG6EkDEo4
         dLoH2pUrTrzkCGnxObGpI6YECln88m9e/OfXyvlyWWpxbs8qg82OSC9431aQ5MXKqk4m
         msMgy5vulSFuQe8hpMdtYflHR1oHwQ0cRs/KwFjHCsixZhJ3xnpF27u2Z6jtmAu4HkIi
         dzfijVRrYmgu6qaB0F2T0tDRfGPnc48ALWa16CnwveNxhMbbtrMt2iug/Gjx4BACpzuU
         AiKmqE3cZNLoGzLLUQtFMyKPvJ1rOaSZTtcxWzmvxXUidFblxcoBZTczeHuc3fotCemr
         kD7A==
X-Gm-Message-State: AOAM533BPEE4Plx0hLn0CY+LRvbmmO4p06XpkqamWKbctVSdVxfVKYyn
        w/uDGXlZslisX60LVHRZHeABsXLJgBBGA764Addo0Pcqw1XCybl7dXrtgmvAvJJte1MhMIXpDH+
        HBnAnLMbhpEgU2pIWvrCa
X-Received: by 2002:a05:6214:2406:b0:464:41bb:3582 with SMTP id fv6-20020a056214240600b0046441bb3582mr29016765qvb.3.1654782553853;
        Thu, 09 Jun 2022 06:49:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIQ+lnH1PJb1CfB0MllWVq08fBjPi4efChc8Ezpwo0RGCx3QWvy+fWH4qsU3Z5DqlUHJ5BAw==
X-Received: by 2002:a05:6214:2406:b0:464:41bb:3582 with SMTP id fv6-20020a056214240600b0046441bb3582mr29016744qvb.3.1654782553590;
        Thu, 09 Jun 2022 06:49:13 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::48])
        by smtp.gmail.com with ESMTPSA id s3-20020a05620a0bc300b006a66f3d3708sm20920889qki.129.2022.06.09.06.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 06:49:13 -0700 (PDT)
Date:   Thu, 9 Jun 2022 08:49:11 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gdsc: Bump parent usage count when GDSC is
 found enabled
Message-ID: <20220609134911.xmk5x6qbfu5r7nmd@halaneylaptop>
References: <20220606212112.3617731-1-bjorn.andersson@linaro.org>
 <20220607121548.fhzpjcmoahlkue4t@halaneylaptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607121548.fhzpjcmoahlkue4t@halaneylaptop>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jun 07, 2022 at 07:15:48AM -0500, Andrew Halaney wrote:
> On Mon, Jun 06, 2022 at 02:21:12PM -0700, Bjorn Andersson wrote:
> > When a GDSC is found to be enabled at boot the pm_runtime state will
> > be unbalanced as the GDSC is later turned off. Fix this by increasing
> > the usage counter on the power-domain, in line with how we handled the
> > regulator state.
> > 
> > Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/clk/qcom/gdsc.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> > index 44520efc6c72..a1fa7c4cff60 100644
> > --- a/drivers/clk/qcom/gdsc.c
> > +++ b/drivers/clk/qcom/gdsc.c
> > @@ -420,6 +420,9 @@ static int gdsc_init(struct gdsc *sc)
> >  				return ret;
> >  		}
> >  
> > +		/* ...and the power-domain */
> > +		gdsc_pm_runtime_get(sc);
> > +
> >  		/*
> >  		 * Votable GDSCs can be ON due to Vote from other masters.
> >  		 * If a Votable GDSC is ON, make sure we have a Vote.
> > -- 
> > 2.35.1
> > 
> 
> Makes sense to me!
> 
> Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

Gah, too trigger happy -- I missed checking the return of
gdsc_pm_runtime_get() as Stephen pointed out in his reply.
I think with that in place feel free to add my R-B.

Thanks,
Andrew

