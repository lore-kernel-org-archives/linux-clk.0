Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078BAC7EE22
	for <linux-clk@archiver.kernel.org>; Tue,  9 May 2023 07:53:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233867AbjEIHxN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 May 2023 03:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233731AbjEIHxN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 May 2023 03:53:13 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D792133
        for <linux-clk@vger.kernel.org>; Tue,  9 May 2023 00:53:10 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9659f452148so968276766b.1
        for <linux-clk@vger.kernel.org>; Tue, 09 May 2023 00:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1683618789; x=1686210789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=feUQTmDsglXzlQR46XLSaIS8pInOXk6yAAJ3q99bp6I=;
        b=hjRhYZ2sqanoRvze/04alzqj9JiiwPhCoxB+BI/eJx6dHRi6cYVOLmaRH9YzRfEfv6
         T3ZXVRAubpUacBIo/dQ1Oe6Ccb8QgQhq8ZZyqE4K3gqrMkiztqLy40BvjiJrSpLAq/Et
         D5CExYDCCSTBwJUZJaiAnXUj+uvuTSbyouSFBVHyZIWGpiHNKyGCmgqG0WBQJvHcsLlr
         D0s7voEYioCxU7RFpIUN39peWz4+qm+s7GB6IczkO65xQ2rOLlQ1/KxMhF8pDHefm+oH
         SMNyWsNxQhQnjC5bN2bD59vzIffXLhoebYhPhQUl9Wxe19W38bupMDXk2WzIzp9m0ij3
         sCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683618789; x=1686210789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feUQTmDsglXzlQR46XLSaIS8pInOXk6yAAJ3q99bp6I=;
        b=T4lXnWmm+R7eg9W2AUzj4NFFKV45fXbDcNzZ8sWQTnQkFz5LOqeBq/SMBu5mRWgmlX
         Is4CHFc9GsNt0Yw9AOKKRgX2Tn3eAuu3jLEspaymiomwXNc3AOkayOmDP4kY12XflXyN
         yuY73D2qS6bgWnYV78jLmSuAtHQrHNCC17sa8V5C4aRCx6OSINXuriDPLN6zRyuisFcu
         EqruRP7yIjX3vbhWq1JY+EdmTduZlG1Zmf20oCLMsLYxD+C9vSjtyrSmDagRcvvqSr4q
         iqmpbqlp2XWErESv2tQb41KB4+/uBqQy9pv9Rt5X4B5I6e5IYUYVTeE9u/lk+Xjzqpa9
         ZISA==
X-Gm-Message-State: AC+VfDwnQHk/7nIHCrx0hRaeq2Q7d3JKAheCSlzQXe1Tuob6B4gUR+u5
        y9DTXMXloOkGz/jnP+WxI1XxZQ==
X-Google-Smtp-Source: ACHHUZ4Ys5JPUT5yfL7I2Ptl2Kgw41O9I1am/CVOQxdIoqUTW0+/rjArOEcpP2Y6DgIN8YjOjWtTBA==
X-Received: by 2002:a17:907:1c9a:b0:966:2fdf:f66c with SMTP id nb26-20020a1709071c9a00b009662fdff66cmr9304626ejc.3.1683618788710;
        Tue, 09 May 2023 00:53:08 -0700 (PDT)
Received: from localhost ([86.61.181.4])
        by smtp.gmail.com with ESMTPSA id d21-20020a170906c21500b00965fdb90801sm990212ejz.153.2023.05.09.00.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:53:08 -0700 (PDT)
Date:   Tue, 9 May 2023 09:53:07 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Paolo Abeni <pabeni@redhat.com>,
        "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        Vadim Fedorenko <vadfed@meta.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        poros <poros@redhat.com>, mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>
Subject: Re: [PATCH RFC v6 2/6] dpll: Add DPLL framework base functions
Message-ID: <ZFn74xJOtiXatfHQ@nanopsycho>
References: <ZFOQWmkBUtgVR06R@nanopsycho>
 <20230504090401.597a7a61@kernel.org>
 <ZFPwqu5W8NE6Luvk@nanopsycho>
 <20230504114421.51415018@kernel.org>
 <ZFTdR93aDa6FvY4w@nanopsycho>
 <20230505083531.57966958@kernel.org>
 <ZFdaDmPAKJHDoFvV@nanopsycho>
 <d86ff1331a621bf3048123c24c22f49e9ecf0044.camel@redhat.com>
 <ZFjoWn9+H932DdZ1@nanopsycho>
 <20230508124250.20fb1825@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508124250.20fb1825@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Mon, May 08, 2023 at 09:42:50PM CEST, kuba@kernel.org wrote:
>On Mon, 8 May 2023 14:17:30 +0200 Jiri Pirko wrote:
>> >> Hmm, that would kind of embed the pin type into attr which feels wrong.  
>
>An attribute which changes meaning based on a value of another attribute
>feels even more wrong.

It wouldn't change meaning, it would be still "a label". Either on a
back of a PCI card or internal pin in a board scheme. Still the same
meaning (for mux type for example).



>
>> >Looking at the above from a different angle, the
>> >DPLL_A_PIN_FRONT_PANEL_LABEL attribute will be available only for
>> >DPLL_PIN_TYPE_EXT type pins, which looks legit to me - possibly
>> >renaming DPLL_A_PIN_FRONT_PANEL_LABEL as DPLL_A_PIN_EXT_LABEL.  
>
>Yup. Even renaming EXT to something that's less.. relative :(

Suggestion?


>
>> Well sure, in case there is no "label" attr for the rest of the types.
>> Which I believe it is, for the ice implementation in this patchset.
>> Otherwise, there is no way to distinguish between the pins.
>> To have multiple attrs for label for multiple pin types does not make
>> any sense to me, that was my point.
>
>Come on, am I really this bad at explaining this?

Or perhaps I'm just slow.


>
>If we make a generic "label" attribute driver authors will pack
>everything they want to expose to the user into it, and then some.

What's difference in generic label string attr and type specific label
string attr. What is stopping driver developers to pack crap in either
of these 2. Perhaps I'm missing something. Could you draw examples?


>
>So we need attributes which will feel *obviously* *wrong* to abuse.

Sure, I get what you say and agree. I'm just trying to find out the
actual attributes :)
