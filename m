Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F75C0015E
	for <linux-clk@archiver.kernel.org>; Sat, 12 Aug 2023 11:20:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbjHLLUe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 12 Aug 2023 07:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231307AbjHLLUe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 12 Aug 2023 07:20:34 -0400
Received: from out-64.mta0.migadu.com (out-64.mta0.migadu.com [91.218.175.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1ECB19F
        for <linux-clk@vger.kernel.org>; Sat, 12 Aug 2023 04:20:36 -0700 (PDT)
Message-ID: <436629d9-dd05-7593-1439-f22c9957485d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1691839234;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kYo66lOIT+5jOUo4wy3zizk9GdGi3NV1HZ2V22eu1ns=;
        b=jFz/38T66Y6siTMwiAscYuxfkEZaBMIbcW6Q2SYha5VHt/0mhzefJ1jz/KT5yfzz0mCyzN
        dactyUAErLwrNu4EtspM8oujFFvcFRZyCSxKTMcWzmF3wYVS9feK4b5FGU+vM9VaWSDBgm
        htWF0rUREYLroIOqRHZwxsl9zfgyWec=
Date:   Sat, 12 Aug 2023 12:20:32 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next v4 0/9] Create common DPLL configuration API
Content-Language: en-US
To:     Jiri Pirko <jiri@resnulli.us>, Jakub Kicinski <kuba@kernel.org>
Cc:     Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
        intel-wired-lan@lists.osuosl.org
References: <20230811200340.577359-1-vadim.fedorenko@linux.dev>
 <ZNclEAXpyAFrhCh5@nanopsycho>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <ZNclEAXpyAFrhCh5@nanopsycho>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12.08.2023 07:22, Jiri Pirko wrote:
> Fri, Aug 11, 2023 at 10:03:31PM CEST, vadim.fedorenko@linux.dev wrote:
>> Implement common API for DPLL configuration and status reporting.
>> The API utilises netlink interface as transport for commands and event
>> notifications. This API aims to extend current pin configuration
>> provided by PTP subsystem and make it flexible and easy to cover
>> complex configurations.
>>
>> Netlink interface is based on ynl spec, it allows use of in-kernel
>> tools/net/ynl/cli.py application to control the interface with properly
>> formated command and json attribute strings. Here are few command
>> examples of how it works with `ice` driver on supported NIC:
>>
>> - dump dpll devices
>> $ sudo ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
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
>> $ sudo ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
>> --do pin-get --json '{"pin-id":2}'
>> {'clock-id': 282574471561216,
>> 'module-name': 'ice',
>> 'pin-board-label': 'C827_0-RCLKA',
>> 'pin-dpll-caps': 6,
>> 'pin-frequency': 1953125,
>> 'pin-id': 2,
>> 'pin-parent-device': [{'id': 0,
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
>> $ sudo ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
>> --do pin-set --json '{"pin-id":2, "pin-parent-device":{"id":1, "pin-state":2}}'
>>
>> - set pin's prio on dpll:
>> $ sudo ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
>> --do pin-set --json '{"pin-id":2, "pin-parent-device":{"id":1, "pin-prio":4}}'
>>
>> - set pin's state on parent pin:
>> $ sudo ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
>> --do pin-set --json '{"pin-id":13, \
>>                       "pin-parent-pin":{"pin-id":2, "pin-state":1}}'
>>
> 
> For the record, I'm fine with this patchset version now.
> Please merge and make this jurney to be over. Thanks!
> 
Thanks Jiri! We are waiting for Jakub to review the code again and hopefully
merge the code1
