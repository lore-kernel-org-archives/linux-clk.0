Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC29AC6FA82
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 18:03:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234186AbiI1SD3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 14:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233060AbiI1SD2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 14:03:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89948FE659;
        Wed, 28 Sep 2022 11:03:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5B30A61F6B;
        Wed, 28 Sep 2022 18:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B413EC433D6;
        Wed, 28 Sep 2022 18:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664388205;
        bh=Zf4ExtAqcVoAoom2cGsF9EZX5frcvfathzUeLBSXytM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=GJ3t/sEwoMUzyZujD0sAwTQNoxJMp7c+mZAtGwBOUq6uOPIWj4g+h1mC9eDJv0zgK
         kcqEkzOpDQM7kRT3nJTNGDJWYdM3V5z/I150rHOYGnRR1V1aSE0eKWXmV/Ds7oV9i9
         3fcI84hzzXeoivlmAdP3vGAMvCcYI7iE/obitDGtKoDzmhB9PrPYwb+Hc8S+nSvdIX
         dhjWQcDd8A+Pz2845b/eqwOxHRzzr25jANQI6IvRdLGVqk0NusDycB9jQkr9AalR6o
         9SGbGSFzQyX/qoiEPydwre3hUUzlgN0jKj3tVcFDjb3arG07BDFrUHAKPXMmApLdDw
         3HWpI8YTyKdAw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d9f8322d362c7cebb29bfa7e128b4974882c4a7d.1664204336.git.geert+renesas@glider.be>
References: <cover.1664204336.git.geert+renesas@glider.be> <d9f8322d362c7cebb29bfa7e128b4974882c4a7d.1664204336.git.geert+renesas@glider.be>
Subject: Re: [PATCH 1/2] clk: renesas: r8a779g0: Add SYS-DMAC clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 28 Sep 2022 11:03:23 -0700
User-Agent: alot/0.10
Message-Id: <20220928180325.B413EC433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2022-09-26 08:01:48)
> Add the module clocks used by the Direct Memory Access Controllers for
> System (SYS-DMAC) on the Renesas R-Car V4H (R8A779G0) SoC.
>=20
> Extracted from a larger patch in the BSP by Kazuya Mizuguchi.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
