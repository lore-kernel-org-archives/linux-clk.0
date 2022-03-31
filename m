Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FDAC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 31 Mar 2022 22:02:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbiCaWDz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 31 Mar 2022 18:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbiCaWDy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Mar 2022 18:03:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA5AC1EE8E0
        for <linux-clk@vger.kernel.org>; Thu, 31 Mar 2022 15:02:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 51E7760B60
        for <linux-clk@vger.kernel.org>; Thu, 31 Mar 2022 22:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93DDC340ED;
        Thu, 31 Mar 2022 22:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648764125;
        bh=sq4IJmGrxQ3TogrRpurT596fT/qZn5fqE2CDej4dznc=;
        h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
        b=EXUleC8Ql14kXOrbr7fxGnYkqH+JUL20xchmr4SsO99VVc/8MaZlzsuqqVyrFYIUB
         QRZujlKXlGuOSLSIGZ2noA+SosOECL0fr57eAmWUZbKFFJ3afRx0Ts9lQPuA4GtNF1
         tj7NnndQDs/7wGIZifrx1zGm2LP85lBnX5d9HxPWzVYmbjpsGMQdrhDYeWBlTBgVuD
         g63KJ6gRYwUDEMBDYWRFC9/5uOlz77uq88Wg/Md5ti0hbV9GBgDwRqPaCWWCw6VXFC
         Fb8WBLXlmjS1CcWX8uB7tZJC3lF/EB3DDb738D9kt5JVK7zRkSSWPSmSBO2Xu0uMX4
         exonihFLLe9Ug==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1911426.usQuhbGJ8B@steina-w>
References: <1911426.usQuhbGJ8B@steina-w>
Subject: Re: Boot lockup on imx8mp in llinux-next
From:   Stephen Boyd <sboyd@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc:     Maxime Ripard <maxime@cerno.tech>
Date:   Thu, 31 Mar 2022 15:02:03 -0700
User-Agent: alot/0.10
Message-Id: <20220331220205.A93DDC340ED@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alexander Stein (2022-03-30 00:49:31)
> Hello everyone,
>=20
> I noticed that my imx8mp based board (TQMa8MPxL, not yet mainline) locked=
 up=20
> during boot in linux-next. I bisected it down to commit [1].
> I found out that disabling 'fec' and 'eqos' (both ethernet controller) no=
des=20
> in DT resulted in booting Kernel, alas NFS boot failed eventually obvious=
ly.=20
> Reverting make things working again.
> I have no idea which clock is the actual culprit here and how to fix it. =
I=20
> just wanted to make you aware of this issue.

Thanks. Please try to help debug hit on the thread at
https://lore.kernel.org/r/20220325161144.1901695-4-maxime@cerno.tech
