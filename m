Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61817C001B0
	for <linux-clk@archiver.kernel.org>; Tue, 15 Aug 2023 11:37:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232971AbjHOLgc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Aug 2023 07:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236727AbjHOLgW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Aug 2023 07:36:22 -0400
Received: from out-58.mta1.migadu.com (out-58.mta1.migadu.com [95.215.58.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C15FE7C
        for <linux-clk@vger.kernel.org>; Tue, 15 Aug 2023 04:36:20 -0700 (PDT)
Message-ID: <43395307-9d11-7905-0eec-0a4c1b1fc62a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1692099378;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xdaOhJMcLy8g2NeNhcZ0hjcc5u5LnChRhx//RtiayQ4=;
        b=OWMV0nhGYN/Xpcdri2nKwD8iSdWtf+SoVmD0ynb6XBq7aevH38T/J7f4EyvMgs+IbLLaoK
        BBMPl5leCQ99nxanJAOjIDE7trjwwvU8TliNlMXmnZhpOKwqtRNKKOp6abth0eL3v/B9NR
        cHd9by0qtahbeg3ZcFMSJjLeTkHVYVw=
Date:   Tue, 15 Aug 2023 12:36:11 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next v4 0/9] Create common DPLL configuration API
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Jiri Pirko <jiri@resnulli.us>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
        intel-wired-lan@lists.osuosl.org
References: <20230811200340.577359-1-vadim.fedorenko@linux.dev>
 <20230814194528.00baec23@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20230814194528.00baec23@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/08/2023 03:45, Jakub Kicinski wrote:
> On Fri, 11 Aug 2023 21:03:31 +0100 Vadim Fedorenko wrote:
>>   create mode 100644 Documentation/driver-api/dpll.rst
>>   create mode 100644 Documentation/netlink/specs/dpll.yaml
>>   create mode 100644 drivers/dpll/Kconfig
>>   create mode 100644 drivers/dpll/Makefile
>>   create mode 100644 drivers/dpll/dpll_core.c
>>   create mode 100644 drivers/dpll/dpll_core.h
>>   create mode 100644 drivers/dpll/dpll_netlink.c
>>   create mode 100644 drivers/dpll/dpll_netlink.h
>>   create mode 100644 drivers/dpll/dpll_nl.c
>>   create mode 100644 drivers/dpll/dpll_nl.h
>>   create mode 100644 drivers/net/ethernet/intel/ice/ice_dpll.c
>>   create mode 100644 drivers/net/ethernet/intel/ice/ice_dpll.h
>>   create mode 100644 drivers/net/ethernet/mellanox/mlx5/core/dpll.c
>>   create mode 100644 include/linux/dpll.h
>>   create mode 100644 include/uapi/linux/dpll.h
> 
> Feels like we're lacking tests here. Is there a common subset of
> stuff we can expect reasonable devices to support?
> Anything you used in development that can be turned into tests?

Well, we were playing with the tool ynl/cli.py and it's stated in
the cover letter. But needs proper hardware to run. I'm not sure
we can easily create emulation device to run tests.
