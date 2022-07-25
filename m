Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDC8C43334
	for <linux-clk@archiver.kernel.org>; Mon, 25 Jul 2022 10:20:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234382AbiGYKUK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Jul 2022 06:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233403AbiGYKUE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Jul 2022 06:20:04 -0400
X-Greylist: delayed 64 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 25 Jul 2022 03:20:03 PDT
Received: from us-smtp-delivery-115.mimecast.com (us-smtp-delivery-115.mimecast.com [170.10.129.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 18DA1DFAD
        for <linux-clk@vger.kernel.org>; Mon, 25 Jul 2022 03:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxlinear.com;
        s=selector; t=1658744401;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=dUMUeCqVR66yyixygH8UDylbRMhD6rtr0vwk1SwVG2I=;
        b=mntGHbLLFdOjt/mDrgpnah+LvIoYWT9j+TxlzIfrSjoNjiIWq2SrQLWb2+EKTTLWoHDP4C
        nKAmWvfRpnj6ut0xoopF4e7UDkTds4xgekN7OWw9IIxggvtpdppLYZ78AKiVsZPW9q+QYt
        20WrvknAgZgM6RxyKj3VTafdFYOrVMsv8BPEFSyKzBU+uAC5t6L98GsIhwR1bpc3g4qJ4k
        H5qIIfQ2utp5tujSS5PPGfuzbSgZ8YzFElOSi3GXMgV7+muSpftq2b2PWX+Xfz1k4Oad8c
        bHpgGWIQSrBfDOhOwji3+p9oRorQrkU3YZkKQiE4n/hDtm7sOFGN11foF9Q6Ag==
Received: from mail.maxlinear.com (174-47-1-83.static.ctl.one [174.47.1.83])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 us-mta-25-SZBz8UKfPgKJjB-U4Hqy_A-1; Mon, 25 Jul 2022 06:18:56 -0400
X-MC-Unique: SZBz8UKfPgKJjB-U4Hqy_A-1
Received: from sgsxdev001.isng.phoenix.local (10.226.81.111) by
 mail.maxlinear.com (10.23.38.120) with Microsoft SMTP Server id 15.1.2375.24;
 Mon, 25 Jul 2022 03:18:58 -0700
From:   Rahul Tanwar <rtanwar@maxlinear.com>
To:     <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <linux-clk@vger.kernel.org>
CC:     <linux-lgm-soc@maxlinear.com>, Rahul Tanwar <rtanwar@maxlinear.com>
Subject: [PATCH 0/3] Modify MxL's CGU clk driver to make it secure boot compatible
Date:   Mon, 25 Jul 2022 18:18:45 +0800
Message-ID: <cover.1658742240.git.rtanwar@maxlinear.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA115A51 smtp.mailfrom=rtanwar@maxlinear.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: maxlinear.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

MxL's CGU driver was found to be lacking below required features. Add these
required lacking features:

1. Since it is a core driver, it has to conform to secure boot & secure
   access architecture. In order for the register accesses to be secure
   access compliant, it needs regmap support as per our security architectu=
re.
   Hence, replace direct read/writel with regmap based IO. Also remove spin=
locks
   because they are no longer necessary because regmap uses its own lock.

2. There are some gate clocks which are used by the power mgmt IP to gate w=
hen
   a certain power saving mode is activated. These gate clocks can also be=
=20
   gated from CGU clk driver. This creates a conflict. To avoid the conflic=
t,
   by default disable gating such gate registers from CGU clk driver. But k=
eep
   a flag to do so for other older IP's which uses same CGU clk IP but does=
 not
   use same power mgmt IP.

This patch series is based on below git tree:
git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git

Rahul Tanwar (3):
  clk: mxl: Switch from direct readl/writel based IO to regmap based IO
  clk: mxl: Remove unnecessary spinlocks
  clk: mxl: Avoid disabling gate clocks from clk driver

 drivers/clk/x86/Kconfig       |   5 +-
 drivers/clk/x86/clk-cgu-pll.c |  23 ++-----
 drivers/clk/x86/clk-cgu.c     | 117 +++++++++++-----------------------
 drivers/clk/x86/clk-cgu.h     |  45 +++++++------
 drivers/clk/x86/clk-lgm.c     |  14 ++--
 5 files changed, 76 insertions(+), 128 deletions(-)

--=20
2.17.1

