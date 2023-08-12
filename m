Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9634AC0015E
	for <linux-clk@archiver.kernel.org>; Sat, 12 Aug 2023 06:22:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231649AbjHLGWN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 12 Aug 2023 02:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjHLGWN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 12 Aug 2023 02:22:13 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B48919B2
        for <linux-clk@vger.kernel.org>; Fri, 11 Aug 2023 23:22:12 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fe7e1ef45dso4216045e87.1
        for <linux-clk@vger.kernel.org>; Fri, 11 Aug 2023 23:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1691821330; x=1692426130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tIaxLGslRcW1QcwxO7GUCWkC9wgWwk1uDGheKD/YCrw=;
        b=4PctNgLywMMJCSp6BUcfrAV8WOEPnbG4kVlmHd2WEFjSmqXBcuZ/AfSLxuR4EXNmR0
         nyhBBFjS8+zL8ucP4+zurnj7NAahlSvniN3ONxIhuWJ9dvgDuArke3IfQT+NN+WfuUUZ
         CEuniya89+TOZA/kXssDd9PJmlBDK1KJK95gLegPBhP0srsdaJRI6k/9oYkGutLxC4+B
         Gv9kIZ8yJiQ1ScPq94nDqLgNVp6BZTOJ2yHdCHtyxQs9poN3oI5/f1PY9BBjLxUN3d/C
         6IMnuaPJcQrwDpiF71wfSivHhhz4qCAUuJ6sN4sQJpZwS12RLCmaUqs11Cp57p36sm1N
         IbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691821330; x=1692426130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIaxLGslRcW1QcwxO7GUCWkC9wgWwk1uDGheKD/YCrw=;
        b=U62e1nGaqfN4mxJlCUE+I3LURSK8DLVQwbd9wgSBJC5deaoB6hoKiUgDfPgtlXkW/p
         LlNj9LWuSu/6kvl/10xnmkmWKH1rYgUSa4r6Dtcrf9GkiepbMi11wnPKrec3hrj3evd5
         cTXBS9XHQRDo6FiOCIM7ypDRXxwwx5xEXtHYZ4G6zwzr/v8q/ZT+Ojm7/FcKdmptExzt
         rgzkxixkmnR6J0Wl8167PeBfd3gaH6/HyjwOlb/p4VqpknBRm5ZKnLNEsUmhaXyimP0J
         U2PF43bQSyfkYsAdCx8UL/p72xzzgrUR4+kQ8I8Y87rTZIXUv9XewVauPxpvEVqnyft1
         oYRw==
X-Gm-Message-State: AOJu0Yzk4Y0kC7A0VXL+gFpF8S/cOQ0A0dHM+FJJuhUBPsmx4dRXOkQD
        hL5VUXPfUZnqsqJnqE1nyUuctA==
X-Google-Smtp-Source: AGHT+IEjyBAvqlEbHIM9xPstbrjCcgXcTfotTEm4wwyq+KYhjkim0j7pUrNecCBDyycYcldKCLSwcA==
X-Received: by 2002:a05:6512:3da0:b0:4f8:71cc:2b6e with SMTP id k32-20020a0565123da000b004f871cc2b6emr3913300lfv.33.1691821330468;
        Fri, 11 Aug 2023 23:22:10 -0700 (PDT)
Received: from localhost ([212.23.236.67])
        by smtp.gmail.com with ESMTPSA id l26-20020aa7c31a000000b005224d15d3dfsm2883854edq.87.2023.08.11.23.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 23:22:09 -0700 (PDT)
Date:   Sat, 12 Aug 2023 08:22:08 +0200
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
Subject: Re: [PATCH net-next v4 0/9] Create common DPLL configuration API
Message-ID: <ZNclEAXpyAFrhCh5@nanopsycho>
References: <20230811200340.577359-1-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811200340.577359-1-vadim.fedorenko@linux.dev>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fri, Aug 11, 2023 at 10:03:31PM CEST, vadim.fedorenko@linux.dev wrote:
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
>- dump dpll devices
>$ sudo ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
>--dump device-get
>[{'clock-id': 282574471561216,
>  'id': 0,
>  'lock-status': 'unlocked',
>  'mode': 'automatic',
>  'module-name': 'ice',
>  'type': 'eec'},
> {'clock-id': 282574471561216,
>  'id': 1,
>  'lock-status': 'unlocked',
>  'mode': 'automatic',
>  'module-name': 'ice',
>  'type': 'pps'}]
>
>- get single pin info:
>$ sudo ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
>--do pin-get --json '{"pin-id":2}'
>{'clock-id': 282574471561216,
> 'module-name': 'ice',
> 'pin-board-label': 'C827_0-RCLKA',
> 'pin-dpll-caps': 6,
> 'pin-frequency': 1953125,
> 'pin-id': 2,
> 'pin-parent-device': [{'id': 0,
>                         'pin-direction': 'input',
>                         'pin-prio': 11,
>                         'pin-state': 'selectable'},
>                        {'id': 1,
>                         'pin-direction': 'input',
>                         'pin-prio': 9,
>                         'pin-state': 'selectable'}],
> 'pin-type': 'mux'}
>
>- set pin's state on dpll:
>$ sudo ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
>--do pin-set --json '{"pin-id":2, "pin-parent-device":{"id":1, "pin-state":2}}'
>
>- set pin's prio on dpll:
>$ sudo ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
>--do pin-set --json '{"pin-id":2, "pin-parent-device":{"id":1, "pin-prio":4}}'
>
>- set pin's state on parent pin:
>$ sudo ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml \
>--do pin-set --json '{"pin-id":13, \
>                      "pin-parent-pin":{"pin-id":2, "pin-state":1}}'
>

For the record, I'm fine with this patchset version now.
Please merge and make this jurney to be over. Thanks!

