Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8328E3033D6;
	Fri, 17 Jul 2026 05:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784266547; cv=none; b=Ni54CIAdBwcdZFMULL23pD2eFzMpamvnQYWKTZSFCPlZTfDUml6maB+RMLNUAb1AOS3GZfN3t2duJRFQtQv+8xe0G5+g3RFeLHt+kDIuGafFA4W/poBI41TPB6IDFKzuGU+reuTwQjezrqxB0Sns3g5F5NhXR7rwtG+IZAnafuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784266547; c=relaxed/simple;
	bh=YDSxbn9s3W9am5Mo6+HxEvJNqobAfPM8jM9dcKNMoc8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=e3wKOX9Le1kvpREc3j07qO6oviwbbCEcnmA0rC3UzfeE9eGuCP0nJqKh9aOELJMq2c49dBNnEj0RcTEYCpso9o/Q3/OgwsMsXA5JT8uxiWOS8n6MK2Vi5ovfRvtgD4PrKR9YkG7pUg8nDPimuyekG8dJaxq1n+4h9Nue55pGeIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=di8TkEFT; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="di8TkEFT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=Ow2kUQN440OzcZ89TGxd2cVBk20szhTPg
	d1ipxkcXLI=; b=di8TkEFT34xV3XmWZ1BOkD76tAvVCjpg80Z1Djp5TCulYWYuX
	z772zC0qLZkRDTSkUmHrvL3832tCZ5y+uFw7ru+CJV4oq+7/QfqSUGJA9spRz3SK
	oVYOEW65E0O7EEp60FitJY96E72uz0l4d6kUAk30HysJuqSX1/PCn8HRkY=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnYUI9v1lqLjoTAA--.17135S2;
	Fri, 17 Jul 2026 13:35:57 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 3/3] clk: ultrarisc: Add DP1000 clock driver
From: Jia Wang <wangjia@ultrarisc.com>
To: Brian Masney <bmasney@redhat.com>
Cc: wangjia@ultrarisc.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <alkgIyhI43ypvZdb@redhat.com>
References: <20260714-ultrarisc-clock-v3-0-4b1ccaa26b37@ultrarisc.com>
 <20260714-ultrarisc-clock-v3-3-4b1ccaa26b37@ultrarisc.com>
 <alkgIyhI43ypvZdb@redhat.com>
Date: Fri, 17 Jul 2026 13:35:27 +0800
Message-Id: <178426652713.1335571.11769344745272660761.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784266527; l=2671;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=YDSxbn9s3W9am5Mo6+HxEvJNqobAfPM8jM9dcKNMoc8=;
 b=T1cBaRptEhfrIKUrgotimHb95po3f0x3VVO/U4hqCmw+T4MNtvGbL+L4MRDO0Z+SJq2u5XOYR
 wsCdqVY4GCPC5EIc4Dl0haU6NFHVRJ94CKvoCQH5a94CZbL47kwlgiy
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwAnYUI9v1lqLjoTAA--.17135S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJry3Xr17JFy3XFyDKFWkXrb_yoW8KFy3pF
	W8Gay5tFyUJr47Ww1aqw4DAF9YyF1xta43t347ta4xtrn8ZryrtFs7G34fCa1Dur43Crya
	vr1Uuw13Ca1Yka7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9m14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAKEWpYVVAAAwAIsm

On 2026-07-16 14:17 -0400, Brian Masney wrote:
> Hi Jia,
> 
> I have one minor question below.
> 
> On Tue, Jul 14, 2026 at 09:35:09AM +0800, Jia Wang via B4 Relay wrote:
> > From: Jia Wang <wangjia@ultrarisc.com>
> > 
> > Add a clock driver for the UltraRISC DP1000 SoC.
> > 
> > The clock tree is driven by a SYSPLL and provides fixed-factor clocks for
> > the subsystem and PCIe, divider-based root clocks for GMAC and the UART,
> > I2C, and SPI blocks, and per-instance gate clocks for UART0-3, I2C0-3,
> > and SPI0-1.
> > 
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > ---
> >  MAINTAINERS                           |   1 +
> >  drivers/clk/Kconfig                   |   1 +
> >  drivers/clk/Makefile                  |   1 +
> >  drivers/clk/ultrarisc/Kconfig         |  18 ++
> >  drivers/clk/ultrarisc/Makefile        |   4 +
> >  drivers/clk/ultrarisc/clk-dp1000.c    | 154 +++++++++++++
> >  drivers/clk/ultrarisc/clk-ultrarisc.c | 407 ++++++++++++++++++++++++++++++++++
> >  drivers/clk/ultrarisc/clk-ultrarisc.h |  71 ++++++
> >  8 files changed, 657 insertions(+)
> 
> [snip]
> 
> > 
> > +static int ultrarisc_clk_register_dividers(struct platform_device *pdev,
> > +					   struct clk_hw_onecell_data *clk_data,
> > +					   const struct ultrarisc_clk_soc_data *soc_data,
> > +					   void __iomem *base,
> > +					   spinlock_t *lock)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	u32 i;
> > +
> > +	for (i = 0; i < soc_data->num_dividers; i++) {
> > +		const struct ultrarisc_divider_desc *desc;
> > +		struct clk_hw *parent_hw;
> > +		struct clk_hw *hw;
> > +
> > +		desc = &soc_data->dividers[i];
> > +		if (desc->id >= clk_data->num || desc->parent_id >= clk_data->num)
> > +			return -EINVAL;
> > +
> > +		parent_hw = clk_data->hws[desc->parent_id];
> > +		if (!parent_hw)
> > +			return -EINVAL;
> > +
> > +		hw = ultrarisc_clk_register_divider(dev, desc, parent_hw, base,
> > +						    lock);
> > +		if (IS_ERR(hw))
> > +			return PTR_ERR(hw);
> > +
> > +		if (desc->max_rate) {
> > +			unsigned long rate;
> > +
> > +			clk_hw_set_rate_range(hw, 0, desc->max_rate);
> > +
> > +			rate = clk_hw_get_rate(hw);
> > +			if (rate > desc->max_rate)
> > +				dev_warn(dev, "%s rate %lu exceeds max %lu\n",
> > +					 desc->name, rate, desc->max_rate);
> 
> At this point in the probe, the clock tree may not be fully propagated
> yet. Is this check needed?
> 

Agreed, I will drop this diagnostic check in the next version and keep
only the rate range constraint.

> Everything else in the driver looks fine to me.
> 
> Brian
> 
> 

Best regards,
Jia Wang


