Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E282CA0ECD
	for <linux-clk@archiver.kernel.org>; Tue, 12 Sep 2023 03:11:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234561AbjILDLh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Sep 2023 23:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242330AbjILDLX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Sep 2023 23:11:23 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D257107C61
        for <linux-clk@vger.kernel.org>; Mon, 11 Sep 2023 19:07:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DCBC433C8;
        Mon, 11 Sep 2023 20:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694465390;
        bh=tXh52zQ3ksnPDe7dwnngV0ivakdoeYJLtl9+Qlj0BVI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZTE//uRzsaHf4WlK2aQYcMsNMWgNNYpr0gUOtxgumVKiSoVgX7ShnYXHmsNjVk8Lg
         sy7kX32cpnzrNcKr0N6tzHtHJIdrQK/OyRO7MC4eqrOXLOQGWXsBjAkx19k7nUMgWF
         fbrCW96xW+ucbxVb3BYw2phZJKMOTKm4/1Av4+WTH1T8WePvU8Y26aU19cgHGtTQUD
         FvrKAFl8fUrZJFW2IQtLkHzzMCojFu2VdGaWfR03RcsMs1E+4NHQ1mlVfoRWb6pt5q
         3hiru/B99g8OkQmY9+4mNh7gQOUI3rGApUxd4gomsq0BPTJwxUAlyT21NE++L6m4iu
         BE8eFON2TnM6g==
Message-ID: <9c8519e9bd5e1852fe5a6821918222d3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230831181656.154750-1-marex@denx.de>
References: <20230831181656.154750-1-marex@denx.de>
Subject: Re: [PATCH 1/2] clk: si521xx: Use REGCACHE_FLAT instead of NONE
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Mon, 11 Sep 2023 13:49:47 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2023-08-31 11:16:55)
> In order to reload registers into the clock generator on resume using
> regcache_sync(), it is necessary to select one of the regcache types
> which are not NONE. Since this device has some 7 registers, use the
> simplest one, FLAT. The regcache code complains about REGCACHE_NONE
> being selected and generates a WARNING, this fixes that warning.
>=20
> Fixes: edc12763a3a2 ("clk: si521xx: Clock driver for Skyworks Si521xx I2C=
 PCIe clock generators")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

Applied to clk-fixes
