Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 718D8EB64DC
	for <linux-clk@archiver.kernel.org>; Fri, 21 Jul 2023 15:46:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231764AbjGUPq6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Jul 2023 11:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbjGUPq6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Jul 2023 11:46:58 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85FC91BD
        for <linux-clk@vger.kernel.org>; Fri, 21 Jul 2023 08:46:56 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fbc656873eso18916385e9.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Jul 2023 08:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1689954415; x=1690559215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XJ605DFCuMMQFc82oM42YKr424AySsSucD5Bxe5qZCI=;
        b=moda7FHuShy9tRX7Z2Ec/0UcfzdJhwj5UWRSSVVE54lS4jjEVJOASvaJFM4W73Fuc6
         9Pz5+nSSpDFLGhrjU3UBljQHCI3YilTkDribbKqodkm4pvBykp3IGYARbrjtSqKwQKaS
         uuhvDuiubZ48egK58f0+3XCpmWN9q8blCKqFFEIJ02RE6Kf8kuTwHEVoaY83SGgyGZMG
         j9b075P+5tUI0QoMmXRlefSRXgY24DX94uYZtQ8pK/NBJsnlvvFRD2UC5Q8q9sAWmmKi
         QMZEvUJ67Ct8NoG/IOLcKPm/S7vj2l8QFxOd8MRj3A//n3cc29yLc2OZXM1huwFyEsB6
         lhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689954415; x=1690559215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJ605DFCuMMQFc82oM42YKr424AySsSucD5Bxe5qZCI=;
        b=PZFdNf4U8BHpRez8iKKZuGv0AfjLvnHLe9nycTvlck+14YlIszqHwwCO1k8orpNXh4
         83JNy50XLsruqJ0iTv8Gb6nCs4nX+tcwD3EiN+6cExPAy+/RLHMDd1364j6uY1yKaob3
         vEWfUVZghhdtPPUyZRBz6hpLX7bMfqPo4V72JrVCXWKYwWvMN3J82AAlIHxudDuiEuyn
         fzDRc7l5M6DcbfrTTcE7Fv5/o1Vlh6abybMMi9iYs3iI8pL2pZL07n3aw7sjNyGAUzg0
         jWKIB+Wa4mUIJlt9U3sVm/GCsYzKryVyKv/8eFE/LGU218lFv/lPxSuFxOZWUnkXiJMx
         qsSg==
X-Gm-Message-State: ABy/qLbzE/okidwCLkT5HCPXRWQ9EnZsInl9UHGjGqbuA3DSQofT4RLD
        jabUZGNI/uZjhyoplTWuMJ48Wg==
X-Google-Smtp-Source: APBJJlHvQh8xvLfBN66qyK7xnRp8Hj8pK8wtMmdZnTdJD9U+JvLAO1Hphm/NmTs7pfD+SqvgbBvHTA==
X-Received: by 2002:adf:fb01:0:b0:313:eb34:b23e with SMTP id c1-20020adffb01000000b00313eb34b23emr1693035wrr.49.1689954414876;
        Fri, 21 Jul 2023 08:46:54 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id m9-20020a5d56c9000000b00313e2abfb8dsm4539979wrw.92.2023.07.21.08.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 08:46:54 -0700 (PDT)
Date:   Fri, 21 Jul 2023 17:46:53 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH net-next 00/11] Create common DPLL configuration API
Message-ID: <ZLqobYBeNoEYNE/0@nanopsycho>
References: <20230720091903.297066-1-vadim.fedorenko@linux.dev>
 <ZLpom60B+fkjsoG1@nanopsycho>
 <dbbfd954-efef-67e6-b291-539c0b0b5ac4@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbbfd954-efef-67e6-b291-539c0b0b5ac4@linux.dev>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fri, Jul 21, 2023 at 04:42:46PM CEST, vadim.fedorenko@linux.dev wrote:
