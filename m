Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47C1C4332F
	for <linux-clk@archiver.kernel.org>; Mon,  3 Oct 2022 08:42:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbiJCIl7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Oct 2022 04:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbiJCIll (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Oct 2022 04:41:41 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7343C5A3EA;
        Mon,  3 Oct 2022 01:16:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0904FB80E6D;
        Mon,  3 Oct 2022 08:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2A4C433D6;
        Mon,  3 Oct 2022 08:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1664784993;
        bh=kTDmwPfLGmXZrqG5rj4Hg4GoLOQ1rOubtd4cLIZsMQY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l9FDqNvbhfcyt+VzddHugKCubtrGwP3xVINRk7suOCRjMtW7gKVE7toh7olNdi0W2
         mltz0/fMOyLUna5hiiMJZgpfzYvv4Nze/Bu4L4v30Dx/VK5JDSk/PLwYYRUmeRVBBO
         HHhQaVdS8WMoDJucKrJYgx+z/SSWgIIOYWxyLkpY=
Date:   Mon, 3 Oct 2022 10:16:30 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-clk@vger.kernel.org, git@amd.com, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org,
        mturquette@baylibre.com
Subject: Re: [PATCH 1/2] dt-bindings: clk: Add binding for versal clocking
 wizard
Message-ID: <YzqaXthSLBbwU+5V@kroah.com>
References: <20220930080400.15619-1-shubhrajyoti.datta@amd.com>
 <20220930080400.15619-2-shubhrajyoti.datta@amd.com>
 <CAL_JsqLaqjZeZd3c-fd9f5m-4OCXgOZcOu+paik9FV_eno5sLg@mail.gmail.com>
 <afb3f19f-eb40-5453-a82b-295e06861f86@amd.com>
 <20220930213924.GA1079711-robh@kernel.org>
 <6e58837e-896c-7069-7913-2afb90af5e95@amd.com>
 <b495804c-cf04-4512-ac05-424eded46468@linaro.org>
 <57989d3e-a186-1d67-cff9-6a059f94ebd3@amd.com>
 <f611237f-0401-9e3c-3a21-79b33141bb51@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f611237f-0401-9e3c-3a21-79b33141bb51@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Oct 03, 2022 at 10:10:38AM +0200, Krzysztof Kozlowski wrote:
> On 03/10/2022 09:58, Michal Simek wrote:
> > 
> > 
> > On 10/3/22 09:23, Krzysztof Kozlowski wrote:
> >> On 03/10/2022 09:15, Michal Simek wrote:
> >>>>> And this is new IP. Not sure who has chosen similar name but this targets
> >>>>> Xilinx Versal SOCs. Origin one was targeting previous families.
> >>>>
> >>>> Do we need a whole new schema doc?
> >>>
> >>> It is completely new IP with different logic compare to origin one.
> >>>
> >>>>
> >>>> It is not ideal to define the same property, xlnx,nr-outputs, more than
> >>>> once. And it's only a new compatible string.
> >>>
> >>> I can't see any issue with using dt binding for xlnx,clocking-wizard.yaml
> >>>
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> >>
> >> So we already have out of staging document:
> >> devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> > 
> > in 6.1 yes.
> > 
> >>
> >> and author wants to add one more:
> >> devicetree/bindings/clock/xlnx,clk-wizard.yaml
> > 
> > as I said it is completely different IP which requires complete different driver 
> > but IP designers choose similar name which is out of developer control.
> > 
> >>
> >> Shall we expect in two years, a third document like:
> >> devicetree/bindings/clock/xlnx,clk-wzrd.yaml
> >> ?
> > 
> > Developer definitely doesn't know. If new SoC requires for the same purpose 
> > different IP with completely different driver is something out of developer 
> > control. As of today I am not aware about such a requirement and need and 
> > personally I can just hope that if they need to do such a change they will be 
> > able to keep current SW driver compatible with new HW IP.
> 
> Then please start naming them reasonable, not two (and in future
> x-times) the same names for entirely different blocks. And by name I
> mean compatible, filename and device name.
> 
> >>> also for this IP if that's fine with you.
> >>> Only xlnx,speed-grade can be defined for previous IP which is easy to mark.
> >>
> >> That old binding also explained nr-outputs as "Number of outputs".
> >> Perfect... :(
> > 
> > Anyway if description should be improved let's just do it. I just want to get 
> > guidance if we should update current dt binding for similar IP or just create 
> > new one as this one is trying to do.
> 
> IMHO, new binding is extremely confusing. We already have support for
> devices named "xlnx,clocking-wizard" and now you add exactly the same
> (clk=clocking) with almost the same properties, named
> "xlnx,clk-wizard-1.0". For a different IP?
> 
> How anyone (even Xilinx' customer) can understand which block is for
> what if they have exactly the same name and (almost) the same
> properties, but as you said - these are entirely different IP?

Maybe we should just delete the staging one (and the staging driver),
and start over?  No one has taken the time to get the staging driver out
of there, so I have no objection to dropping it for 6.1.

thanks,

greg k-h
