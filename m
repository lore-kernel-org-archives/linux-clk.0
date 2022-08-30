Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF13ECAAA1
	for <linux-clk@archiver.kernel.org>; Tue, 30 Aug 2022 20:25:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbiH3UZ2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Aug 2022 16:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbiH3UZ1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Aug 2022 16:25:27 -0400
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9347E20BD3;
        Tue, 30 Aug 2022 13:25:25 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso8889007otb.6;
        Tue, 30 Aug 2022 13:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=Tj4CsI96CjSjdfLbbYWWFgXSfTixivMeud5ZwWBQkhA=;
        b=sV4CcrTFr5TdMFPOaOPMC3uQRH3/2XXJ95A8LSqFrWzvXMWQ3yNWAHPzJaTEHHqSS6
         fzBRnqi1Q+jWxzDKz0PEwucV07IRrDZfpYJJsp1GQ2iN+kaTv01cY9MWpGMSnt+4WwMy
         iZaboDIjaZZrIByP9CiKR12bHKDVE58gUt5IaUC1l1dDWnzhqO8Jciojm318Ukq0VTVu
         oTAaJS6TIhhUsUf9GK3Bs0IwNANjApy56srHllGkjrqXEK1YUGr6NZ7GjO63hEhygBWP
         OKHKNVOjtyzMu64AiGPhJAeUVjwPcoi7zzNH6NbRC7uxOYroKnlLfgPZp0Abk8Wgw4m2
         YR5g==
X-Gm-Message-State: ACgBeo2aHWoxamPpodOTCKzZEGdUCN7d/vrUZaCX8YBglv60mEVioO+s
        Ni+5twhLWMyAIo/RbxyCYg==
X-Google-Smtp-Source: AA6agR44QFXaVTLoVdfdBD39OtxZChKA1FfiUuvrEsa0YWZU90ufr34W1rBh380qhYIKvXbaWVzBTg==
X-Received: by 2002:a9d:bf3:0:b0:638:b4aa:508c with SMTP id 106-20020a9d0bf3000000b00638b4aa508cmr9120044oth.43.1661891124804;
        Tue, 30 Aug 2022 13:25:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e5-20020a9d5605000000b00636e9a0cce5sm7829933oti.60.2022.08.30.13.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 13:25:24 -0700 (PDT)
Received: (nullmailer pid 2002663 invoked by uid 1000);
        Tue, 30 Aug 2022 20:25:23 -0000
Date:   Tue, 30 Aug 2022 15:25:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Daniel Mack <daniel@zonque.org>, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH v2 2/2] clk: cs2000-cp: make PLL lock timeout configurable
Message-ID: <20220830202523.GA1996382-robh@kernel.org>
References: <20220826091122.2344503-1-daniel@zonque.org>
 <20220826091122.2344503-2-daniel@zonque.org>
 <20220830014909.64D78C433D6@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830014909.64D78C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Aug 29, 2022 at 06:49:06PM -0700, Stephen Boyd wrote:
> Quoting Daniel Mack (2022-08-26 02:11:22)
> > The driver currently does 256 iterations of reads from the DEVICE_CTRL
> > register to wait for the PLL_LOCK bit to clear, and sleeps one
> > microsecond after each attempt.
> > 
> > This isn't ideal because
> > 
> >  a) the total time this allows for the device to settle depends on the I2C
> >     bus speed, and
> >  b) the device might need more time, depending on the application.
> > 
> > This patch allows users to configure this timeout through a new device-tree
> > property "cirrus,pll-lock-timeout-ms".
> 
> It's a timeout, so why not just increase the timeout regardless of
> everything else? Or can we parse the bus speed (100kHz or 400kHz)
> instead of adding a new property?

My thought too. Usually PLLs have a spec for max/typ lock times. Given 
it's a should never happen type of thing, it doesn't seem like we need a 
super precise time.

Rob

