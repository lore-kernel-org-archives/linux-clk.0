Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69336CD68E4
	for <linux-clk@archiver.kernel.org>; Tue, 10 Oct 2023 03:29:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442028AbjJJD3z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Oct 2023 23:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442073AbjJJD3w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Oct 2023 23:29:52 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC81ED;
        Mon,  9 Oct 2023 20:29:50 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D78D2C433C8;
        Tue, 10 Oct 2023 03:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696908589;
        bh=Ly/Ryy3DLoBLlXot7Uucvzq3EkIMyJJajKKSmuEt8ao=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=NM9ds/tRtIPOQpsFpYHxT6oWvLaW1bz0plV1vyHFXzLSDcZMbjoLomMoqA8cfjggQ
         tra2aZ/4hvvzihhKdfqiIb2vLr5iNC6L1LDujqbofVxeYOGgHza67q4LhfHH2XVT9I
         x69yHCVpCS24HYlEJkmEzPclkkvzhiRUUBy9T/xkPLfBahdZSK24uUW1Bhxwi2+el4
         pBZKE2QJCBED1vnl2O3m+v4FKFDQq4+VwiqiMptu25DV0YEkO6GX64OfOBIKpd3BOJ
         MajisfPTPCHuTMvrQbSrV8i4CqxeLXedVpjwd0gKz0rclYykiyj7suNdWBsFxMcMEW
         vJ+PKPgmWWp7w==
Message-ID: <6a6b1a9e78f51536c885dfbc08297bbe.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230929-clk-maple-si-v1-3-e26cfcaf27bd@kernel.org>
References: <20230929-clk-maple-si-v1-0-e26cfcaf27bd@kernel.org> <20230929-clk-maple-si-v1-3-e26cfcaf27bd@kernel.org>
Subject: Re: [PATCH 3/5] clk: si5351: Convert to use maple tree register cache
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
To:     Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 09 Oct 2023 20:29:47 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Mark Brown (2023-09-29 05:22:01)
> The maple tree register cache is based on a much more modern data structu=
re
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
>=20
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Applied to clk-next
