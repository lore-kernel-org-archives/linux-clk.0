Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3BDEB64DD
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jul 2023 22:53:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbjGYWxQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jul 2023 18:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbjGYWxC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jul 2023 18:53:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 433AB4208
        for <linux-clk@vger.kernel.org>; Tue, 25 Jul 2023 15:51:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BE61F61826
        for <linux-clk@vger.kernel.org>; Tue, 25 Jul 2023 22:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75A7C433C7;
        Tue, 25 Jul 2023 22:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690325400;
        bh=yCYXB/co0y66KfJ5siP/ruQ0G4HPzFeuKJ1ydF2sdcg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nON4It2PJgV7wEINj51T8CkZ9jRF1X43G12KRSmLJ7POrAXcdM8vSHja5dY00Rm+q
         l6tkt6hmOFSMc4WolozDrpQapu5FYESr2JEJwyqhx1IeqMc+FKj43BdWnBMfCZdyZw
         2fwdwm2coM+xXbOCKr131y9fkJ8VT51zBS5OwSJvHsLXpuADOwUCa0KUeO9I9ezBKZ
         PbnSNQ6BpntKs/MJBRwVFGTgN0ybn+q7D3sYrEaM5PgqZ4LaHCBw1O2kz/WvJtaXy9
         w6sYnyrBXqKOHCL2gMmjdDx2aYbBrywJnpRPRkJAsYymRuuW2dFFL/gqpYXHeBxtiY
         bJOsnrtisaWQA==
Date:   Tue, 25 Jul 2023 15:49:58 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Jiri Pirko <jiri@resnulli.us>
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
Message-ID: <20230725154958.46b44456@kernel.org>
In-Reply-To: <ZLpzwMQrqp7mIMFF@nanopsycho>
References: <20230720091903.297066-1-vadim.fedorenko@linux.dev>
        <20230720091903.297066-10-vadim.fedorenko@linux.dev>
        <ZLk/9zwbBHgs+rlb@nanopsycho>
        <DM6PR11MB46572F438AADB5801E58227A9B3EA@DM6PR11MB4657.namprd11.prod.outlook.com>
        <ZLo0ujuLMF2NrMog@nanopsycho>
        <DM6PR11MB46576153E0E28BA4C283A30A9B3FA@DM6PR11MB4657.namprd11.prod.outlook.com>
        <ZLpzwMQrqp7mIMFF@nanopsycho>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 21 Jul 2023 14:02:08 +0200 Jiri Pirko wrote:
> So it is not a mode! Mode is either "automatic" or "manual". Then we
> have a state to indicate the state of the state machine (unlocked, locked,
> holdover, holdover-acq). So what you seek is a way for the user to
> expliticly set the state to "unlocked" and reset of the state machine.

+1 for mixing the state machine and config.
Maybe a compromise would be to rename the config mode?
Detached? Standalone?

> Please don't mix config and state. I think we untangled this in the past
> :/
> 
> Perhaps you just need an extra cmd like DPLL_CMD_DEVICE_STATE_RESET cmd
> to hit this button.
