Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C447C41513
	for <linux-clk@archiver.kernel.org>; Mon, 31 Jul 2023 12:08:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbjGaMIP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Jul 2023 08:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjGaMIN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2023 08:08:13 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B6BC1722
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 05:08:08 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b9c0391749so67468681fa.0
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 05:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1690805286; x=1691410086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f+FNabLCPagoiMZfcH6abH6GfhwY3UwM4ct9KVUS0DI=;
        b=jpaoni1Vhyj7nVBeKlDzQa+jBMD8ppPsMoBs/c/Qi3krQa7eOwdoin1I0tzyUwG6Pd
         84BbqhQ6RHQ3i+lrr0HDP6Nxs8oNRKIwGZ/09HASOTDyfnIu8fcXXR18+ex+ox3+sshu
         FJdC1XbIJCL7VjwYdAyEZlHi+jWHYWzUOLWjXqysOwMrbmPfmTY8fmoSgJFW5l36kUPY
         3j43TWrPvZ25+UM3bloq7peFyzsZlGTizivoooiD3SabxDG/YNiECiCKyNVrv/4VUUto
         ZQ/M+9fiG0Upp1yr5E0YXl4PMVjEjSYVKpL7LZjVsV3mDNZu+8AaeipZhx5pohPErppJ
         r8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805286; x=1691410086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+FNabLCPagoiMZfcH6abH6GfhwY3UwM4ct9KVUS0DI=;
        b=RjAjNjEn936dnaopKPrpMtCU/f97QVSEHm60VchCmBOxxhq0za/bqbDYWS711GBYLP
         cGw9VKEOkjw/ZCjaWPOKs63Jf+AA629ePSLrHuTm/kZ/9kEl7JSNUUv90BmTFpkOMI2k
         CsFW4UGb/XiYyWSF5+UXVGj7mZEUD6WwFQYhalIRX48MvVpUeLn3mChlteAn62Fh7yIu
         x2Dzy9IeSIHbWk71tT+E5REATIlcLK5I9+Ykw/u8VpyqZB724odB4QKZBAAePrpYgfAb
         FjmnsHRswxQvitvFw0TS5Z55OWL/R1a+9b8wBYnnwG32FSDgIiQjpXdujVYKSNWKBuxZ
         zRmg==
X-Gm-Message-State: ABy/qLbonDwc57unIjefitRF2Va1vXueU69tE2osWJIkfECPH0tJkT/j
        uLNaZMAtfXUaYLSmdu7vV8/DoA==
X-Google-Smtp-Source: APBJJlEus2CGrr2Q272FyfIIVE+Hs+kMt+44Yxs/jka8ImX2tluGcJSiyLjXJsvxV5HlwBSJvHtAYQ==
X-Received: by 2002:a2e:9e46:0:b0:2b6:d0fc:ee18 with SMTP id g6-20020a2e9e46000000b002b6d0fcee18mr6254947ljk.19.1690805285743;
        Mon, 31 Jul 2023 05:08:05 -0700 (PDT)
Received: from localhost ([212.23.236.67])
        by smtp.gmail.com with ESMTPSA id u7-20020a170906408700b0098de7d28c34sm6052607ejj.193.2023.07.31.05.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 05:08:04 -0700 (PDT)
Date:   Mon, 31 Jul 2023 14:08:03 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Paolo Abeni <pabeni@redhat.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH 09/11] ice: implement dpll interface to control cgu
Message-ID: <ZMekIw3KPvGTLXCm@nanopsycho>
References: <20230720091903.297066-1-vadim.fedorenko@linux.dev>
 <20230720091903.297066-10-vadim.fedorenko@linux.dev>
 <ZLk/9zwbBHgs+rlb@nanopsycho>
 <DM6PR11MB46572F438AADB5801E58227A9B3EA@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZLo0ujuLMF2NrMog@nanopsycho>
 <DM6PR11MB46576153E0E28BA4C283A30A9B3FA@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZLpzwMQrqp7mIMFF@nanopsycho>
 <20230725154958.46b44456@kernel.org>
 <a3870a365d6f43491c8c82953d613c2e69311457.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3870a365d6f43491c8c82953d613c2e69311457.camel@redhat.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Wed, Jul 26, 2023 at 05:20:12PM CEST, pabeni@redhat.com wrote:
>On Tue, 2023-07-25 at 15:49 -0700, Jakub Kicinski wrote:
>> On Fri, 21 Jul 2023 14:02:08 +0200 Jiri Pirko wrote:
>> > So it is not a mode! Mode is either "automatic" or "manual". Then we
>> > have a state to indicate the state of the state machine (unlocked, locked,
>> > holdover, holdover-acq). So what you seek is a way for the user to
>> > expliticly set the state to "unlocked" and reset of the state machine.
>> 
>> +1 for mixing the state machine and config.
>> Maybe a compromise would be to rename the config mode?
>> Detached? Standalone?
>
>For the records, I don't know the H/W details to any extents, but
>generally speaking it sounds reasonable to me that a mode change could
>cause a state change.

The thing is, you don't need an extra mode just to "reset state". There
could be a command for it, staying under the same mode. That way, things
would be cleaner and obvious for the user.
case a)
AUTOMATIC MODE
user changes to FREERUN to reset state
user changes back to AUTOMATIC to continue

case b)
AUTOMATIC MODE
user submits state reset command


>
>e.g. switching an ethernet device autoneg mode could cause the link
>state to flip.
>
>So I'm ok with the existence of the freerun mode.
>
>I think it should be clarified what happens if pins are manually
>enabled in such mode. I expect ~nothing will change, but stating it

That is another very good point you touched. In the "freerun"
mode, the pins does not have any meaning.
The same you achieve with automatic mode, setting all pins to
disconnect.

If we have freerun mode, the core should sanitize all pins are
disconnect and stay disconnect. But do you see how ridiculous this is
becoming? :)


>clearly would help.
>
>Cheers,
>
>Paolo
>
