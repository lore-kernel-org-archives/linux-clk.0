Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE73C433EF
	for <linux-clk@archiver.kernel.org>; Mon,  8 Nov 2021 18:55:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05A3661361
	for <linux-clk@archiver.kernel.org>; Mon,  8 Nov 2021 18:55:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236292AbhKHS6E (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Nov 2021 13:58:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:51142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229837AbhKHS6E (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Nov 2021 13:58:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B15BA61361;
        Mon,  8 Nov 2021 18:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636397719;
        bh=nlWHtZSD28HFUcjijaDxHBOQhnjx4wm+XZ/r9gMfWC4=;
        h=Date:From:To:Cc:Subject:From;
        b=E66u5zZbFZBi77EzAZ2Fn1XKLoUrVRH3KQZgfde55UndaJ6YDWMk48rwzH2B6xUa+
         gXJGCYMArVZGRhi4tKFAmJVFdB1I7sb8fbQohkbEIxDQt9fEOU+6XkL+GkMPeL9tCm
         Yfpgr6V3Af/ml50/v3IJbp+FF9ApoUKNatB0a/T/2xXTw7CSCYMElcOxaM1S2t3/4y
         rerZ8TSJpD9XTcbe8rrfnsR5YmPp7+UDYSDRj4XW0L058TG7yLcsMcWUFhZRVlR5cT
         w0haaiH5upd/RDFumZd0nRZCxjsfL1NbxjmhQt7CpGrPS0/tdked6K+g+K/oZigAZS
         3NhZuNFEXxnEA==
Date:   Mon, 8 Nov 2021 19:55:14 +0100
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     pali@kernel.org
Subject: request for review
Message-ID: <20211108195514.51332aaf@thinkpad>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Michale, Stephen,

I would like to ask you to review the 2nd patch of the series
  [PATCH v7 0/6] serial: mvebu-uart: Support for higher baudrates

The series can be found at
  https://lore.kernel.org/linux-serial/20210930095838.28145-1-pali@kernel.org/

the second patch at
  https://lore.kernel.org/linux-serial/20210930095838.28145-3-pali@kernel.org/

We need to implement this clock driver inside the UART driver, because
the clock configuration registers unfortunately are in UART driver
space and various cross mutexes between clock driver and UART driver
would have been needed otherwise.

Could you please review this and give your Reviewed-by / Acked-by, if
there aren't any problems? We would like to move on with it since we
sent it 40 days ago and didn't get the necessary reviews yet.

Thanks.

Marek