>On 21.07.2023 12:14, Jiri Pirko wrote:
>> There are couple of issues that came up during our internal ci run:
>> 
>> 10:16:04  error: drivers/dpll/dpll_netlink.c:452:5: error: no previous prototype for '__dpll_device_change_ntf' [-Werror=missing-prototypes]
>> 10:16:04  error: drivers/dpll/dpll_netlink.c:1283:13: error: no previous prototype for 'dpll_netlink_fini' [-Werror=missing-prototypes]
>> 10:16:04  error: drivers/dpll/dpll_core.c:221:1: error: no previous prototype for 'dpll_xa_ref_dpll_find' [-Werror=missing-prototypes]
>> 
>> 10:27:31  error: drivers/dpll/dpll_core.c:220:21: warning: symbol 'dpll_xa_ref_dpll_find' was not declared. Should it be static?
>> 10:27:31  error: drivers/dpll/dpll_netlink.c:452:5: warning: symbol '__dpll_device_change_ntf' was not declared. Should it be static?
>> 10:27:31  error: drivers/dpll/dpll_netlink.c:1283:13: warning: symbol 'dpll_netlink_fini' was not declared. Should it be static?
>> 10:27:41  error: drivers/net/ethernet/intel/ice/ice_dpll.c:461:3: error: a label can only be part of a statement and a declaration is not a statement
>> 
>> I believe that you didn't run make with C=2, otherwise you would hit
>> these.
>
>Yeah, I'll re-run the set patch-by-patch with C=2 next time.
>
>> 
>> Checkpatch issue:
>> 10:29:30  CHECK: struct mutex definition without comment
>> 10:29:30  #6581: FILE: drivers/net/ethernet/intel/ice/ice_dpll.h:85:
>> 10:29:30  +	struct mutex lock;
>
>Arkadiusz will take care of "ice" part.
>
>
>> Spelling errors:
>> 10:45:08  error: Documentation/netlink/specs/dpll.yaml:165: prority ==> priority
>> 10:45:08  error: include/uapi/linux/dpll.h:128: prority ==> priority
>> 10:45:08  error: drivers/net/ethernet/intel/ice/ice_dpll.c:2008: userpsace ==> userspace
>> 10:45:08  error: drivers/net/ethernet/intel/ice/ice_dpll.h:20: properities ==> properties
>> 
>
>Will fix it.
>
>> 
>> Thu, Jul 20, 2023 at 11:18:52AM CEST, vadim.fedorenko@linux.dev wrote:
>> > Implement common API for clock/DPLL configuration and status reporting.
>> > The API utilises netlink interface as transport for commands and event
>> > notifications. This API aim to extend current pin configuration and
>> 
>> s/API aim/API aims/
>> 
>> 
>> > make it flexible and easy to cover special configurations.
>> 
>> I don't follow. How this could "aim to extend current pin configuration" ?
>> This is a new thing. Could you re-phrase?
>
>Not really new. PTP devices have already simple pin configurations, mlx5 is
>using it for some cards with external pins. The problem is that PTP subsystem
>covers only simple configuration of the pin and doesn't cover DPLL part at all.

Okay, please put the info in.


>
>> 
>> What's "special configuration"? Sounds odd.
>> 
>
>Yeah, "complex configurations" sounds better, will change it.
>
>> 
>> > 
>> > Netlink interface is based on ynl spec, it allows use of in-kernel
>> > tools/net/ynl/cli.py application to control the interface with properly
>> > formated command and json attribute strings. Here are few command
>> > examples of how it works with `ice` driver on supported NIC:
>> > 
>> > - dump dpll devices
>> > $# ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
>> 
>> "$#" looks a bit odd. Just "$" with "sudo" when you want to emphasize
>> root is needed to perform the command.
>> 
>> 
>> > --dump device-get
>> > [{'clock-id': 282574471561216,
>> >   'id': 0,
>> >   'lock-status': 'unlocked',
>> >   'mode': 'automatic',
>> >   'module-name': 'ice',
>> >   'type': 'eec'},
>> > {'clock-id': 282574471561216,
>> >   'id': 1,
>> >   'lock-status': 'unlocked',
>> >   'mode': 'automatic',
>> >   'module-name': 'ice',
>> >   'type': 'pps'}]
>> > 
>> > - get single pin info:
>> > $# ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
>> > --do pin-get --json '{"pin-id":2}'
>> > {'clock-id': 282574471561216,
>> > 'module-name': 'ice',
>> > 'pin-board-label': 'C827_0-RCLKA',
>> > 'pin-dpll-caps': 6,
>> > 'pin-frequency': 1953125,
>> > 'pin-id': 2,
>> > 'pin-parenti-device': [{'id': 0,
>> 
>> This looks like manual edit went wrong :)
>> s/parenti/parent/
>> 
>
>Ahhh... yeah :)
>
>> 
>> >                          'pin-direction': 'input',
>> >                          'pin-prio': 11,
>> >                          'pin-state': 'selectable'},
>> >                         {'id': 1,
>> >                          'pin-direction': 'input',
>> >                          'pin-prio': 9,
>> >                          'pin-state': 'selectable'}],
>> > 'pin-type': 'mux'}
>> > 
>> > - set pin's state on dpll:
>> > $# ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
>> > --do pin-set --json '{"pin-id":2, "pin-parent-device":{"id":1, "pin-state":2}}'
>> > 
>> > - set pin's prio on dpll:
>> > $# ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
>> > --do pin-set --json '{"pin-id":2, "pin-parent-device":{"id":1, "pin-prio":4}}'
>> > 
>> > - set pin's state on parent pin:
>> > $# ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
>> > --do pin-set --json '{"pin-id":13, \
>> >                       "pin-parent-pin":{"pin-id":2, "pin-state":1}}'
>> > 
>> 
>> [...]
>
