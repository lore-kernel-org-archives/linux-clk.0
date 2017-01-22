Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from szxga03-in.huawei.com ([119.145.14.66]:52768 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751080AbdAVJfH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 22 Jan 2017 04:35:07 -0500
Subject: Re: [PATCH 3/3] dts: hisi: add dts files for Hi3516CV300 demo board
To: Pan Wen <wenpan@hisilicon.com>, <mturquette@baylibre.com>,
        <sboyd@codeaurora.org>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <linux@armlinux.org.uk>,
        <xuwei5@hisilicon.com>
References: <20161017120705.3726-1-wenpan@hisilicon.com>
 <20161017120705.3726-4-wenpan@hisilicon.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <howell.yang@hisilicon.com>, <xuejiancheng@hisilicon.com>,
        <jalen.hsu@hisilicon.com>, <lvkuanliang@hisilicon.com>,
        <suwenping@hisilicon.com>, <raojun@hisilicon.com>,
        <kevin.lixu@hisilicon.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <48bb201b-a443-13de-72ed-66a2b4982734@huawei.com>
Date: Sun, 22 Jan 2017 17:33:03 +0800
MIME-Version: 1.0
In-Reply-To: <20161017120705.3726-4-wenpan@hisilicon.com>
Content-Type: text/plain; charset="utf-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 2016/10/17 20:07, Pan Wen wrote:
> Add dts files for Hi3516CV300 demo board.
> 
> Signed-off-by: Pan Wen <wenpan@hisilicon.com>
> ---
>  arch/arm/boot/dts/Makefile             |   1 +

[...]

> diff --git a/arch/arm/boot/dts/hi3516cv300.dtsi b/arch/arm/boot/dts/hi3516cv300.dtsi
> new file mode 100644
> index 0000000..1da41ab
> --- /dev/null
> +++ b/arch/arm/boot/dts/hi3516cv300.dtsi
> @@ -0,0 +1,397 @@
> +/*
> + * Copyright (c) 2016 HiSilicon Technologies Co., Ltd.
> + *
> + * This program is free software; you can redistribute  it and/or modify it
> + * under  the terms of  the GNU General Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + *
> + */
> +
> +#include "skeleton.dtsi"

please drop this include due to commit 9c0da3cc61f1233c ("ARM: dts: explicitly mark skeleton.dtsi as deprecated")

Thanks
Kefeng



