Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214EDC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 09:03:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344066AbiELJDz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 05:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235555AbiELJDy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 05:03:54 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9324537AB5
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 02:03:53 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 2718C21C7F;
        Thu, 12 May 2022 09:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1652346232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=auevF0gkb/iOSAxsAtuFPx/dUacPMjXObJBDok2REpI=;
        b=Bz0QXqkm3AT4GduUhB0v9SdgX5rQzMK9anyRlAmMfL+LGYLMMSbpvojCeJIoIfzJhn6qX6
        UELYs33CtPRjzC2XphTUVXibCHf5oUqsMb03ltimKFmShdFdH4SbCQjMOrZRF+VlnytO3t
        1sYL3wI7oB4J1tsy2VNjs7aTx46P3vQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1652346232;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=auevF0gkb/iOSAxsAtuFPx/dUacPMjXObJBDok2REpI=;
        b=vV40Xl8iHQYkQX0fzdosiilrJH6TihjbzFZvE886sLyWI8CLuuaeOF1jd7wZjjVLaUfVTW
        u/6Q5I9x0bAtroAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A352413ABE;
        Thu, 12 May 2022 09:03:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 2IzkJXfNfGKNKQAAMHmgww
        (envelope-from <iianov@suse.de>); Thu, 12 May 2022 09:03:51 +0000
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH v4 0/3] clk: bcm: rpi: Add support for three more clocks
From:   Ivan Ivanov <iianov@suse.de>
In-Reply-To: <20220512085347.lu3cyeiitfsgaljn@houat>
Date:   Thu, 12 May 2022 12:03:50 +0300
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <80D9F737-AA89-4D05-A764-933437A6EA9B@suse.de>
References: <20220428065743.94967-1-iivanov@suse.de>
 <VI1PR08MB2847DA5DC2665EBA2756D7EB83C99@VI1PR08MB2847.eurprd08.prod.outlook.com>
 <20220510133019.h2urxj3feponfuku@houat>
 <6066bd9d-b53b-0a91-7440-98244c2d55c2@i2se.com>
 <20220512075737.mpipy7rmixwfwpyl@houat>
 <EA46E084-07A4-4BC9-B9FB-A64102F03867@suse.de>
 <20220512085347.lu3cyeiitfsgaljn@houat>
To:     Maxime Ripard <maxime@cerno.tech>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

> On 12 May 2022, at 11:53, Maxime Ripard <maxime@cerno.tech> wrote:
>=20
> On Thu, May 12, 2022 at 11:10:00AM +0300, Ivan Ivanov wrote:
>> Hi,
>>=20
>>> On 12 May 2022, at 10:57, Maxime Ripard <maxime@cerno.tech> wrote:
>>>=20
>>> On Wed, May 11, 2022 at 08:10:50AM +0200, Stefan Wahren wrote:
>>>> Am 10.05.22 um 15:30 schrieb Maxime Ripard:
>>>>> Hi,
>>>>>=20
>>>>> On Tue, May 10, 2022 at 01:20:18PM +0000, Guillaume Gardet wrote:
>>>>>> May I ask what's the status/plan of  this patch series?
>>>>> As far as I know it hasn't been merged yet.
>>>>>=20
>>>>>> It seems it has not been merged yet, and I know we are a bit late =
in
>>>>>> the 5.18 schedule, but I think this is a good fix for 5.18.
>>>>> Fix for what? I don't think this series fix any bug?
>>>>=20
>>>> This seems to be a "fix" for the Frankenstone scenario: mainline =
kernel +
>>>> vendor DT
>>>=20
>>> Did we ever support this?
>>>=20
>>> I don't think we did, so even though it can be nice to improve that
>>> situation, I don't think it's worth sending this to stable
>>=20
>> Yes, maybe not stable material, but considering support for devices
>> which are shipped with upstream Linux and vendor device tree blobs,
>> saved somewhere on them, should be pretty normal to expect, right?
>=20
> Not really?
>=20
> If the vendor in question uses a binding that has never been reviewed,
> accepted, and supported by upstream, then I don't see what upstream
> should be doing to accommodate for that situation?


Ok, let do not generalise this discussion too much :-)

I bringed above as example that some times device tree could not
be changed and it is provided by board supplier, not by Linux OS
supplier.

In this particular case vendor device tree blob is using standard=20
clock bindings. Just upstream Linux clock driver don=E2=80=99t have =
support
for some of the clocks. This is what these patches fix.

Regards,
Ivan=20


