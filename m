Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DECC433F5
	for <linux-clk@archiver.kernel.org>; Mon, 21 Mar 2022 19:27:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352657AbiCUT3W (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Mar 2022 15:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352830AbiCUT2R (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Mar 2022 15:28:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F2E91877E1;
        Mon, 21 Mar 2022 12:26:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A7CC460DBF;
        Mon, 21 Mar 2022 19:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4409C340E8;
        Mon, 21 Mar 2022 19:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647890811;
        bh=VBZ7dLMfzVeymeYnE82k5NNdzTuepKWng0FFKYTaSA4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IR5BGmYkMJ8vBX+bfjnOoPbfgh8UY7vKJtQeJ5RZWTDsNoeDCqdjfBtK/cBLVAoe7
         /zjQRxYHhQCjpZE4GFWwOdUbbAvn0GKB5oXc3tmDtYg8mh8m0p4cjmUPYpVJBjfJKx
         3kAvNc6l7WWZe8GB9Ke/aQTfAuLOddgeO1zeNaTYQqa9eg5k4k2jba18fWv4qt3NT3
         Lvbn5Rr3H4/7/4RRPRj9Zx0Sms1uDcRp/6CTeGMXV+p3GsVAlzT6EPAbAqd34WZaSz
         0TMPARQd0i6TSQG6gC8c8q/zAfgkpCrs8JrZn23lYs0rMTczcfE7EQ32qjFwHkhrGR
         2NvoQ1tmqOT3A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5f97232b-579f-bccf-c603-c263aea143b6@denx.de>
References: <20220226040723.143705-1-marex@denx.de> <20220226040723.143705-2-marex@denx.de> <20220318210356.55D1EC340E8@smtp.kernel.org> <5f97232b-579f-bccf-c603-c263aea143b6@denx.de>
Subject: Re: [PATCH v3 2/3] clk: Make __clk_hw_register_fixed_factor non-static
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Mon, 21 Mar 2022 12:26:49 -0700
User-Agent: alot/0.10
Message-Id: <20220321192650.E4409C340E8@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-03-20 06:23:14)
> On 3/18/22 22:03, Stephen Boyd wrote:
> > Quoting Marek Vasut (2022-02-25 20:07:22)
> >> Access to the full parameters of __clk_hw_register_fixed_factor()
> >> is useful in case a driver is registering fixed clock with only
> >> single parent, in which case the driver should set parent_name to
> >> NULL and parent_index to 0, and access to this function permits it
> >> to do just that.
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> Cc: Michael Turquette <mturquette@baylibre.com>
> >> Cc: Rob Herring <robh+dt@kernel.org>
> >> Cc: Stephen Boyd <sboyd@kernel.org>
> >> Cc: devicetree@vger.kernel.org
> >> To: linux-clk@vger.kernel.org
> >> ---
> >> V2: - New patch
> >> V3: - No change
> >=20
> > This isn't exported. Given that we don't typically export an internal
> > function (hence the double underscore) I'm going to change this to be a
> > new function. See the attached patch.
>=20
> I can confirm the change works and looks OK.
>=20
> Do you want me to send a V4 or will you squash it into these patches=20
> yourself when applying?

No need I fixed it up and pushed it out.
