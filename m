Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD2ECD68EA
	for <linux-clk@archiver.kernel.org>; Tue, 10 Oct 2023 03:29:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442009AbjJJD3l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Oct 2023 23:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442013AbjJJD3i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Oct 2023 23:29:38 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 911949E;
        Mon,  9 Oct 2023 20:29:37 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA8AC433C7;
        Tue, 10 Oct 2023 03:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696908577;
        bh=PNrpxzwMPHZAXENZJTeP+nz+JFLdco5OM86AWAA6ZEI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fZmgN+7BIky+iz4AHaKxaW1VUc/zGefQSNu1gjrl5i6VLbRS/wulqcjj59JZmRQ9Q
         7Og7JbAJpitKGIv/BQ/GsgUINeaXiIjrMKR8ZBMC8pIVXFAT3gkZw2ISEb9Y+nqxkV
         XB82BkqytMa7oNUWw1vdUk/SODHE2i28rWVJasTxl+CWFxlsOF2UDeRH4ZqFO//Hgq
         VmaRRdHeTMOgzSYD7Z8mXSM7yMQMnQnhImmFelVugyC9hU7qkrYKnjVdp4HKGKYUco
         xsnOOsxf/oGM0RfGHu6LQpS0jWNwAzsmArK3G16AQwrBztv3LXpsKqniaYlIGFMuUp
         /SnoJsQ5b6JpQ==
Message-ID: <c1376fe541113b510ade173c8e895a1c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230929-clk-maple-si-v1-4-e26cfcaf27bd@kernel.org>
References: <20230929-clk-maple-si-v1-0-e26cfcaf27bd@kernel.org> <20230929-clk-maple-si-v1-4-e26cfcaf27bd@kernel.org>
Subject: Re: [PATCH 4/5] clk: si544: Convert to use maple tree register cache
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
To:     Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 09 Oct 2023 20:29:35 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Mark Brown (2023-09-29 05:22:02)
> The maple tree register cache is based on a much more modern data structu=
re
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
>=20
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Applied to clk-next
