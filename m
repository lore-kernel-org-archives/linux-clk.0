Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980AEC6FD1D
	for <linux-clk@archiver.kernel.org>; Fri, 17 Mar 2023 14:29:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbjCQO3y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Mar 2023 10:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjCQO3u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Mar 2023 10:29:50 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC4ECD5A7F
        for <linux-clk@vger.kernel.org>; Fri, 17 Mar 2023 07:29:40 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id ip21-20020a05600ca69500b003ed56690948so3157219wmb.1
        for <linux-clk@vger.kernel.org>; Fri, 17 Mar 2023 07:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112; t=1679063379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TC4JhN24VRkXfCJn3EN0pxyu20Kc6X0LVvYiiW34KUw=;
        b=Oh2pDDoySWwlh5slWc7GLkY+Jp79GbDkTlt2ELVfSNR7zocx4j+tfZJYOAy+bKqFPF
         6JGRUrG65BceY55xIyuyE9/6LofdMYqb1JdOr5NKxY9ODXT75EkOVFL4e5gUPLs7QXVa
         rLFtGyLPgFQFKiVsgTUmqW8ZAyyQ+dVbOjPataEZmI/xn+28OdTYW03So49vOO3jHGUi
         NYDBAJLcKJjbZmlJAi0fdP6UQtmDSIjjFqtj9mXdlFt1AY0HHDcweEpFn98OQAymhIKk
         t+mukt1JydnfTmZ6lX27W7hotLQsbKcMfmZNfWEfQ1KY7q9b+u5HHaytYu3tR69hyEQ1
         7/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679063379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TC4JhN24VRkXfCJn3EN0pxyu20Kc6X0LVvYiiW34KUw=;
        b=TgZg4yLZat46wvI5ysjqVMyP8JQZTaChCRozlNbDklbJZAa/N4jylS3QWrT2b1yxF3
         Oz+vpjwwCuUz7N7e4KWAT/i1+Ban0eHGUedPZW8JuwNw0JBSUsmyUrnZgyydBdzpHHBs
         zfaNM+tL5mGjLCprFALmutsSIKEvjL6fJ0ZuY72yl3aGYZn/Fyi++AqHynDNDFPAk3XS
         WQHDwzVllBoBHA3xfiRRDcrKLQvsUSpQ/aXlqKOkUT5Eoi/0jAKF5hq0ZuU9pW1Mfec6
         WcAVJyENBGUSFtelP1+5Ajir3rVTe+g6/Fp6ifd68XtBntaOgN9X6C5lTD5WsgV3iL3Q
         vQ3Q==
X-Gm-Message-State: AO0yUKUJ+70U6u/m0Rt+Dnr81tKnrFe2yJ8570A2AdCc7DxqL+mDRiKs
        Zh1gfXHwC3RN26cpq7sJb7ejrg==
X-Google-Smtp-Source: AK7set/5yd8eHA/DHRjrURRwh9fCclvu/hQ9JlKTY+8G1Q7lpRH91RRBU3SBEdu+8h+TjVDv7J/NsQ==
X-Received: by 2002:a05:600c:28c:b0:3ed:5d41:f964 with SMTP id 12-20020a05600c028c00b003ed5d41f964mr1878674wmk.1.1679063378822;
        Fri, 17 Mar 2023 07:29:38 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id r6-20020a05600c35c600b003ed29189777sm8444894wmq.47.2023.03.17.07.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 07:29:38 -0700 (PDT)
Date:   Fri, 17 Mar 2023 15:29:36 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc:     Vadim Fedorenko <vadfed@meta.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        poros <poros@redhat.com>, mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "Michalik, Michal" <michal.michalik@intel.com>
Subject: Re: [PATCH RFC v6 1/6] dpll: spec: Add Netlink spec in YAML
Message-ID: <ZBR5UC5cF15ciXPf@nanopsycho>
References: <20230312022807.278528-1-vadfed@meta.com>
 <20230312022807.278528-2-vadfed@meta.com>
 <ZBCIPg1u8UFugEFj@nanopsycho>
 <DM6PR11MB4657F423D2B3B4F0799B0F019BBC9@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZBMdZkK91GHDrd/4@nanopsycho>
 <DM6PR11MB465709625C2C391D470C33F49BBD9@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZBQ7ZuJSXRfFOy1b@nanopsycho>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBQ7ZuJSXRfFOy1b@nanopsycho>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fri, Mar 17, 2023 at 11:05:26AM CET, jiri@resnulli.us wrote:
>Fri, Mar 17, 2023 at 01:52:44AM CET, arkadiusz.kubalewski@intel.com wrote:
>>>From: Jiri Pirko <jiri@resnulli.us>
>>>Sent: Thursday, March 16, 2023 2:45 PM
>>>
>>
>>[...]
>>
>>>>>>+attribute-sets:
>>>>>>+  -
>>>>>>+    name: dpll
>>>>>>+    enum-name: dplla
>>>>>>+    attributes:
>>>>>>+      -
>>>>>>+        name: device
>>>>>>+        type: nest
>>>>>>+        value: 1
>>>>>>+        multi-attr: true
>>>>>>+        nested-attributes: device
>>>>>
>>>>>What is this "device" and what is it good for? Smells like some leftover
>>>>>and with the nested scheme looks quite odd.
>>>>>
>>>>
>>>>No, it is nested attribute type, used when multiple devices are returned
>>>>with netlink:
>>>>
>>>>- dump of device-get command where all devices are returned, each one nested
>>>>inside it:
>>>>[{'device': [{'bus-name': 'pci', 'dev-name': '0000:21:00.0_0', 'id': 0},
>>>>             {'bus-name': 'pci', 'dev-name': '0000:21:00.0_1', 'id': 1}]}]
>>>
>>>Okay, why is it nested here? The is one netlink msg per dpll device
>>>instance. Is this the real output of you made that up?
>>>
>>>Device nest should not be there for DEVICE_GET, does not make sense.
>>>
>>
>>This was returned by CLI parser on ice with cmd:
>>$ ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/dpll.yaml /
>>--dump device-get
>>
>>Please note this relates to 'dump' request , it is rather expected that there
>>are multiple dplls returned, thus we need a nest attribute for each one.
>
>No, you definitelly don't need to nest them. Dump format and get format
>should be exactly the same. Please remove the nest.

Another example:
$ ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/netdev.yaml --dump dev-get
[{'ifindex': 1, 'xdp-features': set()},
 {'ifindex': 2, 'xdp-features': {'basic', 'rx-sg', 'redirect'}},
 {'ifindex': 3, 'xdp-features': {'basic', 'rx-sg', 'redirect'}},
 {'ifindex': 4, 'xdp-features': set()},
 {'ifindex': 5, 'xdp-features': {'basic', 'rx-sg', 'xsk-zerocopy', 'redirect'}},
 {'ifindex': 6, 'xdp-features': {'basic', 'rx-sg', 'xsk-zerocopy', 'redirect'}}]

[...]
