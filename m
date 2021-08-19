Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14135C4320E
	for <linux-clk@archiver.kernel.org>; Thu, 19 Aug 2021 10:27:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB07B61139
	for <linux-clk@archiver.kernel.org>; Thu, 19 Aug 2021 10:27:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237889AbhHSK2C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Aug 2021 06:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236149AbhHSK2A (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Aug 2021 06:28:00 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E1EC061575;
        Thu, 19 Aug 2021 03:27:24 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id s21-20020a4ae5550000b02902667598672bso1665522oot.12;
        Thu, 19 Aug 2021 03:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jsS5/Qk38dqU4qUT0sBuVqWNsgAOCJyhSzLWep3REvU=;
        b=U67CKuef60XVqJ0XcypTZSH5qZMC1rKHJDCxYZ8WraKA0ZReMwtqeIE1TbQKhuCDYc
         EvBe4luaoFVkpLkpeS0DH1hrF1hIbXvpunccj48A0yHIUCFqYF8hLKFddrnsfCWSVW4b
         Ti5KqqBkYz68hyXmev/nJNmM45Bj2Ouy/MlALBaGdQiPlLG+0I9HYSrj3muWObHwFWDG
         aLSv7u7QHY/Q/xey/6qfJIFZZtSkKseYpi+Ce6hQyoNDcmg3hSFjomSJnmlazJcIIQn6
         HOwjGQkwCZNbzf+gruLbBvx7NhGcgoidLr5z3TCxEgDmbppiXJS76G1C8d7gNHvxO4sh
         fGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jsS5/Qk38dqU4qUT0sBuVqWNsgAOCJyhSzLWep3REvU=;
        b=cgkT639pT6ANGQ4Hkqz6grsisI+OmzWn5CJeyqceZAZg86eAuAHEvf8RLWW7lrYh1x
         vaX5Sp0mcK/0/wgv96XGuOAhy0QJUDJJqsU+oMD7Tl21Dke0TeAG2gazBiOMHngsUr88
         gvKLZQOQZYP0ShDUdMqEd4mSqhttpOTTf+VhzJ5PDvlrmBhUUmHx2ZqXE5F94vJqqD9D
         aRNE2sR2LwCdUgaknE6PwXzM/yaUEBalUDUlQNkPyApNDlp6/1ztVI4vLNpdFcm1JdWJ
         FyAUBP/8VP/vv10bgt7wRTx6o3lSoU53jy8Xe4bl51/9Nus2ycE1LHvYVG4lzf+H+VMI
         wPpA==
X-Gm-Message-State: AOAM531QHjAbmCbdWi+2B/Bge8BKabRtu+kYr0udF7qGwms2GjWGB2GQ
        OQqbpIGHRgBqr1wYw1Ljv7HWrnKQidFmTuncr9w=
X-Google-Smtp-Source: ABdhPJyD11vs8Caiy7qKANwrwSWoTLLfk7/jI3SuJuy87Mj4lHjF11BOjq6usfWfqAMJ2s30oCbuhj3V4dMz8Q96JeQ=
X-Received: by 2002:a4a:b601:: with SMTP id z1mr10567602oon.7.1629368843644;
 Thu, 19 Aug 2021 03:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210810072533.27620-1-shubhrajyoti.datta@xilinx.com>
 <20210810072533.27620-2-shubhrajyoti.datta@xilinx.com> <YRwTdQ5MyH6/xcja@robh.at.kernel.org>
In-Reply-To: <YRwTdQ5MyH6/xcja@robh.at.kernel.org>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Thu, 19 Aug 2021 15:57:12 +0530
Message-ID: <CAKfKVtE00VBwFi0DfqHsoYxcR9H8WpWtS+prYYKpRu8F_pxEUw@mail.gmail.com>
Subject: Re: [PATCH v12 1/5] dt-bindings: add documentation of xilinx clocking wizard
To:     Rob Herring <robh@kernel.org>
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-clk@vger.kernel.org, git@xilinx.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Aug 18, 2021 at 1:22 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Aug 10, 2021 at 12:55:29PM +0530, Shubhrajyoti Datta wrote:
> > Add the devicetree binding for the xilinx clocking wizard.
> >
> > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > ---
> >  v6:
> >  Fix a yaml warning
> >  v7:
> >  Add vendor prefix speed-grade
> >  v8:
> >  Fix the warnings
> >  v10:
> >  Add nr-outputs
> >  v11:
> >  add the compatibles for various versions
> >  rename nr-outputs to xlnx,nr-outputs
> >  v12:
> >  No change
> >
> >  .../bindings/clock/xlnx,clocking-wizard.yaml  | 77 +++++++++++++++++++
> >  1 file changed, 77 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> > new file mode 100644
> > index 000000000000..74a121988e92
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> > @@ -0,0 +1,77 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/clock/xlnx,clocking-wizard.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Xilinx clocking wizard
> > +
> > +maintainers:
> > +  - Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > +
> > +description:
> > +  The clocking wizard is a soft ip clocking block of Xilinx versal. It
> > +  reads required input clock frequencies from the devicetree and acts as clock
> > +  clock output.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - xlnx,clocking-wizard
>
> What version is this one?

This is kept for backward compatibility the current driver expects this string
>
> > +      - xlnx,clocking-wizard-v5-2 # version 5.2
> > +      - xlnx,clocking-wizard-v6-0 # version 6.0
>
> The comment is pretty pointless. And periods are allowed in compatible
> strings, so just do '-v5.2'.
sure will do.

>
> > +
> > +
> > +  reg:
> > +    maxItems: 1
> > +
