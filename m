Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9BEC433FE
	for <linux-clk@archiver.kernel.org>; Tue,  5 Apr 2022 07:08:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbiDEHKC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Apr 2022 03:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231375AbiDEHKB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Apr 2022 03:10:01 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6243C1C11C;
        Tue,  5 Apr 2022 00:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649142484; x=1680678484;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PC27KwuVG8KAYodjrOP60rfdN85ofNCcBf0iofVAKIc=;
  b=Urk+CTTccqDVSmds3FtqTtoHFLsnVJ7IPXQx2x+GRbQNfvJkLuz1bBjJ
   baWbwgLtReElt5+5/q5X4TfbgEpjUbhXMXEMzYiE9T+s8DC8rJpb2Ggso
   M/yUziVkXeRzJxdpwyC2MZdlFh/Vxdr/zPusoWRGMTx6+v3Xs+lRc6fAz
   P7ATM/J7coRyxy2xqkQlMIEQ6Hav67e13INTjWE0o3nJIQITRdnU2M/sz
   C0GCX/SRkLQt+sXDWUsRqNqhwsRcmuC9JnHqIiezMXKWFFZXuhQKvvw1X
   Rr5Kj073D5BhQCWjbVFkgsKe/rnuElSgvUrf8qQ25ctEl6BqXKVFHony7
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="259512427"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; 
   d="scan'208";a="259512427"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 00:08:04 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; 
   d="scan'208";a="523352160"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 00:07:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nbdHk-00DBak-GV;
        Tue, 05 Apr 2022 10:07:28 +0300
Date:   Tue, 5 Apr 2022 10:07:28 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        dmaengine@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
        Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v6 5/8] dmaengine: dw: dmamux: Introduce RZN1 DMA router
 support
Message-ID: <YkvqsO0aecSjGqx2@smile.fi.intel.com>
References: <20220404133904.1296258-1-miquel.raynal@bootlin.com>
 <20220404133904.1296258-6-miquel.raynal@bootlin.com>
 <YkvaOKmamLF+Mp7m@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkvaOKmamLF+Mp7m@matsya>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Apr 05, 2022 at 11:27:12AM +0530, Vinod Koul wrote:
> On 04-04-22, 15:39, Miquel Raynal wrote:

...

> > +MODULE_LICENSE("GPL");
> 
> This is not consistent with the SPDX tag..

Actually it is. "GPLv2" is obsolete form, in new code we are supposed using
"GPL" as per Documentation.


-- 
With Best Regards,
Andy Shevchenko


