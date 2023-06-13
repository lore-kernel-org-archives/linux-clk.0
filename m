Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483EFC7EE2E
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 01:28:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232921AbjFMB2X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 21:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232685AbjFMB2W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 21:28:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF46B1711;
        Mon, 12 Jun 2023 18:28:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 55A16617D1;
        Tue, 13 Jun 2023 01:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D5AC433EF;
        Tue, 13 Jun 2023 01:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686619700;
        bh=aoQHeYjAPGfNsJxskI4bGk1bJt70oxm3UkCtG4nr2WE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=NU35VNuLeysvpUmDK0NJYN9LrNtUg81XsEOvJh4/d0EWZ/jnCtS10NUzZtkSDKGDx
         ca/gTk9Qm1HWacaDB37/fSwmWv5sMY7ThphibW0xlvESn+N/1J1vn6CTg11UTx2LX2
         1doTKtxwMqDRIjTgvEXrsFJpTpLCR5F3HVlYJM7kVm4QEsQEL8Va5zNsdY3l9WzFA5
         vaKRLifMIaVBaWA19QQOPGsIXmzfYMv/HdUInE4Dwnp7vIhrl0+nIKaoKAyqCkh+D9
         PvsWslQ06rT3mZ1flvjwE94ncnwQCkeVSjnedNgFOZD2Dbo8I3Qrk3uNiJRWjJ760V
         NpX9zizYlLlrA==
Message-ID: <47f1be5577fdf4a2ab36d1f6dc0c393e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230422084331.47198-1-u201911157@hust.edu.cn>
References: <20230422084331.47198-1-u201911157@hust.edu.cn>
Subject: Re: [PATCH] clk: mediatek: fix of_iomap memory leak
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     hust-os-kernel-patches@googlegroups.com,
        Bosi Zhang <u201911157@hust.edu.cn>,
        Dongliang Mu <dzm91@hust.edu.cn>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Bosi Zhang <u201911157@hust.edu.cn>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Ikjoon Jang <ikjn@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Weiyi Lu <weiyi.lu@mediatek.com>
Date:   Mon, 12 Jun 2023 18:28:18 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Bosi Zhang (2023-04-22 01:43:31)
> Smatch reports:
> drivers/clk/mediatek/clk-mtk.c:583 mtk_clk_simple_probe() warn:
>     'base' from of_iomap() not released on lines: 496.
>=20
> This problem was also found in linux-next. In mtk_clk_simple_probe(),
> base is not released when handling errors
> if clk_data is not existed, which may cause a leak.
> So free_base should be added here to release base.
>=20
> Fixes: c58cd0e40ffa ("clk: mediatek: Add mtk_clk_simple_probe() to simpli=
fy clock providers")
> Signed-off-by: Bosi Zhang <u201911157@hust.edu.cn>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---

Applied to clk-next
