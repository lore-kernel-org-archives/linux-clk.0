Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C941EB64D0
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 19:01:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231954AbjFMTBE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 15:01:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231562AbjFMTBD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 15:01:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 011CFE5;
        Tue, 13 Jun 2023 12:01:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6FA59639C3;
        Tue, 13 Jun 2023 19:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B74C433F0;
        Tue, 13 Jun 2023 19:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686682860;
        bh=vpdD1xtCGn8zgkiM7OOoo1VAxg2XmTvf1Sa5rKBYx3M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eA+mBtT1y42vAoVhEkJzt0PosLqltCsC9EldapWQtzEaUjEClky2Gqoh8A51X8bOt
         FPUcVcRJFERNRNxgrZjiOkud/8OrirOczyYf2Ek4QgCK/3ZG/7Ba6ypgvNoaC0VhDl
         UzhZ2NgNP+Z1FBB8o9lzTIaEiPGsYECK4+rxpQu7ylhu8Tbtb+mzvnBa/xOTmKMYyV
         HbwFHWsYZmKFtQwSQDM7bNGmepiCIVcQgwmOcLGnsudDpLOS8IZYD3if82gEAah+UL
         kCDbQ1hzt3zoUI5QJocNxHqHo3PWBT6iX624FkrslwsFQzL4ofj/kbyLsHfS4IqBE/
         HP3o4GzbZoE4Q==
Message-ID: <8959f662218933897a768eb6c100164c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230613011201.1166753-1-sboyd@kernel.org>
References: <20230613011201.1166753-1-sboyd@kernel.org>
Subject: Re: [PATCH] ASoC: tlv320aic32x4: pll: Remove impossible condition in clk_aic32x4_pll_determine_rate()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        patches@lists.linux.dev, Maxime Ripard <maxime@cerno.tech>,
        kernel test robot <lkp@intel.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Date:   Tue, 13 Jun 2023 12:00:58 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stephen Boyd (2023-06-12 18:12:00)
> Smatch warns:
>=20
> sound/soc/codecs/tlv320aic32x4-clk.c:219 clk_aic32x4_pll_determine_rate()=
 warn: unsigned 'rate' is never less than zero.
>=20
> Cc: Maxime Ripard <maxime@cerno.tech>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202306101217.08CRVGcK-lkp@i=
ntel.com/
> Fixes: 25d43ec352ea ("ASoC: tlv320aic32x4: pll: Switch to determine_rate")
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next
