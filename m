Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDC7EE4997
	for <linux-clk@archiver.kernel.org>; Fri, 18 Aug 2023 21:03:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236138AbjHRVDQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Aug 2023 17:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239374AbjHRVDJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Aug 2023 17:03:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BEC34215
        for <linux-clk@vger.kernel.org>; Fri, 18 Aug 2023 14:03:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 764CA64678
        for <linux-clk@vger.kernel.org>; Fri, 18 Aug 2023 21:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C68C433C8;
        Fri, 18 Aug 2023 21:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692392585;
        bh=HHxNOIqgqP6yYIqo8lV6m5wy51W8npjOcTEiKx/jJO0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UQ1G45rnUtbvnxhcsWbx94oyx/wuL9JR9EKknlg1Rfs7gLKRAS21Q1lpWqWQvVRC2
         iOmH4tn0t06UkvIGfIt+2qfahKr1Kz03lQErN6upF0ZVjlOvvnUINWvnIpjnCzbm3B
         RaAlSN+ps5J0EQHtpdCz20fhEHxYKPQesS9UOYpobQyA84U55WUl3u/Lm0bdY22FlQ
         oZYz1T7zmnqkYOAEPY2jRBxMOPmdMuLw74TamIhMLB+kdrQiUtI1bxD8a/znjgNI8E
         qJYqUziTnO9PQbKD3EoJqkvBNygwT85YbrzZzFfLp6OuVrrp6SK/x00Qcw0CUzCqnU
         LPis6trKOy8ew==
Date:   Fri, 18 Aug 2023 14:03:04 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc:     Jiri Pirko <jiri@resnulli.us>,
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
        "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>
Subject: Re: [PATCH net-next v4 0/9] Create common DPLL configuration API
Message-ID: <20230818140304.11f316c9@kernel.org>
In-Reply-To: <DM6PR11MB4657374BF0A9361647444D239B1BA@DM6PR11MB4657.namprd11.prod.outlook.com>
References: <20230811200340.577359-1-vadim.fedorenko@linux.dev>
        <20230814194528.00baec23@kernel.org>
        <43395307-9d11-7905-0eec-0a4c1b1fc62a@linux.dev>
        <ZNtm6v+UuDIex1+s@nanopsycho>
        <20230815100203.4e45fc7e@kernel.org>
        <DM6PR11MB4657374BF0A9361647444D239B1BA@DM6PR11MB4657.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 18 Aug 2023 10:15:34 +0000 Kubalewski, Arkadiusz wrote:
> HW agnostic tests were submitted by Michal as RFC for test framework
> with fake modules implemented here:
> https://lore.kernel.org/netdev/20230817152209.23868-1-michal.michalik@intel.com/#t
> We had an agreement on latest dpll-meeting that we will follow up with
> patches that would test dpll over fake modules, and we have started it.
> As there was no requests to add HW-aware tests yet, we are not ready for
> such submission yet. We could probably extended Michal's framework to
> make it possible test real HW, but Michal's patches were just submitted,
> we do expect some review/changes there, thus we could think of adding
> something simpler for now..
> 
> Is simple bash script wrapping around cli.py and talking to ice dpll
> while verifying the outputs, an acceptable solution?

Okay, it is what it is, let's leave tests as follow up.

I'll reply to Michal on the RFC thread/
