Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB54C43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 18:41:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3FD4A218A4
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 18:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545158502;
	bh=AwdX88LwfF+YuvAm/TFiswVQOd5bxkkc6IXL+wdwNAc=;
	h=References:In-Reply-To:To:Cc:Subject:From:Date:List-ID:From;
	b=MnvHLh5koVGTmrWq/KHhOOISHKCYyBb3xiQXkXxybSTca+6k48tAcomOhky7+8W28
	 cOGCsRnenctMtuxkBNaZII3UHM8vgA7ISyxkH9Gb16uLxOld/grDkSIbpHDqKXvZkU
	 HGrfTB3y4Y5kqaWc/dyEWaXAxx1niD1z0hBY8L04=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbeLRSll (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 13:41:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:60626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726685AbeLRSll (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 18 Dec 2018 13:41:41 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0728021841;
        Tue, 18 Dec 2018 18:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545158501;
        bh=AwdX88LwfF+YuvAm/TFiswVQOd5bxkkc6IXL+wdwNAc=;
        h=References:In-Reply-To:To:Cc:Subject:From:Date:From;
        b=DnRvCsH6KgkRsr2MbRc7mO116n5RN5cE/MXOOnfm/gXNQbri1q7evei27gNaREYsp
         XOS26zxWvLcmnh4566OwUVgDA9kxN8NLm2XfiK6MvjGeAiPaSshQEPrEob9q4yFisN
         q6O22KBo5RssyplKKX4PCth4IrsRFOy835QbIPMc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20181218091232.23532-1-josephl@nvidia.com> <20181218091232.23532-8-josephl@nvidia.com>
Message-ID: <154515850026.238328.7010951773585896961@swboyd.mtv.corp.google.com>
In-Reply-To: <20181218091232.23532-8-josephl@nvidia.com>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, Joseph Lo <josephl@nvidia.com>
User-Agent: alot/0.8
Subject: Re: [PATCH V3 07/20] clk: tegra: dfll: support PWM regulator control
From:   Stephen Boyd <sboyd@kernel.org>
Date:   Tue, 18 Dec 2018 10:41:40 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Joseph Lo (2018-12-18 01:12:19)
> The DFLL hardware supports two modes (I2C and PWM) for voltage control
> when requesting a frequency. In this patch, we introduce PWM mode support.
>=20
> To support that, we re-organize the LUT for unifying the table for both
> cases of I2C and PWM mode. And generate that based on regulator info.
> For the PWM-based regulator, we get this info from DT. And do the same as
> the case of I2C LUT, which can help to map the PMIC voltage ID and voltag=
es
> that the regulator supported.
>=20
> The other parts are the support code for initializing the DFLL hardware
> to support PWM mode. Also, the register debugfs file is slightly
> reworked to only show the i2c registers when I2C mode is in use.
>=20
> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
>=20
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

