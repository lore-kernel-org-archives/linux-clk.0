Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6A5CDB474
	for <linux-clk@archiver.kernel.org>; Thu, 12 Oct 2023 22:42:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442914AbjJLWmG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Oct 2023 18:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442438AbjJLWmF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Oct 2023 18:42:05 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 430D39D
        for <linux-clk@vger.kernel.org>; Thu, 12 Oct 2023 15:42:04 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E11C433C7;
        Thu, 12 Oct 2023 22:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697150523;
        bh=yrRKW0nN2ug47HYHw/pJQHYKlVYEj1Qqp8SgZSIO3Sk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qwpFgFo1t2yN5HETz5wj3Hx3dLJlV9WIJ78NINaTg1yEWCeYNEu1nbscDyld+KxgT
         YeppHmM+2i9GUFfBMa0NszSX37mitihO9BeHBEuxYOK04TbMkn1mBq95E9VXud660J
         I4AqzxljchtfDf99FYBSijSBJJDj5SqlWavMchBsBJf4KWawQyb0OjBheCPGIC5OcL
         pOJjTp5EgSF+C9DvAwtgPyA1WQ6w6M58/CUK6/0G9pmpqd/Bszb8dryoHF6FFMjurN
         NO3O9UdstJJa+pzWcUNqQvHIErLg36Wzmxvq+ZAa8rTXRaCvr8E4AciSxHF8gHg+2i
         6g953Y1oski3g==
Message-ID: <8d58307a9c07961540a338c5b939c055.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231012083729.2148044-1-mripard@kernel.org>
References: <20231012083729.2148044-1-mripard@kernel.org>
Subject: Re: [PATCH] clk: socfpga: gate: Account for the divider in determine_rate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Benedikt Spranger <b.spranger@linutronix.de>
To:     Dinh Nguyen <dinguyen@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>
Date:   Thu, 12 Oct 2023 15:42:01 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2023-10-12 01:37:29)
> Commit 9607beb917df ("clk: socfpga: gate: Add a determine_rate hook")
> added a determine_rate implementation set to the
> clk_hw_determine_rate_no_reparent, but failed to account for the
> internal divider that wasn't used before anywhere but in recalc_rate.
>=20
> This led to inconsistencies between the clock rate stored in
> clk_core->rate and the one returned by clk_round_rate() that leverages
> determine_rate().
>=20
> Since that driver seems to be widely used (and thus regression-prone)
> and not supporting rate changes (since it's missing a .set_rate
> implementation), we can just report the current divider programmed in
> the clock but not try to change it in any way.
>=20
> This should be good enough to fix the issues reported, and if someone
> ever wants to allow the divider to change then it should be easy enough
> using the clk-divider helpers.
>=20
> Link: https://lore.kernel.org/linux-clk/20231005095927.12398-2-b.spranger=
@linutronix.de/
> Fixes: 9607beb917df ("clk: socfpga: gate: Add a determine_rate hook")
> Reported-by: Benedikt Spranger <b.spranger@linutronix.de>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

Applied to clk-fixes
