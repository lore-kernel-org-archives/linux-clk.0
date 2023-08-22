Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A6EEE49A5
	for <linux-clk@archiver.kernel.org>; Tue, 22 Aug 2023 21:53:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbjHVVxU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Aug 2023 17:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231270AbjHVVxT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Aug 2023 17:53:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C19CEB;
        Tue, 22 Aug 2023 14:53:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1DAEA642A6;
        Tue, 22 Aug 2023 21:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77813C433C8;
        Tue, 22 Aug 2023 21:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692741194;
        bh=Sb+8B0MLmf4tgQ3FPv56qNbDe94/XdjmPCnIDt42lFc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fBFauLga5KWguRoR+euA048qYtqGnmn2KT5j86hXcgxbovpviuAyQNxoLNq1yXbZs
         ujXb7N5FuGe+Ml7X9JR+/pFdNsSpxNcNQA2lZ5qQjwxz2KxIYthm17ZeQSjwJ7zDXi
         jB2sjSjRmU4det4schIUwTqYmfBrF7GncMOHhdqHmubtuxeOIoyIQ4eni4Da42dRU+
         pxTRyeoiFJI1emNa6FUruG+QHTNE04/3YtwNVwnbPxwhwcU5bQrI7SfRgb97qEdLvK
         jAtLP/Rg8s1MfmKl+U/iQGp0IeKrrJ8z/joS5dYHFP3cECQz7pG2GwuHBAveU58AOm
         utj0xJqYOkT2w==
Message-ID: <ae6c4c5e6bcce66da49d5699624414a1.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230705065313.67043-9-frank.li@vivo.com>
References: <20230705065313.67043-1-frank.li@vivo.com> <20230705065313.67043-9-frank.li@vivo.com>
Subject: Re: [PATCH 09/13] clk: mediatek: Convert to devm_platform_ioremap_resource()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Yangtao Li <frank.li@vivo.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Yangtao Li <frank.li@vivo.com>
Date:   Tue, 22 Aug 2023 14:53:12 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Yangtao Li (2023-07-04 23:53:09)
> Use devm_platform_ioremap_resource() to simplify code.
>=20
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---

Applied to clk-next
