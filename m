Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:50884 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751086AbeGJF4I (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 10 Jul 2018 01:56:08 -0400
Date: Mon, 9 Jul 2018 22:56:05 -0700
From: Tony Lindgren <tony@atomide.com>
To: Keerthy <j-keerthy@ti.com>
Cc: t-kristo@ti.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
        d-gerlach@ti.com, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] clk: clk: Add functions to save/restore clock
 context en-masse
Message-ID: <20180710055605.GF99251@atomide.com>
References: <1529568907-19930-1-git-send-email-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1529568907-19930-1-git-send-email-j-keerthy@ti.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

* Keerthy <j-keerthy@ti.com> [180621 01:18]:
> Deep enough power saving mode can result into losing context of the clock
> registers also, and they need to be restored once coming back from the power
> saving mode. Hence add functions to save/restore clock context.

Patches 1 to 3 look good to me:

Acked-by: Tony Lindgren <tony@atomide.com>

Stephen, if no more comments, can you please set up an immutable
branch for me as otherwise the last patch might cause merge
conflicts?

Regards,

Tony
