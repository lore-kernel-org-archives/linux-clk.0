Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B32C636D6
	for <linux-clk@archiver.kernel.org>; Thu, 23 Feb 2023 17:39:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbjBWRj1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Feb 2023 12:39:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjBWRj1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Feb 2023 12:39:27 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B11A215CA6;
        Thu, 23 Feb 2023 09:39:24 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id D825080AE4;
        Thu, 23 Feb 2023 18:39:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1677173963;
        bh=O3IRV+shEDtZsoaALUQKrtNo9sDC2VLCvqXxuJK8bUQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Gyqof24y1xX0/Da9dgFTlfK4TWqU2HB3AiaJqSMsRuLJ8xZtWb83CjYuHqxUqhRp0
         8zuqWw84XyUP3/7QkUMemeVZMJPKVmfuS6VLSVW1OtkbMOoQIEIcNbE9csulJXEVB5
         NTDWsoegBjAx0Oj6WgCcAjWR6ybVH2L9OY1pF2CLEAWufNlBSEr4sN2EuIfsjKdIMl
         uL/F4SZmqIj6mw+wKZDnPXo0oG8RJmZkZKIJNn04uatwyLBJNDdEGl4Lu4Vc1Qx3hk
         157V6qkIDMc/lpV1Luf6QlhDb/xpeztpFlMiHWBXy/lUUX96PdAEqwGnR5bLogvb4w
         FCkBf6MX4mAyg==
Message-ID: <9bcaaa02-d9e6-1086-91bf-b94a10330577@denx.de>
Date:   Thu, 23 Feb 2023 18:39:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 5/5] arm64: dts: imx8mp: Add analog audio output on
 i.MX8MP EVK
Content-Language: en-US
To:     Fabio Estevam <festevam@gmail.com>
Cc:     linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
        Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
        linux-arm-kernel@lists.infradead.org,
        Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20230223171114.59164-1-marex@denx.de>
 <20230223171114.59164-5-marex@denx.de>
 <CAOMZO5A5k0EdE9_VqXe5iJ5x+dPFse=jqjMaL-3ip3r0zDQ=5w@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAOMZO5A5k0EdE9_VqXe5iJ5x+dPFse=jqjMaL-3ip3r0zDQ=5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2/23/23 18:28, Fabio Estevam wrote:
> Hi Marek,

Hi,

> On Thu, Feb 23, 2023 at 2:11 PM Marek Vasut <marex@denx.de> wrote:
> 
>> +       reg_audio_pwr: regulator-audio-pwr {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "audio-pwr";
>> +               regulator-min-microvolt = <3300000>;
>> +               regulator-max-microvolt = <3300000>;
>> +               gpio = <&gpio4 29 GPIO_ACTIVE_HIGH>;
>> +               enable-active-high;
>> +               regulator-always-on;
> 
> It seems that "regulator-always-on" could be removed as the regulator
> is controlled by the codec.

Ah yes

> Reviewed-by: Fabio Estevam <festevam@gmail.com>

Thanks
