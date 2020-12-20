Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BFDFC3526C
	for <linux-clk@archiver.kernel.org>; Sun, 20 Dec 2020 08:58:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 655BA22CF8
	for <linux-clk@archiver.kernel.org>; Sun, 20 Dec 2020 08:58:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbgLTI6f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 20 Dec 2020 03:58:35 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:36597 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727403AbgLTI6f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 20 Dec 2020 03:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1608454714; x=1639990714;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=k+6cIfjqBLX4Y0qqbAYtcuVjCW//tzEez+xoQo5rciE=;
  b=k/0/Ut2jbfFiZtq4LaoGYV9ujkGsNcnrYgaoOtGNyfdvQ6CGkYoiADIy
   caHeE1G50g4BDXsWgDq8fdGJ/RstA3WeXMoKYvCC3YP4m/ESyBcPt7tns
   uifvfNGvIA4fEjbl065zGxmQFn3IySHcWPsjiltNuLm53QFFVX+d2yzkQ
   +SQIeemQYWu53fyP62H7drYTVqY0Se72ZI0wX3udY8skDBESTEPtAuVD4
   xlxrNTuVoBJvrNbiNkYdQo5khWO14Uq81dyGt8/Fq52SBYIRl6Ev6tMS0
   CJmJgAvoJbNiRwwp29S7VKiZQO79tE9Z84i1oIsCf1LYHOJlbF8AtKRh2
   Q==;
IronPort-SDR: CLrsRobWajL7tbJx6PHjQt9l9abNjKhYEj23EzBynKZdUR43oyK81/hpi1woGTbMtEx7UzZyKW
 oxBnwapvL0HP1MMc01KJjCYm9IxO1swcAM/PA/n/8qMV8S7JNHh4dUHvBsH0t8pAkvDrBEs7EP
 eJmOjcrJ0fLIe5srcGknuzb274eGaNX1joUt3Q+N9dcXmDdsy6gxTgYWKMiffIV4d2Dxax7WMc
 J6luEWgIQtAJLoSD3JccHVLa8rygocpB642LUjaCBv8LhrIf+uIS77B1CjS8rdvgme5d+0C0Ua
 dc4=
X-IronPort-AV: E=Sophos;i="5.78,434,1599494400"; 
   d="scan'208";a="155618012"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2020 16:57:29 +0800
IronPort-SDR: Xn6wDylZdNhhOA/Mc/6CkisQUvkCbfeNF9ZQ0IvUHOcD6U3M3znE0Cqfn2HPvmt+vn7IjY0Vvo
 CwHWi6ZIGZPL676dvONspd9E4QAXsxMeXFn81kYkaQsSpfwK58c7b0sJZNvd3DKisBD1crUa4y
 pe3xgDpeiBNyJGEFmcTqZN9Il0mrW6Z9T4nz86k9phj512b0M2N1R6wwlHz66Rqu+W2jYylGAq
 U11mrxFkBJs0va3eQ1DtfnVMzmzLTRT2qqkNIX6NuPMSYP0I5cqZ+HNMAw6uz0OIScz9ZSP7Oy
 /QGnsXh4rTkW4G83IF7EMMYN
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2020 00:42:42 -0800
IronPort-SDR: rXbpo0csq0YRke/BrWXlZFrMUpKvqm47qy9iz3LT1BgFKsX8yhxqt5o53VktRS3pnK9JkEFAFV
 TNS4dDEam7B4pNIhQQSCEpfHF0SdBjnLUGS9UHzdcN/qcmk2QE5iG/oOLwqsHxdhWx4asFB66d
 TDEE2qBLPCSCc5fu2uulyXAe2fwN7tA8sD3GOtA1DXbI8gQSPYIyHs5CT4cDcixIp0bJFunAuN
 rqAaSp6vUwo1+ZfHfRsDVegTcTm7pfb2D30JU602tJg9l5NjEW0ou9Ugpdp+BmDVdWTZu7as4g
 WPI=
WDCIronportException: Internal
Received: from twf009363.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.70.7])
  by uls-op-cesaip02.wdc.com with ESMTP; 20 Dec 2020 00:57:28 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 0/2] RISC-V K210 SoC clock driver documentation
Date:   Sun, 20 Dec 2020 17:57:23 +0900
Message-Id: <20201220085725.19545-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Stephen,

Here is a couple of patches documenting the Canaan Kendryte K210 clock
driver in preparation for the larger patch drop implemeting the driver
in the next cycle.

Please consider these for addition to the current cycle.

Thanks !

Damien Le Moal (2):
  dt-bindings: Add Canaan vendor prefix
  dt-binding: clock: Document canaan,k210-clk bindings

 .../bindings/clock/canaan,k210-clk.yaml       | 54 ++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 include/dt-bindings/clock/k210-clk.h          | 56 +++++++++++++++----
 3 files changed, 101 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml

-- 
2.29.2

