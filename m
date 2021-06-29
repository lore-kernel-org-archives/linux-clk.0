Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2344C11F66
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 06:10:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE16E61DCC
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 06:10:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232158AbhF2GNT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Jun 2021 02:13:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:34588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231881AbhF2GNS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 29 Jun 2021 02:13:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E625661DC5;
        Tue, 29 Jun 2021 06:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624947052;
        bh=85E4bCz0J8Knq4WBqIa5jZgR0ZZ72QjNHf1hztwEL7w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HKq+Vng3Y0hOVbQHsxCFccyZjskJt6bwjLScg5wQHzID06iSvbHlJXIQAVe9lkCDH
         9nHYBkjahAgNHlOYZRJersnkiNUfGmUSmYV6HXbZMgb6/Awlb5CT0P4C9FihdneLAS
         Z8LatZpEuE59rQUoj/n/75YyJfareV1tDExBUfycbMq5MC/HbaA44xqcGsYSpWe0lN
         quoZ+dhnVdEb5qmhwSN4Zcn1Fj2KiWu9nWD8dYCaQIuxCEC+jt2Sebaip/WyMlV3GJ
         LhwRnMFmPhP0ebsR6wan6uHhCcdVrE25vvD2Hc6zaES6Vb2OvOcpQPG5e/ZmJHAhBo
         u1PvGsUKZzILg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210628070122.26217-5-rajan.vaja@xilinx.com>
References: <20210628070122.26217-1-rajan.vaja@xilinx.com> <20210628070122.26217-5-rajan.vaja@xilinx.com>
Subject: Re: [PATCH v6 4/4] clk: zynqmp: Handle divider specific read only flag
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Rajan Vaja <rajan.vaja@xilinx.com>
To:     Rajan Vaja <rajan.vaja@xilinx.com>, kristo@kernel.org,
        lee.jones@linaro.org, michal.simek@xilinx.com,
        mturquette@baylibre.com, quanyang.wang@windriver.com
Date:   Mon, 28 Jun 2021 23:10:50 -0700
Message-ID: <162494705066.2516444.12484471667064926730@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Rajan Vaja (2021-06-28 00:01:22)
> Add support for divider specific read only CCF flag
> (CLK_DIVIDER_READ_ONLY).
>=20
> Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
> ---

Applied to clk-next
