Return-Path: <SRS0=fX0Q=WL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F6E7C3A589
	for <linux-clk@archiver.kernel.org>; Thu, 15 Aug 2019 13:49:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2787B2133F
	for <linux-clk@archiver.kernel.org>; Thu, 15 Aug 2019 13:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565876976;
	bh=XILyYvenM8mueUzNTt0fyDFTra78z6GvF3WvF2wiNso=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=CnJfzNSZvcUwjB7wi9oVNcouDVK9yOTXrtFlbJrlZQFlcxrNxzX3IBi2JcnkuRdzf
	 G4B3xW/LWQgXVo/O2TOFwy6iEZ9fDceckblhJoJ4ZtEuT5vOX1kF2wzJw/qudwhLeZ
	 dfeTqoeJSsxDbSWx7XHhxuvLZBXtsQZbyaZxgwmc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732552AbfHONtf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Aug 2019 09:49:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:40406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732504AbfHONtf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 15 Aug 2019 09:49:35 -0400
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 27F41206C1;
        Thu, 15 Aug 2019 13:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565876975;
        bh=XILyYvenM8mueUzNTt0fyDFTra78z6GvF3WvF2wiNso=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xunLVaA83Fbaa6Fdti3e4WAjMNv4cWDwWALoTHbKoJOHxmuauGkPVQJlmV+RDwQlG
         H8fjrcVizEavv92/eMqItyQQinbOvS+TnLvnKeEGQHFX4xCd8+6eAt0AKDM8z60vSM
         iLPyBVsIhxv6ifTeBNGEur8tiClV+4wpqBhIAjuQ=
Received: by mail-qt1-f172.google.com with SMTP id b11so2344805qtp.10;
        Thu, 15 Aug 2019 06:49:35 -0700 (PDT)
X-Gm-Message-State: APjAAAUa//32Hjekuim1sKAQL3tafU86s6dgQchZvFaqA6OED2ol8mjM
        DbOdaCGh8OStA+xgRCSSviYlOESAzGB5/TvRTA==
X-Google-Smtp-Source: APXvYqzFcbqOCFWw/Uma4l3oy2DjH+0PUBG+XVA7ZEMtPj5MPqhwFmHx+kGVwQMVzpYeB6DyLNHy3kVz0QEYq2nh2R4=
X-Received: by 2002:ac8:386f:: with SMTP id r44mr4130599qtb.300.1565876974383;
 Thu, 15 Aug 2019 06:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190815101613.22872-1-wen.he_1@nxp.com>
In-Reply-To: <20190815101613.22872-1-wen.he_1@nxp.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 15 Aug 2019 07:49:23 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLp4BB+=kdGkMuH+-QQWHt8vRB_DSxjDYBFHLcHUg5V=A@mail.gmail.com>
Message-ID: <CAL_JsqLp4BB+=kdGkMuH+-QQWHt8vRB_DSxjDYBFHLcHUg5V=A@mail.gmail.com>
Subject: Re: [v2 1/3] dt/bindings: clk: Add YAML schemas for LS1028A Display
 Clock bindings
To:     Wen He <wen.he_1@nxp.com>
Cc:     linux-devel@linux.nxdi.nxp.com,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Yang-Leo Li <leoyang.li@nxp.com>,
        Liviu Dudau <liviu.dudau@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Aug 15, 2019 at 4:26 AM Wen He <wen.he_1@nxp.com> wrote:
>
> LS1028A has a clock domain PXLCLK0 used for provide pixel clocks to Display
> output interface. Add a YAML schema for this.
>
> Signed-off-by: Wen He <wen.he_1@nxp.com>
> ---
> change in v2:
>         - Convert bindings to YAML format
>
>  .../devicetree/bindings/clock/fsl,plldig.yaml | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/fsl,plldig.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
