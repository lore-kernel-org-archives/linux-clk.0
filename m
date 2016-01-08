Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:49138 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750824AbcAHPLO (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 8 Jan 2016 10:11:14 -0500
Date: Fri, 8 Jan 2016 15:10:58 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Jiancheng Xue <xuejiancheng@huawei.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org,
	p.zabel@pengutronix.de, robh+dt@kernel.org, pawel.moll@arm.com,
	mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org, khilman@linaro.org, arnd@arndb.de,
	olof@lixom.net, xuwei5@hisilicon.com, haojian.zhuang@linaro.org,
	zhangfei.gao@linaro.org, bintian.wang@huawei.com,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com,
	suwenping@hisilicon.com, ml.yang@hisilicon.com,
	gaofei@hisilicon.com, zhangzhenxing@hisilicon.com,
	xuejiancheng@hisilicon.com
Subject: Re: [PATCH v5 6/6] ARM: dts: add dts files for Hi3519
Message-ID: <20160108151058.GN19062@n2100.arm.linux.org.uk>
References: <1452219400-32478-1-git-send-email-xuejiancheng@huawei.com>
 <1452219400-32478-7-git-send-email-xuejiancheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1452219400-32478-7-git-send-email-xuejiancheng@huawei.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jan 08, 2016 at 10:16:40AM +0800, Jiancheng Xue wrote:
> +		uart0: serial@12100000 {
> +			compatible = "arm,pl011", "arm,primecell";
> +			reg = <0x12100000 0x1000>;
> +			interrupts = <0 4 4>;

Should the last digit there be IRQ_TYPE_LEVEL_HIGH (and same for the
other interrupts= after this?)

Thanks.

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
