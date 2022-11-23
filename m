Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731F9C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 23 Nov 2022 01:44:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233625AbiKWBoW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Nov 2022 20:44:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbiKWBoV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Nov 2022 20:44:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26E3474CC9;
        Tue, 22 Nov 2022 17:44:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B0CE7619D0;
        Wed, 23 Nov 2022 01:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10129C433D6;
        Wed, 23 Nov 2022 01:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669167860;
        bh=yYdMEzHLIt5eIeu2zhVvzwrCKj/xjohYDRGrsbFXcIo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZJOiG8mKNApmQWUik10mWa1ENXwoj/RSUumKB8Pyjqi/0J30haeXQGbt31oqh2dVa
         Q9jgxNIJE83Tqbusi6ijWCITeBv1E4KdvXR939nbqND9mIT/c5IBKPVQ3krxTyDa2z
         lRHZn/jqagdH4h1GS/0YKod5cKmVuzhnlCkGq6UqQtr62Gkr1WmbTcP6gLL/sIqs0H
         vCEvnYNKx47QYYMQWpi2brxZnBAziNqDFPBQue17AcviITWHygeueLYhnS5FObdvcM
         nSm083cMVCXkl6M+ICDxqPOu82SowqgZBa/kLj4D88//xdJSs2MEPRcei9jLOVEd7C
         9bbHvRD0H6ukA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221122184844.6794-1-rdunlap@infradead.org>
References: <20221122184844.6794-1-rdunlap@infradead.org>
Subject: Re: [PATCH] clk: sunxi-ng: fix ccu_mmc_timing.c kernel-doc issues
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Yang Li <yang.lee@linux.alibaba.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Date:   Tue, 22 Nov 2022 17:44:17 -0800
User-Agent: alot/0.10
Message-Id: <20221123014420.10129C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Randy Dunlap (2022-11-22 10:48:44)
> Use '-' to separate the function name and its description.
> Use '%' on constants in kernel-doc notation.
> Use the kernel-doc Return: format for function return values.
>=20
> Fixes this warning:
> ccu_mmc_timing.c:21: warning: No description found for return value of 's=
unxi_ccu_set_mmc_timing_mode'
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Yang Li <yang.lee@linux.alibaba.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
