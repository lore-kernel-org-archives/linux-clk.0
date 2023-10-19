Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5041FCDB47E
	for <linux-clk@archiver.kernel.org>; Thu, 19 Oct 2023 01:16:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbjJSBQ7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Oct 2023 21:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjJSBQ6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Oct 2023 21:16:58 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C56BB0;
        Wed, 18 Oct 2023 18:16:57 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A68C433C8;
        Thu, 19 Oct 2023 01:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697678217;
        bh=t1TklU9qUL66rgk0DGUbyrm6spkuXcGIBxohjbWjYzk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=o4veyHpA0PGtgf1yjNmv1t+x3rl/W3WjM0vivvwxZXCxdsGUPzJmmRlBdjmFmfMQK
         6lF4AFZQ3m5wNmOGOAQ7bvcUsaG6CfdaeKyO43nkNv6NBiaM1hMX+AlESKCB9N4mJT
         7vUJBtKiBPcFzGihnQhy+Gx2VFPinxheROltw+QjBApmttRcYEebjh/5hCx4Gz5xam
         N/GhP/UUf5/fcTKFaHvppyK9VyK2YIt3JpJl9HvkZcSnrLHF7Con4qkjhHLBxtjCQO
         +D3Es6qXHqSJchxfmpHIZSvPBgIK6mZj42cz9ZSvdcnNVb3ScKDIkH5dvYcbtHgd/A
         T+0lOABVLwAUw==
Message-ID: <ecd552b9cb8d56dcf86a382385f39ef4.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230901024658.23405-1-jiasheng@iscas.ac.cn>
References: <20230901024658.23405-1-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] clk: mediatek: clk-mt2701: Add check for mtk_alloc_clk_data
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>
To:     Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        angelogioacchino.delregno@collabora.com, erin.lo@mediatek.com,
        frank.li@vivo.com, jamesjj.liao@mediatek.com,
        matthias.bgg@gmail.com, msp@baylibre.com, mturquette@baylibre.com,
        robh@kernel.org, shunli.wang@mediatek.com, wenst@chromium.org
Date:   Wed, 18 Oct 2023 18:16:55 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jiasheng Jiang (2023-08-31 19:46:58)
> Add the check for the return value of mtk_alloc_clk_data() in order to
> avoid NULL pointer dereference.
>=20
> Fixes: e9862118272a ("clk: mediatek: Add MT2701 clock support")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---

Applied to clk-next
