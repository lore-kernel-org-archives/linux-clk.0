Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130DAC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 29 Oct 2021 06:43:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E20A36113B
	for <linux-clk@archiver.kernel.org>; Fri, 29 Oct 2021 06:43:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbhJ2GqH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Oct 2021 02:46:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:56406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230252AbhJ2GqG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 29 Oct 2021 02:46:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69FCA610E8;
        Fri, 29 Oct 2021 06:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635489818;
        bh=gEHX7ynF/ppcvsGDEnIY4VgZwPq0Ug481fxptjn4OBU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LIx/w/9Il1pkztf3jXOH/9JLrHiELtQiqon0lK3OO8TJ1imLJLy8gG/UT/C+6P4dB
         LCQj773WZpnFCyqZ2EG8PCZzCyr5pk9U7y+pqMo29Js2PAq7AiQ25nbhpcp5lA4knk
         jBafPDu1kWnU9OTjNTKAR/VmsPfGIR1uk4P8/nJvZSq+JgiIwBR1PThsngsbOzQs2Q
         h4iID5RI74xiHh+wJw8Q7srDaA7xUfG0efICUujePy/xXidzF0nCnDP8jk8PwXyetU
         MQWEmQkVt8luQ08xZ6071+kbHsrXawkr2ziMCBA+h6RTik1qNjH37qud67SGh9oQep
         KiZ1J6gA42jxg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <463e771a-71cd-8457-ed4d-a505a39009cc@gmail.com>
References: <20211016105022.303413-1-martin.blumenstingl@googlemail.com> <20211016105022.303413-2-martin.blumenstingl@googlemail.com> <163458726377.1767887.8064107515338216758@swboyd.mtv.corp.google.com> <463e771a-71cd-8457-ed4d-a505a39009cc@gmail.com>
Subject: Re: [PATCH clk-fixes v1 1/2] clk: composite: Also consider .determine_rate for rate + mux composites
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com
To:     Alex Bee <knaerzche@gmail.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-clk@vger.kernel.org
Date:   Thu, 28 Oct 2021 23:43:37 -0700
Message-ID: <163548981724.15791.2800391930689856024@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alex Bee (2021-10-27 15:47:03)
> >=20
> > Applied to clk-fixes
>=20
> any chance this can make it in 5.15?
>=20

That's the plan.
