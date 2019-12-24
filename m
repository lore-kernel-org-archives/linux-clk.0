Return-Path: <SRS0=7p6v=2O=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE36C2D0CF
	for <linux-clk@archiver.kernel.org>; Tue, 24 Dec 2019 07:49:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C804820730
	for <linux-clk@archiver.kernel.org>; Tue, 24 Dec 2019 07:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577173743;
	bh=GTiuJToEf1rYPyFg+M8KQHlG48XsZfpkE1FmUWz15rw=;
	h=In-Reply-To:References:Cc:From:To:Subject:Date:List-ID:From;
	b=OO5y2Br8lVyMyho+VKtXb3ZcrnOICCt1aUduJ3M8dH6I1yPzbBNO4LL+sdHPz0kx1
	 ACWvnK6n120K2TgodLolRTb2uw1kbNAjnXn9fheqssjHNMpa3hZIlB4KvLyalnZ7+s
	 pI3RbVt+wDGIHVCW6NHethgF0ZIjxAwlFdF0n9Y0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbfLXHtD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Dec 2019 02:49:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:40002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbfLXHtD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 24 Dec 2019 02:49:03 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C9CF620706;
        Tue, 24 Dec 2019 07:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577173742;
        bh=GTiuJToEf1rYPyFg+M8KQHlG48XsZfpkE1FmUWz15rw=;
        h=In-Reply-To:References:Cc:From:To:Subject:Date:From;
        b=LtYDFR5QH+rp40jWZrHpHHIfROItwwLlOpd1+T0oPEZYQQD8VyVLoeikFdTwtapxN
         Fmwpw8nLFLqTN5794+J0FC5rz/Bdfektw2hYboggdM7vjugpp4ZEP/CLzvHEOdp1kB
         oHDxRvHk+ROafWKtHk2qh4a6yopx1uDFfcTNxY3c=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191210145345.11616-13-sudeep.holla@arm.com>
References: <20191210145345.11616-1-sudeep.holla@arm.com> <20191210145345.11616-13-sudeep.holla@arm.com>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
To:     Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/15] clk: scmi: Match scmi device by both name and protocol id
User-Agent: alot/0.8.1
Date:   Mon, 23 Dec 2019 23:49:02 -0800
Message-Id: <20191224074902.C9CF620706@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sudeep Holla (2019-12-10 06:53:42)
> The scmi bus now has support to match the driver with devices not only
> based on their protocol id but also based on their device name if one is
> available. This was added to cater the need to support multiple devices
> and drivers for the same protocol.
>=20
> Let us add the name "clocks" to scmi_device_id table in the driver so
> that in matches only with device with the same name and protocol id
> SCMI_PROTOCOL_CLOCK.
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

