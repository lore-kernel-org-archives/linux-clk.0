Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5176C433E0
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 07:47:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9052E64EAA
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 07:47:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbhBIHr5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Feb 2021 02:47:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:37410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229464AbhBIHr4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 9 Feb 2021 02:47:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EA0A64DAD;
        Tue,  9 Feb 2021 07:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612856836;
        bh=F22jfFy9W8oMUmsbBd5rEjgo8FcPzu5fWH8d+uvExto=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=X1TeLjv/DpMG9iI/wnak/vJu3odgdTETbzOp/lO3340oyZcyIARHd1Sp6CplwyPGY
         gMolQ7oKa5oc39yze9j70lMSIdX8Oi7iqIN1TeBRuj1fHvi39/+LN+B7oqtd9fGABl
         ABjp2Jcvf+oRToTq0mrG4gixhJ4bCJV1JS4PlrnvQBVkHGiBj4/whmbQt3cG4QJA5R
         td2P2u3WgcmB4aIKLGarQKtCBqcfj54pOH5FDST8D6P7A3zLuwIUgjp1UDgvUIJfOr
         NagsmNgJb+bFLu7+LrVRtR5XIzyg/mNO3uKTLNRxSw05cny9R5RjObyoTmPjM0NtGL
         IXvRMhWnjQqMA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210203105423.682960-1-enric.balletbo@collabora.com>
References: <20210203105423.682960-1-enric.balletbo@collabora.com>
Subject: Re: [PATCH] clk: mediatek: Select all the MT8183 clocks by default
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     matthias.bgg@gmail.com, drinkcat@chromium.org, hsinyi@chromium.org,
        Collabora Kernel ML <kernel@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        Mars Cheng <mars.cheng@mediatek.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Owen Chen <owen.chen@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-mediatek@lists.infradead.org
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-kernel@vger.kernel.org
Date:   Mon, 08 Feb 2021 23:47:14 -0800
Message-ID: <161285683488.418021.7723049164920384151@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Enric Balletbo i Serra (2021-02-03 02:54:23)
> If MT8183 SoC support is enabled, almost all machines will use topckgen,
> apmixedsys, infracfg, mcucfg and subsystem clocks, so it feels wrong to
> require each one to select that symbols manually.
>=20
> Instead, enable it whenever COMMON_CLK_MT8183_* is disabled as
> a simplification. This would add few KB in the kernel image size but
> will make the life a bit easier to the users, anyway you'll need to proba=
bly
> enable all of them if you want to have proper support for that SoC.
>=20
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---

Applied to clk-next
