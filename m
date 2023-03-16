Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBBAC6FD19
	for <linux-clk@archiver.kernel.org>; Thu, 16 Mar 2023 12:31:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbjCPMbv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Mar 2023 08:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjCPMbu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Mar 2023 08:31:50 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DBFCC88B6
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 05:31:48 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id r18so1393441wrx.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 05:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112; t=1678969907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EBgLiap3z0eOs9IEVV1ogrSUVwRj9wQ1k01+u0gMWts=;
        b=FgR5guvHvPt4kprXYHnCrdMuuGY87sl592+oE7AbdXaOSaBhccVRR6LSIafFSvDjDN
         8mx8u7y8ohjXaY3r3PowRqodGoXPB+mmdeco3rDch3ZB9lABVAqKAhi6rxrbrlaTrLGi
         dGilRPr05l0o/L1nMmHRrEs3CK5eOErA95PKShDFJyozqR+4LzE4v1JpwRPJfmyFLJSw
         LuiX1ekhHh6b7dnGF3TIOAyNJpkMcR4F6GGi+Pfuko8GF1aw3nFwo6ooxVbrb1pFYxGi
         WCKPCvqe3HlKzCEv1N1L39hlx6qS97tsJy9lD0tGTX1M5fws/jpD9SDvdcOc05gb7F20
         Cuew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678969907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBgLiap3z0eOs9IEVV1ogrSUVwRj9wQ1k01+u0gMWts=;
        b=f7urREMIxWtFsbJ49E40d0oIG3PddOTBpxhAqiFGzQKQGVD0YvRFkbdXLaoyACVLuC
         wV//E85KIlZlnQeaeXClyuPGljfUfgqp4zl1iAwAXFK11hn2yGOGy19ds+msSY2jwtfW
         AlaXDNDCeOB8y+ZKUJW9r+Tcc0L/rni5ugOyAnM+0dIq8ZG87rwGpwCVclC/q0zDTlyx
         HU7axhMGPdWHzkPNVL4vtMspaAlsyCTN379M5z/+69AAyIXdHE4LCmZ6+Mr3ta64KpLW
         +I1bUCr7UnUGhppF/fD05ADax67RBHe6QvJ8OnaNbVcepMUQeDEUI7ziiyU1JVhzBybp
         nDiw==
X-Gm-Message-State: AO0yUKUgepvo02HYzUil1U59+wjpe5WRFlvzSiiK2/BDoixNSIb7Lj62
        MPh5rTJj/m1HWvwAdtukh/L0PA==
X-Google-Smtp-Source: AK7set8nrHPE+yCjyiqyl0cay4i3vqG4IwBn3w4wy8QX9KqZAxyW3zqrdr6NHGXNGcwea6nJ5f6j3g==
X-Received: by 2002:a5d:428c:0:b0:2cf:e957:644b with SMTP id k12-20020a5d428c000000b002cfe957644bmr4753522wrq.27.1678969906981;
        Thu, 16 Mar 2023 05:31:46 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id u1-20020adfed41000000b002c6e8cb612fsm7148717wro.92.2023.03.16.05.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 05:31:46 -0700 (PDT)
Date:   Thu, 16 Mar 2023 13:31:45 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc:     Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        Vadim Fedorenko <vadfed@meta.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>
Subject: Re: [PATCH RFC v6 2/6] dpll: Add DPLL framework base functions
Message-ID: <ZBMMMd+PifhKGj+t@nanopsycho>
References: <20230312022807.278528-1-vadfed@meta.com>
 <20230312022807.278528-3-vadfed@meta.com>
 <ZA9Nbll8+xHt4ygd@nanopsycho>
 <2b749045-021e-d6c8-b265-972cfa892802@linux.dev>
 <ZBA8ofFfKigqZ6M7@nanopsycho>
 <DM6PR11MB4657120805D656A745EF724E9BBE9@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZBGOWQW+1JFzNsTY@nanopsycho>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBGOWQW+1JFzNsTY@nanopsycho>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Wed, Mar 15, 2023 at 10:22:33AM CET, jiri@resnulli.us wrote:
>Tue, Mar 14, 2023 at 06:50:57PM CET, arkadiusz.kubalewski@intel.com wrote:
>>>From: Jiri Pirko <jiri@resnulli.us>
>>>Sent: Tuesday, March 14, 2023 10:22 AM
>>>
>>>Mon, Mar 13, 2023 at 11:59:32PM CET, vadim.fedorenko@linux.dev wrote:
>>>>On 13.03.2023 16:21, Jiri Pirko wrote:
>>>>> Sun, Mar 12, 2023 at 03:28:03AM CET, vadfed@meta.com wrote:

[...]


>>>>> > +	     const struct dpll_pin_properties *prop)
>>>>> > +{
>>>>> > +	struct dpll_pin *pos, *ret = NULL;
>>>>> > +	unsigned long index;
>>>>> > +
>>>>> > +	mutex_lock(&dpll_pin_xa_lock);
>>>>> > +	xa_for_each(&dpll_pin_xa, index, pos) {
>>>>> > +		if (pos->clock_id == clock_id &&
>>>>> > +		    pos->dev_driver_id == device_drv_id &&
>>>>> > +		    pos->module == module) {
>>>>>
>>>>> Compare prop as well.
>>>>>
>>>>> Can't the driver_id (pin index) be something const as well? I think it
>>>>> should. And therefore it could be easily put inside.
>>>>>
>>>>
>>>>I think clock_id + dev_driver_id + module should identify the pin exactly.
>>>>And now I think that *prop is not needed here at all. Arkadiusz, any
>>>>thoughts?
>>>
>>>IDK, no strong opinion on this. I just thought it may help to identify
>>>the pin and avoid potential driver bugs. (Like registering 2 pins with

Was thinking about this some more, I think that it would be good to
store and check properties in case of pin_get() call. If the driver does
call for the second time pin_get() for the same pin (clockid,pin_index)
with different prop, it is buggy and WARN_ON should be triggered.
WARN_ON check should compare the actual struct, not just pointer.

[...]
