Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03703C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 23 Nov 2022 01:48:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235244AbiKWBsl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Nov 2022 20:48:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235349AbiKWBsk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Nov 2022 20:48:40 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F0CC5E9EF;
        Tue, 22 Nov 2022 17:48:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2B79F619A9;
        Wed, 23 Nov 2022 01:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 820FDC433D6;
        Wed, 23 Nov 2022 01:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669168118;
        bh=Cbo+NRn0ge6LwevugN7/1gv4dID3/XMFDmQvtgROA6k=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YTDo902cvuWge8+AnTdTVklZotOtwWx0I0IcUHwPQZL9wDEhizAmjaTiZ/Tisgg5w
         uZcxKdsqJTZhx8yTO9rT5LnEFcpo0yZqakurH0fSXeZYjKqxijxjFmAx30cUdB8+uz
         lr17Qy2FJAxj/b5pvQH/+Qtpoxiwr7Hr2uQ++2Cak8Wl3qcLXWv+pdi5ysmN7+TSBs
         Iq4EDoiv5Dgkz1T6EgvTem2/bBdyDgg5vigIexL9EplP1Dyb3KEqa6AvpTEnJmZQAO
         nqoiN/xPqNWTrHxqVcU/eVg0wM9dSr7ao6Wxasu3hjZ5uRxraBnROZz9BDY7NBi514
         MdoV9jJYjaoXg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221122023826.101503-1-yang.lee@linux.alibaba.com>
References: <20221122023826.101503-1-yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next v2] clk: Fix one kernel-doc comment
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     rdunlap@infradead.org, wens@csie.org, jernej.skrabec@gmail.com,
        samuel@sholland.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>
To:     Yang Li <yang.lee@linux.alibaba.com>, mturquette@baylibre.com
Date:   Tue, 22 Nov 2022 17:48:36 -0800
User-Agent: alot/0.10
Message-Id: <20221123014838.820FDC433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Yang Li (2022-11-21 18:38:26)
> drivers/clk/sunxi-ng/ccu_mmc_timing.c:54: warning: expecting prototype fo=
r sunxi_ccu_set_mmc_timing_mode(). Prototype was for sunxi_ccu_get_mmc_timi=
ng_mode() instead
>=20
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D3230
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
