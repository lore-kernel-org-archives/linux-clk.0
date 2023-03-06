Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5924C64EC4
	for <linux-clk@archiver.kernel.org>; Mon,  6 Mar 2023 22:18:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjCFWSP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Mar 2023 17:18:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbjCFWSO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 17:18:14 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89119211C3;
        Mon,  6 Mar 2023 14:18:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 04E98CE172D;
        Mon,  6 Mar 2023 22:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432DCC433EF;
        Mon,  6 Mar 2023 22:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678141088;
        bh=HHwREwgr7XzZ/KCzNNwwOJxP6lTWS/fbgtvNqWgvOtk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Hob+OCcHgGfzIIaZaVV/XuwakpfvJBrYe/VLpsD6cm0acT5wJ4eUGKxby7Rkt5XiL
         EHPzRB30XSbyWWqxwH1MpP4DymD0cDvrvjLZ786gFCp1a92QgZ+jf2RkiN2f871822
         l7T94gccigsrUBHZ6uA/v+IvhRBvJPpm7+J6UdCsiNc/J/hRQNdfeGcFpF80U7zK2J
         9sDvREipOL/R7ww72T4sRw1zadmyo9sa4/qybQAs6Foom0anmrhTSBFnRppjJfu2Jg
         MYQ8HGOzYDwzlw/D99yzjJngvBfv5d+OmY/eDz5IJfyuuG1W77n4eeyWg7gk1t35Nk
         fdVJmwW5q7DTg==
Message-ID: <3fa10935df53baca5e4521f0fbe6f382.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230302005834.13171-2-jk@codeconstruct.com.au>
References: <20230302005834.13171-1-jk@codeconstruct.com.au> <20230302005834.13171-2-jk@codeconstruct.com.au>
Subject: Re: [PATCH v5 1/6] clk: ast2600: allow empty entries in aspeed_g6_gates
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
To:     Jeremy Kerr <jk@codeconstruct.com.au>, devicetree@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Date:   Mon, 06 Mar 2023 14:18:06 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jeremy Kerr (2023-03-01 16:58:29)
> We're about to remove an entry from aspeed_g6_gates, but we won't want
> to alter/reorder existing entries. Allow empty entries in this array.
>=20
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
>=20
> ---

Applied to clk-next
