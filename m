Return-Path: <SRS0=Wo9f=PM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DDDC43387
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 21:29:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 67A6121872
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 21:29:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=boxcast-com.20150623.gappssmtp.com header.i=@boxcast-com.20150623.gappssmtp.com header.b="Y7ZTR1na"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbfADV3U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Jan 2019 16:29:20 -0500
Received: from mail-vs1-f47.google.com ([209.85.217.47]:45071 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbfADV3U (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Jan 2019 16:29:20 -0500
Received: by mail-vs1-f47.google.com with SMTP id x28so23456959vsh.12
        for <linux-clk@vger.kernel.org>; Fri, 04 Jan 2019 13:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=boxcast-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vE1Q0Bc1SFxN5ZGoc1DN9oRhWsroDUR7ST1CAHn9QkM=;
        b=Y7ZTR1navXP3D1KcHPx04IR+Kl2Uw7aav84guCM04j+Tu1qE8jd4Zt9AdHZBiDFXZI
         PqHHDTisejW3vTrYzLhm6QaiF3lHbgeRzxtKJcP/ZtDB/kCJHldHq+klMg6/MDLTizmW
         M5mSmbYyfEYQ5YDncxxZyQcA70PJ7t2U9/tMRvFldh5SoWCDT4Kj5oxSgzlC/gGQ+FR8
         tWtcto6CNL8uKP35+sTu4Ybj3uN9ySLHvH343eoTOiTbDrVkCrZfZxQjoTXfMA/O/gkl
         S6LiSuGGtYIbmqfs4yiUgJIPgE8hPvE8y3u7JGFdzZ66MeCdgZLt8kGV+hYK49qqTV2n
         btvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vE1Q0Bc1SFxN5ZGoc1DN9oRhWsroDUR7ST1CAHn9QkM=;
        b=LiAo/6gRWqpz0iQQOPyWYBRsnIRaNwLSw4aj1AWrS4xB4P4L5MQLBeHum3QVmhikiQ
         tI7I9DxF0WA6XotTjfHp6O8Qc0/cvDKOXezRKAgOGy9meHZZqlFC55oqDsxh/4AO2UwH
         vMxEeYB3tWTo5c/0fypP1dy936qud9bhuNLCiQiMo12H6vkx3SQIjs8MK1egAJfp+0/Q
         ViUjIJPi9unxy+wrFA7TguuBEvqTIkgtLomEqdkTEF050uNdLZvluiQx8EDJ3ijfUcWv
         rgt87vRa8T7dbXY/XsHJPv24emQGxHKHaWqRzLfookMq+bIFx58NJCni3cwIQtjugyvN
         NeLg==
X-Gm-Message-State: AJcUukcrPB8l+3jkdq8d+TxIEYolRNZ2LRzO0v1/+S+ryAEdaovc5juW
        3TOzN6AGmNcbjAgVYX1YaSfHzus77dnYwrLybuc6wfmHXUU=
X-Google-Smtp-Source: AFSGD/Usv8Swlxbmrap7HYktpVwCftV02aSAqngjiHdcnaglvnzvYJY/swJX4EmJXMhMTUS1B5u1KuGbBc3cLAjRPEQ=
X-Received: by 2002:a67:b749:: with SMTP id l9mr21776128vsh.123.1546637358738;
 Fri, 04 Jan 2019 13:29:18 -0800 (PST)
MIME-Version: 1.0
References: <CGME20190104023702epcas4p4e6b225121db059cb6ed167581c303e92@epcas4p4.samsung.com>
 <CAP_wsPYwykAPF=aedoHkZnKhLgFdbUNMK7tpFJkhMfr_X2Gnrg@mail.gmail.com> <32a08ee4-3989-3785-88d6-7d215147eba3@samsung.com>
In-Reply-To: <32a08ee4-3989-3785-88d6-7d215147eba3@samsung.com>
From:   Jonny Hall <jonny.hall@boxcast.com>
Date:   Fri, 4 Jan 2019 16:29:07 -0500
Message-ID: <CAP_wsPa5qsuUhDNXWe55612xY-ppytj+jX4+5s-bFxn5BURoTg@mail.gmail.com>
Subject: Re: Informing common clock framework driver of externally-derived
 base clock frequency
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jan 4, 2019 at 4:30 AM Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
>
> Hi,
>
> Cc: CCF maintainers
>
> On 1/4/19 03:35, Jonny Hall wrote:
> [...]
>
> > ... However, in my application, the input frequency of
> > the si5342 is not known in advance, is derived from an external
> > source, and can change during runtime. The si5342 will need to be
> > (re)configured during operation with the frequency of this root clock
> > source in order to properly lock onto it and generate the correct
> > output frequencies -- it cannot independently determine the input
> > frequency, only "locked" / "unlocked" state.  The application software
> > (other drivers and usermode application code) will know the input
> > clock rate.  I've though of a couple ways to do this:
> >
> > -Implement the root clock source as an "imaginary" divider where the
> > set_rate call actually configures the input dividers of the si5342.
> > This approach seems to abuse the common clock framework, as I'm not
> > actually *setting* the rate, I'm *informing* the driver of a rate that
> > was determined independently.
>
> It sounds like registering a clk notifier on the si5342 root source clock
> might be a way to go, wouldn't that work for you?
> For an example you could have a look at drivers/clk/sunxi-ng/ccu_mux.c.
>
> --
> Regards,
> Sylwester

Maybe my understanding is incorrect, but to me it looks like a
notifier (callback registered with clk_notifier_register) is actually
the opposite case -- this method would be used by a clock consumer
that wants to be notified by the common clock framework that a clock
rate has changed (I, as an endpoint, want to know when my clock
source, which is controlled by CCF drivers, changes rate).  The use
case I'm looking for is when a clock chip needs to be notified by
*something else* that something in the system has changed (I, as a
clock chip, need to be informed by other parts of the system what my
input clock rate is).

To add a bit of clarity to the scenario -- in my use case, the si5342
is generating video pixel clocks for video outputs from the system.
The inputs of the si5342 are other video pixel clocks, from video
inputs to the system.  The parts of the system that are aware of the
input clock rates are things like HDMI subsystem drivers and usermode
application code.  I need a way to connect these
"parts-that-are-aware-of-the-clock-rate" to my si5342 driver so it can
properly configure that portion of the si5342 -- preferably within the
common clock framework, because on the output side of the si5342, our
video output drivers already work with the CCF.

It looks like some similar chips use recalc_rate as their function to
configure input dividers -- but there appears to be no way to call
recalc_rate through the clk.h API -- it looks like recalc_rate is only
used for keeping track of things internal to the CCF.

Thanks,
  -Jonny
