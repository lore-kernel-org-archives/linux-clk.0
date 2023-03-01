Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2485DC7EE2F
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 19:03:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbjCATDd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 14:03:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjCATDc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 14:03:32 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F3A15170
        for <linux-clk@vger.kernel.org>; Wed,  1 Mar 2023 11:03:30 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-536cd8f6034so381992347b3.10
        for <linux-clk@vger.kernel.org>; Wed, 01 Mar 2023 11:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677697409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Zq6w+3KpfUuJehM+pz4ZLpOlH92MgBO3MjFD8/rQoI=;
        b=J2JKndqrLvZeHdUnqzz+c26OCyx/4EwfeEMfpstyZTQRAom4cmO3NzeqL55K8g5YHe
         4vz4p0YCiloHqMIGtzHb+uHsoZkfCOb2Ty/PXPCcBY7sw0Irzsw1tKHzubOxF+pzGBao
         fd6DlR7W4NRUzfyvnZ55eng+YBaf3fRyaU+KRiBoX4j1BxR6YjtQbsyFb9EYN5RiAyEL
         12knCbcxwweQfNZf2uA6RuvVgOdyBgRtKLu5HzcfJa1eXPWy1fpuxPjuqgXVf5tT9D5K
         DtcvAAidV6F8fl0sZRXzYJ5595m9xyAb5ttJ/ktOHvpGjvyaSBn2NGEzyKWXYVe/xiiR
         7/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677697409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Zq6w+3KpfUuJehM+pz4ZLpOlH92MgBO3MjFD8/rQoI=;
        b=Oqg2TGfZ/55IkpOxYAh3o4N8dOLPsuPXcQNwCj4xC2ooABo7934/mAHBfEGC7Z7YHs
         6eY0Cc/OB6L4cFSMT025U1WhVN6TWjEXui4WJYrIZ3i8hhQlD3D7yR/9UrEoFse0HYpH
         MIWwbDCjE+GVJ/XXSt1KQ/wYDcqjMMYijK2zUxBncYx9cGJqnlGcFnm4ig8EIJ2sXylB
         cSBKPI6cmeWnjWa6OQbe30BA1dL11EzSOV4WLb0UcUrA0coCQMTUWyxG7AsedEzYnBvi
         Mnj+pYnbm/fd9ErZJoc5a1VGJXW9yeGjFaVWETBuSf+/qXp4vzYzKc6gaGevHU/XpHLH
         M4/Q==
X-Gm-Message-State: AO0yUKWTxzOKbiLkeNNr43Wt9lI7xADJHocxF5DbWUOU2XgX1YtaSELY
        PJpNLeIlRhkt9aK9v+SU2W9Q4A8BRk66ZlYDoOe6Rg==
X-Google-Smtp-Source: AK7set+Un546LGQlZJYVV02GkQBXlnvnyWWFDBtFp2Swl+8gKQ+savF590tdL71F6KBBCBZtyCa52yEmc5uXPgb5scc=
X-Received: by 2002:a81:4005:0:b0:52e:dddf:82b9 with SMTP id
 l5-20020a814005000000b0052edddf82b9mr4427638ywn.10.1677697409653; Wed, 01 Mar
 2023 11:03:29 -0800 (PST)
MIME-Version: 1.0
References: <20230227183937.377612-1-ralph.siemsen@linaro.org>
 <20230227183937.377612-4-ralph.siemsen@linaro.org> <20230301122430.4317530f@xps-13>
In-Reply-To: <20230301122430.4317530f@xps-13>
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
Date:   Wed, 1 Mar 2023 14:03:18 -0500
Message-ID: <CANp-EDYOeZ3GWNQFpoLgRXj+6-O1Hk+DSr1hTGd=OhX=T9iHhQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: renesas: r9a06g032: document structs
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Miqu=C3=A8l,

Thanks for reviewing. A few comments below.

On Wed, Mar 1, 2023 at 6:24=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> > +/**
> > + * struct r9a06g032_gate - clock gate control bits
> > + * @gate:   bit which enables/disables the clock
>
> Is this really a bit? I see below you explain what each field means
> in terms of offset/bitmask, so maybe we could be vague here,
> something like:
>
> "configuration to enable/disable the clock"

I'll drop the "bit" phrasing from all of them, to avoid confusion.

> > + * @reset:  bit which controls module reset (active low)
>
> "clock module reset" ?

Sounds good!

> > + * @ready:  bit which indicates device is ready for access
>
> "the clock is stacle and the device fed should be ready for access"
> (not sure about this one)

This one controls whether read/write requests are forwarded to the
device. I believe this is to prevent the AXI bus from hanging the
module clock is not enabled. I tried to explain that here:

> > + * Modules may also need to signal when the are @ready to
> > + * handle requests (read/writes) from the NoC interconnect.

I'll see if I can come up with a better description for both @ready and @mi=
dle.

> > + * @type:   see enum gate_type
> > + * @index:  the ID of this clock element
> > + * @source: the ID+1 of the parent clock element.
> > + *          Root clock uses ID of ~0 (PARENT_ID);
> > + * @gate:   describes the bits which control clock gate
>
> I would just refer to the structure above (like @type).
>
> No description of the following fields? :-) :-) It's okay, but while
> you're at it...

Ack, I will add the others too.

Ralph
