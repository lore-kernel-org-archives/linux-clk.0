Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F202C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 13:40:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383559AbiAYNkZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 08:40:25 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:16368 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387491AbiAYNiF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jan 2022 08:38:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1643117885; x=1674653885;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4XsaF876U/hgEJKu54gwoJY3UnWMir4ZSlxRuPkHNO4=;
  b=CwxtDVi3HTZ0KY7Ykt84tLDuashAVMIAfZAIgHfWE2Jv9/z873R2qp9c
   VXanhkNTF5PD4rKGD99nsGYZtzbPQ0wrxZgUZaNOGZT8K5FEw4dNvPL5d
   FHUmOIAgjttBPb+RB8sVrpozlAzdlfd9wzn7kgYQhXxN2wZxjl+LgAEOx
   6IgvTmDSAtC0A6Go3zZ63dUrSOI/rkXyB4i6PRNw/oE9H0N+XxvDOBUY0
   MAfo2oX6+tyuKrmAey10RsM84fBI0LVfRVMBaT6zFfhHjU6Wv9mj42oR1
   lY2aq0pI2kbCLN7yJrDlyV9iMd5m0utJlWIZysd+P9mwdB0SaJ9tgsgDp
   Q==;
IronPort-SDR: jrYpXM4lm/0/X2wdLxFXy0yAE9ciDzvfx/iWDgev0vqLQFsAT0fbYyM4pWvmzZFrpTrS7d5H2y
 /iThcaqTiik7xdKBOExTNXv7lZFDBRjw+OvMiNT5bXzamX0J+2TKAK5SMOqzixWlQRakTCrGuG
 l2wnJ0+O5TQ72AsiyyCQPDOONC/PEPy4RlaRdDZ0/Y23e5YIrj9L9zZYRBYeLjGVFvDhFQMqwK
 QAptWyWgRSE/g5lXvNhW0aJfTDMTEzzQmFdPpyeflkhZC7USUoaW08NT8XcXURXoitIgrKL0kP
 U+PZAq27gwZ+f63z0k9Grono
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; 
   d="scan'208";a="151360551"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Jan 2022 06:38:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 25 Jan 2022 06:38:02 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Tue, 25 Jan 2022 06:38:00 -0700
From:   <conor.dooley@microchip.com>
To:     <sboyd@kernel.org>
CC:     <conor.dooley@microchip.com>, <cyril.jean@microchip.com>,
        <daire.mcnamara@microchip.com>, <david.abdurachmanov@gmail.com>,
        <devicetree@vger.kernel.org>, <geert@linux-m68k.org>,
        <krzysztof.kozlowski@canonical.com>, <linux-clk@vger.kernel.org>,
        <mturquette@baylibre.com>, <padmarao.begari@microchip.com>,
        <palmer@dabbelt.com>, <robh+dt@kernel.org>
Subject: Re: [PATCH v9 2/2] clk: microchip: Add driver for Microchip PolarFire SoC
Date:   Tue, 25 Jan 2022 13:40:11 +0000
Message-ID: <20220125134010.2528785-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220125004818.83E27C340E4@smtp.kernel.org>
References: <20220125004818.83E27C340E4@smtp.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Quoting conor.dooley@microchip.com (2021-12-16 06:00:22)
> > diff --git a/drivers/clk/microchip/Makefile b/drivers/clk/microchip/Makefile
> > index f34b247e870f..0dce0b12eac4 100644
> > --- a/drivers/clk/microchip/Makefile
> > +++ b/drivers/clk/microchip/Makefile

Snipping the rest, will/have addressed them.

> > +static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_clock *cfg_hws,
> > +                                 unsigned int num_clks, struct mpfs_clock_data *data,
> > +                                 struct clk *clk_parent)
> > +{
> > +       struct clk_hw *hw;
> > +       void __iomem *sys_base = data->base;
> > +       unsigned int i, id;
> > +
> > +       for (i = 0; i < num_clks; i++) {
> > +               struct mpfs_cfg_hw_clock *cfg_hw = &cfg_hws[i];
> > +
> > +               cfg_hw->cfg.parent = __clk_get_hw(clk_parent);
> > +               cfg_hw->hw.init = CLK_HW_INIT_HW(cfg_hw->cfg.name, cfg_hw->cfg.parent,
> > +                                                &mpfs_clk_cfg_ops, cfg_hw->cfg.flags);
> > +               hw = mpfs_clk_register_cfg(dev, cfg_hw, sys_base);
> > +               if (IS_ERR(hw)) {
> > +                       dev_err(dev, "failed to register clock %s\n", cfg_hw->cfg.name);
> > +                       goto err_clk;
> > +               }
> > +
> > +               id = cfg_hws[i].cfg.id;
> > +               data->hw_data.hws[id] = hw;
> > +       }
> > +
> > +       return 0;
> > +
> > +err_clk:
> > +       while (i--)
> > +               devm_clk_hw_unregister(dev, data->hw_data.hws[cfg_hws[i].cfg.id]);
> 
> > +       clk_parent = devm_clk_get(dev, NULL);
> 
> Use clk_parent_data instead please.
> 
> > +       if (IS_ERR(clk_parent))
> > +               return PTR_ERR(clk_parent);


Please correct me if I am misinterpreting:
I had the devm_clk_get() in there to pickup the refclk from the device
tree as a result of previous feedback. I have replaced this with the
following, which I have found in several other drivers - does it achieve
the same thing?
If it does, all of the args to CLK_HW_INIT_PARENTS_DATA are now set at
compile time & I will take CLK_HW_INIT_PARENTS_DATA back out of this
function.

static struct clk_parent_data mpfs_cfg_parent[] = {
	{ .index = 0 },
};

static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_clock *cfg_hws,
				  unsigned int num_clks, struct mpfs_clock_data *data)
{
	void __iomem *sys_base = data->base;
	unsigned int i, id;
	int ret;

	for (i = 0; i < num_clks; i++) {
		struct mpfs_cfg_hw_clock *cfg_hw = &cfg_hws[i];

		cfg_hw->hw.init = CLK_HW_INIT_PARENTS_DATA(cfg_hw->cfg.name, mpfs_cfg_parent,
						 &mpfs_clk_cfg_ops, cfg_hw->cfg.flags);

		ret = mpfs_clk_register_cfg(dev, cfg_hw, sys_base);
		if (ret) {
			dev_err_probe(dev, ret, "failed to register clock %s\n",
				      cfg_hw->cfg.name);
			return ret;
		}

		id = cfg_hws[i].cfg.id;
		data->hw_data.hws[id] = &cfg_hw->hw;
	}

	return 0;
}
