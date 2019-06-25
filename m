Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0F1C48BD5
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 22:58:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F0A462086D
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 22:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561503516;
	bh=8SZy9CuPsIuAEKonya0wbhkOSTztivF6u7odkDAhOlg=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=2EBlq1G2SQXqw7CuOoH9IiA8exnuu499M5njN1EmYlNb/YmkXtL1vfVna9wgGqgPr
	 dBOk1ITcx49A/4EazRjJ8jOLRU8d3VDLUwRjC4Mp/WHcYFGEwPt7u6Po2qPvRXdI/N
	 kWdtAsdlEL1bTtH2ZH5uRXwR+Ocx8U/ngwKjGAkE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbfFYW6f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jun 2019 18:58:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:47734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725782AbfFYW6f (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Jun 2019 18:58:35 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B6E972084B;
        Tue, 25 Jun 2019 22:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561503514;
        bh=8SZy9CuPsIuAEKonya0wbhkOSTztivF6u7odkDAhOlg=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=vO86YorkBNc62UV2N7y9Vzqub90UnOgak7AMFwpaFYt2kj6CiWFFh4ZtfxPr1XRrN
         MQ2+t+DhBVLxoNJjZ0ld0kM48n/nsoHxIszi+LhT7Hb5qSNGNf2K2Yr+idXEQdAbWz
         IgDy+YpQvrS8Xs+mKjwbin2ITVvwDPCB5FCo0zo8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1556261624-20504-1-git-send-email-vabhav.sharma@nxp.com>
References: <1556261624-20504-1-git-send-email-vabhav.sharma@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Vabhav Sharma <vabhav.sharma@nxp.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4] clk: qoriq: add support for lx2160a
Cc:     "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Vabhav Sharma <vabhav.sharma@nxp.com>,
        Andy Tang <andy.tang@nxp.com>,
        Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
User-Agent: alot/0.8.1
Date:   Tue, 25 Jun 2019 15:58:33 -0700
Message-Id: <20190625225834.B6E972084B@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Vabhav Sharma (2019-04-25 23:53:38)
> Add clockgen support and configuration for NXP SoC lx2160a
> with compatible property as "fsl,lx2160a-clockgen".
>=20
> Signed-off-by: Tang Yuantian <andy.tang@nxp.com>
> Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
> Signed-off-by: Vabhav Sharma <vabhav.sharma@nxp.com>
> Acked-by: Scott Wood <oss@buserror.net>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

Applied to clk-next

