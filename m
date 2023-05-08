Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1614AC77B73
	for <linux-clk@archiver.kernel.org>; Mon,  8 May 2023 06:51:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbjEHGvW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 May 2023 02:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbjEHGvU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 May 2023 02:51:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 915E36A40
        for <linux-clk@vger.kernel.org>; Sun,  7 May 2023 23:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683528631;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=32UpXCzVyg7syon/NdEm9BVsI1w4xTARICsqJk7H+no=;
        b=JDpyR0OyVsGetDMYGEKR3OAJXY6v+WDpiOY3V3BO7UYAvTAaWQ+yS4jiNfezOXTqt3PF5U
        S3iLLMPMamGylzmIYfJQjq6iUx4p9uHv7ltZWje5Bavshz4pCUBAh7i/XE4HkixPgQbTwa
        AxodCkX34TG5Jxv7aNLFGBfO/rby4bY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-FbStRIykPw27jraak9csag-1; Mon, 08 May 2023 02:50:14 -0400
X-MC-Unique: FbStRIykPw27jraak9csag-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-5ef4d54d84cso8039086d6.0
        for <linux-clk@vger.kernel.org>; Sun, 07 May 2023 23:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683528614; x=1686120614;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=32UpXCzVyg7syon/NdEm9BVsI1w4xTARICsqJk7H+no=;
        b=duwdImH7Y9dgAKXecAU2N4BowpzdhcNssJHuXgUmVEekt97uChQSwkcNbND+4poDJZ
         yqdBEdg61OKnAJmmns5cAj5oUD3G37TWBxw4Xjyuf9RuUI5qRc6JCO3UCvceH7wfWBjD
         t4hTmge8PYWcOfGAaWoALfaTQCtjlwjUDLtmkO8RiAwkWJ7TacC/TJ77iWSC9y0yAFz/
         A8zdWzMGtQU28TuLKmQqPyRKzXqJnZpVCeX9M9C0JERAObigOpBNjyYBQF1RrjSZJguq
         TMjxN4a/vdSr3ImeQ4W8B/A7mP4CdzFNywQt6MRM2RKSZsqLVSgw8g1ZYjK/KS3qWO4Q
         TRRA==
X-Gm-Message-State: AC+VfDyexY8VfqZx2y9nyql1rMHTFhMd+yN945b5h6zXGhKSxXyBhZIl
        sjv/Jl4sHUwxdoiTmE9ZyOcDu03f3MLJREJ9X2tlUbkoDz1RQKLi4mNWcSFc5edm62gIei3AMoe
        vN85Lfzds/5oPNsWb5BhZ
X-Received: by 2002:ad4:5ecf:0:b0:5df:55b5:b1a with SMTP id jm15-20020ad45ecf000000b005df55b50b1amr13016798qvb.4.1683528614395;
        Sun, 07 May 2023 23:50:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5q5ghOczOmNoK3lScvQqhcZZ6tdqJVH5UXF5t5HvbVS/LDnf2+1HpA70aZES2YbbGS4w+1MA==
X-Received: by 2002:ad4:5ecf:0:b0:5df:55b5:b1a with SMTP id jm15-20020ad45ecf000000b005df55b50b1amr13016781qvb.4.1683528614096;
        Sun, 07 May 2023 23:50:14 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-244-175.dyn.eolo.it. [146.241.244.175])
        by smtp.gmail.com with ESMTPSA id t17-20020a0ce2d1000000b005ef442226bbsm2552489qvl.8.2023.05.07.23.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 23:50:13 -0700 (PDT)
Message-ID: <d86ff1331a621bf3048123c24c22f49e9ecf0044.camel@redhat.com>
Subject: Re: [PATCH RFC v6 2/6] dpll: Add DPLL framework base functions
From:   Paolo Abeni <pabeni@redhat.com>
To:     Jiri Pirko <jiri@resnulli.us>, Jakub Kicinski <kuba@kernel.org>
Cc:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        Vadim Fedorenko <vadfed@meta.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        poros <poros@redhat.com>, mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>
Date:   Mon, 08 May 2023 08:50:09 +0200
In-Reply-To: <ZFdaDmPAKJHDoFvV@nanopsycho>
References: <ZFDPaXlJainSOqmV@nanopsycho>
         <20230502083244.19543d26@kernel.org> <ZFITyWvVcqgRtN+Q@nanopsycho>
         <20230503191643.12a6e559@kernel.org> <ZFOQWmkBUtgVR06R@nanopsycho>
         <20230504090401.597a7a61@kernel.org> <ZFPwqu5W8NE6Luvk@nanopsycho>
         <20230504114421.51415018@kernel.org> <ZFTdR93aDa6FvY4w@nanopsycho>
         <20230505083531.57966958@kernel.org> <ZFdaDmPAKJHDoFvV@nanopsycho>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 2023-05-07 at 09:58 +0200, Jiri Pirko wrote:
> Fri, May 05, 2023 at 05:35:31PM CEST, kuba@kernel.org wrote:
> > On Fri, 5 May 2023 12:41:11 +0200 Jiri Pirko wrote:
> > >=20
> > Sound perfectly fine, if it's a front panel label, let's call=20
> > the attribute DPLL_A_PIN_FRONT_PANEL_LABEL. If the pin is not
> > brought out to the front panel it will not have this attr.
> > For other type of labels we should have different attributes.
>=20
> Hmm, that would kind of embed the pin type into attr which feels wrong.

Looking at the above from a different angle, the
DPLL_A_PIN_FRONT_PANEL_LABEL attribute will be available only for
DPLL_PIN_TYPE_EXT type pins, which looks legit to me - possibly
renaming DPLL_A_PIN_FRONT_PANEL_LABEL as DPLL_A_PIN_EXT_LABEL.

Cheer,

Paolo

