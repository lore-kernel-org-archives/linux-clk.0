Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972A9C001DC
	for <linux-clk@archiver.kernel.org>; Mon, 31 Jul 2023 12:12:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232007AbjGaMMR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Jul 2023 08:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232081AbjGaMMP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2023 08:12:15 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBDDB1716
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 05:12:00 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-986d8332f50so647679666b.0
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 05:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1690805519; x=1691410319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TCRpBBOXRt66nrHvcNiyBDUNvZ5LmzoF9YZ7grd0BQo=;
        b=EKsGsVeQ4drni87wkK8WbdLTSFlZI5vKda+Fp0sWnA3hz8gEvUviS8orRfSK2kKXlO
         3fg82tZgHcc1TuYTwldP1twEMISraccVpYdeod+ZyZaG0RxDs9Ca5BARtoFQRx8OGPyJ
         3C/YryosOpC8ctLScPYSswQ+PMbpvIYWMKZ8VD6yN6kk2mrHEJ56HDBtof9n0lF/2d4u
         KF5BIkzUllM2Kg0UT9YD5Fz5B1QRsoybR1fJxwfpVj/P5/kdnmyG5JVu2RlgqejRavvT
         1TMeSuAimYr37f/IwHT2evjlRGfCHtziJcIUKS/cvbu1T2EN57RE6rdyNv4hLtlaXf5I
         wepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805519; x=1691410319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCRpBBOXRt66nrHvcNiyBDUNvZ5LmzoF9YZ7grd0BQo=;
        b=gpdZpuR/hwtw3K3lX2/phJh3AmiykyPwRpBfgYv0tEWDLwrSDsVQWnmjRRlTsJCr0N
         MpPgAsYpyQzO2opo0ucqgVfR0ejVXhzx9jHYl3bHPm7IwJLx+hPsj7sqlIsW4d0ydyWp
         pVXlWM1veKC4kmkIZg5Ysm/T+dxiwBcVLfrTqCBWYPoUcMADpn0VraocqT0HrNzYOVfL
         fxNA5gwulqOBkC17vdzL6AFEUgFAzBg44B96ywBURC38akrqPrELlPPqYRrobzXW2MxI
         IqwYt1ck3MoIJO6gSIutAMOZhfoyqCp6kyw63p9vMQwHomOrDJRxaO6KDHr6Z5R/aim+
         +d+A==
X-Gm-Message-State: ABy/qLZ+iju2HLwGaR5MZW2kwhYYzcq0pxG1fIAaem6M9dcJBVFKH5Pu
        hFSS06JGT3r5gYuvtn7mNcIkSg==
X-Google-Smtp-Source: APBJJlHRuhSxixgmaPI/GHZ9fICq6Co32qefCCbwO83NICKAhcGDLv+Uf8kwnvDPgbPs0xqSLHESYA==
X-Received: by 2002:a17:907:2bf4:b0:994:569b:61b8 with SMTP id gv52-20020a1709072bf400b00994569b61b8mr6020219ejc.58.1690805518997;
        Mon, 31 Jul 2023 05:11:58 -0700 (PDT)
Received: from localhost ([212.23.236.67])
        by smtp.gmail.com with ESMTPSA id z7-20020a170906074700b0099293cdbc98sm6148952ejb.145.2023.07.31.05.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 05:11:58 -0700 (PDT)
Date:   Mon, 31 Jul 2023 14:11:57 +0200
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
        Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH 09/11] ice: implement dpll interface to control cgu
Message-ID: <ZMelDWrImeIFv+jh@nanopsycho>
References: <20230720091903.297066-1-vadim.fedorenko@linux.dev>
 <20230720091903.297066-10-vadim.fedorenko@linux.dev>
 <ZLk/9zwbBHgs+rlb@nanopsycho>
 <DM6PR11MB46572F438AADB5801E58227A9B3EA@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZLo0ujuLMF2NrMog@nanopsycho>
 <DM6PR11MB46576153E0E28BA4C283A30A9B3FA@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZLpzwMQrqp7mIMFF@nanopsycho>
 <20230725154958.46b44456@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725154958.46b44456@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Wed, Jul 26, 2023 at 12:49:58AM CEST, kuba@kernel.org wrote:
>On Fri, 21 Jul 2023 14:02:08 +0200 Jiri Pirko wrote:
>> So it is not a mode! Mode is either "automatic" or "manual". Then we
>> have a state to indicate the state of the state machine (unlocked, locked,
>> holdover, holdover-acq). So what you seek is a way for the user to
>> expliticly set the state to "unlocked" and reset of the state machine.
>
>+1 for mixing the state machine and config.
>Maybe a compromise would be to rename the config mode?
>Detached? Standalone?

But even with different name, you will still have the same mixture.

Why having automatic/manual mode with possibility to connect/disconnect
pins with additional uapi extension to submit state reset command is
not enough? Clear and simple, easy to document and understand.

There are too many uncertanties about "freerun" mode, very confusing,
not clear behaviour (as this thread demonstrated). That is extually very
good reason to don't have it. Could we please drop it?


>
>> Please don't mix config and state. I think we untangled this in the past
>> :/
>> 
>> Perhaps you just need an extra cmd like DPLL_CMD_DEVICE_STATE_RESET cmd
>> to hit this button.
