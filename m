Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187CEC43334
	for <linux-clk@archiver.kernel.org>; Mon, 27 Jun 2022 16:23:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237765AbiF0QXj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Jun 2022 12:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236443AbiF0QXi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Jun 2022 12:23:38 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A765DAE7E
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 09:23:36 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id D7B8083E3A;
        Mon, 27 Jun 2022 18:23:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1656347014;
        bh=qyRqRKTcgCbtBEtdObSLSc6Y2Bi2gAfQy+jLb9syFLE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=aoBI1xtyR05DdOJWxQRP5Ld292ikzanHOi4LUlHlAAqug+7dxr38icjCXZxk2kCYZ
         CTFuddo+7LVOxt2CYkf9EH/v8yNv14koHkt9zwx8lWYXkIMGoRfj5bnkjx5kp3VfjA
         ddtno241N8WKHdE8As/z7yeEzt3pM2AETgDz99KEJQ2jhRT93DMQoKwE+KT50E853S
         HpGBW6YxQuBfVnf7yZP8/B0Ta1lDqKSzQUY7k/8LLj9n0ynn8QIB3Dd0WUB16jeNC8
         FCx71dHkI3Cy+/Z+tGMYlcAcZyiKkhe8Rb+X6ozCpi2Rk4mQVM5yawVhFHq/WVHW6+
         hbTdsH2bWTYSg==
Message-ID: <66f689d9-a691-8bf6-62a2-48fac6eb3938@denx.de>
Date:   Mon, 27 Jun 2022 18:23:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 3/6] clk: imx: imx8mp: Add audiomix block control
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>,
        Lucas Stach <l.stach@pengutronix.de>
Cc:     linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
References: <20220625013235.710346-1-marex@denx.de>
 <20220625013235.710346-3-marex@denx.de> <YrnOTaLS2r7QBMNx@linaro.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <YrnOTaLS2r7QBMNx@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 6/27/22 17:35, Abel Vesa wrote:
> On 22-06-25 03:32:32, Marek Vasut wrote:
>> Unlike the other block control IPs in i.MX8M, the audiomix is mostly a
>> series of clock gates and muxes. Model it as a large static table of
>> gates and muxes with one exception, which is the PLL14xx . The PLL14xx
>> SAI PLL has to be registered separately.
>>
> 
> Again, there is a chance that the blk-ctrl driver might disable the PD
> from under this.

Can you elaborate a bit more on this ? How/why do you think so ?
