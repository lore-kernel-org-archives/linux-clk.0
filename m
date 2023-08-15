Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D4CC001DB
	for <linux-clk@archiver.kernel.org>; Tue, 15 Aug 2023 14:33:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237650AbjHOOdA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Aug 2023 10:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235222AbjHOOch (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Aug 2023 10:32:37 -0400
Received: from out-51.mta1.migadu.com (out-51.mta1.migadu.com [IPv6:2001:41d0:203:375::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9D5010C0
        for <linux-clk@vger.kernel.org>; Tue, 15 Aug 2023 07:32:35 -0700 (PDT)
Message-ID: <5c5dfd21-9882-94b8-79f8-9d8c03df22c4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1692109953;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qzSXyJkj1fcIfg4XzbZtfcYtwRNqAm+dyKqw3EUgwmE=;
        b=xiggilbwQ3DFN5RK8GgY6aFQvWwy/a+D6DC3D9+5yKbjKeSu6Gw7B4hNzM0DmKzamUPzxR
        RCfHnEUjrZkSm+XjIbYMWHWRWPu7B/9sio2eSWgqR9hHbwpCDAH/7pDkUCEUdtSJbtwcqa
        A+8u3Fci3GVpyuwE1NkMj3ew+Q7iJEk=
Date:   Tue, 15 Aug 2023 15:32:28 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next v4 0/9] Create common DPLL configuration API
Content-Language: en-US
To:     Jiri Pirko <jiri@resnulli.us>
Cc:     Jakub Kicinski <kuba@kernel.org>,
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
 <43395307-9d11-7905-0eec-0a4c1b1fc62a@linux.dev>
 <ZNtm6v+UuDIex1+s@nanopsycho>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <ZNtm6v+UuDIex1+s@nanopsycho>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/08/2023 12:52, Jiri Pirko wrote:
> Tue, Aug 15, 2023 at 01:36:11PM CEST, vadim.fedorenko@linux.dev wrote:
>> On 15/08/2023 03:45, Jakub Kicinski wrote:
>>> On Fri, 11 Aug 2023 21:03:31 +0100 Vadim Fedorenko wrote:
>>>>    create mode 100644 Documentation/driver-api/dpll.rst
>>>>    create mode 100644 Documentation/netlink/specs/dpll.yaml
>>>>    create mode 100644 drivers/dpll/Kconfig
>>>>    create mode 100644 drivers/dpll/Makefile
>>>>    create mode 100644 drivers/dpll/dpll_core.c
>>>>    create mode 100644 drivers/dpll/dpll_core.h
>>>>    create mode 100644 drivers/dpll/dpll_netlink.c
>>>>    create mode 100644 drivers/dpll/dpll_netlink.h
>>>>    create mode 100644 drivers/dpll/dpll_nl.c
>>>>    create mode 100644 drivers/dpll/dpll_nl.h
>>>>    create mode 100644 drivers/net/ethernet/intel/ice/ice_dpll.c
>>>>    create mode 100644 drivers/net/ethernet/intel/ice/ice_dpll.h
>>>>    create mode 100644 drivers/net/ethernet/mellanox/mlx5/core/dpll.c
>>>>    create mode 100644 include/linux/dpll.h
>>>>    create mode 100644 include/uapi/linux/dpll.h
>>>
>>> Feels like we're lacking tests here. Is there a common subset of
>>> stuff we can expect reasonable devices to support?
>>> Anything you used in development that can be turned into tests?
>>
>> Well, we were playing with the tool ynl/cli.py and it's stated in
>> the cover letter. But needs proper hardware to run. I'm not sure
>> we can easily create emulation device to run tests.
> 
> Well, something like "dpllsim", similar to netdevsim would be certainly
> possible, then you can use it to write selftests for the uapi testing.
> But why don't we do that as a follow-up patchset?

Yeah, I agree, we can implement simulator, but as a follow-up work. 
Otherwise it might take a year to merge this set :)
