Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED5FCCA468
	for <linux-clk@archiver.kernel.org>; Wed,  1 Jun 2022 14:25:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355365AbiFAOZs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Jun 2022 10:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355501AbiFAOZh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Jun 2022 10:25:37 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D422D562E8
        for <linux-clk@vger.kernel.org>; Wed,  1 Jun 2022 07:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1654092957; x=1685628957;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sBSeKKXxzY07fwPIGCoJPmHeELhT4b7543po4px3cBY=;
  b=GYJ5WflPzhorbeNOQrPuKQUBiiTUTMKYgXMhYx12TnQN02LczepZCs+p
   fQVnuUQUqDhKT9v6CY5n0VgnLY71u5wvqIHSq5EyvExvYnrGltzmWWixu
   4oPdSlczGF2T5DHBe8o9yz83+P7OnC8fJzZtBUnyJzQgF1/3cl8PUvw6m
   QqfnlyCeDzP19vhE7bFsF+iDAp35qsVik8Vdhqj5y56aJhcOzRosCCNPC
   peGOIp/6btA6uhVhJTZiHjk57Mw4Mx1CWoF0ZPDR1U5tmQR5cFmv5AADm
   9LfemLRXYB5aHcQGK8kF1z777v9tz6t9zFSjjhxxy/YBS1A/ftJZSinrG
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,268,1647298800"; 
   d="scan'208";a="24209515"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 01 Jun 2022 16:15:54 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 01 Jun 2022 16:15:54 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 01 Jun 2022 16:15:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1654092954; x=1685628954;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sBSeKKXxzY07fwPIGCoJPmHeELhT4b7543po4px3cBY=;
  b=W8L/KzliD0lGPDgCxwMIzk523JOtM1FtrQ6P3E1R4QgKtlZgDY822Xmu
   BnDG/mIGYLI1xVuE9mwFI24O5ftRnNVn7iV9/Md3oK5NP5tfUaa6vKtJh
   G2E3ZRomG8crOxDVXJ16E8CDFwUXZzxExUnD8SNjI9NhgtZn1MMFGV1Wy
   mUr7rBg7UPp3KbfcBc/jf6KcG6w8ms80bHxScNfLNlEuUDEUppeBdxHC2
   ng8t3jeg/wVLsNMC77tRW36r0PptAnYzQVibX2v+1PVn4NcgANr3yZgbX
   R2UGGAsJnfPprCeWuiifL3qtxbzHItT7nKqjvsKu5RSKNLFIpPAIzPU1K
   A==;
X-IronPort-AV: E=Sophos;i="5.91,268,1647298800"; 
   d="scan'208";a="24209514"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 01 Jun 2022 16:15:54 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B1F45280056
        for <linux-clk@vger.kernel.org>; Wed,  1 Jun 2022 16:15:54 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-clk@vger.kernel.org
Subject: clock consumer for output clocks?
Date:   Wed, 01 Jun 2022 16:15:54 +0200
Message-ID: <3677796.MHq7AAxBmi@steina-w>
Organization: TQ-Systems GmbH
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

I want to use an output clock, which provides some internal clock on an putput 
pad, such as IMX8MP_CLK_CLKOUT1 or IMX6QDL_CLK_CKO.
To prepare and enable a clock I need a consumer, but in my case there is no 
(local) consumer. Is there some way, DT node or some kind of driver/uapi, 
which I can use to enable the clock?

Best regards,
Alexander



