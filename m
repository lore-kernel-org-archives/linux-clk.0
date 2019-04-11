Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96213C10F13
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 20:38:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D9072184B
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 20:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555015139;
	bh=jMa92Ejs5lhKw3LQE3KrDpn8pqdeLEP8Jn8t/c5pEAk=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=O1MisivYejXeBaSJvLzp+6DI054XcYPFnvjNKOqzVPiCwFg685vQ2rCXYbxPelSmS
	 8iUGVne7BdW9tcjQ8SK45V55vf+WmLticD5Qh1OymcA9TaF0niv2XpT6uq7vA+/Jzq
	 KWRG6aonn2hx6dDYuvZUFFklSMjBFOUIyHUKaos4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbfDKUi7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 16:38:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:57474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726693AbfDKUi7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Apr 2019 16:38:59 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4DF262075B;
        Thu, 11 Apr 2019 20:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555015138;
        bh=jMa92Ejs5lhKw3LQE3KrDpn8pqdeLEP8Jn8t/c5pEAk=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=rFaAwtu5Bc4nEyuiLW6o2i5grv53pQAb5mNCJ9i0H34Y46jyy2p13/aKiorNSu80c
         YwLifo6lMwZAOzy8Wl6FbSye6eUDgW/YKr7i2D090djP572d+IMFMsdLjTtsu36ERd
         jyCocANfWq1g2JAxMFK9thfdflxveU8s2oCrqu2s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a7e27415-02d9-bfe9-c0ea-59dc236a7f91@free.fr>
References: <a7e27415-02d9-bfe9-c0ea-59dc236a7f91@free.fr>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1] clk: qcom: Skip halt checks on gcc_pcie_0_pipe_clk for 8998
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Michael Turquette <mturquette@baylibre.com>
Message-ID: <155501513749.20095.1821975004534833321@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 11 Apr 2019 13:38:57 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marc Gonzalez (2019-03-25 06:49:54)
> See similar issue solved by commit 5f2420ed2189
> ("clk: qcom: Skip halt checks on gcc_usb3_phy_pipe_clk for 8998")
>=20
> Without this patch, PCIe PHY init fails:
>=20
> qcom-qmp-phy 1c06000.phy: pipe_clk enable failed err=3D-16
> phy phy-1c06000.phy.0: phy init failed --> -16
>=20
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> ---

Applied to clk-next

