Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67947C67871
	for <linux-clk@archiver.kernel.org>; Mon, 16 Jan 2023 08:15:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232051AbjAPIP3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Jan 2023 03:15:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232173AbjAPIP1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Jan 2023 03:15:27 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B411565B1;
        Mon, 16 Jan 2023 00:15:25 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id F2783FF80C;
        Mon, 16 Jan 2023 08:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1673856923;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3cZw9VxLeMkCzOe50uNhDJIqqBvSHOIrXZUz9T5U+Vs=;
        b=IqfzsoDd9Xetki7S++XXPe+u9lZL7x+6drmQ1e8V8QK8c0Pd9gUu0ZiXYfNoDIXDkwvpQF
        l1XdDpZw2PervXoKhqMNi3c109RAYEuWi59X8vVKwBAVdzn5DyCT0shv9q4qWnFZyTZYAf
        0iwLUo4nhVRiGxx9fSFNunS7MzOo9oRDKvPnixUUXPDwG7C3rkvOwjet5110M3umPIvnH8
        O4qQLuLwmzxw0iwPp+Kmg+7ggHL3BB7W/r959oIvbKOyf3ha+tI6uQ7MuVgDdsC1NOmzCI
        05IlwFsQsqa8fD5fZVZ7PQ4UU+kObQavaSrOqZVuD7TS7l+4K6L8nuzntCNUOQ==
Date:   Mon, 16 Jan 2023 09:15:21 +0100
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: vc5: Use `clamp()` to restrict PLL range
Message-ID: <20230116091521.1ebaa482@booty>
In-Reply-To: <20230114233500.3294789-1-lars@metafoo.de>
References: <20230114233500.3294789-1-lars@metafoo.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Lars-Peter,

On Sat, 14 Jan 2023 15:34:58 -0800
Lars-Peter Clausen <lars@metafoo.de> wrote:

> The VCO frequency needs to be within a certain range and the driver
> enforces this.
> 
> Make use of the clamp macro to implement this instead of open-coding it.
> This makes the code a bit shorter and also semanticly stronger.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
