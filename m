Return-Path: <SRS0=Sfi7=UJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6AAC468C1
	for <linux-clk@archiver.kernel.org>; Mon, 10 Jun 2019 12:13:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 893E22085A
	for <linux-clk@archiver.kernel.org>; Mon, 10 Jun 2019 12:13:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="K01tIZmp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389446AbfFJMNp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Jun 2019 08:13:45 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:52404 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389229AbfFJMNo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Jun 2019 08:13:44 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5ACDagN037456;
        Mon, 10 Jun 2019 07:13:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560168816;
        bh=osAjUsWcdirwDiL6VFKp3uYcXBRHoQkePLbEhd8oePw=;
        h=To:CC:From:Subject:Date;
        b=K01tIZmpwlWUkHBndyup+SmEHWCoMTdxIZAy59z+agy8sOVLaV8Iy0rprwggndBW9
         OAD18cgsya4KcXf0HVW69ne+E7GF0QytR0xADcegLgtJXTptZjiHrcO6M4TUyRM+9r
         V+wutYy9RjBKWMUZUeiDBedmNrQybtYfXM9mfywA=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5ACDaOI082558
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Jun 2019 07:13:36 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 07:13:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 07:13:36 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5ACDY0v129308;
        Mon, 10 Jun 2019 07:13:35 -0500
To:     linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
From:   Tero Kristo <t-kristo@ti.com>
Subject: [GIT PULL] clk: keystone: changes for 5.3
Message-ID: <3bd8aa21-60a5-f36a-b86f-425ce4f0163e@ti.com>
Date:   Mon, 10 Jun 2019 15:13:29 +0300
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

Here's a pull request for the clock changes for keystone SoC for 5.3. 
The patches were acked by Santosh, so I took liberty to create a 
pull-request for these also. I snipped patch #5 out of the series (it is 
against drivers/firmware) and am planning to send a separate 
pull-request for this, or alternatively agree with Santosh how to handle it.

-Tero

---

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kristo/linux 
tags/keystone-clk-for-5.3

for you to fetch changes up to 3f1f22d8009035a641a359a09239bcc6ffac7bb9:

   clk: keystone: sci-clk: extend clock IDs to 32 bits (2019-06-07 
12:11:41 +0300)

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

----------------------------------------------------------------
Tero Kristo (4):
       clk: keystone: sci-clk: cut down the clock name length
       clk: keystone: sci-clk: split out the fw clock parsing to own 
function
       clk: keystone: sci-clk: probe clocks from DT instead of firmware
       clk: keystone: sci-clk: extend clock IDs to 32 bits

  drivers/clk/keystone/Kconfig   |  11 ++
  drivers/clk/keystone/sci-clk.c | 239 
++++++++++++++++++++++++++++++++++-------
  2 files changed, 212 insertions(+), 38 deletions(-)
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
