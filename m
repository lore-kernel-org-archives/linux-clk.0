Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BF2C04FE0
	for <linux-clk@archiver.kernel.org>; Fri, 21 Jul 2023 14:43:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbjGUOnE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Jul 2023 10:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231857AbjGUOmz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Jul 2023 10:42:55 -0400
Received: from out-44.mta0.migadu.com (out-44.mta0.migadu.com [91.218.175.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0641635BD
        for <linux-clk@vger.kernel.org>; Fri, 21 Jul 2023 07:42:49 -0700 (PDT)
Message-ID: <dbbfd954-efef-67e6-b291-539c0b0b5ac4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1689950567;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Mg2SzEE2M9WvVRfM1Guy+LNUuC3B+BHA9FYVw72Vv+0=;
        b=IbkDFl+0eJMk/qy7B7jfVxr03KcCAlklrh/Ou8ViMvTUdWjThyX9CmdtZ36mhDRtERb/nv
        CBwMVHKk/pXH52lxDNshhaXG3OFNzLTiztm1HoHCW9gZ4xyby9Vuq5c51p9VE9JzHPsrgx
        u+aTLC4vCZ3Q4qnsPmaPoZTM7DGkNqY=
Date:   Fri, 21 Jul 2023 15:42:46 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next 00/11] Create common DPLL configuration API
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
        linux-clk@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>
References: <20230720091903.297066-1-vadim.fedorenko@linux.dev>
 <ZLpom60B+fkjsoG1@nanopsycho>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <ZLpom60B+fkjsoG1@nanopsycho>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21.07.2023 12:14, Jiri Pirko wrote:
> There are couple of issues that came up during our internal ci run:
> 
> 10:16:04  error: drivers/dpll/dpll_netlink.c:452:5: error: no previous prototype for '__dpll_device_change_ntf' [-Werror=missing-prototypes]
> 10:16:04  error: drivers/dpll/dpll_netlink.c:1283:13: error: no previous prototype for 'dpll_netlink_fini' [-Werror=missing-prototypes]
> 10:16:04  error: drivers/dpll/dpll_core.c:221:1: error: no previous prototype for 'dpll_xa_ref_dpll_find' [-Werror=missing-prototypes]
> 
> 10:27:31  error: drivers/dpll/dpll_core.c:220:21: warning: symbol 'dpll_xa_ref_dpll_find' was not declared. Should it be static?
> 10:27:31  error: drivers/dpll/dpll_netlink.c:452:5: warning: symbol '__dpll_device_change_ntf' was not declared. Should it be static?
> 10:27:31  error: drivers/dpll/dpll_netlink.c:1283:13: warning: symbol 'dpll_netlink_fini' was not declared. Should it be static?
> 10:27:41  error: drivers/net/ethernet/intel/ice/ice_dpll.c:461:3: error: a label can only be part of a statement and a declaration is not a statement
> 
> I believe that you didn't run make with C=2, otherwise you would hit
> these.

Yeah, I'll re-run the set patch-by-patch with C=2 next time.

> 
> Checkpatch issue:
> 10:29:30  CHECK: struct mutex definition without comment
> 10:29:30  #6581: FILE: drivers/net/ethernet/intel/ice/ice_dpll.h:85:
> 10:29:30  +	struct mutex lock;

Arkadiusz will take care of "ice" part.


> Spelling errors:
> 10:45:08  error: Documentation/netlink/specs/dpll.yaml:165: prority ==> priority
> 10:45:08  error: include/uapi/linux/dpll.h:128: prority ==> priority
> 10:45:08  error: drivers/net/ethernet/intel/ice/ice_dpll.c:2008: userpsace ==> userspace
> 10:45:08  error: drivers/net/ethernet/intel/ice/ice_dpll.h:20: properities ==> properties
> 

Will fix it.

> 
> Thu, Jul 20, 2023 at 11:18:52AM CEST, vadim.fedorenko@linux.dev wrote:
>> Implement common API for clock/DPLL configuration and status reporting.
>> The API utilises netlink interface as transport for commands and event
>> notifications. This API aim to extend current pin configuration and
> 
> s/API aim/API aims/
> 
> 
>> make it flexible and easy to cover special configurations.
> 
> I don't follow. How this could "aim to extend current pin configuration" ?
> This is a new thing. Could you re-phrase?

Not really new. PTP devices have already simple pin configurations, mlx5 is 
using it for some cards with external pins. The problem is that PTP subsystem
covers only simple configuration of the pin and doesn't cover DPLL part at all.

> 
> What's "special configuration"? Sounds odd.
> 

Yeah, "complex configurations" sounds better, will change it.

> 
>>
>> Netlink interface is based on ynl spec, it allows use of in-kernel
>> tools/net/ynl/cli.py application to control the interface with properly
>> formated command and json attribute strings. Here are few command
>> examples of how it works with `ice` driver on supported NIC:
>>
>> - dump dpll devices
>> $# ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
> 
> "$#" looks a bit odd. Just "$" with "sudo" when you want to emphasize
> root is needed to perform the command.
> 
> 
>> --dump device-get
>> [{'clock-id': 282574471561216,
>>   'id': 0,
>>   'lock-status': 'unlocked',
>>   'mode': 'automatic',
>>   'module-name': 'ice',
>>   'type': 'eec'},
>> {'clock-id': 282574471561216,
>>   'id': 1,
>>   'lock-status': 'unlocked',
>>   'mode': 'automatic',
>>   'module-name': 'ice',
>>   'type': 'pps'}]
>>
>> - get single pin info:
>> $# ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
>> --do pin-get --json '{"pin-id":2}'
>> {'clock-id': 282574471561216,
>> 'module-name': 'ice',
>> 'pin-board-label': 'C827_0-RCLKA',
>> 'pin-dpll-caps': 6,
>> 'pin-frequency': 1953125,
>> 'pin-id': 2,
>> 'pin-parenti-device': [{'id': 0,
> 
> This looks like manual edit went wrong :)
> s/parenti/parent/
> 

Ahhh... yeah :)

> 
>>                          'pin-direction': 'input',
>>                          'pin-prio': 11,
>>                          'pin-state': 'selectable'},
>>                         {'id': 1,
>>                          'pin-direction': 'input',
>>                          'pin-prio': 9,
>>                          'pin-state': 'selectable'}],
>> 'pin-type': 'mux'}
>>
>> - set pin's state on dpll:
>> $# ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
>> --do pin-set --json '{"pin-id":2, "pin-parent-device":{"id":1, "pin-state":2}}'
>>
>> - set pin's prio on dpll:
>> $# ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
>> --do pin-set --json '{"pin-id":2, "pin-parent-device":{"id":1, "pin-prio":4}}'
>>
>> - set pin's state on parent pin:
>> $# ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
>> --do pin-set --json '{"pin-id":13, \
>>                       "pin-parent-pin":{"pin-id":2, "pin-state":1}}'
>>
> 
> [...]

