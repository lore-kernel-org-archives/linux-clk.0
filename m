Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60275C25B48
	for <linux-clk@archiver.kernel.org>; Fri, 27 Oct 2023 19:20:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231302AbjJ0TUo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Oct 2023 15:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231360AbjJ0TUn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Oct 2023 15:20:43 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC78C186
        for <linux-clk@vger.kernel.org>; Fri, 27 Oct 2023 12:20:41 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 521ACC433C7;
        Fri, 27 Oct 2023 19:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698434441;
        bh=JKKpzqO+6p5kskoHSTC9fZiBdexWLIpncw+xKzTJ1UI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=utDkT9BxZ9zJNlSchLbWG360/5nYRChqLAKkt93onripBRlf+ZRoeQiOmMaW/eJ3e
         PA5YSF2IydoHwAbNCGA2US4GyUwC1oRF7IeZdIqOBy16iAT/t4Xlrvv3dA6mk2hfPg
         7JwBkzAeZayU6QIJQgfzwTyVjbn8ayDySSek9kCpYw6ENM+MtR6Hjr78HaxM8E00m5
         O0bh7emJtOf4T6x4fv8cKUwZongUCoPI67YsO342sGL4X+2EagcZMHs6zbnzzom/Cf
         bqaGvtdGz5hqpYZXVhYxWlxzUbFJUTxxYIhmvCHzUN4ef09j+uquFvJzjxOE7vdNjx
         90no+vpBKENhw==
Message-ID: <6c2f97c17fdab82782ccc0a09c291d4b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231027085840.30098-1-marex@denx.de>
References: <20231027085840.30098-1-marex@denx.de>
Subject: Re: [PATCH] clk: si521xx: Increase stack based print buffer size in probe
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marex@denx.de>, kernel test robot <lkp@intel.com>,
        Michael Turquette <mturquette@baylibre.com>
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Fri, 27 Oct 2023 12:20:39 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2023-10-27 01:58:24)
> Increase the size of temporary print buffer on stack to fix the
> following warnings reported by LKP.
>=20
> Since all the input parameters of snprintf() are under control
> of this driver, it is not possible to trigger and overflow here,
> but since the print buffer is on stack and discarded once driver
> probe() finishes, it is not an issue to increase it by 10 bytes
> and fix the warning in the process. Make it so.
>=20
> "
>    drivers/clk/clk-si521xx.c: In function 'si521xx_probe':
> >> drivers/clk/clk-si521xx.c:318:26: warning: '%d' directive output may b=
e truncated writing between 1 and 10 bytes into a region of size 2 [-Wforma=
t-truncation=3D]
>       snprintf(name, 6, "DIFF%d", i);
>                              ^~
>    drivers/clk/clk-si521xx.c:318:21: note: directive argument in the rang=
e [0, 2147483647]
>       snprintf(name, 6, "DIFF%d", i);
>                         ^~~~~~~~
>    drivers/clk/clk-si521xx.c:318:3: note: 'snprintf' output between 6 and=
 15 bytes into a destination of size 6
>       snprintf(name, 6, "DIFF%d", i);
>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> "
>=20
> Fixes: edc12763a3a2 ("clk: si521xx: Clock driver for Skyworks Si521xx I2C=
 PCIe clock generators")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202310260412.AGASjFN4-lkp@i=
ntel.com/
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

Applied to clk-next
