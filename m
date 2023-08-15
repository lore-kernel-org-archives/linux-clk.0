Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28558C001E0
	for <linux-clk@archiver.kernel.org>; Tue, 15 Aug 2023 11:52:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236863AbjHOLwS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Aug 2023 07:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236884AbjHOLwQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Aug 2023 07:52:16 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B53510CF
        for <linux-clk@vger.kernel.org>; Tue, 15 Aug 2023 04:52:13 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fe8242fc4dso44877115e9.1
        for <linux-clk@vger.kernel.org>; Tue, 15 Aug 2023 04:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1692100332; x=1692705132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XG1CdDs3BJOFxaT2xWjh9aVXbUzXw0Qce5rbzwyMS1I=;
        b=cx29Z2/Gf27wrI+GW+nt3MIGLYw8rdG0pM2V8V6gDIXoay6oVWyPcSlNRrXgx+ia9H
         bynI3SuDiD1rHaWKQmAYTV+ZTfQRL8SBYnGy7ugUvdKNYR2KihJl4aW/Ae6gZOEY+ppk
         C+bHh+tb7qpNR5GWM7RLqu4DpPHA6S7nI3guRFLWjxpbWRZGPcmghzt7lHjZWBPKEHrR
         2fzhXb3Ah5+iraDZEA83A635nZ1V8bHmbW2lwyeqV/rCQP+S2FLs1H33TInFKWf3s2oO
         HmUYDH1HIX7JjEYrXa0u+I/jRXatro806knbv5tOnVzBiq3f5FvOjTuiNbgH9Q+B3xzP
         HZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692100332; x=1692705132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XG1CdDs3BJOFxaT2xWjh9aVXbUzXw0Qce5rbzwyMS1I=;
        b=XgIc5y2y4OVAWc19wI3G+ke22DCI8BgwxIdKQ/Y3md+J9TssinJcoJxNdKMyMNpB8o
         lgEIc4u+EMNiL6nfB48ewCzhPW0QvyyqQ7uT7wu50TMZHgeIgP4f9sIMpNvjyMcpvLZN
         iLhMJLXS8tY9zHRtJ005a+/FTgkGQdke71k1cEnIEThbHGfc24iQOfV3lMfPriOHyke/
         b0vI7CCI0uPwTkyjTI4pkcIuzIZLQ9SOq6teNI/ymq3oR+y1c2UIh4+yUCtisL84Yu29
         IIIFnPrSPTqCUBuravmgEXOCs94F3oBKVJKe8f6fCiV2O2XiZV7rNsMmN1gSk7BqWXO5
         +0DQ==
X-Gm-Message-State: AOJu0YzcDNk3oMckipfZozYfml7hMlT+ZJkiM2ZkEtxrQR2A7whQPCto
        81NMUp76qH5UobaqXobrTlyqaw==
X-Google-Smtp-Source: AGHT+IG4DWtf444jYikYwXk+iJ1caroN9SCLeIUZQSKVD0XACiRvyg7nhoXLwxD45xrNyqAuLwJwHQ==
X-Received: by 2002:a05:600c:214d:b0:3fe:179a:9eee with SMTP id v13-20020a05600c214d00b003fe179a9eeemr9396315wml.30.1692100331959;
        Tue, 15 Aug 2023 04:52:11 -0700 (PDT)
Received: from localhost ([212.23.236.67])
        by smtp.gmail.com with ESMTPSA id z5-20020a7bc7c5000000b003fbe4cecc3bsm20301828wmk.16.2023.08.15.04.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 04:52:11 -0700 (PDT)
Date:   Tue, 15 Aug 2023 13:52:10 +0200
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
Message-ID: <ZNtm6v+UuDIex1+s@nanopsycho>
References: <20230811200340.577359-1-vadim.fedorenko@linux.dev>
 <20230814194528.00baec23@kernel.org>
 <43395307-9d11-7905-0eec-0a4c1b1fc62a@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43395307-9d11-7905-0eec-0a4c1b1fc62a@linux.dev>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Tue, Aug 15, 2023 at 01:36:11PM CEST, vadim.fedorenko@linux.dev wrote:
>On 15/08/2023 03:45, Jakub Kicinski wrote:
>> On Fri, 11 Aug 2023 21:03:31 +0100 Vadim Fedorenko wrote:
>> >   create mode 100644 Documentation/driver-api/dpll.rst
>> >   create mode 100644 Documentation/netlink/specs/dpll.yaml
>> >   create mode 100644 drivers/dpll/Kconfig
>> >   create mode 100644 drivers/dpll/Makefile
>> >   create mode 100644 drivers/dpll/dpll_core.c
>> >   create mode 100644 drivers/dpll/dpll_core.h
>> >   create mode 100644 drivers/dpll/dpll_netlink.c
>> >   create mode 100644 drivers/dpll/dpll_netlink.h
>> >   create mode 100644 drivers/dpll/dpll_nl.c
>> >   create mode 100644 drivers/dpll/dpll_nl.h
>> >   create mode 100644 drivers/net/ethernet/intel/ice/ice_dpll.c
>> >   create mode 100644 drivers/net/ethernet/intel/ice/ice_dpll.h
>> >   create mode 100644 drivers/net/ethernet/mellanox/mlx5/core/dpll.c
>> >   create mode 100644 include/linux/dpll.h
>> >   create mode 100644 include/uapi/linux/dpll.h
>> 
>> Feels like we're lacking tests here. Is there a common subset of
>> stuff we can expect reasonable devices to support?
>> Anything you used in development that can be turned into tests?
>
>Well, we were playing with the tool ynl/cli.py and it's stated in
>the cover letter. But needs proper hardware to run. I'm not sure
>we can easily create emulation device to run tests.

Well, something like "dpllsim", similar to netdevsim would be certainly
possible, then you can use it to write selftests for the uapi testing.
But why don't we do that as a follow-up patchset?
