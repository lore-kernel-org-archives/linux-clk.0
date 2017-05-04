Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:44350 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755141AbdEDODg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 4 May 2017 10:03:36 -0400
Date: Thu, 04 May 2017 22:03:26 +0800
In-Reply-To: <20170504140220.26kguf3trz7ocylv@lukather>
References: <20170504135006.16483-1-icenowy@aosc.io> <20170504135006.16483-4-icenowy@aosc.io> <20170504140220.26kguf3trz7ocylv@lukather>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Subject: Re: [PATCH v2 03/10] pinctrl: sunxi: add A20 support to A10 driver
To: Maxime Ripard <maxime.ripard@free-electrons.com>
CC: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-sunxi@googlegroups.com
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <83062089-19CD-4805-A6DC-2C25D75621FF@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



于 2017年5月4日 GMT+08:00 下午10:02:20, Maxime Ripard <maxime.ripard@free-electrons.com> 写到:
>On Thu, May 04, 2017 at 09:49:59PM +0800, Icenowy Zheng wrote:
>>  static const struct of_device_id sun4i_a10_pinctrl_match[] = {
>> -	{ .compatible = "allwinner,sun4i-a10-pinctrl", },
>> +	{
>> +		.compatible = "allwinner,sun4i-a10-pinctrl",
>> +		.data = (void *)PINCTRL_SUN4I_A10
>> +	},
>> +	{
>> +		.compatible = "allwinner,sun7i-a20-pinctrl",
>> +		.data = (void *)PINCTRL_SUN7I_A20
>> +	},
>>  	{}
>>  };
>
>This means you're going to have two drivers probing for the same
>device: this driver, and the old one. This is not ok, and probably
>introduces some corner cases.

The A20 driver is dropped in the next commit.

>
>Maxime
