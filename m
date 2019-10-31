Return-Path: <SRS0=Iazp=YY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C01CA9ECF
	for <linux-clk@archiver.kernel.org>; Thu, 31 Oct 2019 04:18:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 17A7E2086D
	for <linux-clk@archiver.kernel.org>; Thu, 31 Oct 2019 04:18:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dDi7VJOV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbfJaESY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 31 Oct 2019 00:18:24 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:37991 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbfJaESY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Oct 2019 00:18:24 -0400
Received: by mail-qt1-f195.google.com with SMTP id t26so6752848qtr.5
        for <linux-clk@vger.kernel.org>; Wed, 30 Oct 2019 21:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nSHy1cjR1xkgmuZz3ish/LYbJAeXr+2guwTMfaEp/2Q=;
        b=dDi7VJOVxKs0r/d6rOSHZNa49pPy/2qkN3lVs78MtSJYQcuETyVvpU20XKacQl03rP
         Z5Oh4DMuEqvQYoqhlQhRSROYoKiONHSAtvDClYuFK9nQ3xXEyHTBNWnRVRAXAdw0UBBm
         kW+F0NYA3db0/9JquvnCHen6w5K8C2EOkgyrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nSHy1cjR1xkgmuZz3ish/LYbJAeXr+2guwTMfaEp/2Q=;
        b=ce27gfWEzNbZpKmhhcmiP+Jh50INIQQUPFNrTnMcfF0X+V27H13fmNKhfh+RfjzpkK
         6+ylvvU8eeK3sC9VDohSEd6s/0lGsnoj7LuT2FzfMMqU/x92aEb3EKXi7r1vXmdQEIn4
         qteTU/HlcqJBB4zOI+oVqLhTZoFC8bDyIkGJEYvIU5v7nsFqX/CH9WCAvT1zR6ZqhSqY
         HPFtd2FG+TdiCG0X3Z/zUJDzsQqUEuPtbpZ/Gfsgt+aaktA2qP0isnlP7YijctULbejY
         X0gfjfa69uZvlrui/qcha3FzEDPIBX5P6Rx7oXD6ylPTIExtmaneo7JDNAXqELLb8BUh
         basQ==
X-Gm-Message-State: APjAAAW5tfsaTqAP87xFR5VZ0tqWgk8DNwcZjD0hnqRLg4CvMWgToErn
        xKeGY97J27SWcP/cpDJv99lvTAIs/UwRj4j5jbMWSQ==
X-Google-Smtp-Source: APXvYqzvctBznLa1zRorcFn3nFNYxiVwCfSbZqxRisaWDLUronf8jK6QlXFzZaxUI1E4SGi5OziDzFPEZJ9JxHay74A=
X-Received: by 2002:a0c:b35c:: with SMTP id a28mr2755168qvf.238.1572495501348;
 Wed, 30 Oct 2019 21:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20181116125449.23581-1-matthias.bgg@kernel.org> <20181116125449.23581-4-matthias.bgg@kernel.org>
In-Reply-To: <20181116125449.23581-4-matthias.bgg@kernel.org>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Thu, 31 Oct 2019 12:17:55 +0800
Message-ID: <CAJMQK-jHHAsBoL6Zcv8ZW1nRAD9NRjEbH1hnf9q418zGka8Vxg@mail.gmail.com>
Subject: Re: [PATCH v5 03/12] clk: mediatek: mt8173: switch mmsys to platform
 device probing
To:     matthias.bgg@kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        CK Hu <ck.hu@mediatek.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        David Airlie <airlied@linux.ie>, mturquette@baylibre.com,
        sboyd@codeaurora.org, ulrich.hecht+renesas@gmail.com,
        laurent.pinchart@ideasonboard.com,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        rdunlap@infradead.org, sean.wang@mediatek.com,
        lkml <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, sean.wang@kernel.org,
        wens@csie.org, Matthias Brugger <mbrugger@suse.com>,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Nov 16, 2018 at 12:54 PM <matthias.bgg@kernel.org> wrote:
>
> From: Matthias Brugger <mbrugger@suse.com>
>
> Switch probing for the MMSYS to support invocation to a
> plain paltform device. The driver will be probed by the DRM subsystem.
>
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---

> +
> +static struct platform_driver clk_mt8173_mm_drv = {
> +       .probe = mtk_mmsys_probe,
> +       .probe = mtk_mmsys_remove,
Should be .remove?

> +       .driver = {
> +               .name = "clk-mt8173-mm",
> +       },
> +};
> +module_platform_driver(clk_mt8173_mm_drv);
>
>  static void __init mtk_vdecsys_init(struct device_node *node)
>  {
