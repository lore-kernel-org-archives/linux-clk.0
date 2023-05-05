Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE27EC77B7C
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 10:41:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231588AbjEEKlW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 06:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231690AbjEEKlR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 06:41:17 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77A051A1F6
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 03:41:14 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-2fa47de5b04so1506808f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 05 May 2023 03:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1683283273; x=1685875273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Nq9FdkBIx7qSryTVXqkeom+1RISA8nreL8gl42Y7iA=;
        b=aRXM1GWidgf8Okv7zsy+p23RkW4A7VS9PvC9GNkHVM3zrKKuhdA2WkYNRci3aNhwti
         WS7qBTTCy31SYNrRXFqkRKGQU4QuBkK1BtB4cb+NwGYLXUFmKFtCdYhA1WHAzQODEYTT
         cHvO55vJwuUBRrbCbmHny5TfPxwFP6tFvsZzwDQ7agH8+f1z6d/Tx5jVq2PdmCLR14Cz
         el85dxokm3LC+zxDGH+INLa5KqWsBi7eLfkpWesxin9bQZBMlWxG4BTGwBaKIt6Sp/y6
         RcRlTJynem2WpOKg7R8VDezVZAM/w8Y7smGK0K6mm2C8UThkycRNNcPJMgoQ23AIhWgA
         v5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683283273; x=1685875273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Nq9FdkBIx7qSryTVXqkeom+1RISA8nreL8gl42Y7iA=;
        b=Oe0pYQS7CtYijm+1TvflTbZNZswHrt3qt+NrYafPP2aBz+bRVbD+IrgP47Dkx2Ka6V
         xE1S+dmGGif1oDfxst0hwLFLuGiv0RX2QuNWbZZf9Yrt5apRURGHV3F10NGsZWCwqQcx
         Jbb9VwUco/QsA3GEa+1qKWQPvnC6vpzBcRqnqNSkuLiOrb/OS/IVdSbGBPXL556I5U9c
         cN66dbc8V8J/0AEkUlPSFMWc4ElSvamaSMYRzYX+/vJxXheJbNT6z6hhuL/kudp7ZnqJ
         WhScBq449xCZk1c8H/grLzq/pxCupWVrJmy5DUUyCxVGXUnrdbzyYs9ur1QdlyDQ4GZF
         4nHw==
X-Gm-Message-State: AC+VfDw3pu5v8FYfRvgSbLztj0xWBhOrdXXJbq5wTNFxFZp/Bt1l6tbH
        bM1e+VlGZCGCaz/Rvm6dWEeDqg==
X-Google-Smtp-Source: ACHHUZ5N1BYv2fq0cH1ZrnOoRhp0jMNO3Sek0h8iGuMTIFGDHe5roWYot3NxaGP4Kg3ciiwxq4JcMw==
X-Received: by 2002:a5d:4c8c:0:b0:2f5:3dfd:f4d2 with SMTP id z12-20020a5d4c8c000000b002f53dfdf4d2mr1102918wrs.64.1683283272788;
        Fri, 05 May 2023 03:41:12 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id f16-20020a5d6650000000b003062c0ef959sm1993670wrw.69.2023.05.05.03.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 03:41:12 -0700 (PDT)
Date:   Fri, 5 May 2023 12:41:11 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        Vadim Fedorenko <vadfed@meta.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>
Subject: Re: [PATCH RFC v6 2/6] dpll: Add DPLL framework base functions
Message-ID: <ZFTdR93aDa6FvY4w@nanopsycho>
References: <ZDwg88x3HS2kd6lY@nanopsycho>
 <20230417124942.4305abfa@kernel.org>
 <ZFDPaXlJainSOqmV@nanopsycho>
 <20230502083244.19543d26@kernel.org>
 <ZFITyWvVcqgRtN+Q@nanopsycho>
 <20230503191643.12a6e559@kernel.org>
 <ZFOQWmkBUtgVR06R@nanopsycho>
 <20230504090401.597a7a61@kernel.org>
 <ZFPwqu5W8NE6Luvk@nanopsycho>
 <20230504114421.51415018@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504114421.51415018@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Thu, May 04, 2023 at 08:44:21PM CEST, kuba@kernel.org wrote:
>On Thu, 4 May 2023 19:51:38 +0200 Jiri Pirko wrote:
>> >> What is the next intelligible element to identify DPLL device here?  
>> >
>> >I don't know. We can always add more as needed.
>> >We presuppose that the devices are identifiable, so whatever info
>> >is used to identify them goes here.  
>> 
>> Allright. So in case of ptp_ocp and mlx5, module_name and clock_id
>> are enough. In case of ice, DPLL_A_TYPE, attr is the one to make
>> distinction between the 2 dpll instances there
>> 
>> So for now, we can have:
>>  CMD_GET_ID
>>    -> DPLL_A_MODULE_NAME  
>>       DPLL_A_CLOCK_ID
>>       DPLL_A_TYPE
>>    <- DPLL_A_ID
>> 
>> 
>> if user passes a subset which would not provide a single match, we error
>> out with -EINVAL and proper exack message. Makes sense?
>
>Yup, that sounds good to me.
>
>> >Same answer. Could be a name of the pin according to ASIC docs.
>> >Could be the ball name for a BGA package. Anything that's meaningful.  
>> 
>> Okay, for pin, the type and label would probably do:
>>  CMD_GET_PIN_ID
>>    -> DPLL_A_MODULE_NAME  
>>       DPLL_A_CLOCK_ID
>>       DPLL_A_PIN_TYPE
>>       DPLL_A_PIN_LABEL
>
>Label sounds dangerously open ended, too. Would that be the SMA

Well, every string is. And past RFCs of this patchset demonstrated guys
did serialize a lot of stuff in strings.


>connector label (i.e. front panel label)? Or also applicable to
>internal pins? It'd be easier to talk details if we had the user
>facing documentation that ships with these products.

I think is is use case specific. Some of the pins face the user over
physical port, they it is a front panel label. Others are internal
names. I have no clue how to define and mainly enforce rules here.

But as an example, if you have 2 pins of the same type, only difference
is they are connected to front panel connector "A" and "B", this is the
label you have to pass to the ID query. Do you see any other way?


>
>>    <- DPLL_A_PIN_ID
>> 
>> Again, if user passes a subset which would not provide a single match,
>> we error out with -EINVAL and proper exack message.
>> 
>> If there is only one pin for example, user query of DPLL_A_MODULE_NAME
>> and DPLL_A_CLOCK_ID would do return a single match. No need to pass
>> anything else.
>> 
>> I think this could work with both ice and ptp_ocp, correct guys?
>> 
>> For mlx5, I will have 2 or more pins with same module name, clock id
>> and type. For these SyncE pins the label does not really make sense.
>> But I don't have to query, because the PIN_ID is going to be exposed for
>> netdev over RT netlink. Clicks.
>> 
>> Makes sense?
