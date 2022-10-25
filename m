Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525BBC38A2D
	for <linux-clk@archiver.kernel.org>; Tue, 25 Oct 2022 11:04:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232255AbiJYLEN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Oct 2022 07:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232285AbiJYLEI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Oct 2022 07:04:08 -0400
Received: from us-smtp-delivery-115.mimecast.com (us-smtp-delivery-115.mimecast.com [170.10.133.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D9DF17FD67
        for <linux-clk@vger.kernel.org>; Tue, 25 Oct 2022 04:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxlinear.com;
        s=selector; t=1666695845;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=e9ey0KHZoREvDvjOAPwKHYKH0ajm7TTYQlLzrgFDqig=;
        b=iO2SDm747bgDYpnPFWXP6zu0F65cwyxuU79WOZ+nc6tmpQvSPw7Nnl1m9szyKvly9h/FHJ
        C6nSA4nrG3OHTHN9kLcMnI5/8JWlI1ZksmS2phrE9rKEJK+l9NXsiLU7mw1rlAysSn5fdP
        riTtPyYa9yeKTllUIqcv4ul+ZiOvqJE8saXW+0GNiokj2/9JIchCBEDlcZp3pJbykhStG7
        UXZjWeYV7McafeihRIYZx7U7JzX7Wqm7EJPdj5wFFnuZ+y8doqotIzDlifmRZM5xFyx4rb
        UuN1hqKQgaaNrI7aBmwbHSWK8RKm1JRbAjOfhqvlMNRE8yNxiDJyOxNjTCIsNg==
Received: from mail.maxlinear.com (174-47-1-84.static.ctl.one [174.47.1.84])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 us-mta-126-FSWmC2tZPhidqx7gP7bzrw-1; Tue, 25 Oct 2022 07:04:04 -0400
X-MC-Unique: FSWmC2tZPhidqx7gP7bzrw-1
Received: from sgsxdev001.isng.phoenix.local (10.226.81.111) by
 mail.maxlinear.com (10.23.38.119) with Microsoft SMTP Server id 15.1.2375.24;
 Tue, 25 Oct 2022 04:04:00 -0700
From:   Rahul Tanwar <rtanwar@maxlinear.com>
To:     <sboyd@kernel.org>, <dan.carpenter@oracle.com>,
        <linux-clk@vger.kernel.org>, <yzhu@maxlinear.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-lgm-soc@maxlinear.com>,
        "Rahul Tanwar" <rtanwar@maxlinear.com>
Subject: [PATCH 0/1] clk: mxl: Fix smatch static checker warning
Date:   Tue, 25 Oct 2022 19:03:56 +0800
Message-ID: <cover.1666695221.git.rtanwar@maxlinear.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: maxlinear.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix the static checker warning reported by Dan Carpenter.

The patch is created on top of clk-next branch of below clk git tree:
git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next

Rahul Tanwar (1):
  clk: mxl: Fix smatch static checker warning

 drivers/clk/x86/clk-lgm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--=20
2.17.1

