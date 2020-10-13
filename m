Return-Path: <SRS0=uYlR=DU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49BDC433E7
	for <linux-clk@archiver.kernel.org>; Tue, 13 Oct 2020 23:12:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3BF722203
	for <linux-clk@archiver.kernel.org>; Tue, 13 Oct 2020 23:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602630723;
	bh=tfZ1Ed/HUg6H1WyBtvVkA6Cmajtx4ciBmnMP86j4nwY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=sGez6l7HqjAzVNr84aNOikicw4L5H5Bnc55eo6D99RJ+lshs1CPVm8owi+94DjyvS
	 MQUtmm65dQ3CrsHSipRL/7gEHD80/AIHV+Kb5fb5H29TKWQ9Mc3vr/Lm6gmE+vkm5c
	 LyOmTnVpmVAvUHk0sQMZDSlu6SGz5xdsj14DMP+A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729734AbgJMXL7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Oct 2020 19:11:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:46572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729697AbgJMXL7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Oct 2020 19:11:59 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3593621D40;
        Tue, 13 Oct 2020 23:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602630719;
        bh=tfZ1Ed/HUg6H1WyBtvVkA6Cmajtx4ciBmnMP86j4nwY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CV8FwXu0d8tIsLdT12NMXkpkxryAcidNyeOYsTT9wxpQqyYB3OX5PMJh2PpRd5Cas
         fX1ebvi5kfURYRjHXb0yDHXPgPF11KN/uzvVC/YSyTrmlguUsDmue3QbHDJVdbscuM
         QcQbLvivOrk64HJMRQO5oEH5pWN7gedqgndgluCM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200918132303.2831815-1-fparent@baylibre.com>
References: <20200918132303.2831815-1-fparent@baylibre.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: mediatek: add bindings for MT8167 clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     krzk@kernel.org, masahiroy@kernel.org, ck.hu@mediatek.com,
        macpaul.lin@mediatek.com, owen.chen@mediatek.com,
        matthias.bgg@gmail.com, Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>
To:     Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date:   Tue, 13 Oct 2020 16:11:58 -0700
Message-ID: <160263071802.310579.17543538800410702856@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Fabien Parent (2020-09-18 06:23:02)
> Add binding documentation for topckgen, apmixedsys, infracfg, audsys,
> imgsys, mfgcfg, vdecsys on MT8167 SoC.
>=20
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
