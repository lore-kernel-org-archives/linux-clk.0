Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C5DC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 15 Mar 2022 23:58:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352679AbiCOX73 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Mar 2022 19:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344372AbiCOX72 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Mar 2022 19:59:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985E423BF1;
        Tue, 15 Mar 2022 16:58:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F3CB06136C;
        Tue, 15 Mar 2022 23:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A535C340E8;
        Tue, 15 Mar 2022 23:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647388694;
        bh=huHBXn0QCeFwMu/dqEeIXq5bX6y1cLUrl2JTytIIHQw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=U6JJpDUxXrFqyf6pkGMc7rManCafaarWTmcl5WtRMAQc3Das4uNTknPK4MoyZCG4T
         w2cy0VQ4jKXaC+QBDzq3XYjB6figmZh+8/6RlMOflLlQnmvhzf7opdYUA52lbvClKQ
         dHrb9PfI5R650Q0QmRdndu3lmxSalY7krhGnacDPFO51JHjLzleI+KHEx1Q9uhDkmF
         5RcX0N/QhPCFAHM91XFQoc3hr/DnE/AWO+/q98+KdrYXjRcBTynofKm6X7V7MX/zJT
         PzHm6TZBwGEa/kC+OPg+npsyOUOMPNpu9lNBYxEWT0vTQ9WFGU3psEqoNM9Mk+5ScH
         SqK0htZYqF68g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220226040723.143705-2-marex@denx.de>
References: <20220226040723.143705-1-marex@denx.de> <20220226040723.143705-2-marex@denx.de>
Subject: Re: [PATCH v3 2/3] clk: Make __clk_hw_register_fixed_factor non-static
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Tue, 15 Mar 2022 16:58:12 -0700
User-Agent: alot/0.10
Message-Id: <20220315235814.5A535C340E8@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-02-25 20:07:22)
> Access to the full parameters of __clk_hw_register_fixed_factor()
> is useful in case a driver is registering fixed clock with only
> single parent, in which case the driver should set parent_name to
> NULL and parent_index to 0, and access to this function permits it
> to do just that.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> To: linux-clk@vger.kernel.org
> ---

Applied to clk-next
