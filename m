Return-Path: <SRS0=xLj1=TE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C33C43219
	for <linux-clk@archiver.kernel.org>; Sat,  4 May 2019 05:43:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0AB98206DF
	for <linux-clk@archiver.kernel.org>; Sat,  4 May 2019 05:43:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725802AbfEDFn1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 4 May 2019 01:43:27 -0400
Received: from mga02.intel.com ([134.134.136.20]:2148 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725801AbfEDFn1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 4 May 2019 01:43:27 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 May 2019 22:43:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,428,1549958400"; 
   d="scan'208";a="136714960"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 May 2019 22:43:25 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hMnSG-000I8X-Pg; Sat, 04 May 2019 13:43:24 +0800
Date:   Sat, 4 May 2019 13:42:39 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     kbuild-all@01.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [clk:clk-parent-rewrite 18/78] drivers/clk/clk.c:371 clk_core_get()
 warn: always true condition '(index >= 0) => (0-255 >= 0)'
Message-ID: <201905041336.UcvSZvFD%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-parent-rewrite
head:   f5e93ab2421d0dd27acac9159d9c4834cd5705e7
commit: 9fd6fd58989e06bc5fe92f5aef85a64f63340ab1 [18/78] clk: Cache core in clk_fetch_parent_index() without names

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

New smatch warnings:
drivers/clk/clk.c:371 clk_core_get() warn: always true condition '(index >= 0) => (0-255 >= 0)'

Old smatch warnings:
drivers/clk/clk.c:135 clk_prepare_lock() warn: inconsistent returns 'mutex:&prepare_lock'.
  Locked on:   line 135
  Unlocked on: line 128
drivers/clk/clk.c:383 clk_core_get() warn: passing zero to 'ERR_CAST'
drivers/clk/clk.c:432 clk_hw_get_parent_by_index() error: 'parent' dereferencing possible ERR_PTR()
drivers/clk/clk.c:561 clk_mux_determine_rate_flags() error: 'parent' dereferencing possible ERR_PTR()
drivers/clk/clk.c:3405 clk_hw_create_clk() warn: passing zero to 'ERR_CAST'
drivers/clk/clk.c:4321 __of_clk_get_hw_from_provider() warn: passing zero to 'ERR_CAST'

vim +371 drivers/clk/clk.c

bddca894 Prashant Gaikwad 2012-12-26  326  
fc0c209c Stephen Boyd     2019-04-12  327  /**
dde4eff4 Stephen Boyd     2019-04-12  328   * clk_core_get - Find the clk_core parent of a clk
fc0c209c Stephen Boyd     2019-04-12  329   * @core: clk to find parent of
9fd6fd58 Stephen Boyd     2019-04-30  330   * @p_index: parent index to search for
fc0c209c Stephen Boyd     2019-04-12  331   *
fc0c209c Stephen Boyd     2019-04-12  332   * This is the preferred method for clk providers to find the parent of a
fc0c209c Stephen Boyd     2019-04-12  333   * clk when that parent is external to the clk controller. The parent_names
fc0c209c Stephen Boyd     2019-04-12  334   * array is indexed and treated as a local name matching a string in the device
dde4eff4 Stephen Boyd     2019-04-12  335   * node's 'clock-names' property or as the 'con_id' matching the device's
dde4eff4 Stephen Boyd     2019-04-12  336   * dev_name() in a clk_lookup. This allows clk providers to use their own
fc0c209c Stephen Boyd     2019-04-12  337   * namespace instead of looking for a globally unique parent string.
fc0c209c Stephen Boyd     2019-04-12  338   *
fc0c209c Stephen Boyd     2019-04-12  339   * For example the following DT snippet would allow a clock registered by the
fc0c209c Stephen Boyd     2019-04-12  340   * clock-controller@c001 that has a clk_init_data::parent_data array
fc0c209c Stephen Boyd     2019-04-12  341   * with 'xtal' in the 'name' member to find the clock provided by the
fc0c209c Stephen Boyd     2019-04-12  342   * clock-controller@f00abcd without needing to get the globally unique name of
fc0c209c Stephen Boyd     2019-04-12  343   * the xtal clk.
fc0c209c Stephen Boyd     2019-04-12  344   *
fc0c209c Stephen Boyd     2019-04-12  345   *      parent: clock-controller@f00abcd {
fc0c209c Stephen Boyd     2019-04-12  346   *              reg = <0xf00abcd 0xabcd>;
fc0c209c Stephen Boyd     2019-04-12  347   *              #clock-cells = <0>;
fc0c209c Stephen Boyd     2019-04-12  348   *      };
fc0c209c Stephen Boyd     2019-04-12  349   *
fc0c209c Stephen Boyd     2019-04-12  350   *      clock-controller@c001 {
fc0c209c Stephen Boyd     2019-04-12  351   *              reg = <0xc001 0xf00d>;
fc0c209c Stephen Boyd     2019-04-12  352   *              clocks = <&parent>;
fc0c209c Stephen Boyd     2019-04-12  353   *              clock-names = "xtal";
fc0c209c Stephen Boyd     2019-04-12  354   *              #clock-cells = <1>;
fc0c209c Stephen Boyd     2019-04-12  355   *      };
fc0c209c Stephen Boyd     2019-04-12  356   *
fc0c209c Stephen Boyd     2019-04-12  357   * Returns: -ENOENT when the provider can't be found or the clk doesn't
fc0c209c Stephen Boyd     2019-04-12  358   * exist in the provider. -EINVAL when the name can't be found. NULL when the
fc0c209c Stephen Boyd     2019-04-12  359   * provider knows about the clk but it isn't provided on this system.
fc0c209c Stephen Boyd     2019-04-12  360   * A valid clk_core pointer when the clk can be found in the provider.
fc0c209c Stephen Boyd     2019-04-12  361   */
9fd6fd58 Stephen Boyd     2019-04-30  362  static struct clk_core *clk_core_get(struct clk_core *core, u8 p_index)
fc0c209c Stephen Boyd     2019-04-12  363  {
9fd6fd58 Stephen Boyd     2019-04-30  364  	const char *name = core->parents[p_index].fw_name;
9fd6fd58 Stephen Boyd     2019-04-30  365  	u8 index = core->parents[p_index].index;
dde4eff4 Stephen Boyd     2019-04-12  366  	struct clk_hw *hw = ERR_PTR(-ENOENT);
dde4eff4 Stephen Boyd     2019-04-12  367  	struct device *dev = core->dev;
dde4eff4 Stephen Boyd     2019-04-12  368  	const char *dev_id = dev ? dev_name(dev) : NULL;
fc0c209c Stephen Boyd     2019-04-12  369  	struct device_node *np = core->of_node;
fc0c209c Stephen Boyd     2019-04-12  370  
601b6e93 Stephen Boyd     2019-04-12 @371  	if (np && index >= 0)
601b6e93 Stephen Boyd     2019-04-12  372  		hw = of_clk_get_hw(np, index, name);
dde4eff4 Stephen Boyd     2019-04-12  373  
dde4eff4 Stephen Boyd     2019-04-12  374  	/*
dde4eff4 Stephen Boyd     2019-04-12  375  	 * If the DT search above couldn't find the provider or the provider
dde4eff4 Stephen Boyd     2019-04-12  376  	 * didn't know about this clk, fallback to looking up via clkdev based
dde4eff4 Stephen Boyd     2019-04-12  377  	 * clk_lookups
dde4eff4 Stephen Boyd     2019-04-12  378  	 */
601b6e93 Stephen Boyd     2019-04-12  379  	if (PTR_ERR(hw) == -ENOENT && name)
dde4eff4 Stephen Boyd     2019-04-12  380  		hw = clk_find_hw(dev_id, name);
dde4eff4 Stephen Boyd     2019-04-12  381  
dde4eff4 Stephen Boyd     2019-04-12  382  	if (IS_ERR(hw))
fc0c209c Stephen Boyd     2019-04-12  383  		return ERR_CAST(hw);
fc0c209c Stephen Boyd     2019-04-12  384  
fc0c209c Stephen Boyd     2019-04-12  385  	return hw->core;
fc0c209c Stephen Boyd     2019-04-12  386  }
fc0c209c Stephen Boyd     2019-04-12  387  

:::::: The code at line 371 was first introduced by commit
:::::: 601b6e93304a65f8f7c37168763ab9ba5b195ce5 clk: Allow parents to be specified via clkspec index

:::::: TO: Stephen Boyd <sboyd@kernel.org>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
