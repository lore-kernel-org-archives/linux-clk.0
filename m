Return-Path: <SRS0=DnCL=OU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D3BC07E85
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 09:16:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8F46F20849
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 09:16:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Pmfyfouw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F46F20849
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbeLKJQp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Dec 2018 04:16:45 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:15426 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbeLKJQo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Dec 2018 04:16:44 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0f80780000>; Tue, 11 Dec 2018 01:16:40 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 11 Dec 2018 01:16:43 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 11 Dec 2018 01:16:43 -0800
Received: from tbergstrom-lnx.Nvidia.com (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 11 Dec
 2018 09:16:43 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id 0E31A4053C; Tue, 11 Dec 2018 11:16:41 +0200 (EET)
Date:   Tue, 11 Dec 2018 11:16:41 +0200
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     Jon Hunter <jonathanh@nvidia.com>
CC:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 01/19] dt-bindings: clock: tegra124-dfll: Update DFLL
 binding for PWM regulator
Message-ID: <20181211091641.GB29064@pdeschrijver-desktop.Nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-2-josephl@nvidia.com>
 <af1211f0-dda0-bdde-f320-03e54f82d7e1@nvidia.com>
 <46b5eafa-00a0-1d91-1f4d-97ab119fcf21@nvidia.com>
 <e61b1da8-78cd-c3d4-9878-c25fd9c89ba3@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e61b1da8-78cd-c3d4-9878-c25fd9c89ba3@nvidia.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL101.nvidia.com (172.20.187.10)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544519800; bh=A411QSLmIPpAC1NMANbP/z9YFRgAKuIPGAUL3gFl+v8=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Disposition:
         Content-Transfer-Encoding:In-Reply-To:X-NVConfidentiality:
         User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=PmfyfouwRrR7+LsbYUDw/630/hG0H+8bVLp2kITlgi8c0LaSusGPT+c5hJ3R2gbWf
         05zwymmk9fk5Rek5V3c8DVLtmeJQ5AxtZU6/7QMgZUiED5ueH3GabZawXp9uAMsjwH
         y++keznCMNFT7NLyxPtNd5gXgbwHFurz+5C/cTPNxLNHBXU1o/LYArhjz2P6gYxFpy
         3HsJhcd10hOUWX005cZj4kWDjmZFMb/2WfLKyTwG+XxrTIJxKidmYHZmg8qXG161W6
         fBxl0f7PqUerGPEKQKycdM6Qg35f7DrFFNKL7BqSX27uidtkBSQfSDu6vA2OKqw41G
         nsbH2Iey46ptQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Dec 10, 2018 at 08:59:10AM +0000, Jon Hunter wrote:
>=20
> On 10/12/2018 08:49, Joseph Lo wrote:
> > Hi Jon,
> >=20
> > Thanks for reviewing this series.
> >=20
> > On 12/7/18 9:41 PM, Jon Hunter wrote:
> >>
> >> On 04/12/2018 09:25, Joseph Lo wrote:
> >>> From: Peter De Schrijver <pdeschrijver@nvidia.com>
> >>>
> >>> Add new properties to configure the DFLL PWM regulator support. Also
> >>> add an example and make the I2C clock only required when I2C support =
is
> >>> used.
> >>>
> >>> Cc: devicetree@vger.kernel.org
> >>> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> >>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> >>> ---
> >>> =A0 .../bindings/clock/nvidia,tegra124-dfll.txt=A0=A0 | 73 ++++++++++=
++++++++-
> >>> =A0 1 file changed, 71 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git
> >>> a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> >>> b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> >>> index dff236f524a7..8c97600d2bad 100644
> >>> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.tx=
t
> >>> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.tx=
t
> >>> @@ -8,7 +8,6 @@ the fast CPU cluster. It consists of a free-running
> >>> voltage controlled
> >>> =A0 oscillator connected to the CPU voltage rail (VDD_CPU), and a
> >>> closed loop
> >>> =A0 control module that will automatically adjust the VDD_CPU voltage=
 by
> >>> =A0 communicating with an off-chip PMIC either via an I2C bus or via
> >>> PWM signals.
> >>> -Currently only the I2C mode is supported by these bindings.
> >>> =A0 =A0 Required properties:
> >>> =A0 - compatible : should be "nvidia,tegra124-dfll"
> >>> @@ -45,10 +44,28 @@ Required properties for the control loop paramete=
rs:
> >>> =A0 Optional properties for the control loop parameters:
> >>> =A0 - nvidia,cg-scale: Boolean value, see the field
> >>> DFLL_PARAMS_CG_SCALE in the TRM.
> >>> =A0 +Optional properties for mode selection:
> >>> +- nvidia,pwm-to-pmic: Use PWM to control regulator rather then I2C.
> >>> +
> >>> =A0 Required properties for I2C mode:
> >>> =A0 - nvidia,i2c-fs-rate: I2C transfer rate, if using full speed mode=
.
> >>> =A0 -Example:
> >>> +Required properties for PWM mode:
> >>> +- nvidia,pwm-period: period of PWM square wave in microseconds.
> >>> +- nvidia,init-uv: Regulator voltage in micro volts when PWM control
> >>> is disabled.
> >>
> >> Maybe consider 'pwm-inactive-voltage-microvolt'.
> > Ah, I think I need to refine the description here. It should be
> > something like below.
> > =A0- nvidia,pwm-init-microvolt : Regulator voltage in micro volts when =
PWM
> > control is initialized
> >=20
> > This is the initial voltage that when we just initialize the DFLL
> > hardware for PWM output. And before we switch the CPU clock from PLLX t=
o
> > DFLL, we will enable DFLL hardware in closed loop mode which will aplly
> > the DVFS table that was calculated from CVB table.
> >=20
> > The original description maybe make you think that it's the working
> > voltage when it's under open-loop mode. But it's not. Sorry.
> >=20
> > When we working on open-loop mode which will switch to low voltage rang=
e
> > which also follows the DVFS table. Not this one.
>=20
> OK, but I am still not sure what this voltage is. I mean that I
> understand it is the initial voltage, but how exactly do we define this
> number? Where does it come from, how is this determined?
>=20

It is set by a resistive divider on the board iirc.

> >>
> >>> +- nvidia,align-offset-uv: Regulator voltage in micro volts when PWM
> >>> control is
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enabled and PWM output is lo=
w.
> >>
> >> Would this be considered the minimum pwm active voltage?
> > This would be used for minimum voltage for LUT table, which is the tabl=
e
> > that PMIC can output. The real minimum voltage in PWM mode still depend=
s
> > on the CVB table.
> >=20
> > So maybe change this one to 'nvidia,pwm-offset-uv'.
>=20
> So is this the min supported by the PMIC? Maybe the name should reflect
> that because the above name does not reflect this. Furthermore, if this
> is a min then maybe the name should use 'min' as opposed to 'offset'.
> for example, 'nvidia,pwm-pmic-min-microvolts'.
>=20
> Does this need to be described in DT, can it not be queried from the PMIC=
?
>=20

There is no interface to query anything from the OVR regulator.

Peter.
