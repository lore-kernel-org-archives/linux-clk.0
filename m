Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69BB8ECAAA3
	for <linux-clk@archiver.kernel.org>; Fri, 26 Aug 2022 08:51:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236536AbiHZIvK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Aug 2022 04:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbiHZIvJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Aug 2022 04:51:09 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE146F57D
        for <linux-clk@vger.kernel.org>; Fri, 26 Aug 2022 01:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1661503864; x=1693039864;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=15TfOMC5A2oKfwpJl33+/BggjTtRg+/ddvS5gpa/G9Q=;
  b=QTlRTx0z1nWISIarq8xB+4NqtklggJyczsRhSvhc0srkNZkJJm+EiMDZ
   i0RMFlOJ9a6h7iqPU0zpL+JhqhdI/c7y/tMBE2ocDiy1/L1ZgrPWwfN9K
   MedThlKoOQMU1v5JMA1xgxcDlf7GgHLfsep2+t7Zkowszo+Wu/puiuLBG
   SkHDJaWrC7viv3YsEBiwk/k0X1aR3N7XHSN9Fx4lcxMYYE3JR+mfXgkhi
   z6WPHScNpxAXDCnu+0umn30MyxD5cZ/ozy5ppzWbGHea6D8S0USbx3Fa1
   UTX1S2mkBucpfCtR2wa7NfuhtmMU4Eb0x9zntsfcRAx4/QXOWs6TJGqmc
   g==;
X-IronPort-AV: E=Sophos;i="5.93,264,1654552800"; 
   d="scan'208";a="25823033"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 26 Aug 2022 10:51:02 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 26 Aug 2022 10:51:02 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 26 Aug 2022 10:51:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1661503862; x=1693039862;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=15TfOMC5A2oKfwpJl33+/BggjTtRg+/ddvS5gpa/G9Q=;
  b=KvFIuEuJ/4QtnFa+cSh7TPtUmOkkwQq/lEK2EhDnZo/a0UJEsW3DCg/a
   r2E25L/ZlEMpxPp+X0eOvAWRuNmYgvubUY5FmyLnLmlM6uQGEq2LrIESE
   U24s5YLEuLSZvSB7EvEJU6KTH4l0BAzcsXeqfVYDyaogjPLbX1snfHGcg
   CUXFJo+Y/meICdd2FF3lIltvufGJlD1I5BZhh9cLJGQ5yuIsXy/y5a5Wk
   8Zi9iSB4FQ1HnsMxZJVg0aJjjMxf1GaqkfvENvkNHSSdhD9vhg2FQl2ki
   xYaKjRBGLj00trN1P2MIVI98gIQ29rlYANatmVSJDHWFqha9GyV0ZAbRk
   g==;
X-IronPort-AV: E=Sophos;i="5.93,264,1654552800"; 
   d="scan'208";a="25823032"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 26 Aug 2022 10:51:01 +0200
Received: from steina-w.localnet (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B0882280056;
        Fri, 26 Aug 2022 10:51:01 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>
Subject: clk-renesas-pcie (9FGV0241) does not work
Date:   Fri, 26 Aug 2022 10:50:59 +0200
Message-ID: <3458883.Lt9SDvczpP@steina-w>
Organization: TQ-Systems GmbH
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

CC'ing Marek as original author.

I'm trying to use the clk-renesas-pcie driver for 9FGV0241 on my board.
But apparently it doesn't work. After digging into it IMHO the i2c transfer 
are not correct.
The datasheet [1] states that for reading the following sequence applies:
1. Start
2. W slave address
3. W beginning byte
4. Repeated start
5. R slave address
6. data byte count (from slave)
7. beginning byte (from slave)
...
x. Stop

So before each read there is an additional byte containing (an apparently 
configurable) amount of bytes to be transferred. This is also what I see in u-
boot:
> => i2c md 0x6a 0 9
> 0000: 08 ff 06 ff 5f ff 01 02 08    ...._....

The first ff, here on offset 1, is actually the reset default register/byte 0.
01 02 (offsets 6 & 7) are the ID registers at byte 5 & 6.

The write access is quite similar, the amount of bytes to be written has to be 
sent first. So the data byte count is completely ignored, IMHO which is why 
this doesn't work. Am I'm missing something? How can this be fixed?

Best regards,
Alexander

[1] https://www.renesas.com/us/en/document/dst/9fgv0241-datasheet?r=37495



