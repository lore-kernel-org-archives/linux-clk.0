Return-Path: <SRS0=hB7x=4X=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC043C10DCE
	for <linux-clk@archiver.kernel.org>; Fri,  6 Mar 2020 21:11:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD67920705
	for <linux-clk@archiver.kernel.org>; Fri,  6 Mar 2020 21:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583529080;
	bh=bgYLPO3G4nkJJB/f9GkSCw7YIcFIZOYJCiUNYzU9W74=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=cdtAXcOz6XZ6+BXR0tcEMsYPpoCSH7TO0lDLEKSj1u0L7aE9ikKZ4akLSJTcPwBJa
	 v3PS9aTvH9NOXeuD7t80zVpzZCAKgagju/m4ahnlRflFIopwcSvW/DEWqnsyORbF5y
	 iKjD7Pt7Vy4GL3qzCQ3jrtgGkCT3SmJTFZ4hjvuY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgCFVLU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Mar 2020 16:11:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:60058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726185AbgCFVLU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Mar 2020 16:11:20 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C66B7206E6;
        Fri,  6 Mar 2020 21:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583529079;
        bh=bgYLPO3G4nkJJB/f9GkSCw7YIcFIZOYJCiUNYzU9W74=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=r/eEneZLlM60N0gvDl4VyErBWHmHsv9+ZOlXCGRvNGCGugEV/xX3Xk6DUk4qdPTkt
         gpnRImb0MNxqIhu7NpqaEnxglWYRpm82DQrKHtlu2N320YGzataPZi6wd7Z10NOC/4
         vPUnDNog8IiW2HH1WQtmIsqr4KaNmQphjx+3vXXs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200224121322.GI27688@dragon>
References: <20200224121322.GI27688@dragon>
Subject: Re: [GIT PULL] i.MX clock fixes for 5.6, round 2
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To:     Shawn Guo <shawnguo@kernel.org>
Date:   Fri, 06 Mar 2020 13:11:19 -0800
Message-ID: <158352907905.174340.14348638942004736998@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2020-02-24 04:13:23)
> The following changes since commit 5eb40257047fb11085d582b7b9ccd0bffe9007=
26:
>=20
>   clk: imx8mn: Fix incorrect clock defines (2020-02-17 15:18:00 +0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/i=
mx-clk-fixes-5.6-2
>=20
> for you to fetch changes up to 6fb9006abe37e44afaed4f2a5fd3a247a815bb8d:
>=20
>   clk: imx8mp: Correct the enet_qos parent clock (2020-02-24 15:38:03 +08=
00)
>=20
> ----------------------------------------------------------------
> i.MX clock fixes for 5.6, round 2:
>=20
>  - A couple of fixes on i.MX8MP clock driver to correct HDMI_AXI and
>    ENET_QOS_ROOT parent clock.
>  - A couple of fixes on clk-scu driver to ensure that messages sent to
>    i.MX System Controller are 4 bytes aligned.
>=20
> ----------------------------------------------------------------
> Anson Huang (1):
>       clk: imx8mp: Correct IMX8MP_CLK_HDMI_AXI clock parent
>=20
> Fugang Duan (1):
>       clk: imx8mp: Correct the enet_qos parent clock
>=20
> Leonard Crestez (2):
>       clk: imx: Align imx sc clock msg structs to 4
>       clk: imx: Align imx sc clock parent msg structs to 4

Can you resend without these last two? I don't know what's going on with
that thread.
