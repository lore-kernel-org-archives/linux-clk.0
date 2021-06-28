Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27375C48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 03:02:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05D4061C2F
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 03:02:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232065AbhF1DE6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 23:04:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:60464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232024AbhF1DE6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 23:04:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE2D361C2A;
        Mon, 28 Jun 2021 03:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624849353;
        bh=mmF0naHe+YSuxHB55a8Wfhc5PaQmsVsOBnuwplZ3Fsc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ohJy8C+TYtF0GVt4OnuDHN0cHp2S8N1XPugax+aCmvKFaVCr1ykUKUnKSBgpG9bEd
         i6Omax7BGHhjzymYA3xmKdbzX7v3fO4ojRGgAyvw0q7fz9S5i2bIZpqtjWRrUh4KRO
         ZCNw5EBOuotPL8zeLNsm2ydkNkdrMUm2SSD/U+SOP7IaXDxCB1N4WVMILUsaa2xSZZ
         VBV7GqGYn76Z7/8TkRpGevblWN1CpnZSD7CtXOxyGcUAOga2CfyjW6yp/J5wvOAFgJ
         VFUTBlboZbAkZnOR9jfU5x3W3kAx3MCB7nxFFrtv3F10HZYiK9mg87KxW3d6pMXcRB
         Mv+B7xMky2jIA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210325192643.2190069-4-robert.hancock@calian.com>
References: <20210325192643.2190069-1-robert.hancock@calian.com> <20210325192643.2190069-4-robert.hancock@calian.com>
Subject: Re: [PATCH v3 3/9] clk: si5341: Avoid divide errors due to bogus register contents
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mike.looijmans@topic.nl, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
To:     Robert Hancock <robert.hancock@calian.com>, mturquette@baylibre.com
Date:   Sun, 27 Jun 2021 20:02:32 -0700
Message-ID: <162484935268.2516444.4701585275304414826@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Robert Hancock (2021-03-25 12:26:37)
> If the Si5341 is being initially programmed and has no stored NVM
> configuration, some of the register contents may contain unexpected
> values, such as zeros, which could cause divide by zero errors during
> driver initialization. Trap errors caused by zero registers or zero clock
> rates which could result in divide errors later in the code.
>=20
> Fixes: 3044a860fd ("clk: Add Si5341/Si5340 driver")
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---

Applied to clk-next
