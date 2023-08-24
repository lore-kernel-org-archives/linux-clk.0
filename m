Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C934C83003
	for <linux-clk@archiver.kernel.org>; Thu, 24 Aug 2023 07:00:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235535AbjHXHAN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Aug 2023 03:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237025AbjHXG7t (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Aug 2023 02:59:49 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBB63E45
        for <linux-clk@vger.kernel.org>; Wed, 23 Aug 2023 23:59:45 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31c79850df5so156526f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 23 Aug 2023 23:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1692860384; x=1693465184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+xVvlCGex8MTTZYxV9+n6jIh21hrXPC9JzY4cLwH6KA=;
        b=JA/SlRiSGXLmyf4uxdL8Ezug//3djjbWkWBwFLDDwMEZb8sfx3E/tGZNzckZiddzdY
         vzZdao/SmZppv1Jwr8TYyz+1EEMuiXtaqhPJ7UsLHabhBVyNQllseyx+wcxHnck5PYfx
         3hjWgKX243esYSmP+UJ9iPL8O54M2Y1okgV06RTexXMWQJin22ja0auiPFgIJxZxJuaI
         0qIi2d3hAdKgKRPFYf5Kr6t0K2llnb2ccWk78c7jf4OX2MR20VO/5sXnz2HOzK16yds/
         PV7MZCBC2Ro5kwyuyRG7lb7ghiiAWapS+FketmqQpxWVxUlSyzuqj3dxhlKM2K9It+vQ
         2oRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692860384; x=1693465184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xVvlCGex8MTTZYxV9+n6jIh21hrXPC9JzY4cLwH6KA=;
        b=BGnUay9FVEcZVcJT34HQsE9pHFjeRbCwwkVf6Fy7nidZKorDfJUNg2HgyeLivWPoCG
         043ww3Hse1Olbbt838qVujEuQ8p/8obulhuhXMyZq1K2Jjqxhh2GYZEDaszrijHuKYf0
         NMhyMieZmPbT/J0OSa/iH8RvIP7/+vYk1T00t2+0vq1jqwHabPX614dZu94h0wjw7Ydk
         BNGw7IX4LCcJAyUqCgC+MAu55Iuh1rXcGxDmvaBmcNOVaY06Jy897U+nhttABW8CTVxD
         rpKsl9ObfkzUEZ7tZfCJhjlf2ihpSceABBSVL2oBk651mffsqDSx9hRhK5W+r2WmhOFQ
         Vzyg==
X-Gm-Message-State: AOJu0Yyjt6zts5Ti2vIvwFWmt3H6JJpcPYFr8ds3/G09YFaI9WJZE6lP
        yvZx/mKQqgBrv8D66EXTMGknhQ==
X-Google-Smtp-Source: AGHT+IHV5h/gWiGqWISIXTEBzuyi+BE2xkRY/zgFh1SxLekzv+sqKnQhfmfoEMGVAG+tjnX0+xWpsg==
X-Received: by 2002:adf:edca:0:b0:31a:d7fc:28f with SMTP id v10-20020adfedca000000b0031ad7fc028fmr12034332wro.19.1692860384103;
        Wed, 23 Aug 2023 23:59:44 -0700 (PDT)
Received: from localhost ([212.23.236.67])
        by smtp.gmail.com with ESMTPSA id y17-20020adfe6d1000000b003176eab8868sm21246718wrm.82.2023.08.23.23.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 23:59:43 -0700 (PDT)
Date:   Thu, 24 Aug 2023 08:59:42 +0200
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
        linux-clk@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
        intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH net-next v6 0/9] Create common DPLL configuration API
Message-ID: <ZOb/3qbGKS4+6Slu@nanopsycho>
References: <20230823225242.817957-1-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823225242.817957-1-vadim.fedorenko@linux.dev>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Thu, Aug 24, 2023 at 12:52:33AM CEST, vadim.fedorenko@linux.dev wrote:
>Implement common API for DPLL configuration and status reporting.
>The API utilises netlink interface as transport for commands and event
>notifications. This API aims to extend current pin configuration 
>provided by PTP subsystem and make it flexible and easy to cover
>complex configurations.
>
>Netlink interface is based on ynl spec, it allows use of in-kernel
>tools/net/ynl/cli.py application to control the interface with properly
>formated command and json attribute strings. Here are few command
>examples of how it works with `ice` driver on supported NIC:
>
>- dump dpll devices:
>$ sudo ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
>--dump device-get
>[{'clock-id': 4658613174691613800,
>  'id': 0,
>  'lock-status': 'locked-ho-acq',
>  'mode': 'automatic',
>  'mode-supported': ['automatic'],
>  'module-name': 'ice',
>  'type': 'eec'},
> {'clock-id': 4658613174691613800,
>  'id': 1,
>  'lock-status': 'locked-ho-acq',
>  'mode': 'automatic',
>  'mode-supported': ['automatic'],
>  'module-name': 'ice',
>  'type': 'pps'}]
>
>- get single pin info:
>$ sudo ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
>--do pin-get --json '{"id":2}'
>{'board-label': 'C827_0-RCLKA',
> 'clock-id': 4658613174691613800,
> 'capabilities': 6,
> 'frequency': 1953125,
> 'id': 2,
> 'module-name': 'ice',
> 'parent-device': [{'direction': 'input',
>                    'parent-id': 0,
>                    'prio': 9,
>                    'state': 'disconnected'},
>                   {'direction': 'input',
>                    'parent-id': 1,
>                    'prio': 9,
>                    'state': 'disconnected'}],
> 'type': 'mux'}
>
>- set pin's state on dpll:
>$ sudo ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
>--do pin-set --json '{"id":2, "parent-device":{"parent-id":1, "state":2}}'
>
>- set pin's prio on dpll:
>$ sudo ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
>--do pin-set --json '{"id":2, "parent-device":{"parent-id":1, "prio":4}}'
>
>- set pin's state on parent pin:
>$ sudo ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
>--do pin-set --json '{"id":13, "parent-pin":{"parent-id":2, "state":1}}'
>
>
>Changelog:
>
>v5 -> v6:
>- change dpll-caps to pin capabilities and adjust enum accordingly
>- remove dpll.h from netdevice.h

For the record, I'm fine with this version and my signed-offs stand.

Thanks!
