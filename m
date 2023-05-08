Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF60C7EE22
	for <linux-clk@archiver.kernel.org>; Mon,  8 May 2023 19:42:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232876AbjEHTmy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 May 2023 15:42:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbjEHTmx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 May 2023 15:42:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C37E359EB
        for <linux-clk@vger.kernel.org>; Mon,  8 May 2023 12:42:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2255D621A5
        for <linux-clk@vger.kernel.org>; Mon,  8 May 2023 19:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158CCC433EF;
        Mon,  8 May 2023 19:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683574971;
        bh=SY73x8IhrnJA5Nj+GnLr47A2+BFgrw3F4GvL/0/ZJ2g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=o2AcLV9JL/78yhEOpa3QYZP/jviYPFFoj9JYYWEg/m+uHfZSWp8GTFMsg1F/6PXsr
         k+ysw3VT98stdpgoYdFjGRpQ+9b5WHAbirbZTq1KoeXFwqzy0lFj9pqam+UuzwVguz
         8zV4USoYMaKE7nwZzjqdMScx4W5DJXfY9n7YUZIEuwXlx1Z6KmvCN4TvUssJluyyox
         NWQCpSP2TdKyr+VF0lJsrNKTZ1y7l/DzZImiqESmzeXDcRlSzhcjkbHuwBKJAlcuOd
         OXqiyC1dJEFRzzbR89lDjkJO4PCgEprD2lZGLdEviZce6o4YjOvNkaBhU37rx6k3QM
         pZ1rE1zq0n/Yw==
Date:   Mon, 8 May 2023 12:42:50 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Jiri Pirko <jiri@resnulli.us>
Cc:     Paolo Abeni <pabeni@redhat.com>,
        "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        Vadim Fedorenko <vadfed@meta.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        poros <poros@redhat.com>, mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>
Subject: Re: [PATCH RFC v6 2/6] dpll: Add DPLL framework base functions
Message-ID: <20230508124250.20fb1825@kernel.org>
In-Reply-To: <ZFjoWn9+H932DdZ1@nanopsycho>
References: <ZFITyWvVcqgRtN+Q@nanopsycho>
        <20230503191643.12a6e559@kernel.org>
        <ZFOQWmkBUtgVR06R@nanopsycho>
        <20230504090401.597a7a61@kernel.org>
        <ZFPwqu5W8NE6Luvk@nanopsycho>
        <20230504114421.51415018@kernel.org>
        <ZFTdR93aDa6FvY4w@nanopsycho>
        <20230505083531.57966958@kernel.org>
        <ZFdaDmPAKJHDoFvV@nanopsycho>
        <d86ff1331a621bf3048123c24c22f49e9ecf0044.camel@redhat.com>
        <ZFjoWn9+H932DdZ1@nanopsycho>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 8 May 2023 14:17:30 +0200 Jiri Pirko wrote:
> >> Hmm, that would kind of embed the pin type into attr which feels wrong.  

An attribute which changes meaning based on a value of another attribute
feels even more wrong.

> >Looking at the above from a different angle, the
> >DPLL_A_PIN_FRONT_PANEL_LABEL attribute will be available only for
> >DPLL_PIN_TYPE_EXT type pins, which looks legit to me - possibly
> >renaming DPLL_A_PIN_FRONT_PANEL_LABEL as DPLL_A_PIN_EXT_LABEL.  

Yup. Even renaming EXT to something that's less.. relative :(

> Well sure, in case there is no "label" attr for the rest of the types.
> Which I believe it is, for the ice implementation in this patchset.
> Otherwise, there is no way to distinguish between the pins.
> To have multiple attrs for label for multiple pin types does not make
> any sense to me, that was my point.

Come on, am I really this bad at explaining this?

If we make a generic "label" attribute driver authors will pack
everything they want to expose to the user into it, and then some.

So we need attributes which will feel *obviously* *wrong* to abuse.
