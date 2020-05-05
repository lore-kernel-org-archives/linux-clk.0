Return-Path: <SRS0=eW+W=6T=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EAC9C47247
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 04:51:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C25520721
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 04:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588654315;
	bh=X9GRLsoukMpsJw4Udi3r8ICfUdLOLpahsdSjCtGBO0g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=IIZ3DIF5YDyZGavRXFX9ksarjJkJP9UfOLulpqF0mN4dl92+5tl3ksP4XlOEy1QiQ
	 tHcqVi0LV6x4VwUrFARk7G7wgGMAM1d+l/gZ5tA5Hxp4zEWXVc4gHdechfDAd4ZuyK
	 omR2J/Y6idQS3p3xQKjh0r7r0i/mI4MGhjWQrn2w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgEEEvz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 May 2020 00:51:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:43484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725298AbgEEEvz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 May 2020 00:51:55 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9AD73206B9;
        Tue,  5 May 2020 04:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588654314;
        bh=X9GRLsoukMpsJw4Udi3r8ICfUdLOLpahsdSjCtGBO0g=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=0ptx5klHessgJUU5hM1RUgBd8LU+0dgdj6Rbj1FtqJnsWNQExRJk5BSjOBlG7XJUU
         54/El2qAgho1YCeAiI4bzok5sbMu4mCTEm2dL+tPrw4gD8qt9wWwpXm+QOfj8O2PqP
         WQr19Q/UKj/u/ixS8zUyqC4PsE/YWxqjNAhInRIg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1584279836-29825-11-git-send-email-aisheng.dong@nxp.com>
References: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com> <1584279836-29825-11-git-send-email-aisheng.dong@nxp.com>
Subject: Re: [PATCH V6 10/12] clk: imx: clk-imx8qxp-lpcg: add runtime pm support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        shawnguo@kernel.org, fabio.estevam@nxp.com, linux-imx@nxp.com,
        kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
Date:   Mon, 04 May 2020 21:51:53 -0700
Message-ID: <158865431390.11125.1386502608687921297@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2020-03-15 06:43:54)
> add runtime pm support
>=20
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
