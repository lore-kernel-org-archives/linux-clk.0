Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF73C74A5B
	for <linux-clk@archiver.kernel.org>; Wed, 29 Mar 2023 21:50:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbjC2Vt7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Mar 2023 17:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbjC2Vt5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Mar 2023 17:49:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E408E4EEF;
        Wed, 29 Mar 2023 14:49:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8F3A9B82341;
        Wed, 29 Mar 2023 21:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C39CC433D2;
        Wed, 29 Mar 2023 21:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680126592;
        bh=UXCvv8muYJ21IdoMOB/bG/WWb+6yCZdVWfTUTQypW6g=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uoLOBv7g/NPF9bnjoNWSKb7NNBSMmnd2gAvwaJrgKNHWsHHyw9fFYOz1YE3hjxEyO
         73jM0cDbS8B6e+ryXPDlLHBEolIoMkmPOXIX7qmadMG8D6lwJ3udWuX29Wom+H+aOz
         NCmH/Wts9MQTrsK40L1rReX/b1av6D9ZhbPn7G+xgifOi9rzVTitnx8M+4GcI33MKR
         EADeLWcwMYv8RGKfeZd/Xar4ZaAU7nZNzlDH8yA+EMAK1bTYnDEOR7OBcN+BN7yLIE
         ymMh1MlsxH5hwcLQL8g2O1byrcCPHqpRt36O2ZonuDkjTx/+SlUYRchmpMp7kNz97M
         b4aV+pL3I3Yhw==
Message-ID: <27ded6a4ebd67cef0d4b472a2aea442e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221117105829.256717-1-bmasney@redhat.com>
References: <20221117105829.256717-1-bmasney@redhat.com>
Subject: Re: [PATCH] clk: add debug message showing which unused clocks are disabled on boot
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Brian Masney <bmasney@redhat.com>, mturquette@baylibre.com
Date:   Wed, 29 Mar 2023 14:49:50 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Brian Masney (2022-11-17 02:58:29)
> The clk framework on bootup will automatically disable all unused clocks
> on bootup unless the clk_ignore_unused kernel parameter is present.
> Let's add a basic debugging log statement here that shows which clocks
> are disabled. There is already tracepoint present here as well, but
> there's nothing like a simple, good ol' fashioned printk for simplicity.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

I'd like to see a documentation update instead that covers how to enable
the tracepoint on the kernel commandline and have it print to the serial
console.
