Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D44C04A95
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 06:53:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233501AbiI1Gxu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 02:53:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232160AbiI1GxY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 02:53:24 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4408A1F65C3
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 23:51:26 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id r18so25063956eja.11
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 23:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=VKS/VF0CIgvcZvBFOPg/1OgyZ/pIlJ2/81i9icexORw=;
        b=iECOdZjKhncEnAw0CsNKmcZACs/WmHxH0eaQ4q0VbDy5j5wDGWw1csn5q7gxcz31md
         iZAjgiUd+ID5VWXQiNCNSy7lGFEDGfpmxASWMziXMhFmITezAXVrpFIrKCROmDEJL12x
         XAHO0OJxlXup8DfxacOU1eT4qWrUy+kfMxlSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=VKS/VF0CIgvcZvBFOPg/1OgyZ/pIlJ2/81i9icexORw=;
        b=U1DnbB4Z8xhBVmjH56+lF3WVUprbJJ9Jsi9aEUYqe8ZYLyBOGxWjUOwEzAjE7Y7wYv
         6eliTRjUMRCIMQrHIUsxg7snzCQLpDIpFjMgl+d5ymRts1+i3w3WtXL7kuRagc2QD+8/
         yUrNzwYc0FarNqP1mE9TIsW4TJ9ZXODnTqBx3DOkxWy499slpY+mIW6j0291YGzKZ+g4
         55d21wG2kynNZxKRcHaqnrH0jtuYYfk5PR+lYHEcGoOLBY8ri5WBy8f1MujAQQtsG/3F
         BRmo4sIuSsAFYpHrxlptjPeUYdjuBCYVjQEUnHvCPQhTxUOWpdUnChQcp9BvKMPQin7x
         UkvA==
X-Gm-Message-State: ACrzQf3H1DV1Qca6YijKQJ/RRBXOTKhK5qRqHuAHWbIsiyrzu0mri6vV
        OiA/kB5ld/XBOvqRSEwmwkFGwsg9FBdSsV+ULDTBIw==
X-Google-Smtp-Source: AMsMyM7+efvQsRLd4e2MqG4ydC0xN3YqsjPc8629mTw8VIsF31t+nnGUFKem/9nHVbG9M7i14vzEBfCkJSHU3A+JEyM=
X-Received: by 2002:a17:907:7f93:b0:781:dbee:dece with SMTP id
 qk19-20020a1709077f9300b00781dbeedecemr26105617ejc.323.1664347884849; Tue, 27
 Sep 2022 23:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220926102523.2367530-1-wenst@chromium.org> <20220926102523.2367530-4-wenst@chromium.org>
 <0a1618c4-b808-56bd-e89f-560b0423191d@collabora.com>
In-Reply-To: <0a1618c4-b808-56bd-e89f-560b0423191d@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 28 Sep 2022 14:51:13 +0800
Message-ID: <CAGXv+5E=RXd2u00-j98BFLpiXaei6JgHNbi21-R2nhqHn40x3Q@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: mediatek: mt8192: Do not re-register
 top_early_divs in probe function
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Sep 27, 2022 at 6:39 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 26/09/22 12:25, Chen-Yu Tsai ha scritto:
> > top_early_divs are registered in the CLK_OF_DECLARE_DRIVER() half of the
> > topckgen clk driver. Don't try to register it again in the actual probe
> > function. This gets rid of the "Trying to register duplicate clock ..."
> > warning.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Can't we simply remove the CLK_OF_DECLARE_DRIVER() and top_init_early entirely,
> and transfer TOP_CSW_F26M_D2 to top_divs[] instead?
> I get that systimer concern and we have something similar in MT8195, where the
> TOP_CLK26M_D2 is registered "late".

That was what I initially wanted to do. However I asked MTK whether the
system would work fully without systimer, and apparently it is used during
suspend (presumably it is supposed to be running?), so making it not
functional was a bit concerning.

That said, I do plan to rework the systimer stuff. The /2 divider is
actually internal to the systimer block, and should not have been modeled
the way it is now. Notably, the divider is actually variable. It is
only configured and locked by the bootloader.

For this I think we have two options:

a. Move the /2 fixed factor clock into a standalone device node, like
   what was done for the MT8195

b. Rework the systimer to internalize the divider, and thus moving the
   systimer input clock to osc26M.

Either one is outside the scope of this series. Option a. works especially
well for MT8192, as the configurable divider was removed from the systimer
block (only for this chip).

> Getting back to MT8192, TOP_CSW_F26M_D2 seems to be used only for:
> 1. systimer
> 2. SPMI MST (registered "late").
>
> Being it a fixed factor clock, parented to another fixed clock, it doesn't
> even have any ON/OFF switch, so I think it would be actually possible to go
> for the proposed removal... which would further improve this cleanup.

As mentioned above, I do have some plans to rework the stuff, but it is
kind of beyond the scope of this series, as it changes the device tree
binding and ABI.

Regards
ChenYu
