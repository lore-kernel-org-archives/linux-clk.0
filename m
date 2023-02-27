Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D454C7EE2D
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 18:59:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbjB0S7h (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 13:59:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbjB0S7f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 13:59:35 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E579227BF;
        Mon, 27 Feb 2023 10:59:31 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 117148523A;
        Mon, 27 Feb 2023 19:59:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1677524370;
        bh=SaV/TjI7UpEKIBVcaSodRiOfdQog7mrj9w1GGSFs7Oo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=JJqqi7Qr+Cy0Bd7SzF+2rK+guHnXCV2G071rv8hxZJD+kMwpZnD9gM1wSvWlKcyC1
         YKAM2NVhW81mm6I6DNpWxcEjj+OIhyq4xDM69gknF6S9ue/Chhb584exrf7/0xLtu0
         AkTX2vGU7hJMhZvbdASt9NGpjSMSsbfNiWMp0dlgvxjVMvCETKz5eIcuuHGA4ZtmP/
         xp2crAHIWTyij0nHwm3YZZnVoLduaw/5zbIf6n1ZuzvbEa3MyWzXe9+NM6oUyEGFLz
         vjhCYqecdpH+YFiUspFfEzfmw/WVFJkpfR1ENpFvqPJjdQZrFrpfOQYdfciOUAPEpm
         bltHjkEBqDK6Q==
Message-ID: <f09ecb65-d72f-0132-c718-77c26e807d63@denx.de>
Date:   Mon, 27 Feb 2023 19:59:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] arm64: dts: imx8mn: specify #sound-dai-cells for SAI
 nodes
Content-Language: en-US
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20230227174535.87657-1-marex@denx.de>
 <CAHCN7x+a-9pZFepD=543ri+TK2y-TDf9Nc44iRqpBnvf_qMk_A@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAHCN7x+a-9pZFepD=543ri+TK2y-TDf9Nc44iRqpBnvf_qMk_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2/27/23 19:05, Adam Ford wrote:
> On Mon, Feb 27, 2023 at 11:58 AM Marek Vasut <marex@denx.de> wrote:
>>
>> Add #sound-dai-cells properties to SAI nodes.
>>
> 
> Should this have a fixes tag?
> 
> Fixes: 9e9860069725 ("arm64: dts: imx8mn: Add SAI nodes")
> 
> I don't know when these became required, and/or if this should be
> back-ported or not.

I am unsure myself, but this commit from 2020 does not have it:
ebfa8951e6cd2 ("arm64: dts: imx8mm: specify #sound-dai-cells for SAI nodes")
