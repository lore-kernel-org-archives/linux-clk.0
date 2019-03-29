Return-Path: <SRS0=ZsbM=SA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EB5C43381
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 22:32:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B04B2218A5
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 22:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1553898765;
	bh=xMMy+V0U89LFgFp2COEnF2OFauwfO/EEnamiRdRVMJc=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=MSvkPEIIObieRcrnlpM0mD0Aod7revXfqeVdSamDOT+hpX6josz8xoqjnL62cYSzb
	 xfVKDxrRgHv5pqIkW/88ZRarXRgjZnGr9pPBiIhfjCVdO2rOuckOPcROQHaCjW8rH3
	 mmHQe4IW5nSQa/9NLslXFIXrNVNKr2l3lZeyOG2Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730335AbfC2Wcp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Mar 2019 18:32:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:50204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730240AbfC2Wcp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 29 Mar 2019 18:32:45 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 90C79217F5;
        Fri, 29 Mar 2019 22:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1553898764;
        bh=xMMy+V0U89LFgFp2COEnF2OFauwfO/EEnamiRdRVMJc=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=tBfiW4+v8Ow3gy2GvRINswZxKCsT9N4I3HxdJlDfp4xBH/hkzpnkyCUNkFp8GY7E8
         b2L/YZuTw4FnGqdaKRQzQRRy+dmQkhxkUv948wRFrTMhBlSjebSm60uMJ5B8c97dpE
         SFF8jl5JHJSHq3xmZEozTtpiBJsFEXHAqCHZGifQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c1762201-a1fa-8ed1-24ff-f30916ee45dd@free.fr>
References: <a7e27415-02d9-bfe9-c0ea-59dc236a7f91@free.fr> <c1762201-a1fa-8ed1-24ff-f30916ee45dd@free.fr>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1] clk: qcom: Skip halt checks on gcc_pcie_0_pipe_clk for 8998
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Amit Nischal <anischal@codeaurora.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Michael Turquette <mturquette@baylibre.com>
Message-ID: <155389876377.20095.15037552865160559827@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Fri, 29 Mar 2019 15:32:43 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marc Gonzalez (2019-03-28 09:26:59)
> On 25/03/2019 14:49, Marc Gonzalez wrote:
>=20
> > See similar issue solved by commit 5f2420ed2189
> > ("clk: qcom: Skip halt checks on gcc_usb3_phy_pipe_clk for 8998")
> >=20
> > Without this patch, PCIe PHY init fails:
> >=20
> > qcom-qmp-phy 1c06000.phy: pipe_clk enable failed err=3D-16
> > phy phy-1c06000.phy.0: phy init failed --> -16
> >=20
> > Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> > ---
> >  drivers/clk/qcom/gcc-msm8998.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8=
998.c
> > index c240fba794c7..033688264c7b 100644
> > --- a/drivers/clk/qcom/gcc-msm8998.c
> > +++ b/drivers/clk/qcom/gcc-msm8998.c
> > @@ -2161,7 +2161,7 @@ static struct clk_branch gcc_pcie_0_mstr_axi_clk =
=3D {
> > =20
> >  static struct clk_branch gcc_pcie_0_pipe_clk =3D {
> >       .halt_reg =3D 0x6b018,
> > -     .halt_check =3D BRANCH_HALT,
> > +     .halt_check =3D BRANCH_HALT_SKIP,
> >       .clkr =3D {
> >               .enable_reg =3D 0x6b018,
> >               .enable_mask =3D BIT(0),
>=20
> Actually, 5f2420ed2189 is not the only similar instance.
>=20
> $ git log --oneline -G BRANCH_HALT_SKIP drivers/clk/qcom | grep -v contro=
ller
> 924a86bf9793 clk: qcom: Skip halt checks on gcc_pcie_0_pipe_clk for 8998
> 5f2420ed2189 clk: qcom: Skip halt checks on gcc_usb3_phy_pipe_clk for 8998
> 2abf856202fd clk: qcom: gcc-msm8998: Disable halt check of UFS clocks
> 5f75b78d3d67 clk: qcom: gcc-msm8996: Disable halt check on UFS tx clock
> 12d807cd34b8 clk: qcom: gcc-msm8996: Disable halt check on UFS clocks
> 096abdc296f1 clk: msm8996-gcc: Mark halt check as no-op for USB/PCIE pipe=
_clk
> 7d99ced8f4c6 clk: qcom: Add support for BRANCH_HALT_SKIP flag for branch =
clocks
>=20

I keep asking Qualcomm engineers everytime this comes up why they can't
fix their phy initialization sequence.

Too bad they don't care anymore!

