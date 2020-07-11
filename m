Return-Path: <SRS0=QFiD=AW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB27AC433DF
	for <linux-clk@archiver.kernel.org>; Sat, 11 Jul 2020 00:12:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7A07206D9
	for <linux-clk@archiver.kernel.org>; Sat, 11 Jul 2020 00:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594426350;
	bh=8fx3o7YPTqqLEFov5GsDKcWXomusI8PB9Gem520UFz8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=wIBEEMCNIi0ngjzxiZTt+6/xf9p4ecPRtHnFccMaOWoOfaQm8qlqomyKMf1qA0hND
	 npYYkpzFfLgiD1tHmEDDRlcP9/APUB+n4PDmrRZVd3otqQsMDmSCtzUTxS0YZ5n1d7
	 rHXy5zBoGGQOmCM11YnjBZ//5lu5GjPZ7Nobu7Oo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgGKAMa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 10 Jul 2020 20:12:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:51236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726588AbgGKAMa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 10 Jul 2020 20:12:30 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 908F4206D9;
        Sat, 11 Jul 2020 00:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594426349;
        bh=8fx3o7YPTqqLEFov5GsDKcWXomusI8PB9Gem520UFz8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Z+YWycqxGRPDM1BnMJ0twVvbwlm7pR80eSVYlQHQX26TJxPq/w/Zq/HTmyhBMzrCs
         2jie0IOe48iG+WmEFzodd5vC8dAmW8WcNuWEL7uFN8Kh5rQVVsDp4F/KmcCN7doSDk
         U6+L4T8xp9W7lPFu4Fsq2EuCdbdGlXUXFqfeLfL8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1593766185-16346-2-git-send-email-loic.poulain@linaro.org>
References: <1593766185-16346-1-git-send-email-loic.poulain@linaro.org> <1593766185-16346-2-git-send-email-loic.poulain@linaro.org>
Subject: Re: [PATCH v5 1/5] soc: qcom: Separate kryo l2 accessors from PMU driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        amit.kucheria@linaro.org, Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>, bjorn.andersson@linaro.org
Date:   Fri, 10 Jul 2020 17:12:28 -0700
Message-ID: <159442634887.1987609.14522219371112642819@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Loic Poulain (2020-07-03 01:49:41)
> From: Ilia Lin <ilialin@codeaurora.org>
>=20
> The driver provides kernel level API for other drivers
> to access the MSM8996 L2 cache registers.
> Separating the L2 access code from the PMU driver and
> making it public to allow other drivers use it.
> The accesses must be separated with a single spinlock,
> maintained in this driver.
>=20
> Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---

Applied to clk-next
