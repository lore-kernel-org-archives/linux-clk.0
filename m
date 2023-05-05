Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8AFC77B7C
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 15:30:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbjEEPaF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 11:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232949AbjEEP3s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 11:29:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1AF11887F
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 08:29:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5F67F63EDE
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 15:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35910C433D2;
        Fri,  5 May 2023 15:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683300576;
        bh=2TPWOPhFJzdwwpBDvHtt4BWhGjepWrVrYx1gskl609o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=uc7K/I/VdaX8SNqB1hYfppXeHReiEZmx2kkprPXG2aCStH0FkYn1q0vurH4PwTn+D
         XsIWamEMOdWk9ImVuAZLoa5jVco57mz22p0u+f0+enaF2QHKOZ/+Cy/ye5LfeJTRQ4
         65K4n7tfX2kU3YH0g2M6g7zXZTOVuc/pa8I3OiJzyZZmh4QwDpxwvYpdRgmTFVexaG
         DL6V1cRT56eDGidyGVv70rWDoe8T4irCWAJRe8l5nxSubJP0I9pefMYK/hMGg2WmK0
         ycWf/nmSB5mJ/WOxow0F5b8bN3+h8raqWdPoBKtTarnKcTWZRyLqrm25tzMCIIGwgj
         ghy6a54FyoJyw==
Date:   Fri, 5 May 2023 08:29:35 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc:     Vadim Fedorenko <vadfed@meta.com>, Jiri Pirko <jiri@resnulli.us>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [RFC PATCH v7 3/8] dpll: documentation on DPLL subsystem
 interface
Message-ID: <20230505082935.24deca78@kernel.org>
In-Reply-To: <7be22f4a-3fd5-f579-6824-56b4feafdb03@linux.dev>
References: <20230428002009.2948020-1-vadfed@meta.com>
        <20230428002009.2948020-4-vadfed@meta.com>
        <20230504120431.036cb8ba@kernel.org>
        <7be22f4a-3fd5-f579-6824-56b4feafdb03@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 5 May 2023 14:16:53 +0100 Vadim Fedorenko wrote:
> >> +Then there are two groups of configuration knobs:
> >> +1) Set on a pin - the configuration affects all dpll devices pin is
> >> +   registered to. (i.e. ``PIN_FREQUENCY``, ``PIN_DIRECTION``),  
> > 
> > Why is direction set on a pin? We can't chain DPLLs?  
> 
> We can chain DPLLs using pins only. We don't have any interface to
> configure 2 pins to connect 2 different DPLLs to each other at the same 
> time. The configuration should take care of one pin being input and
> other one being output. That's why we have direction property attached
> to the pin, not the DPLL itself.

Makes sense.

> >> +Device driver implementation
> >> +============================
> >> +
> >> +Device is allocated by ``dpll_device_get`` call. Second call with the
> >> +same arguments doesn't create new object but provides pointer to
> >> +previously created device for given arguments, it also increase refcount
> >> +of that object.
> >> +Device is deallocated by ``dpll_device_put`` call, which first decreases
> >> +the refcount, once refcount is cleared the object is destroyed.  
> > 
> > You can add () after the function name and render the kdoc at the end
> > of this doc. The `` marking will then be unnecessary.
> >   
> Mmm... any examples of such a way of creating documentation? I was
> following tls*.rst style, but without copying code-blocks.

net_dim.rst, maybe?  driver.rst ? Feel free to ping me 1:1 if you're
struggling, it should be fairly straightforward.
