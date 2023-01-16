Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1489BC46467
	for <linux-clk@archiver.kernel.org>; Mon, 16 Jan 2023 08:15:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232177AbjAPIPb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Jan 2023 03:15:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232073AbjAPIPa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Jan 2023 03:15:30 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2605065B1;
        Mon, 16 Jan 2023 00:15:28 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id A74B540006;
        Mon, 16 Jan 2023 08:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1673856927;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MMu87m4GZNvBzbyI4yKWBAMuqu8WKH6hAz7Rpd5/2Yk=;
        b=kawm9N8rz/N+bHJVReMCcnt+DaOApk2hp4mZtUF8zZnozdTdD4LnL0fqDBAPWg8ZaYGWUZ
        xivgSEptu878q6zBRK0+4LmSxbcODb7kOfbmfLh4gJtKYhboCr/lh2EakoHpqBcSA9Xh/f
        U79mA24fN2t8EgQGUlYnpgLNLcWvVfDM4dP3vGHToZo/FmjpufFgMg95D7mVKN2kSWxd2h
        e/LxS5EhHsxuzW6ciXjKJu8fPdaHc3zBaPtWZIYer5ni2fqZowUXIuIDNGuVR1+DEH8lIm
        JoCL0F8FQo09jjVQu4lZwJi9eiEqgYaVlyaGhpsiTqjPU384HX0gPmdfiTEkYw==
Date:   Mon, 16 Jan 2023 09:15:25 +0100
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: vc5: Add support for 5P49V60
Message-ID: <20230116091525.43bcd655@booty>
In-Reply-To: <20230114233500.3294789-2-lars@metafoo.de>
References: <20230114233500.3294789-1-lars@metafoo.de>
        <20230114233500.3294789-2-lars@metafoo.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 14 Jan 2023 15:34:59 -0800
Lars-Peter Clausen <lars@metafoo.de> wrote:

> The 5P49V60 is very similar to the existing supported clock chips of the
> versaclock5 driver and uses the same register map layout. But its maximum
> VCO frequency is 2.7 GHz instead of 3 GHz for the other supported devices.
> 
> Add a vco_max field to the chip info field to allow to specify a per device
> variant maximum VCO frequency.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
