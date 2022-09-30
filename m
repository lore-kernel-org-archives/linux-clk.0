Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA11C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 21:39:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232233AbiI3Vj2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 17:39:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbiI3Vj1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 17:39:27 -0400
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8790A11E5F3;
        Fri, 30 Sep 2022 14:39:26 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id d64so6028790oia.9;
        Fri, 30 Sep 2022 14:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=K26/QFGf4pwGTou2jHMmJ9oX8eBQkxm9aSZ752Zfxgk=;
        b=McTMuFnkeqtqr0HlRusYQByg1KSKX9XIrJydLp+8tAMHfIMcCbLXE3eDP76htGl/RA
         svky8ZErLoF+/ISsi746x6YIQGPZGc20N7J4dWLHZ+OvUJlvSCaICLzBGPVxt/txF8+p
         EBK8QgwWYCRVYq3ysm8poqTZ8M+R18Pwda4L+O1R8XnbN5oWR/eX8U2gB/p4xuvEZm+X
         1L9lsE7btUEpJpk5Hce05ZNR34ZJN3pPXHSRwFSBk2bBW/Njg9cK1i12xaLrms1rMj72
         rA1S5/w33AWcbA9jWtRGq3tuC+5cu6YvuMjpVJbeAMfKUjo4BBt/N3i6b3OQEYCNmo11
         lHkA==
X-Gm-Message-State: ACrzQf2Ysr+WsaRjFZMoA1lrvN/rNr7rs8V+PthTFlaFopMaH/iehCO4
        s4gmyp+OxiV+zmE9VZWa3g==
X-Google-Smtp-Source: AMsMyM4ZY5mvDttJtbB8jpp+V4tZWeSDkayu20AaSI15+URuXm5zY83yipxKfoOugvZI/S2wmu6fCg==
X-Received: by 2002:a05:6808:1a24:b0:350:78b0:9c2c with SMTP id bk36-20020a0568081a2400b0035078b09c2cmr82667oib.143.1664573965759;
        Fri, 30 Sep 2022 14:39:25 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n188-20020aca59c5000000b003450abf4404sm773061oib.21.2022.09.30.14.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 14:39:24 -0700 (PDT)
Received: (nullmailer pid 1088687 invoked by uid 1000);
        Fri, 30 Sep 2022 21:39:24 -0000
Date:   Fri, 30 Sep 2022 16:39:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Michal Simek <michal.simek@amd.com>
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-clk@vger.kernel.org, git@amd.com, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org,
        mturquette@baylibre.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] dt-bindings: clk: Add binding for versal clocking
 wizard
Message-ID: <20220930213924.GA1079711-robh@kernel.org>
References: <20220930080400.15619-1-shubhrajyoti.datta@amd.com>
 <20220930080400.15619-2-shubhrajyoti.datta@amd.com>
 <CAL_JsqLaqjZeZd3c-fd9f5m-4OCXgOZcOu+paik9FV_eno5sLg@mail.gmail.com>
 <afb3f19f-eb40-5453-a82b-295e06861f86@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afb3f19f-eb40-5453-a82b-295e06861f86@amd.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Sep 30, 2022 at 03:00:28PM +0200, Michal Simek wrote:
> Hi Rob,
> 
> On 9/30/22 14:25, Rob Herring wrote:
> > On Fri, Sep 30, 2022 at 3:04 AM Shubhrajyoti Datta
> > <shubhrajyoti.datta@amd.com> wrote:
> > > 
> > > The Clocking Wizard for Versal adaptive compute acceleration platforms
> > > generates multiple configurable number of clock outputs.
> > > Add device tree binding for Versal clocking wizard support.
> > 
> > Really v1? I'm sure I heard of this wizard before.
> > 
> > What about this?:
> > 
> > drivers/staging/clocking-wizard/dt-binding.txt
> > 
> > That needs to be moved out of staging rather than adding a 2nd one.
> 
> 
> Let me clarify this. This is IP which is already moved out of staging.
> Linux-next has these changes and waiting for MW to happen (already in clock
> tree).

Where does this series explain that? If the dependency is not the latest 
rc1, then state that.

> And this is new IP. Not sure who has chosen similar name but this targets
> Xilinx Versal SOCs. Origin one was targeting previous families.

Do we need a whole new schema doc?

It is not ideal to define the same property, xlnx,nr-outputs, more than 
once. And it's only a new compatible string.

Rob
