Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5C0CD68E4
	for <linux-clk@archiver.kernel.org>; Tue, 10 Oct 2023 03:30:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1441993AbjJJDa3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Oct 2023 23:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442082AbjJJDaL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Oct 2023 23:30:11 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D68ECF;
        Mon,  9 Oct 2023 20:30:09 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A362C433C7;
        Tue, 10 Oct 2023 03:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696908609;
        bh=yLuU1gga+K+Pj83NpZYLl50WM8bsRU/KqkGxtvkMuv8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ICUFM0O7DANv7GJqrLnIMjTXVrhEVtqpswjkEyWiISUcWZd1fbgee77HzFttP/oaQ
         NKYVM7BGMx93Mgep9xTTD7+ms0DRYULX6F+lIPKEVkIirOo7uOO0bCT6iCQ5DLdfyK
         zpQYWTuepUS5MPKQd5cVzHYrNKIrTE3XwnSYuMmDZzNKO7Xh4BnAXbYHUxVJBc/aSB
         mZP+fOXK+rg/b99TsstP+eXqEth9RG5zXZwF6I2nedLrQyWxnfA9G1g+gxmzwne7zy
         RkWnraVVSqv6OmwoyuAl+3AyrldNx7pXdreuIVC1Yv7sC6Snl2koMxZa/tlehvNrEY
         tsjx2kT5iMOUg==
Message-ID: <437e809f8d2a3502b1c317922694d71d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230929-clk-maple-si-v1-2-e26cfcaf27bd@kernel.org>
References: <20230929-clk-maple-si-v1-0-e26cfcaf27bd@kernel.org> <20230929-clk-maple-si-v1-2-e26cfcaf27bd@kernel.org>
Subject: Re: [PATCH 2/5] clk: si5341: Convert to use maple tree register cache
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
To:     Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 09 Oct 2023 20:30:07 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Mark Brown (2023-09-29 05:22:00)
> The maple tree register cache is based on a much more modern data structu=
re
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
>=20
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Applied to clk-next
