Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 151C5C32771
	for <linux-clk@archiver.kernel.org>; Thu, 29 Sep 2022 01:35:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234351AbiI2BfU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 21:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234400AbiI2BfH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 21:35:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8780127B1C;
        Wed, 28 Sep 2022 18:35:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 248C061738;
        Thu, 29 Sep 2022 01:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B0AC433D6;
        Thu, 29 Sep 2022 01:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664415305;
        bh=EbKGEAU3hVmTqL1SHJ300ODmj+gh0kwVTgEMP849W6A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LSsz1NmXRRQzI3OKeE3wClAZ+Ouu+LlehP8TaWze87QE+8fwuaY4rgC61ksOrqag7
         O+499IEDkImcacixcwvO16fUFeokyYT0an9l/g/DOTAkV6+QyOq0wMGZSUxkCr7bka
         tzDoly7fD58Qhntk79qxuoBB36uXWOKq65ouFOCT/VAF11l7eNuQR6IN2T8uUdOs/D
         83qYzsK0TmBPtzKThuJ5EkCyiQ4M+F+Bgsl2iJFctwd4eBTZPUogwAfOUkThGtJuhx
         t1gOfMRHPSPpj4xH/p/1M/Apl+W3X8t+9yg4wNmkGoAphB5ev3t2FMmadabtEm6Yax
         AlEF/r2EpItHw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220920055838.22637-1-jslaby@suse.cz>
References: <20220920055838.22637-1-jslaby@suse.cz>
Subject: Re: [PATCH -resend v2] clk: pistachio: Fix initconst confusion
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>,
        linux-clk@vger.kernel.org, Martin Liska <mliska@suse.cz>,
        Jiri Slaby <jslaby@suse.cz>
To:     Jiri Slaby <jslaby@suse.cz>, mturquette@baylibre.com
Date:   Wed, 28 Sep 2022 18:35:03 -0700
User-Agent: alot/0.10
Message-Id: <20220929013505.81B0AC433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jiri Slaby (2022-09-19 22:58:38)
> From: Andi Kleen <ak@linux.intel.com>
>=20
> A variable pointing to const isn't const itself. It has to contain
> "const" keyword after "*" too. So to keep it in __initconst (and not
> mark properly as __initdata), add the "const" keyword exactly there.
>=20
> Note we need to update struct pistachio_mux too. On the other hand, the
> clk core already counts with "const char *const" already.
>=20
> [js] more explanatory commit message.
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: Martin Liska <mliska@suse.cz>
> Signed-off-by: Andi Kleen <ak@linux.intel.com>
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> ---

Applied to clk-next
