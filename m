Return-Path: <SRS0=eW+W=6T=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FCC4C47247
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 04:58:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07F1120721
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 04:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588654702;
	bh=LcQ344sjr6nEiwgADkb7OZQNqpBsHsLRt3hhUHNyb5s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=vooyv5iMqGgGfJTQnMcJJI9uunW1I5pl4wwSt8+kB4vvcxvsmfUqHUh3DqjI9IMUl
	 GBtWgL4kc5KIwDwnQo/Af3roBCDwN5vOfJW/zPR19mfxjHWRDAkBKFKQ7rLTugPGaA
	 +laoG3XQSoBctsJRG4PChNuCnA3UKvqMIEiEhexI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgEEE6V (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 May 2020 00:58:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:48442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726065AbgEEE6V (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 May 2020 00:58:21 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4AB8E206B9;
        Tue,  5 May 2020 04:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588654701;
        bh=LcQ344sjr6nEiwgADkb7OZQNqpBsHsLRt3hhUHNyb5s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BpHQHFGvoS422p27Z7O9MMXB/4z1bDRjgVsznR/1Suj3xgTlf10qxhqpdbLycslDQ
         Fy/qPOnC3q69ovPHCI7IZSlhxz9tdV8WSZ38tleBPUHYct3UmlWgIIRuBdUHSg6qgM
         c5EgZDPFbeBetXlPUPcequXXhwFyCI18RQgt/qr4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1584279836-29825-10-git-send-email-aisheng.dong@nxp.com>
References: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com> <1584279836-29825-10-git-send-email-aisheng.dong@nxp.com>
Subject: Re: [PATCH V6 09/12] clk: imx: lpcg: allow lpcg clk to take device pointer
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        shawnguo@kernel.org, fabio.estevam@nxp.com, linux-imx@nxp.com,
        kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
Date:   Mon, 04 May 2020 21:58:20 -0700
Message-ID: <158865470060.11125.1108363157880978181@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2020-03-15 06:43:53)
> Used to support runtime pm.
>=20
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
