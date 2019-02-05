Return-Path: <SRS0=JsB9=QM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6FFFC282CC
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 22:29:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B30232184D
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 22:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1549405742;
	bh=6WHkd1+UkKwPg7U2XsHUH+zvzu5O/W+hf3bYnca/eo8=;
	h=Subject:From:Cc:References:To:In-Reply-To:Date:List-ID:From;
	b=Bjm3DZ7blgDWUOrB/HMexMjv168Xj91idxi0CRyLNYk8KWeOp8A4XjDNH28HoBGke
	 A9hu31uwdBDW0ot6U8cKMyUew4ZbwbQHuC800XvNIn6TBiAwKxgv3ihDEN+wxHA0a9
	 Kv7LzDiBkH5/BmyXGHnfNZ0EaruECrklAHhFIsPw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729366AbfBEW3C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Feb 2019 17:29:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:38000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729364AbfBEW3C (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 Feb 2019 17:29:02 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 934E02077B;
        Tue,  5 Feb 2019 22:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1549405741;
        bh=6WHkd1+UkKwPg7U2XsHUH+zvzu5O/W+hf3bYnca/eo8=;
        h=Subject:From:Cc:References:To:In-Reply-To:Date:From;
        b=VUGCvQfWJ/HziulJGaKFh2GPkmaVoBfXLxKewKXu49Ciu3SlAnDZwHimrtaV51t/1
         6abUMQFihWxlmtyDl/xBDuG/FvBFCMSWiPkaiP3uhZm16OaWBExFD26RFJz5u7Ocog
         ebZCQnIFRFiQ/Y5ce3aO8Ifqq/GlKnI7Exjd7nK0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: imx8mq: Fix the CLKO2 source select list
From:   Stephen Boyd <sboyd@kernel.org>
Message-ID: <154940574088.169292.15304825462770873584@swboyd.mtv.corp.google.com>
Cc:     shawnguo@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        rogerio.silva@nxp.com, Fabio Estevam <festevam@gmail.com>
References: <20190130192102.7065-1-festevam@gmail.com>
User-Agent: alot/0.8
To:     Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20190130192102.7065-1-festevam@gmail.com>
Date:   Tue, 05 Feb 2019 14:29:00 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Fabio Estevam (2019-01-30 11:21:02)
> The CLKO2 clock source select list is the following as per the i.MX8M
> Reference Manual:
>=20
> 000 - 25M_REF_CLK
> 001 - SYSTEM_PLL2_DIV5
> 010 - SYSTEM_PLL1_DIV2
> 011 - SYSTEM_PLL2_DIV6
> 100 - SYSTEM_PLL3_CLK
> 101 - AUDIO_PLL1_CLK
> 110 - VIDEO_PLL1_CLK
> 111 - 32K_REF_CLK
>=20
> However, in imx8mq_clko2_sels[] only the first four entries are correct.
>=20
> Fix it by adding the missing "sys3_pll2_out" entry in order to match
> the description from the manual.
>=20
> Fixes: b80522040cd3f ("clk: imx: Add clock driver for i.MX8MQ CCM")
> Reported-by: Rogerio Pimentel <rogerio.silva@nxp.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---

Do I need to fast track this into v5.0 final? Or this is a non-critical
fix for something that isn't used right now?

