Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3357BC05052
	for <linux-clk@archiver.kernel.org>; Fri, 18 Aug 2023 07:24:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232427AbjHRHYB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Aug 2023 03:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358155AbjHRHXh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Aug 2023 03:23:37 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08EEB30DF
        for <linux-clk@vger.kernel.org>; Fri, 18 Aug 2023 00:23:34 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4ffa248263cso825016e87.2
        for <linux-clk@vger.kernel.org>; Fri, 18 Aug 2023 00:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1692343412; x=1692948212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+nrlvGLSZrLTAidXKYdnf+IMABQtnX9eIwf7feDIRl4=;
        b=gUkgEFdIUbCRiIovcKuPSXsz2jIBb04GMmR/D3yc0PsZNNvQX94puOhOfFRBicMod9
         FV75KNTBfswt/NUNYIl1BqJy7KRs3S3YAIGngmEcU5TovnqTTcy9aXhsxqPZdIWRXmEM
         KtbCL3yxYGA+YCAMtZmuqJ1ngjumWyHgt292mGY+f43e/fzIwMte2JtKjLmYORwpgGTC
         wE0h78ODD3iiAW0fW7CN/SEAWHZdFAWD/BJ3VsOsurCbmh0IhX82V89Gvry5s6dfXWsY
         UkRy3/h5kT2IwVboIXZHHLuCH3lq20jEzrdr86vQfSmiM5PqstmAICwpAS/ow0JHRMf4
         0k8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692343412; x=1692948212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nrlvGLSZrLTAidXKYdnf+IMABQtnX9eIwf7feDIRl4=;
        b=RMN9G+ICePl7SuUd7Cd4ZvDwvbbjThpHkHS9ZYKYJWDeKiGZh5Usq58ZVCdSuop6ev
         OjY5Sb8SYvRSZeDO6bHhhAtzE50w7aBl6/tQnrVB4pSow0foVUzlXvqbUwz5x3c9haM4
         6I05IT2Om75E5GgsOVbYV4KtV23SrbSjykf+N26WWQ76uu7rPIfJ9e9//fp8y8/xy/fB
         br1iIeNFJNhxwgdfS29Vx2AacxsAO7W63hBLUmr4wczg1pAhrinc3/vQYXNLCnzvlx3E
         JVwmRErf5cfvrUTAQ0ENhwntcuYFh701uR/vJJug+AS6fYRe8FsORdPZQ4oNom3GiQuj
         MU/A==
X-Gm-Message-State: AOJu0YzwR94s6YYVoKOJuOLzaGxOdAI0SAFzjfODjjA2io/4fxJ2qprR
        nyuVFejo9S4iv+EPSrYONMhCwA==
X-Google-Smtp-Source: AGHT+IEOeJMn8/EoRozhoQagPj2QryyIspkPS5PyFAvnzRmg9yRI8DoPXKyuJg63xi4Xks3gO4wgAQ==
X-Received: by 2002:a05:6512:2356:b0:4ff:6fa3:63ce with SMTP id p22-20020a056512235600b004ff6fa363cemr1126718lfu.10.1692343412057;
        Fri, 18 Aug 2023 00:23:32 -0700 (PDT)
Received: from localhost ([212.23.236.67])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c231000b003fc00212c1esm1882608wmo.28.2023.08.18.00.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 00:23:31 -0700 (PDT)
Date:   Fri, 18 Aug 2023 09:23:30 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Bart Van Assche <bvanassche@acm.org>,
        "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
        Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH net-next v4 2/9] dpll: spec: Add Netlink spec in YAML
Message-ID: <ZN8ccoE8X5J6yysk@nanopsycho>
References: <20230811200340.577359-1-vadim.fedorenko@linux.dev>
 <20230811200340.577359-3-vadim.fedorenko@linux.dev>
 <20230814194336.55642f34@kernel.org>
 <DM6PR11MB4657AD95547A14234941F9399B1AA@DM6PR11MB4657.namprd11.prod.outlook.com>
 <20230817163640.2ad33a4b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817163640.2ad33a4b@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fri, Aug 18, 2023 at 01:36:40AM CEST, kuba@kernel.org wrote:
>On Thu, 17 Aug 2023 18:40:00 +0000 Kubalewski, Arkadiusz wrote:
>> >Why are all attributes in a single attr space? :(
>> >More than half of them are prefixed with a pin- does it really
>> >not scream to you that they belong to a different space?
>> 
>> I agree, but there is an issue with this, currently:
>> 
>> name: pin-parent-device
>> subset-of: dpll
>> attributes:
>>   -
>>     name: id
>>     type: u32
>>   -
>>     name: pin-direction
>>     type: u32
>>   -
>>     name: pin-prio
>>     type: u32
>>   -
>>     name: pin-state
>>     type: u32
>> 
>> Where "id" is a part of device space, rest attrs would be a pin space..
>> Shall we have another argument for device id in a pin space?
>
>Why would pin and device not have separate spaces?
>
>When referring to a pin from a "device mostly" command you can
>usually wrap the pin attributes in a nest, and vice versa.
>But it may not be needed at all here? Let's look at the commands:
>
>+    -
>+      name: device-id-get
>+        request:
>+          attributes:
>+            - module-name
>+            - clock-id
>+            - type
>+        reply:
>+          attributes:
>+            - id
>
>All attributes are in "device" space, no mixing.
>
>+      name: device-get
>+        request:
>+          attributes:
>+            - id
>+        reply: &dev-attrs
>+          attributes:
>+            - id
>+            - module-name
>+            - mode
>+            - mode-supported
>+            - lock-status
>+            - temp
>+            - clock-id
>+            - type
>
>Again, no pin attributes, so pin can be separate?
>
>+    -
>+      name: device-set
>+        request:
>+          attributes:
>+            - id
>
>Herm, this one looks like it's missing attrs :S
>
>+    -
>+      name: pin-id-get
>+        request:
>+          attributes:
>+            - module-name
>+            - clock-id
>+            - pin-board-label
>+            - pin-panel-label
>+            - pin-package-label
>+            - pin-type
>+        reply:
>+          attributes:
>+            - pin-id
>
>Mostly pin stuff. I guess the module-name and clock-id attrs can be
>copy/pasted between device and pin, or put them in a separate set
>and add that set as an attr here. Copy paste is likely much simpler.

Agreed for the copy.

Honestly, I wound thing that shared ATTR space is fine for DPLL,
the split is an overkill here. But up to you Jakub :)


>
>+    -
>+      name: pin-get
>+        request:
>+          attributes:
>+            - pin-id
>+        reply: &pin-attrs
>+          attributes:
>+            - pin-id
>+            - pin-board-label
>+            - pin-panel-label
>+            - pin-package-label
>+            - pin-type
>+            - pin-frequency
>+            - pin-frequency-supported
>+            - pin-dpll-caps
>+            - pin-parent-device

The ID of device is inside this nest.


>+            - pin-parent-pin
>
>All pin.
>
>+    -
>+      name: pin-set
>+        request:
>+          attributes:
>+            - pin-id
>+            - pin-frequency
>+            - pin-direction
>+            - pin-prio
>+            - pin-state
>+            - pin-parent-device

Same here.


>+            - pin-parent-pin
>
>And all pin.
