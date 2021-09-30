Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F06C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 30 Sep 2021 18:09:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49A276126A
	for <linux-clk@archiver.kernel.org>; Thu, 30 Sep 2021 18:09:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353156AbhI3SKu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Sep 2021 14:10:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:54780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353055AbhI3SKs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 30 Sep 2021 14:10:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDB1D619E2;
        Thu, 30 Sep 2021 18:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633025345;
        bh=SpOwuMFeKWDwrjzytoNBM5i8GlBsyHpBPYsWVUY8vzc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HMSY8R3g3r24iHxPWgUSGYEK92/IjPrnTikT+Rd2bBxrpzpMo3T+kn6kXzOkg04XM
         y60QgKZprX1Y4latZhhw3LF4v5LeRPkJpS9XUXo47/bTctUdxhWW5WKBtBuHBczwWI
         v7raU8V8rGQKYjywhmIJiRvdZmXVRrTsX74xHk+ixLly/vBkDS4d0EWcyW6iO67RbZ
         SuGXdymXonn8i7r9zPbfJYlcugURbovdGtN9is7/Od4KkWnKrFA1bZMaM+w8AzCgSo
         zPVKzRQwpL2RDo4+3sxGTWhgaMAyDARjBXZDxt6bTHPBXes4rm5DjFMgmBxmWdHTNp
         WkX0ypgLThqCQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210922125419.4125779-3-maxime@cerno.tech>
References: <20210922125419.4125779-1-maxime@cerno.tech> <20210922125419.4125779-3-maxime@cerno.tech>
Subject: Re: [PATCH 2/5] clk: bcm-2835: Remove rounding up the dividers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        Mike Turquette <mturquette@baylibre.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Michael Stapelberg <michael@stapelberg.ch>,
        Linus Torvalds <torvalds@linux-foundation.org>
To:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Thomas Zimmermann <tzimmermann@suse.de>
Date:   Thu, 30 Sep 2021 11:09:04 -0700
Message-ID: <163302534457.358640.9878159260142966969@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2021-09-22 05:54:16)
> The driver, once it found a divider, tries to round it up by increasing
> the least significant bit of the fractional part by one when the
> round_up argument is set and there's a remainder.
>=20
> However, since it increases the divider it will actually reduce the
> clock rate below what we were asking for, leading to issues with
> clk_set_min_rate() that will complain that our rounded clock rate is
> below the minimum of the rate.
>=20
> Since the dividers are fairly precise already, let's remove that part so
> that we can have clk_set_min_rate() working.
>=20
> This is effectively a revert of 9c95b32ca093 ("clk: bcm2835: add a round
> up ability to the clock divisor").
>=20
> Fixes: 9c95b32ca093 ("clk: bcm2835: add a round up ability to the clock d=
ivisor")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
