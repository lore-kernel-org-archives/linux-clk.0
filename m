Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 892B2C25B67
	for <linux-clk@archiver.kernel.org>; Tue, 24 Oct 2023 02:36:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232111AbjJXCgA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Oct 2023 22:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232023AbjJXCfy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Oct 2023 22:35:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D983C10D9;
        Mon, 23 Oct 2023 19:35:42 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54EFAC433CA;
        Tue, 24 Oct 2023 02:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698114941;
        bh=Q5OM8zqw2zTU56yqEkXyN/h5VL/CRznzcuemWZ4Rs7M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hs2b5UDqeY393JE+uSBUAt7n+HPyEIt+z2MOBLqksFSaPzbRimYeg36SYSh+owlz/
         PDxevHw8dqQi3C8Xeh2mF97D8a3uORuooqWjoWSFyubnNmkgLs0UAwmx/t8HQnqkwk
         v1mk79YQhGXrrYVSsm7C8PREE1d6Le1Rya1N3HsUeTwfLJghDSJWz+TzTk/5qhZscP
         SdCGQeXS9nWcZM1D590CFYXw5nJ60hJVi1lo+VMp5QchM+OEWXcpTPf25i6G1eiWcE
         kSfE9oHwfACs9biD5tj7ovtBnxppLIddvsR+rTTdnrJ0Mk85XQiodiFxRSQddqeqEe
         L3TfzyizRiP8A==
Message-ID: <961ca9d413ac51ff26d59f5190c8970e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230909155418.24426-1-biju.das.jz@bp.renesas.com>
References: <20230909155418.24426-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] clk: clk-si544: Simplify probe() and is_valid_frequency()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Biju Das <biju.das.au@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 23 Oct 2023 19:35:39 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Biju Das (2023-09-09 08:54:18)
> The driver has an OF match table, still, it uses an ID lookup table for
> retrieving match data. Currently, the driver is working on the
> assumption that an I2C device registered via OF will always match a
> legacy I2C device ID. The correct approach is to have an OF device ID
> table using i2c_get_match_data() if the devices are registered via OF/ID.
>=20
> Unify the OF/ID table by using max_freq as match data instead of
> enum si544_speed_grade and replace the ID lookup table for
> the match data by i2c_get_match_data(). This allows to simplify both
> probe() and is_valid_frequency().
>=20
> Drop enum si544_speed_grade as there is no user.
>=20
> While at it, remove the trailing comma in the terminator entry for the OF
> table making code robust against (theoretical) misrebases or other similar
> things where the new entry goes _after_ the termination without the
> compiler noticing.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Applied to clk-next
