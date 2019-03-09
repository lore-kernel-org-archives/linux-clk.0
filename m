Return-Path: <SRS0=BXls=RM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3513DC43381
	for <linux-clk@archiver.kernel.org>; Sat,  9 Mar 2019 01:02:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 057ED20851
	for <linux-clk@archiver.kernel.org>; Sat,  9 Mar 2019 01:02:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbfCIBCc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Mar 2019 20:02:32 -0500
Received: from mga06.intel.com ([134.134.136.31]:13872 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726375AbfCIBCc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 8 Mar 2019 20:02:32 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Mar 2019 17:02:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,458,1544515200"; 
   d="scan'208";a="123946847"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Mar 2019 17:02:30 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1h2QNi-0001hY-9n; Sat, 09 Mar 2019 09:02:30 +0800
Date:   Sat, 9 Mar 2019 09:02:25 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     kbuild-all@01.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [clk:clk-parent-rewrite 21/32] drivers/clk/clk.c:2369:6-13: ERROR:
 PTR_ERR applied after initialization to constant on line 2361
Message-ID: <201903090923.Uyt2rglj%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-parent-rewrite
head:   6a6d2ba76f95f9e4f7afea765841f40eb33d55d4
commit: 1dee7b91c5de9c8684a5deb13769505518040f35 [21/32] clk: Introduce get_parent_hw clk op


coccinelle warnings: (new ones prefixed by >>)

>> drivers/clk/clk.c:2369:6-13: ERROR: PTR_ERR applied after initialization to constant on line 2361

vim +2369 drivers/clk/clk.c

  2334	
  2335	static struct clk_core *
  2336	__clk_init_parent(struct clk_core *core, bool update_orphan)
  2337	{
  2338		u8 index = 0;
  2339		struct clk_hw *parent_hw = NULL;
  2340	
  2341		if (core->ops->get_parent_hw) {
  2342			parent_hw = core->ops->get_parent_hw(core->hw);
  2343		} else {
  2344			if (core->num_parents > 1 && core->ops->get_parent)
  2345				index = core->ops->get_parent(core->hw);
  2346	
  2347			if (index >= core->num_parents) {
  2348				/*
  2349				 * Overwrite with NULL here because we can't
  2350				 * differentiate true errors in getting the index from
  2351				 * the case where the clk isn't found because it never
  2352				 * exists or isn't described as a possible parent.
  2353				 *
  2354				 * Note that we don't update the orphan status to true
  2355				 * in this case, because we can't really know for sure
  2356				 * if the clk is truly orphaned or not. To avoid this,
  2357				 * implement .get_parent_hw or use the direct pointer
  2358				 * mechanism of struct clk_parent_data::hw to point
  2359				 * to the parent clk directly.
  2360				 */
> 2361				parent_hw = NULL;
  2362			} else {
  2363				parent_hw = clk_hw_get_parent_by_index(core->hw, index);
  2364			}
  2365		}
  2366	
  2367		if (IS_ERR_OR_NULL(parent_hw)) {
  2368			/* Parent clk provider hasn't probed yet, orphan it */
> 2369			if (PTR_ERR(parent_hw) == -EPROBE_DEFER) {
  2370				if (update_orphan)
  2371					core->orphan = true;
  2372	
  2373				/* Orphans don't have a parent, so use NULL */
  2374				return NULL;
  2375			}
  2376	
  2377			return ERR_CAST(parent_hw);
  2378		}
  2379	
  2380		if (update_orphan)
  2381			core->orphan = parent_hw->core->orphan;
  2382		return parent_hw->core;
  2383	}
  2384	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
