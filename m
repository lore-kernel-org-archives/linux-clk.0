Return-Path: <SRS0=+7n/=PJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B402C43387
	for <linux-clk@archiver.kernel.org>; Tue,  1 Jan 2019 07:38:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 45128208E3
	for <linux-clk@archiver.kernel.org>; Tue,  1 Jan 2019 07:38:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="i6bHE1zw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbfAAHh4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Jan 2019 02:37:56 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40476 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728308AbfAAHh4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Jan 2019 02:37:56 -0500
Received: by mail-pl1-f193.google.com with SMTP id u18so13305386plq.7
        for <linux-clk@vger.kernel.org>; Mon, 31 Dec 2018 23:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=97y5ma4ufpzuFHgG4U4LHmitRQtAGbTe3kx87jknEPs=;
        b=i6bHE1zwmWlww+T4Cd55Y9VG3Pfp8hBrO0nxdoQRK7DAblxPvIGixOOUTTbWDyX4p7
         ftpB7iIE6MLRyreHVbtlD8I9ZugNvwrTqB/sy9CYSFlKpB/ijt1xTAKmE96I7iitZqkU
         F7ua5HgbvqIs3XwnJxwnurvRIoxhovZAz81MM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=97y5ma4ufpzuFHgG4U4LHmitRQtAGbTe3kx87jknEPs=;
        b=LTM6xrBra1XQgckdmoe3/qC+9AhTEtNCaQokD+HFcmylpu4ryZ1p/3WLRyHvmP392T
         d8CHdz8GBjtWWNMrlEh/2JcO8tjr6KYJft6ZYz6kTn8uZn6ayeXkYpbGpEX6eGYnaTBB
         /LEKmNOEO0cNPFPuy+E6HnJVRZ5M3fhPQqwi/Q2cVzYkOhK6tcWAlLLN90JI4HhruqDU
         N6sIvFyWduFFuqLf7Hii6uRLqQXakk18hVn7mfQ58lLCArhPcP9UEM+Vg47mr0GlYr0/
         mYA8GG7eiFZINfPRhhc2QQ5+9BPYs/GKpe3bhCqXIqzLzW/mn8aY+RbGxffT/UcMB4vj
         BQXA==
X-Gm-Message-State: AJcUukcBcJLwOhtx61IdTuydCjL3tr9C4uOuLFt9KPvtgI9DZ05tVEvk
        rLYb278/m5lyrWWlwOy7QCCg
X-Google-Smtp-Source: ALg8bN5uYQ8cKV0BX7QuhVvDPQ7pWu1/iXjsOY5XIo8XP/92WrjJFeyTxMG/vTQz3ARaX3iK8ZJO8Q==
X-Received: by 2002:a17:902:8e8b:: with SMTP id bg11mr40203473plb.332.1546328275746;
        Mon, 31 Dec 2018 23:37:55 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:6394:f979:3812:84fe:81d3:6fa8])
        by smtp.gmail.com with ESMTPSA id u87sm96116441pfi.2.2018.12.31.23.37.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Dec 2018 23:37:54 -0800 (PST)
Date:   Tue, 1 Jan 2019 13:07:45 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc:     Joe Perches <joe@perches.com>, sboyd@kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 6/6] MAINTAINERS: Add linux-actions mailing list for
 Actions Semi
Message-ID: <20190101073745.GA6711@Mani-XPS-13-9360>
References: <20181231185517.18517-1-manivannan.sadhasivam@linaro.org>
 <20181231185517.18517-7-manivannan.sadhasivam@linaro.org>
 <2a7f53c58896e2a9c3115a8630040b98497e5877.camel@perches.com>
 <20190101032622.GC2736@Mani-XPS-13-9360>
 <6c6cc111-ad1b-15eb-a1b0-3cbe8b5e5226@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c6cc111-ad1b-15eb-a1b0-3cbe8b5e5226@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jan 01, 2019 at 04:32:40AM +0100, Andreas Färber wrote:
> Am 01.01.19 um 04:26 schrieb Manivannan Sadhasivam:
> > On Mon, Dec 31, 2018 at 11:12:18AM -0800, Joe Perches wrote:
> >> On Tue, 2019-01-01 at 00:25 +0530, Manivannan Sadhasivam wrote:
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >> []
> >>> @@ -1240,6 +1240,7 @@ ARM/ACTIONS SEMI ARCHITECTURE
> >>>  M:	Andreas Färber <afaerber@suse.de>
> >>>  R:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >>>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> >>> +L:	linux-actions@lists.infradead.org (moderated for non-subscribers)
> >>>  S:	Maintained
> >>>  N:	owl
> >>
> >> The N: entry matches too many non-owl entries like:
> >>
> >> Documentation/parport-lowlevel.txt
> >> drivers/misc/ibmasm/lowlevel.c
> >> drivers/misc/ibmasm/lowlevel.h
> >> fs/udf/lowle
> >> vel.c
> >> net/ipv6/ip6_flowlabel.c
> >> sound/soc/samsung/lowland.c
> >>
> >> Maybe there should be two entries
> >>
> >> N:	/owl
> >> N:	-owl
> >>
> > 
> > Thanks for letting us know. Yes, we need to change it. How about below?
> > 
> > N: owl-
> > N: -owl
> 
> No underscores anywhere?
>

There is nothing with underscore yet and I don't think we'll add it in
future.

Thanks,
Mani

> Cheers,
> Andreas
> 
> > 
> > Will do it as a follow-up patch if agreed!
> > 
> > Regards,
> > Mani
> > 
> >>
> 
> 
> -- 
> SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
> GF: Felix Imendörffer, Jane Smithard, Graham Norton
> HRB 21284 (AG Nürnberg)
