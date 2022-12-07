Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2784C3A5A7
	for <linux-clk@archiver.kernel.org>; Wed,  7 Dec 2022 02:33:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbiLGCdS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Dec 2022 21:33:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiLGCdR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2022 21:33:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE4EA3C6FD;
        Tue,  6 Dec 2022 18:33:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 86E7DB81BEE;
        Wed,  7 Dec 2022 02:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD980C433D6;
        Wed,  7 Dec 2022 02:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670380394;
        bh=uau8K4Bi989Gk/f36wEfZYxbGAyT5HJO4AKtGNiCC9c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=trP45bn61KSi/RVwH9HOyQY4Wz/UfZKELUj3Kh00u1+iHR94MxndXVGBscHiF6PkX
         wi4bbLKa25j6SuRbmE2ZMvxM0jubQMGiuNAJqqrmutp2ytXsKYVej4OAUxrxAUqCA3
         Ds/IiIX0f+GeigueQ5oOHXxfiUgrE8EOeoKsj2TdHmRlhYJUqZRs/xUL+cOuYbA+kr
         9QyBe1TJrc7YzY+kF8PPEwlnq5X3x7beo1410Vg4A56VrtvN1d/h1e3cYwFp65XGxx
         LK/RZMDJrcIHGqg9tFxWlKVYHpicexSGM+zZK536y4BOGo1m8RnO/4FeQ3ipID/aSl
         +plXP7ybcd7XA==
Date:   Tue, 6 Dec 2022 18:33:13 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc:     Jiri Pirko <jiri@resnulli.us>,
        Vadim Fedorenko <vfedorenko@novek.ru>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Vadim Fedorenko <vadfed@fb.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [RFC PATCH v4 4/4] ptp_ocp: implement DPLL ops
Message-ID: <20221206183313.713656f8@kernel.org>
In-Reply-To: <DM6PR11MB465721310114ECA13F556E8A9B179@DM6PR11MB4657.namprd11.prod.outlook.com>
References: <20221129213724.10119-1-vfedorenko@novek.ru>
        <20221129213724.10119-5-vfedorenko@novek.ru>
        <Y4dPaHx1kT3A80n/@nanopsycho>
        <DM6PR11MB4657D9753412AD9DEE7FAB7D9B179@DM6PR11MB4657.namprd11.prod.outlook.com>
        <Y4n0H9BbzaX5pCpQ@nanopsycho>
        <DM6PR11MB465721310114ECA13F556E8A9B179@DM6PR11MB4657.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 2 Dec 2022 14:39:17 +0000 Kubalewski, Arkadiusz wrote:
> >>>Btw, did you consider having dpll instance here as and auxdev? It
> >>>would be suitable I believe. It is quite simple to do it. See
> >>>following patch as an example:  
> >>
> >>I haven't think about it, definetly gonna take a look to see if there
> >>any benefits in ice.  
> >
> >Please do. The proper separation and bus/device modelling is at least one
> >of the benefits. The other one is that all dpll drivers would happily live
> >in drivers/dpll/ side by side.
> 
> Well, makes sense, but still need to take a closer look on that.
> I could do that on ice-driver part, don't feel strong enough yet to introduce
> Changes here in ptp_ocp.

FWIW auxdev makes absolutely no sense to me for DPLL :/
So Jiri, please say why.

