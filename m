Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15FCC433F5
	for <linux-clk@archiver.kernel.org>; Mon,  3 Oct 2022 21:26:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbiJCV0y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Oct 2022 17:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiJCV0e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Oct 2022 17:26:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A9BE64FC;
        Mon,  3 Oct 2022 14:15:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D507660B36;
        Mon,  3 Oct 2022 21:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3614BC433C1;
        Mon,  3 Oct 2022 21:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664831745;
        bh=Lq2cWvSu8fH+x6+gm6WTUPQR/ZFDNaX5+1c+dfp5hgs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kbcw3y2xUnufrF9d7ri5uhuO1//Qh0w1zvsTkNavvlJeE9ql95oNaocJMZO0oGsWz
         iINV73hptqxPHh1nBrILTznC3fNTbESj4FywTb/btwxY05TlU3zmwFpBbYEv/SJejk
         hkB9Dds5nx2/zLSIDA33nc/YfFuRI6a64/TfPmIChx4W91r+6fZIVjWDJqBFgKEsdQ
         tVDXcS5dNDcaLdw48MnXo0isVTyuhQ8PWkaRansSDaaB0KRBDm77B3TLTJZk514Mtp
         yqISwOL33YnMlf0tTMxVnVn575+kyDxvnYUsIlsu/kMlVgP+5EWudvfxYTx1rQIFGY
         49Sj5FJhENCyQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220617103306.489466-1-clement.leger@bootlin.com>
References: <20220617103306.489466-1-clement.leger@bootlin.com>
Subject: Re: [PATCH] clk: allow building lan966x as a module
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Steen Hegelund <steen.hegelund@microchip.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Allan Nielsen <allan.nielsen@microchip.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>
To:     =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 03 Oct 2022 14:15:41 -0700
User-Agent: alot/0.10
Message-Id: <20221003211545.3614BC433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Cl=C3=A9ment L=C3=A9ger (2022-06-17 03:33:06)
> Set the COMMON_CLK_LAN966X option as a tristate and switch from
> builtin_platform_driver() to module_platform_driver() to allow building
> and using this driver as a module.
>=20
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
> ---

Applied to clk-next
