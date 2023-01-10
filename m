Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A2AC46467
	for <linux-clk@archiver.kernel.org>; Tue, 10 Jan 2023 14:29:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232072AbjAJO3C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Jan 2023 09:29:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238435AbjAJO2m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Jan 2023 09:28:42 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CDB4C1F
        for <linux-clk@vger.kernel.org>; Tue, 10 Jan 2023 06:28:40 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id c8-20020a17090a4d0800b00225c3614161so16644125pjg.5
        for <linux-clk@vger.kernel.org>; Tue, 10 Jan 2023 06:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1uAPm4TvuyfFiFiTXnXvZ5Lp4pJKxecoZo4KRpCVo8o=;
        b=LEpEW9Ssbm936q/NCQYLaqvHxdrA4k3lsfgfx3ICIdcyrp0eTpywjWLm0mTlN9/BZl
         c8F3IxrAp/VAsqZMemuJXBgqJjaZZLj1XJ5MIh/oKvSuFfei/k0+FAJc1pxsUIcUSaiT
         U03iFnov0EREVdJBIBKClDDne8YOWmOO1JT+Ch1rW0wXcPC1kBxPsnQ3SCoykO0WhLWW
         VewGxF0LIMOI5TUrMfsOX99vsZ013TzLtl6eArCx4OVkXvSzkTXupgXvKTXVmyIjZOwG
         mg3qfI/KBpyJ0tNezHPXNC/Jsdzsh8bVSAJ1LY6EN6GGEAAT/4qkgO8K8ja0prGlPwAZ
         sUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1uAPm4TvuyfFiFiTXnXvZ5Lp4pJKxecoZo4KRpCVo8o=;
        b=NxESh2unMyPa8gSvZNySzcrMlLukmCWMZ6Ml17q/In7jikbVjwR5LnQvZNKjHivcp3
         T4HXJjyLaa+dfWh/2NEtMqHp3TvcQ6AALD/64ZQIdkN2SgKXKasXdNiTGUe+wOJhHwlZ
         nOOIHsDjPlnT3N4yN3mo1A34d1JltFvssFmnGdOmkF1CDgYRp7aQVgfYjzoBfvRi3Wp3
         GKVj5kAFWSCPizz9Efg3RESTejZ2e/SDbiaHh2y7oM6NQGsYFtrCLxThrKeyIZwp6Sim
         yH43dH3Pe8+vR9WbUR0Kda+sNgsxpE6diCLg2yqvVUdbdo9J+ruYbN2Gbxdgjd+gmZDB
         tSow==
X-Gm-Message-State: AFqh2krlj+W0cFczzFHoeq9S0+VQ4ncAQPeSfrD9jPd24gZumqtJFbZa
        ZnnH2ksO0sXBADtW2rh0MpZ+CQ==
X-Google-Smtp-Source: AMrXdXt2WIz7aq75Fyr4MN5VOK1LagUefbYmsLpAC/QqGptcud67imAJxjVJKdRqcJqjooQZQpoZiA==
X-Received: by 2002:a05:6a21:32a1:b0:aa:6efd:1883 with SMTP id yt33-20020a056a2132a100b000aa6efd1883mr110130914pzb.37.1673360919947;
        Tue, 10 Jan 2023 06:28:39 -0800 (PST)
