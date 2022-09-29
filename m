Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5762C32771
	for <linux-clk@archiver.kernel.org>; Thu, 29 Sep 2022 00:17:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232827AbiI2ARs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 20:17:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232170AbiI2ARr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 20:17:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6AA111A694;
        Wed, 28 Sep 2022 17:17:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4E8A36116A;
        Thu, 29 Sep 2022 00:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F9FC433B5;
        Thu, 29 Sep 2022 00:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664410665;
        bh=fKnEXLC/jKn6OGROQe7w8b0UH801mzP+7eeETzYhNms=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eLvGBSZaJIbxck9Bfjxhu/l3mUdHfpsyPS5mQ8VYihsdSzrrUlJXnPlhgkHrFuxoL
         u5TxWP2C4ci/Ndty9LrBxRJ8bISCLQqmmvhD9sv1nIAyzyOII8tFttvhO3HTby+liB
         DDogsPu+gBNY6n7U6bAUMG3tfsk1AYXtdQaxGUcVQOZijCCzVK93DUPNu8qzGFXIib
         D/2sz3FjSRglJRMxmC2eLQLHe0FCp2OATWIG2MJoqI0r8zmtCqT/yAQKVk5COPm4Yx
         51Ux35O22xe21oI0/ybryxnu+m03VIjJ8vs7nwz3kPShwIWGKDV6MIN0pwCCRp1/v0
         N0nGcQqUDqdbQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5a88bd5a9e93cc6e794080e5cac821ae0c27ec56.1663827071.git.rtanwar@maxlinear.com>
References: <cover.1663827071.git.rtanwar@maxlinear.com> <5a88bd5a9e93cc6e794080e5cac821ae0c27ec56.1663827071.git.rtanwar@maxlinear.com>
Subject: Re: [PATCH RESEND v2 3/5] clk: mxl: Avoid disabling gate clocks from clk driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-lgm-soc@maxlinear.com,
        Rahul Tanwar <rtanwar@maxlinear.com>
To:     Rahul Tanwar <rtanwar@maxlinear.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Date:   Wed, 28 Sep 2022 17:17:40 -0700
User-Agent: alot/0.10
Message-Id: <20220929001745.A4F9FC433B5@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Rahul Tanwar (2022-09-21 23:24:26)
> In MxL's LGM SoC, gate clocks are supposed to be enabled or disabled
> from EPU (power management IP) in certain power saving modes. If gate
> clocks are allowed to be enabled/disabled from CGU clk driver, then
> there arises a conflict where in case clk driver disables a gate clk,
> and then EPU tries to disable the same gate clk, then it will hang
> polling for the clk gated successful status.

Is there any point in registering these clks when they're not supposed
to be controlled from Linux?
