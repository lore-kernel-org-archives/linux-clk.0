Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3A8C46467
	for <linux-clk@archiver.kernel.org>; Mon, 16 Jan 2023 08:15:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232187AbjAPIPf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Jan 2023 03:15:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232073AbjAPIPe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Jan 2023 03:15:34 -0500
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE4E65B1;
        Mon, 16 Jan 2023 00:15:32 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 16C6820004;
        Mon, 16 Jan 2023 08:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1673856930;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ckpNcVfu7V6V0B9TYJB9UDdEuQKGs8H/8i8OKx+26MQ=;
        b=E+thuVC4QDNUMoeHwz6fxO4iGVtgnj7AOKHalLESN1Qhn0Ee3CxZXuYoG00f2Esx6VoG9s
        qiZikH709dXJbGMemwDA3rV35ZGPyHi3qCbgDECVoTdUjo+T+DlsS1/F4US8AYNQ4oXlbr
        1RGbejxxImAcO5F9atRvVLx7UVxtXehfl9P8fdDwmhcEHhux60g2vI64EnIbqNhu7Fkd44
        j/grTzc4lKuBGLQi1G9uxX7ao15TtkOYYKmF4yFTcJqDAgutkVwf4ZLDzCWZx+m5QMqVnP
        L6E/tChB6uLYThznvETI+j0hZFuGXIuK+IrZOfonSAs/45h2vk5+KPTEuz4YDg==
Date:   Mon, 16 Jan 2023 09:15:28 +0100
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: clock: versaclock5: Document 5P49V60
 compatible string
Message-ID: <20230116091528.4dbab083@booty>
In-Reply-To: <20230114233500.3294789-3-lars@metafoo.de>
References: <20230114233500.3294789-1-lars@metafoo.de>
        <20230114233500.3294789-3-lars@metafoo.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 14 Jan 2023 15:35:00 -0800
Lars-Peter Clausen <lars@metafoo.de> wrote:

> The 5P49V60 clock generator is part of the same family of devices that is
> described by the versaclock5 binding documentation.
> 
> Add the compatible string of the 5P49V60 to the binding documentation.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
