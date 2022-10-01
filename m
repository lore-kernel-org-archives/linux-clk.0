Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FF4C433F5
	for <linux-clk@archiver.kernel.org>; Sat,  1 Oct 2022 00:05:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbiJAAFI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 20:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231759AbiJAAFG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 20:05:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8686F2CC83
        for <linux-clk@vger.kernel.org>; Fri, 30 Sep 2022 17:05:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C919561CB4
        for <linux-clk@vger.kernel.org>; Sat,  1 Oct 2022 00:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23268C433D6;
        Sat,  1 Oct 2022 00:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664582703;
        bh=RoJNLUp38GFc1nuFRzD/OOXEm6iNua2g/dUtuRk6+iU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lsHUniJ6R9o2mNfUnz2Jz+Bd++NTdtFnSBxhrelqMSmNagjjnQePwLIBWwZswT0/K
         66eKGfsC5qwVcZdjgyIv+7WGwre/Lh4evzEzfoH/8nvNY6s00I3MevVwEDKHFUMeBe
         beavkEz7oXCAVA1nEC/+2amml+uNQdzO3d4SOiBGuOkSVTdPVt2i3k1ylhitKN4Dzz
         vr2rkGbAiYlTds8C7q29Wm+BiTr8ib9AUNGxd9+mZ6O9tSIFZqVCKbF7/2cADK9jbb
         PAzQJpUNI4w0fhMueRPa461ME1jSHxAn+1MlG1j5kmjJ3C1Bwaj/+i3Xg18uihaGWN
         wWCH2dn4Whp/g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <11481209-7c8f-7543-1e04-5723ffc2ccd4@windriver.com>
References: <20220928201656.30318-1-laurent.pinchart@ideasonboard.com> <11481209-7c8f-7543-1e04-5723ffc2ccd4@windriver.com>
Subject: Re: [PATCH] clk: zynqmp: pll: Fix divider calculation to avoid out-of-range rate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Michal Simek <michal.simek@xilinx.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Maxime Ripard <maxime@cerno.tech>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Quanyang Wang <quanyang.wang@windriver.com>,
        linux-clk@vger.kernel.org
Date:   Fri, 30 Sep 2022 17:05:01 -0700
User-Agent: alot/0.10
Message-Id: <20221001000503.23268C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

+Maxime

Quoting Quanyang Wang (2022-09-28 18:05:10)
> Hi Laurent,
>=20
> I have sent a patch as below to fix this issue which set rate failed and =

> it's in linux-next repo now.
>=20
> https://lore.kernel.org/linux-arm-kernel/20220826142030.213805-1-quanyang=
.wang@windriver.com/T/
>=20
>=20
> As for the frequency gap between the requested rate and the actual, it's =

> because of the commit:
>=20
> commit 948fb0969eae8
> Author: Maxime Ripard <maxime@cerno.tech>
> Date:=C2=A0=C2=A0 Fri Feb 25 15:35:26 2022 +0100
>=20
>  =C2=A0=C2=A0=C2=A0 clk: Always clamp the rounded rate
>=20
> And I haven't figured out how to fix it.
>=20

Maxime has some more patches to fix this and they're in linux-next.
Maybe those fix this problem?
