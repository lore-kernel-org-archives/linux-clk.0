Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF35CC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jan 2022 21:20:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234703AbiAMVUz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jan 2022 16:20:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233724AbiAMVUz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jan 2022 16:20:55 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 341C5C061574
        for <linux-clk@vger.kernel.org>; Thu, 13 Jan 2022 13:20:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F1695B821C3
        for <linux-clk@vger.kernel.org>; Thu, 13 Jan 2022 21:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90BECC36AE3;
        Thu, 13 Jan 2022 21:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642108852;
        bh=X6tbZGFEdhNykZ/yllsfgBDJPOylVJodU1cPFryINMw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=AF16lWvg96RS0o7j2hxBCW+XVbU2XhKO4tnU2YPzY/D8AUKy9aHP3y4iceVGpBl2N
         Bdy440KKxF4mw/5g3Ry83dsk1ZfCg4aSQa/CBtmF7GzpvUwg4ZYWD3dLYNs+wgh5jA
         WQy6fvIvAjDj7sE+63iTCg8I5xEncd7c1UZM3nReSh+ZKL8BQMoZqEiH4BdSjep5rf
         xVmW3pLZOKjaG+fHszEoTBIyhEdeXT10aIouaAbnQYZnfF79BnLiU8Grl7o/bnhTnb
         0BRFJOpWoH39QjT3lQi/shms6/JENRuVSUUOnhuOldrbGTpmG6fzQrDZ7co39cr29/
         rJpLty6j0S+BA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220112203816.1784610-1-robert.hancock@calian.com>
References: <20220112203816.1784610-1-robert.hancock@calian.com>
Subject: Re: [PATCH] clk: si5341: Fix clock HW provider cleanup
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, mike.looijmans@topic.nl,
        Robert Hancock <robert.hancock@calian.com>
To:     Robert Hancock <robert.hancock@calian.com>,
        linux-clk@vger.kernel.org
Date:   Thu, 13 Jan 2022 13:20:51 -0800
User-Agent: alot/0.9.1
Message-Id: <20220113212052.90BECC36AE3@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Robert Hancock (2022-01-12 12:38:16)
> The call to of_clk_add_hw_provider was not undone on remove or on probe
> failure, which could cause an oops on a subsequent attempt to retrieve
> clocks for the removed device. Switch to the devm version of the
> function to avoid this issue.
>=20
> Fixes: 3044a860fd09 ("clk: Add Si5341/Si5340 driver")
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---

Applied to clk-next
