Return-Path: <SRS0=L6e3=X4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BE9C10F14
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 20:59:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 776E4215EA
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 20:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570136370;
	bh=+pRfoOO7vbNetx3C0ZzaCJWPfudCEYI1WCY6NU95QVs=;
	h=In-Reply-To:References:From:To:Cc:Subject:Date:List-ID:From;
	b=yTKoA8aMVU1pUTUCLhlKyg68BnKm7sr1UuXmcipFrFZ+MmnQNphPsxJqaDqnWGuSW
	 WpOYLHjw6y5k5acnUH+5Ob9fF4gGwse3eH3H6vd8Xqt2sLtwRd4N3sL1MeG/f0DuTh
	 h5IvcoOWwOQH6ZO8wHIs3iqhycJcPPl8/kVNIxFc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728315AbfJCU7a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Oct 2019 16:59:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:45152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727024AbfJCU7a (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 3 Oct 2019 16:59:30 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5943A2086A;
        Thu,  3 Oct 2019 20:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570136369;
        bh=+pRfoOO7vbNetx3C0ZzaCJWPfudCEYI1WCY6NU95QVs=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=dXsQ6d8BdsympZ1beP5XI8Unh+SRTzRgqXebdbS3KC+XkzCq7X3GXjMXtuLGLRo8J
         uu7CRHVGYOMZEMRBoy9UOE7dTSrJ6dqFTB6Clt/SQ3fCNiW/Hp1ZNLV8DqBUu2yUZa
         CPaur9pfgJXCSK8+Hdkv8bfv5UBD+bbLVJJwFGZU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1569321191-27606-1-git-send-email-eugen.hristev@microchip.com>
References: <1569321191-27606-1-git-send-email-eugen.hristev@microchip.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Eugen.Hristev@microchip.com, alexandre.belloni@bootlin.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com
Cc:     Nicolas.Ferre@microchip.com, Eugen.Hristev@microchip.com
Subject: Re: [PATCH] clk: at91: sam9x60: fix programmable clock
User-Agent: alot/0.8.1
Date:   Thu, 03 Oct 2019 13:59:28 -0700
Message-Id: <20191003205929.5943A2086A@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Eugen.Hristev@microchip.com (2019-09-24 03:39:09)
> From: Eugen Hristev <eugen.hristev@microchip.com>
>=20
> The prescaler mask for sam9x60 must be 0xff (8 bits).
> Being set to 0, means that we cannot set any prescaler, thus the
> programmable clocks do not work (except the case with prescaler 0)
> Set the mask accordingly in layout struct.
>=20
> Fixes: 01e2113de9a5 ("clk: at91: add sam9x60 pmc driver")
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---

Applied to clk-fixes

