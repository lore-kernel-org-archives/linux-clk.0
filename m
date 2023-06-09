Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A18C7EE29
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jun 2023 00:30:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235563AbjFIAaw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Jun 2023 20:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbjFIAav (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jun 2023 20:30:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B2FB1BE8;
        Thu,  8 Jun 2023 17:30:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 273A365253;
        Fri,  9 Jun 2023 00:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719E2C433EF;
        Fri,  9 Jun 2023 00:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686270649;
        bh=ZVa287C0oWjuND1JLpn/ix4C5uNAJ2w+6kuC46VG9vE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=s/g+io50EQvASbCX7TDs+IUF4y6VXjtJHYVn/8aEdDoARJKSHAeCx3K3xmVKS7mcJ
         GwX3a+feCVTiOWjztM8Z3xA2B3Osv16VE/CJTEr/RxDVB3MFS1lEKMKBb6JRbEKr82
         E30+ILMtwgnYYmwRCUIOBvirg0tRtRTz8JOYEou4KxwaDI9Epgxd+P7uW2EfBcB0ZI
         Wqeq/XzFzahMjAeENB4NoivimmUcpWhWGWV1qpbYg/7XkSJ4mGqxyKOnCjPheEC9Im
         QYZikyivbGxWgz7fj3JktOguTT/fCQZ/bL0ZGhK6Q9tbGMhFbJF8m6vIIvGWehlfQ/
         ANG5h9qBuajlA==
Message-ID: <2e4a08941bf46408eaef415a1f0e6c32.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230601095512.18029-1-zhangqing@rock-chips.com>
References: <20230601095512.18029-1-zhangqing@rock-chips.com>
Subject: Re: [PATCH v1] clk: clk-fractional-divider: Export clk_fractional_divider_general_approximation API
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangtao@rock-chips.com
To:     heiko@sntech.de, kever.yang@rock-chips.com,
        mturquette@baylibre.com, zhangqing@rock-chips.com
Date:   Thu, 08 Jun 2023 17:30:47 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Elaine Zhang (2023-06-01 02:55:12)
> This is used by the Rockchip clk driver, export it to allow that
> driver to be compiled as a module.

Sounds fine when CONFIG_COMMON_CLK_ROCKCHIP is tristate.
