Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DDB3C2D0A3
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 01:11:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD70E20825
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 01:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604538712;
	bh=swEKZL2gZs7d8xj906CwEl9wBFth5xUih5ynJdNZD3o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=ZabG3NZqWzqk0kFQ+iWlFL0iDD4dnK2maPmX6kUrSAocqoyFP3eQNfpO894eY0Kev
	 kVwmxqounkqMDdWkg1Fu6Fc3yeiFFGPgrtTYs2D3YconehwZImS4Kppl8JMy5LQNTl
	 fHxLUSNvDVEO8wVnKuf4s5kx3VK7NZBA7TB/+8SQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388180AbgKEBLw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Nov 2020 20:11:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:57080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388179AbgKEBLw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 4 Nov 2020 20:11:52 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8668E206E3;
        Thu,  5 Nov 2020 01:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604538711;
        bh=swEKZL2gZs7d8xj906CwEl9wBFth5xUih5ynJdNZD3o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Yd/oDadiWuO0VdUZU+ytWHjgXvp1tkkG1ZdKFeyEexQ4O3sQitYZqWlnhAPkuLrRe
         IL/CpwmkhRHx4gBnhlXL0obUfEfjp5+TmhlnUG6evv565zgaOLZ2vYRyMhkywEc0Qv
         mm/rmd5GqGz7M80u5M4G7jaQ5Y3zLcPtiMgI/UZo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201103162435.13689-4-krzk@kernel.org>
References: <20201103162435.13689-1-krzk@kernel.org> <20201103162435.13689-4-krzk@kernel.org>
Subject: Re: [PATCH 4/8] clk: imx8mp: drop of_match_ptr from of_device_id table
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        kernel test robot <lkp@intel.com>
To:     Abel Vesa <abel.vesa@nxp.com>, Anson Huang <Anson.Huang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date:   Wed, 04 Nov 2020 17:11:50 -0800
Message-ID: <160453871023.3965362.3696409468321791476@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Krzysztof Kozlowski (2020-11-03 08:24:31)
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might be not relevant here).  This
> fixes compile warning (!CONFIG_OF && !CONFIG_MODULES):
>=20
>     drivers/clk/imx/clk-imx8mp.c:751:34: warning:
>         =E2=80=98imx8mp_clk_of_match=E2=80=99 defined but not used [-Wunu=
sed-const-variable=3D]
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
