Return-Path: <SRS0=nRqW=NY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCE7C43441
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 22:48:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4687F2087A
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 22:48:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRepUTNC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4687F2087A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbeKNIsU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Nov 2018 03:48:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:39270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726531AbeKNIsU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 14 Nov 2018 03:48:20 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4CE992087A;
        Tue, 13 Nov 2018 22:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1542149279;
        bh=jBRVT/4isSbnPmU7KBtxzGV+qR/YwMzzL7Uy4zOa58I=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=eRepUTNCqGyaXKryWZAZLGPeChmk2e04nZY+w0sPo2cmhbLRwW5YpwlfPnpOiBFt9
         /Yd+lbYa+I8JONOh2KPbvJslkU0xbhtxQwlHzfdqQoSwWrfbgcgnZ08Sb9nqmm4o0G
         wtSEbdVB3RdsRrIP3DVaCmdWjB8Z4hp5aoeoB5/s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Jeffrey Hugo <jhugo@codeaurora.org>, jbrunet@baylibre.com,
        mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <c9984aa1-4c87-d97d-eec8-4adbe9bb243e@codeaurora.org>
Cc:     linux-clk@vger.kernel.org
References: <c9984aa1-4c87-d97d-eec8-4adbe9bb243e@codeaurora.org>
Message-ID: <154214927860.88331.11809444316140612739@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: Does clk_core_round_rate_nolock() really do the right thing?
Date:   Tue, 13 Nov 2018 14:47:58 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jeffrey Hugo (2018-11-13 14:37:54)
> "clk: rework calls to round and determine rate callbacks" [1] added =

> clk_core_round_rate_nolock().
> =

> I question that it does the right thing in a specific scenario.
> =

> Lets assume we have a clock that is currently running at 5Mhz, but we =

> want to have it run at 400Khz, and the clock supports both rates. =

> Perhaps the clock is for a hardware block, where in to switch =

> operational modes, the clock frequency is expected to run at the lower =

> frequency.
> =

> The driver may call clk_set_rate() to do so, resulting in the following =

> call flow (based on 4.20-rc2)-
> =

> clk_set_rate()
> clk_core_set_rate_nolock()
> clk_core_req_round_rate_nolock()
> clk_core_round_rate_nolock()
> =

> In clk_core_round_rate_nolock(), lets assume the conditionals do not =

> apply (clk core cannot round, and set rate parent flag isn't set).  In =

> that case, the requested rate is modified by this line -
> =

> req->rate =3D core->rate;
> =

> This transforms the request from 400Khz to 5Mhz (the current clock rate).
> =

> What will then end up happening is we return from =

> clk_core_round_rate_nolock(), through clk_core_req_round_rate_nolock() =

> back to clk_core_set_rate_nolock() where we check to see if the rate =

> returned from the "rounding" is the same as the current clock rate (5Mhz =

> =3D=3D 5Mhz).  Thus we conclude there is nothing to be done, and we retur=
n =

> success back up to the caller having not actually touched the clock or =

> set the requested rate.
> =

> On the face of it, this seems incorrect to me, although I am a neophyte =

> to the clock framework.  Is this really the expected behavior, to leave =

> the clock at the current rate even though the requested rate is =

> different?  If so, why?
> =

> =


I think you're getting hung up on how clk_set_rate() works.
clk_set_rate() sets the rate to be what the clk can support based on the
requested rate. I suppose we could have named it better to be
clk_request_something_close_to_rate(). The assumption is that a clk
consumer will request the rate it wants, and the clk provider, in this
case the fixed 5MHz clk, will set the rate to what it can support. If
the consumer had called clk_round_rate() before calling clk_set_rate()
to figure out what rate it would get if it called clk_set_rate() with
the same arguments, then it would be informed about what rate is
supported, i.e. 5MHz. It could also call clk_set_rate(4kHz) and then
call clk_get_rate() and see 5MHz returned.

Long story short, clk_set_rate() isn't clk_set_exact_rate(). There's
rounding involved and that rounding is implementation specific.

In your example, it sounds like the clk needs to support rounding so it
can pick between the two different frequencies supported. Then
clk_set_rate() can be called with some frequency and the implementation
can round however it likes to achieve the two supported frequencies.

