Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0441C77B6C
	for <linux-clk@archiver.kernel.org>; Thu, 13 Apr 2023 00:20:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbjDMAUI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Apr 2023 20:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbjDMAUH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Apr 2023 20:20:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1E5B61B3;
        Wed, 12 Apr 2023 17:20:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5446F61345;
        Thu, 13 Apr 2023 00:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5444C433EF;
        Thu, 13 Apr 2023 00:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681345205;
        bh=uV5KjUfxfJ1S9nfIY4Ct9Vky0jgljwYMWvfKdD8J1Lg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=s+muFfIq0atvFfLKnWR2iSn8W80vUcR60RhoQgWbihjKQJlcpDvaY+fHq+9N0out7
         4XfGvEgLrzBdWhzh/sqCscuGF1fHoIlMgfOTDZ3SulpHY9WFt5SCFR3SlBbpZ8Wvmk
         o1Wk34B85AV5m98ad0Wz11iPeLXn8CJWj/t0yy4JBdZhdXrV2qC1wyPLJaiF+qbIk7
         FqF9Z1HiAtDwyC/G0V702afUZxIe+fKlU3rfNEtKTCQvrlFb/C7KVRfHrv+KC+Wczi
         Rt2qnNyK5zw6t9FjvYDPV+ysYdjn0tLsbLZ/OwrdL8p1Vr9rLRWFA+Ai4iCtcCYf7H
         1yGjKMZ6C72LA==
Message-ID: <26b909b5c15fd6c91458a8767d977397.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230412132243.3849779-1-abel.vesa@linaro.org>
References: <20230412132243.3849779-1-abel.vesa@linaro.org>
Subject: Re: [GIT PULL] clk: imx: Updates for v6.4
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To:     Abel Vesa <abel.vesa@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>
Date:   Wed, 12 Apr 2023 17:20:03 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Abel Vesa (2023-04-12 06:22:43)
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4c=
c6:
>=20
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/=
clk-imx-6.4
>=20
> for you to fetch changes up to 8a05f5cccdbe851265bf513643ada48c26b1267f:
>=20
>   clk: imx: imx8ulp: update clk flag for system critical clock (2023-04-0=
9 17:12:49 +0300)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
