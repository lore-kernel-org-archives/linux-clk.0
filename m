Return-Path: <SRS0=pin/=Q4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C34C43381
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 22:16:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 501C22083B
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 22:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550787368;
	bh=6ZocVTDyu6QEKppFxuFMBJv/i8n5oL4RFkclVuHAYiw=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=RSIWn7GkmUMihI2zNqJVBdCLj1CTvIYBV3rYYi786a+U4C5hZWZ959UqYbFDT1PKI
	 dAPiM/C+wnPiI37pTFu0tyHdrxfjnRnOF6jZtTLN9/cyLxLaKlWCeTBHz5JJ9vU3aU
	 tleSXkWTxl5IvibDE2jRJuoLv+CK/jxdHa+fo8k4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727241AbfBUWQD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 17:16:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:47056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726656AbfBUWQD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Feb 2019 17:16:03 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9BA5D208E4;
        Thu, 21 Feb 2019 22:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550787362;
        bh=6ZocVTDyu6QEKppFxuFMBJv/i8n5oL4RFkclVuHAYiw=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=ZsO6VX+RWSctu3HUnqy6FvQ1T3CYcrU2SfaTipuS1HfpXc5zheNiGA8yQILdTmGqX
         XkxB/N0nkt/npEGY9VrStQ+VWkgXWI0Vm0xOyuN6qMT+NcoN+brvaSfJJZkUJEMB7U
         HAFDm37EYP1h+tT2xgKRlSYEda5QLy4wWabT+AKw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 7/7] clk: stm32mp1: fix bit width of hse_rtc divider
Message-ID: <155078736177.77512.5139718258939104063@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <20190214104047.1173-1-gabriel.fernandez@st.com> <20190214104047.1173-8-gabriel.fernandez@st.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190214104047.1173-8-gabriel.fernandez@st.com>
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        gabriel.fernandez@st.com
Cc:     linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Gabriel Fernandez <gabriel.fernandez@st.com>
Date:   Thu, 21 Feb 2019 14:16:01 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting gabriel.fernandez@st.com (2019-02-14 02:40:47)
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>=20
> Fix the bit width of the hse rtc divider because it's off by one.
>=20
> Fixes: 2c87c9d33117 ("clk: stm32mp1: add RTC clock")
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---

Applied to clk-next

