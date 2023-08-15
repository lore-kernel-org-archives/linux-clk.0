Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC5EC04A6A
	for <linux-clk@archiver.kernel.org>; Tue, 15 Aug 2023 18:29:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235853AbjHOS3Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Aug 2023 14:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239130AbjHOS3A (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Aug 2023 14:29:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30050DF
        for <linux-clk@vger.kernel.org>; Tue, 15 Aug 2023 11:28:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7F48A63FDD
        for <linux-clk@vger.kernel.org>; Tue, 15 Aug 2023 18:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F4BC433C8;
        Tue, 15 Aug 2023 18:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692124137;
        bh=/qruM4K34GEGf+StPBYxRoP0CWoc0pHOT9PCxjD218c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OkWhtJDu7Is84Ym19H+u7zVakV0q6ehat1w8njTrbVRyuNIBSGUKya1FsZKQ2/3eW
         DCMU89Q5QfAXBmYOgL9v3lr5TIwMqLnG2VP6pt8CK1cbEp5uSEHRqclEBczftWsLyi
         /BsBBVdWN1g7Evw3haiLSPPXDRuBAlBcpnw8bM+kQFpQwpkQ/SV+zy1cQGHpG6sOqb
         4x7vKW0Q5ks7AriJBw3TXWEnENJyMLsXNM7EJHp6uBee46HUdEmkOqS3ak1P2TaxAl
         KAOeuT3+D2I6zWH5b8nCogW6hTDDU1SzzSEIyGkV3wJ+pmFrPiSFqCT0Udm15rDwGj
         XYnTmjxADj/XA==
Date:   Tue, 15 Aug 2023 11:28:56 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc:     Jiri Pirko <jiri@resnulli.us>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
        intel-wired-lan@lists.osuosl.org, Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH net-next v4 3/9] dpll: core: Add DPLL framework base
 functions
Message-ID: <20230815112856.1f1bd3ac@kernel.org>
In-Reply-To: <ef2eca98-4fcc-b448-fecb-38695238f87b@linux.dev>
References: <20230811200340.577359-1-vadim.fedorenko@linux.dev>
        <20230811200340.577359-4-vadim.fedorenko@linux.dev>
        <20230814201709.655a24e2@kernel.org>
        <ef2eca98-4fcc-b448-fecb-38695238f87b@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 15 Aug 2023 19:20:31 +0100 Vadim Fedorenko wrote:
> >> +	ret = xa_alloc(&dpll_device_xa, &dpll->id, dpll, xa_limit_16b,
> >> +		       GFP_KERNEL);  
> > 
> > Why only 16b and why not _cyclic?
> 
> I cannot image systems with more than 65k of DPLL devices. We don't
> store any id's of last used DPLL device, so there is no easy way to
> restart the search from the last point. And it's not a hot path to
> optimize it.

I think this gets used under the xa_lock() so you can just add a static
variable inside the function to remember previous allocation.

I don't expect >64k devices either, obviously, but what are we saving
by not allowing the full u32 range?