Received: from localhost (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id w65-20020a623044000000b0056c349f5c70sm8179608pfw.79.2023.01.10.06.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 06:28:39 -0800 (PST)
Date:   Tue, 10 Jan 2023 15:28:36 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Maciek Machnikowski <maciek@machnikowski.net>,
        'Vadim Fedorenko' <vfedorenko@novek.ru>,
        'Jonathan Lemon' <jonathan.lemon@gmail.com>,
        'Paolo Abeni' <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [RFC PATCH v4 0/4] Create common DPLL/clock configuration API
Message-ID: <Y712FMgQssL0RYAS@nanopsycho>
References: <10bb01d90a45$77189060$6549b120$@gmail.com>
 <20221207152157.6185b52b@kernel.org>
 <6e252f6d-283e-7138-164f-092709bc1292@machnikowski.net>
 <Y5MW/7jpMUXAGFGX@nanopsycho>
 <a8f9792b-93f1-b0b7-2600-38ac3c0e3832@machnikowski.net>
 <20221209083104.2469ebd6@kernel.org>
 <Y5czl6HgY2GPKR4v@nanopsycho>
 <DM6PR11MB46571573010AB727E1BE99AE9BFE9@DM6PR11MB4657.namprd11.prod.outlook.com>
 <Y7xBHtR3XwfAahry@nanopsycho>
 <DM6PR11MB4657E51AD937BBA5DC2B1FF19BFF9@DM6PR11MB4657.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM6PR11MB4657E51AD937BBA5DC2B1FF19BFF9@DM6PR11MB4657.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Tue, Jan 10, 2023 at 11:54:20AM CET, arkadiusz.kubalewski@intel.com wrote:
>>From: Jiri Pirko <jiri@resnulli.us>
>>Sent: Monday, January 9, 2023 5:30 PM
>>
>>Mon, Jan 09, 2023 at 03:43:01PM CET, arkadiusz.kubalewski@intel.com wrote:
>>>>From: Jiri Pirko <jiri@resnulli.us>
>>>>Sent: Monday, December 12, 2022 2:59 PM
>>>>
>>>>Fri, Dec 09, 2022 at 05:31:04PM CET, kuba@kernel.org wrote:
>>>>>On Fri, 9 Dec 2022 15:09:08 +0100 Maciek Machnikowski wrote:
>>>>>> On 12/9/2022 12:07 PM, Jiri Pirko wrote:
>>>>>> > Looking at the documentation of the chips, they all have mupltiple
>>>>DPLLs
>>>>>> > on a die. Arkadiusz, in your proposed implementation, do you model
>>>>each
>>>>>> > DPLL separatelly? If yes, then I understand the urgency of need of a
>>>>>> > shared pin. So all DPLLs sharing the pin are part of the same chip?
>>>>>> >
>>>>>> > Question: can we have an entity, that would be 1:1 mapped to the
>>>>actual
>>>>>> > device/chip here? Let's call is "a synchronizer". It would contain
>>>>>> > multiple DPLLs, user-facing-sources(input_connector),
>>>>>> > user-facing-outputs(output_connector), i/o pins.
>>>>>> >
>>>>>> > An example:
>>>>>> >                                SYNCHRONIZER
>>>>>> >
>>>>>> >
>>>>┌───────────────────────────────────────┐
>>>>>> >                               │
>>>>│
>>>>>> >                               │
>>>>│
>>>>>> >   SyncE in connector          │              ┌─────────┐
>>>>│     SyncE out connector
>>>>>> >                 ┌───┐         │in pin 1      │DPLL_1   │     out pin
>>>>1│    ┌───┐
>>>>>> >                 │   ├─────────┼──────────────┤
>>>>├──────────────┼────┤   │
>>>>>> >                 │   │         │              │         │
>>>>│    │   │
>>>>>> >                 └───┘         │              │         │
>>>>│    └───┘
>>>>>> >                               │              │         │
>>>>│
>>>>>> >                               │           ┌──┤         │
>>>>│
>>>>>> >    GNSS in connector          │           │  └─────────┘
>>>>│
>>>>>> >                 ┌───┐         │in pin 2   │                  out pin
>>>>2│     EXT SMA connector
>>>>>> >                 │   ├─────────┼───────────┘
>>>>│    ┌───┐
>>>>>> >                 │   │         │
>>>>┌───────────┼────┤   │
>>>>>> >                 └───┘         │                           │
>>>>│    │   │
>>>>>> >                               │                           │
>>>>│    └───┘
>>>>>> >                               │                           │
>>>>│
>>>>>> >    EXT SMA connector          │                           │
>>>>│
>>>>>> >                 ┌───┐   mux   │in pin 3      ┌─────────┐  │
>>>>│
>>>>>> >                 │   ├────┬────┼───────────┐  │         │  │
>>>>│
>>>>>> >                 │   │    │    │           │  │DPLL_2   │  │
>>>>│
>>>>>> >                 └───┘    │    │           │  │         │  │
>>>>│
>>>>>> >                          │    │           └──┤         ├──┘
>>>>│
>>>>>> >                          │    │              │         │
>>>>│
>>>>>> >    EXT SMA connector     │    │              │         │
>>>>│
>>>>>> >                 ┌───┐    │    │              │         │
>>>>│
>>>>>> >                 │   ├────┘    │              └─────────┘
>>>>│
>>>>>> >                 │   │         │
>>>>│
>>>>>> >                 └───┘
>>>>└───────────────────────────────────────┘
>>>>>> >
>>>>>> > Do I get that remotelly correct?
>>>>>>
>>>>>> It looks goot, hence two corrections are needed:
>>>>>> - all inputs can go to all DPLLs, and a single source can drive more
>>>>>>   than one DPLL
>>>>>> - The external mux for SMA connector should not be a part of the
>>>>>>   Synchronizer subsystem - I believe there's already a separate MUX
>>>>>>   subsystem in the kernel and all external connections should be
>>handled
>>>>>>   by a devtree or a similar concept.
>>>>>>
>>>>>> The only "muxing" thing that could potentially be modeled is a
>>>>>> synchronizer output to synchronizer input relation. Some synchronizers
>>>>>> does that internally and can use the output of one DPLL as a source
>>for
>>>>>> another.
>>>>>
>>>>>My experience with DT and muxes is rapidly aging, have you worked with
>>>>>those recently? From what I remember the muxes were really.. "embedded"
>>>>>and static compared to what we want here.
>>>>
>>>>Why do you think we need something "non-static"? The mux is part of the
>>>>board, isn't it? That sounds quite static to me.
>>>>
>>>>
>>>>>
>>>>>Using DT may work nicely for defining the topology, but for config we
>>>>>still need a different mechanism.
>>>>
>>>>"config" of what? Each item in topology would be configure according to
>>>>the item type, won't it?
>>>>
>>>>[...]
>>>
>>>
>>>Hi guys,
>>>
>>>We have been trying to figure out feasibility of new approach proposed on
>>our
>>>latest meeting - to have a single object which encapsulates multiple
>>DPLLs.
>>>
>>>Please consider following example:
>>>
>>>Shared common inputs:
>>>i0 - GPS  / external
>>>i1 - SMA1 / external
>>>i2 - SMA2 / external
>>>i3 - MUX0 / clk recovered from PHY0.X driven by MAC0
>>>i4 - MUX1 / clk recovered from PHY1.X driven by MAC1
>>>
>>>+---------------------------------------------------------+
>>>| Channel A / FW0             +---+                       |
>>>|                         i0--|   |                       |
>>>|         +---+               |   |                       |
>>>| PHY0.0--|   |           i1--| D |                       |
>>>|         |   |               | P |                       |
>>>| PHY0.1--| M |           i2--| L |   +---+   +--------+  |
>>>|         | U |               | L |---|   |---| PHY0.0 |--|
>>>| PHY0.2--| X |-+---------i3--| 0 |   |   |   +--------+  |
>>>|         | 0 | |+------+     |   |---| M |---| PHY0.1 |--|
>>>| ...   --|   | || MUX1 |-i4--|   |   | A |   +--------+  |
>>>|         |   | |+------+     +---+   | C |---| PHY0.2 |--|
>>>| PHY0.7--|   | |         i0--|   |   | 0 |   +--------+  |
>>>|         +---+ |             |   |---|   |---| ...    |--|
>>>|               |         i1--| D |   |   |   +--------+  |
>>>|               |             | P |---|   |---| PHY0.7 |--|
>>>|               |         i2--| L |   +---+   +--------+  |
>>>|               |             | L |                       |
>>>|               \---------i3--| 1 |                       |
>>>|                +------+     |   |                       |
>>>|                | MUX1 |-i4--|   |                       |
>>>|                +------+     +---+                       |
>>>+---------------------------------------------------------+
>>>| Channel B / FW1             +---+                       |
>>>|                         i0--|   |                       |
>>>|                             |   |                       |
>>>|                         i1--| D |                       |
>>>|         +---+               | P |                       |
>>>| PHY1.0--|   |           i2--| L |   +---+   +--------+  |
>>>|         |   |  +------+     | L |---|   |---| PHY1.0 |--|
>>>| PHY1.1--| M |  | MUX0 |-i3--| 0 |   |   |   +--------+  |
>>>|         | U |  +------+     |   |---| M |---| PHY1.1 |--|
>>>| PHY1.2--| X |-+---------i4--|   |   | A |   +--------+  |
>>>|         | 1 | |             +---+   | C |---| PHY1.2 |--|
>>>| ...   --|   | |         i0--|   |   | 1 |   +--------+  |
>>>|         |   | |             |   |---|   |---| ...    |--|
>>>| PHY1.7--|   | |         i1--| D |   |   |   +--------+  |
>>>|         +---+ |             | P |---|   |---| PHY1.7 |--|
>>>|               |         i2--| L |   +---+   +--------+  |
>>>|               |+------+     | L |                       |
>>>|               || MUX0 |-i3--| 1 |                       |
>>>|               |+------+     |   |                       |
>>>|               \---------i4--|   |                       |
>>>|                             +---+                       |
>>>+---------------------------------------------------------+
>>
>>What is "a channel" here? Are these 2 channels part of the same physival
>>chip? Could you add the synchronizer chip/device entities to your drawing?
>>
>
>No.
>A "Synchronization Channel" on a switch would allow to separate groups
>of physical ports. Each channel/group has own "Synchronizer Chip", which is
>used to drive PHY clocks of that group.
>
>"Synchronizer chip" would be the 2 DPLLs on old draw, something like this:
>+--------------------------------------------------------------+
>| Channel A / FW0        +-------------+   +---+   +--------+  |
>|                    i0--|Synchronizer0|---|   |---| PHY0.0 |--|
>|         +---+          |             |   |   |   +--------+  |
>| PHY0.0--|   |      i1--|             |---| M |---| PHY0.1 |--|
>|         |   |          | +-----+     |   | A |   +--------+  |
>| PHY0.1--| M |      i2--| |DPLL0|     |   | C |---| PHY0.2 |--|
>|         | U |          | +-----+     |   | 0 |   +--------+  |
>| PHY0.2--| X |--+---i3--| +-----+     |---|   |---| ...    |--|
>|         | 0 |  |       | |DPLL1|     |   |   |   +--------+  |
>| ...   --|   |  | /-i4--| +-----+     |---|   |---| PHY0.7 |--|
>|         |   |  | |     +-------------+   +---+   +--------+  |
>| PHY0.7--|   |  | |                                           |
>|         +---+  | |                                           |
>+----------------|-|-------------------------------------------+
>| Channel B / FW1| |     +-------------+   +---+   +--------+  |
>|                | | i0--|Synchronizer1|---|   |---| PHY1.0 |--|
>|         +---+  | |     |             |   |   |   +--------+  |
>| PHY1.0--|   |  | | i1--|             |---| M |---| PHY1.1 |--|
>|         |   |  | |     | +-----+     |   | A |   +--------+  |
>| PHY1.1--| M |  | | i2--| |DPLL0|     |   | C |---| PHY1.2 |--|
>|         | U |  | |     | +-----+     |   | 1 |   +--------+  |
>| PHY1.2--| X |  \-|-i3--| +-----+     |---|   |---| ...    |--|
>|         | 1 |    |     | |DPLL1|     |   |   |   +--------+  |
>| ...   --|   |----+-i4--| +-----+     |---|   |---| PHY1.7 |--|
>|         |   |          +-------------+   +---+   +--------+  |
>| PHY1.7--|   |                                                |
>|         +---+                                                |
>+--------------------------------------------------------------+
>Also, please keep in mind that is an example, there could be easily 4
>(or more) channels wired similarly.


Good. So there are 2 synchronizers out there, each has a list of pins
and contain multiple dplls. 1 synchronizer is 1 device. No pin sharing
between devices, just between dplls inside one device. That eliminates
this odd concept of flying pin. Good.


>
>>
>>>
>>>This is a simplified network switch board example.
>>>It has 2 synchronization channels, where each channel:
>>>- provides clk to 8 PHYs driven by separated MAC chips,
>>>- controls 2 DPLLs.
>>>
>>>Basically only given FW has control over its PHYs, so also a control over
>>it's
>>>MUX inputs.
>>>All external sources are shared between the channels.
>>>
>>>This is why we believe it is not best idea to enclose multiple DPLLs with
>>one
>>>object:
>>>- sources are shared even if DPLLs are not a single synchronizer chip,
>>>- control over specific MUX type input shall be controllable from
>>different
>>>driver/firmware instances.
>>>
>>>As we know the proposal of having multiple DPLLs in one object was a try
>>to
>>>simplify currently implemented shared pins. We fully support idea of
>>having
>>>interfaces as simple as possible, but at the same time they shall be
>>flexible
>>>enough to serve many use cases.
>>>
>>>Right now the use case of single "synchronizer chip" is possible (2 DPLLs

Btw, fix your email client not to mangle the text you reply to with line
breaks like this one.


>>with
>>>shared inputs), as well as multiple synchronizer chips with shared inputs.
>>>
>>>If we would entirely get rid of sharing pins idea and instead allowed only
>>to
>>>have multiple DPLLs in one object, we would fall back to the problem where
>>>change on one input is braking another "synchronizer chip" input.
>>>I.e. considering above scheme, user configured both channels to use SMA1
>>1MHz.
>>>If SMA1 input is changed to 10MHz, all DPLLs are affected, thus all using
>>that
>>
>>You say "SMA1 input *is changed*". Could you add to your drawing:
>>1) Who is the one triggering the change.
>>2) Entity that manages the SMA input and applies the configuration.
>>
>
>A user or some tool, this change requires to switch a frequency on a signal
>generator connected to that SMA1. Whatever would make the change is an external
>entity here. The draw show connections on board, don't see a point on having a
>external signal generator or user connected to the board :)
>
>If something is not clear, we could prepare some different draw, please just
>let me know what exactly we want to see. It sound like a sequence diagram?


I think I got it. The pins are shared between DPLLS within single
synchronizer entity. That clears up my modeling concerns. Also it makes
your code much simplier, you don't need special shared pin beast with
reference counting etc. You just have a pin with synchronizer entity as
owner and expose the linkage inside this synchronizer entity between
individual DPLLs and pins.


>
>Thanks!
>Arkadiusz
>
>>
>>>input shall be notified, as long as that input is shared.
>>>For the drivers that have single point of control over dpll, they might
>>just
>>>skip those requests. But if there are multiple firmware instances
>>controlling
>>>multiple DPLLs, they would process it independently.
>>>
>>>Current implementation is the most flexible and least complex for the
>>level of
>>>flexibility it provides.
>>>
>>>BR, Happy new year!
>>>Arkadiusz
