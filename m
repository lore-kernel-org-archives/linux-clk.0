Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8EA5C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 07:03:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbiGKHC7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 03:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiGKHC5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 03:02:57 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2717C1A06D
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 00:02:56 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id D9CC6225C9;
        Mon, 11 Jul 2022 07:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1657522974; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nas+4WYvLdZm2xpQjkLc49qXucZAF+SzuoebcX3npfw=;
        b=XUkD6vVfnI2Oxep9v7gKhZZ/rhK58axzInGpOSHzL9iMnOevZhBqK/fc/Y9zTSIDjfOvAv
        57tqpZS3wF98+N4u7487KdzCAqm8Rwl4cuT5+Qoal7rL7Gx2e/sR8CvgU59mQIO4ytWpoo
        FU1W1IUgUarRHKZ2uVCX0pp+97rv+2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1657522974;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nas+4WYvLdZm2xpQjkLc49qXucZAF+SzuoebcX3npfw=;
        b=l2wazvTrNCzEfmjyuhkRrnn2w4TgiNjHo/oYQsSc1DuoSJ2K0pYXO2e2KhKRe386jt6wMs
        Pp7f+B/IPtLWl+BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC6ED13524;
        Mon, 11 Jul 2022 07:02:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id /Pm6MR7Ly2KOfgAAMHmgww
        (envelope-from <iivanov@suse.de>); Mon, 11 Jul 2022 07:02:54 +0000
MIME-Version: 1.0
Date:   Mon, 11 Jul 2022 10:02:54 +0300
From:   "Ivan T. Ivanov" <iivanov@suse.de>
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Guillaume Gardet <Guillaume.Gardet@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, nd <nd@arm.com>
Subject: Re: [PATCH v4 0/3] clk: bcm: rpi: Add support for three more clocks
In-Reply-To: <ce3e2e21-dc54-1f77-fdbb-6d3627917830@i2se.com>
References: <20220428065743.94967-1-iivanov@suse.de>
 <VI1PR08MB2847DA5DC2665EBA2756D7EB83C99@VI1PR08MB2847.eurprd08.prod.outlook.com>
 <20220510133019.h2urxj3feponfuku@houat>
 <ce3e2e21-dc54-1f77-fdbb-6d3627917830@i2se.com>
User-Agent: Roundcube Webmail
Message-ID: <b5c560cf5610fa8da1cfd7ef06ca6bac@suse.de>
X-Sender: iivanov@suse.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Hi,

On 2022-07-10 14:12, Stefan Wahren wrote:
> Hi,
> 
> Am 10.05.22 um 15:30 schrieb Maxime Ripard:
>> Hi,
>> 
>> On Tue, May 10, 2022 at 01:20:18PM +0000, Guillaume Gardet wrote:
>>> May I ask what's the status/plan of  this patch series?
>> As far as I know it hasn't been merged yet.
>> 
>>> It seems it has not been merged yet, and I know we are a bit late in
>>> the 5.18 schedule, but I think this is a good fix for 5.18.
>> Fix for what? I don't think this series fix any bug?
> 
> i think this series (or at least parts of it) is a workaround for this
> issue [1].

No, not really. Bug which this patch set fixes is this one [2].
When using downstream dtb and up to date bootloader index 15 is
valid id RPI_FIRMWARE_VEC_CLK_ID which is used by vc4 module.

> 
> We better fix the root cause of the potential out of bounds access in
> clk-raspberrypi properly. I will send a patch soon.

If not mistaken after last rework driver already handle this properly.
clk-raspberrypi.c:362

Regards,
Ivan

> 
> [1] - https://github.com/raspberrypi/firmware/issues/1688

[2] https://bugzilla.suse.com/show_bug.cgi?id=1196632

