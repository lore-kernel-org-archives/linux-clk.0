Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44203C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 08:10:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238289AbiELIKF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 04:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbiELIKE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 04:10:04 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD11A6B086
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 01:10:03 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id E7FF31F91F;
        Thu, 12 May 2022 08:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1652343001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WipsG8yIF3QWnRmHCRIlzEnPn7m0KOEw6EN0C4dEFug=;
        b=STAwpWIpaYsLMBMuGXQhvZh5rZZ1Ec/gPpSqTm1GvJ3RXFz18eI9lMpyGYOrUzjw6+pKTp
        4JE+Yx9ygWmNCYCSREsqUm0l8QFm4Gn2QMB5p/KWTDKcInusJGArS5/MjmZ3GTORgjHqhV
        Pr+HzRbRLjy4wFGuqMLSsWBKbEIacqs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1652343001;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WipsG8yIF3QWnRmHCRIlzEnPn7m0KOEw6EN0C4dEFug=;
        b=kkU6FBexd4Z3t3ZSuBeuALithW+sT5ley28GT285C0DUeXyNRTAyD5ybTRImfn/UmVNknu
        g8ZQFzkk+M3O2ZAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 60CC013ABE;
        Thu, 12 May 2022 08:10:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id yfhDFdnAfGLrDgAAMHmgww
        (envelope-from <iianov@suse.de>); Thu, 12 May 2022 08:10:01 +0000
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH v4 0/3] clk: bcm: rpi: Add support for three more clocks
From:   Ivan Ivanov <iianov@suse.de>
In-Reply-To: <20220512075737.mpipy7rmixwfwpyl@houat>
Date:   Thu, 12 May 2022 11:10:00 +0300
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Guillaume Gardet <Guillaume.Gardet@arm.com>,
        "Ivan T. Ivanov" <iivanov@suse.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-rpi-kernel@lists.infradead.org" 
        <linux-rpi-kernel@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, nd <nd@arm.com>
Content-Transfer-Encoding: 7bit
Message-Id: <EA46E084-07A4-4BC9-B9FB-A64102F03867@suse.de>
References: <20220428065743.94967-1-iivanov@suse.de>
 <VI1PR08MB2847DA5DC2665EBA2756D7EB83C99@VI1PR08MB2847.eurprd08.prod.outlook.com>
 <20220510133019.h2urxj3feponfuku@houat>
 <6066bd9d-b53b-0a91-7440-98244c2d55c2@i2se.com>
 <20220512075737.mpipy7rmixwfwpyl@houat>
To:     Maxime Ripard <maxime@cerno.tech>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

> On 12 May 2022, at 10:57, Maxime Ripard <maxime@cerno.tech> wrote:
> 
> On Wed, May 11, 2022 at 08:10:50AM +0200, Stefan Wahren wrote:
>> Am 10.05.22 um 15:30 schrieb Maxime Ripard:
>>> Hi,
>>> 
>>> On Tue, May 10, 2022 at 01:20:18PM +0000, Guillaume Gardet wrote:
>>>> May I ask what's the status/plan of  this patch series?
>>> As far as I know it hasn't been merged yet.
>>> 
>>>> It seems it has not been merged yet, and I know we are a bit late in
>>>> the 5.18 schedule, but I think this is a good fix for 5.18.
>>> Fix for what? I don't think this series fix any bug?
>> 
>> This seems to be a "fix" for the Frankenstone scenario: mainline kernel +
>> vendor DT
> 
> Did we ever support this?
> 
> I don't think we did, so even though it can be nice to improve that
> situation, I don't think it's worth sending this to stable

Yes, maybe not stable material, but considering support for devices
which are shipped with upstream Linux and vendor device tree blobs,
saved somewhere on them, should be pretty normal to expect, right?

Regards,
Ivan


