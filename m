Return-Path: <SRS0=eW+W=6T=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FED3C47247
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 04:49:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33A562075E
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 04:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588654161;
	bh=yItgMkJqd6ODMcueMcLMdpfZUNWtRXTq6l9lC/Swlb0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=wmd9ZefAe7Z/L6Izh/GrmcPR329LUU/mD1N2ABRhT0vb7XKwbwtrOPCNvwnuFuNVe
	 2p+F34PfhosRxZHF09kLFgad51glOgGYNb2DJqdsFeUei545W1srUlYt+pG+ksnADB
	 443g6h72nlLWNnl0niHPqwfrbnka19BmWxePs9pE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725320AbgEEEtV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 May 2020 00:49:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:40690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725298AbgEEEtU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 May 2020 00:49:20 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 52112206B9;
        Tue,  5 May 2020 04:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588654160;
        bh=yItgMkJqd6ODMcueMcLMdpfZUNWtRXTq6l9lC/Swlb0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IHAW4rpA7shJHtRlptSTN/BwwFj9gGau00WdhT5JIbbmaYNPIHMm9u95KRncKcbnn
         Nsvzk33nQilouSBAgpQN4OamPFCWXPk3eiRizjU9vb/uf+qDT7Z6B8zxMjWl1Q9uAh
         y6f5J/qozMlz77bYDFvo71bnf16OYypD6P1gMdBU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1584279836-29825-5-git-send-email-aisheng.dong@nxp.com>
References: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com> <1584279836-29825-5-git-send-email-aisheng.dong@nxp.com>
Subject: Re: [PATCH V6 04/12] clk: imx: scu: bypass cpu power domains
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        shawnguo@kernel.org, fabio.estevam@nxp.com, linux-imx@nxp.com,
        kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
Date:   Mon, 04 May 2020 21:49:19 -0700
Message-ID: <158865415958.11125.10235543039154102899@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2020-03-15 06:43:48)
> Bypass cpu power domains which are owned by ATF.
>=20
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
