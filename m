Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FAAC10F14
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 18:41:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1F5282083E
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 18:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555008067;
	bh=4R0etKb8Gg9PgqltcjVvFpcEYLLV8bYOi3gKgaqWlms=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=fK66kNidzCNbjCRY3AkrNxZkBjubSsBffc5OwROMFpBDqJIc/2nEWuyxkLb6XtYCa
	 HgVqqP1+xOgNSUfLmvSYiURSfvsO7oyJ2V6uG+RlymdCA4m1gqf7tHPWS+r9BK5kI7
	 7rklCIKd7bOoh20lCm/4zQqgpwYUcldNlFhxU2Mo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbfDKSlG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 14:41:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:54180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726603AbfDKSlG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Apr 2019 14:41:06 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2D6A52173C;
        Thu, 11 Apr 2019 18:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555008066;
        bh=4R0etKb8Gg9PgqltcjVvFpcEYLLV8bYOi3gKgaqWlms=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=konDM6ottgp6wEqaB+W4m0Awje4m00XcmxVKt4kaFT8q8wNhzIcq9F3pOoepOVF41
         skr8vSstwlQmXichqvou84Y3OyvqLPBl51PwFk5LJc6gnu3JRCMOfjVTBaYEhh3jR7
         QfRXE7LxXsUPnX0R7PECl2XXRkMQ1elJQaxBjnAg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190319100147.4178-2-m.tretter@pengutronix.de>
References: <20190319100147.4178-1-m.tretter@pengutronix.de> <20190319100147.4178-2-m.tretter@pengutronix.de>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/4] clk: zynqmp: fix kerneldoc of __zynqmp_clock_get_parents
Cc:     kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Michael Tretter <m.tretter@pengutronix.de>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Message-ID: <155500806544.20095.508158087415837912@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 11 Apr 2019 11:41:05 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2019-03-19 03:01:44)
> The kerneldoc refers to __zynqmp_clock_get_topology(), but actually
> documents __zynqmp_clock_get_parents(). Refer to the correct function
> name in the kerneldoc.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---

Applied to clk-next

