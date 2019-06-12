Return-Path: <SRS0=Rxbn=UL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0098C31E46
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jun 2019 11:56:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C8AA20896
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jun 2019 11:56:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rbTp5I2L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390864AbfFLL4Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Jun 2019 07:56:24 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:56620 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387878AbfFLL4Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Jun 2019 07:56:24 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5CBuJgk018223;
        Wed, 12 Jun 2019 06:56:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560340579;
        bh=8UHFs7k6sfh7C8n9f+bbb2RVJXSDiiSPoC5uEcos7Yk=;
        h=To:CC:From:Subject:Date;
        b=rbTp5I2LxEXPbmL5p/xR2KFkpLMHaQsrB1Fuw42DZf8qTV2jeZygCkN8Q0ZTYqvrT
         YUS63y0oykoK7EeSVnl+LxbNhcL7iee/S/R4vsKCnYnGzKpyqKbQRMlqJjBF0wOYFh
         q4vRBOuzTswIMZ5dxo6ufNG2lX03Wd7sCZzbjxGk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5CBuJ5N001201
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 12 Jun 2019 06:56:19 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 12
 Jun 2019 06:56:18 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 12 Jun 2019 06:56:18 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5CBuG5W012747;
        Wed, 12 Jun 2019 06:56:17 -0500
To:     linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
From:   Tero Kristo <t-kristo@ti.com>
Subject: [GIT PULL] clk: keystone: changes for 5.3 v2
Message-ID: <1deb7a85-0859-54f1-950a-33de3a08f9fd@ti.com>
Date:   Wed, 12 Jun 2019 14:56:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen, Mike, Santosh,

Here's a 2nd take of the pull request for the clock changes for keystone 
SoC for 5.3. The only change compared to the v1 is to add the required 
drivers/firmware change in. This avoids the nasty dependency between the 
pull requests between the clock driver and firmware driver.

-Tero

---

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kristo/linux 
tags/keystone-clk-for-5.3-v2

for you to fetch changes up to 81f4458c9c6998fcd37c427d16d76d4dba65d015:

   firmware: ti_sci: extend clock identifiers from u8 to u32 (2019-06-12 
14:45:00 +0300)

----------------------------------------------------------------
Keystone clk changes for 5.3 merge window.

- Add support for 32 bit clock IDs for sci-clks, this is needed
   for the new J721e SoC which has a few devices that have more than
   255 clocks associated to them.
- Clock probing done from DT by default instead of firmware side.
   Scanning clocks from DT is much faster than firmware, and also we
   can omit unnecessary clocks which saves even more time. This has been
   done in the interest of saving boot time.
- Remove the device tree node path from the registered sci-clk names.
   This mainly makes the debugfs interface more readable.
- Also contains a single drivers/firmware change which needs to go in
   via this pull-request; to support the 32bit clock IDs.

----------------------------------------------------------------
Tero Kristo (5):
       clk: keystone: sci-clk: cut down the clock name length
       clk: keystone: sci-clk: split out the fw clock parsing to own 
function
       clk: keystone: sci-clk: probe clocks from DT instead of firmware
       clk: keystone: sci-clk: extend clock IDs to 32 bits
       firmware: ti_sci: extend clock identifiers from u8 to u32

  drivers/clk/keystone/Kconfig           |  11 ++
  drivers/clk/keystone/sci-clk.c         | 239 
+++++++++++++++++++++++++++------
  drivers/firmware/ti_sci.c              | 115 +++++++++++-----
  drivers/firmware/ti_sci.h              |  63 +++++++--
  include/linux/soc/ti/ti_sci_protocol.h |  28 ++--
  5 files changed, 362 insertions(+), 94 deletions(-)
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
