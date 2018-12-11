Return-Path: <SRS0=DnCL=OU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F111C07E85
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 09:15:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D5A132082F
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 09:15:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="fGpDwENd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5A132082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbeLKJPT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Dec 2018 04:15:19 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:11167 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbeLKJPT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Dec 2018 04:15:19 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0f80230000>; Tue, 11 Dec 2018 01:15:15 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 11 Dec 2018 01:15:17 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 11 Dec 2018 01:15:17 -0800
Received: from tbergstrom-lnx.Nvidia.com (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 11 Dec
 2018 09:15:16 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id 996644053C; Tue, 11 Dec 2018 11:15:14 +0200 (EET)
Date:   Tue, 11 Dec 2018 11:15:14 +0200
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     Jon Hunter <jonathanh@nvidia.com>
CC:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 01/19] dt-bindings: clock: tegra124-dfll: Update DFLL
 binding for PWM regulator
Message-ID: <20181211091514.GA29064@pdeschrijver-desktop.Nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-2-josephl@nvidia.com>
 <af1211f0-dda0-bdde-f320-03e54f82d7e1@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <af1211f0-dda0-bdde-f320-03e54f82d7e1@nvidia.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL101.nvidia.com (172.20.187.10)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544519715; bh=JtRcGU7uSLlDQHzVE/5xrx7U9Pn2qELtrHn9KxpN8jc=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
         X-NVConfidentiality:User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=fGpDwENdzpBhTq0uThDCLcf91NWv6BUQSKdXKJhhzCTZhOVVM9fbIwftZAN8DVSWU
         iO2gVZxakPYeWOQbrpqtqSF1BiA+cVzobez1f/Wit4LyKZfRQHgFV8OxY066SjU9UK
         KZaPYzBWEjV8YB6Y/xDxjioJfkUHoUKq99tBuBIKw6w+xhHENNAVXWEc6YIqWqJOmk
         Wo2gHNnwqdmpDSsAJcZzwq1e0IaKZlKS+XNMpBagJ0UHUiuuICtyNKsUbHKKywInX9
         /fZ6iEAxCroJKyInsPkcfSea1+BB14nzvCgOawNzoj9wfvmztAoB1d/QPs7C1E2Mk6
         lRzh2vOekFH9w==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Dec 07, 2018 at 01:41:57PM +0000, Jon Hunter wrote:
> 
> On 04/12/2018 09:25, Joseph Lo wrote:
> > From: Peter De Schrijver <pdeschrijver@nvidia.com>
> > 
> > Add new properties to configure the DFLL PWM regulator support. Also
> > add an example and make the I2C clock only required when I2C support is
> > used.
> > 
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> > Signed-off-by: Joseph Lo <josephl@nvidia.com>
> > ---
> >  .../bindings/clock/nvidia,tegra124-dfll.txt   | 73 ++++++++++++++++++-
> >  1 file changed, 71 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> > index dff236f524a7..8c97600d2bad 100644
> > --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> > +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> > @@ -8,7 +8,6 @@ the fast CPU cluster. It consists of a free-running voltage controlled
> >  oscillator connected to the CPU voltage rail (VDD_CPU), and a closed loop
> >  control module that will automatically adjust the VDD_CPU voltage by
> >  communicating with an off-chip PMIC either via an I2C bus or via PWM signals.
> > -Currently only the I2C mode is supported by these bindings.
> >  
> >  Required properties:
> >  - compatible : should be "nvidia,tegra124-dfll"
> > @@ -45,10 +44,28 @@ Required properties for the control loop parameters:
> >  Optional properties for the control loop parameters:
> >  - nvidia,cg-scale: Boolean value, see the field DFLL_PARAMS_CG_SCALE in the TRM.
> >  
> > +Optional properties for mode selection:
> > +- nvidia,pwm-to-pmic: Use PWM to control regulator rather then I2C.
> > +
> >  Required properties for I2C mode:
> >  - nvidia,i2c-fs-rate: I2C transfer rate, if using full speed mode.
> >  
> > -Example:
> > +Required properties for PWM mode:
> > +- nvidia,pwm-period: period of PWM square wave in microseconds.
> > +- nvidia,init-uv: Regulator voltage in micro volts when PWM control is disabled.
> 
> Maybe consider 'pwm-inactive-voltage-microvolt'.
> 

Inactive is not very accurate. The OVR regulator will output
nvidia,align-offset-uv when the PWM input is driven low but will output
nvidia,init-uv when the PWM input is in tristate mode.

> > +- nvidia,align-offset-uv: Regulator voltage in micro volts when PWM control is
> > +			  enabled and PWM output is low.
> 
> Would this be considered the minimum pwm active voltage?
> 
> > +- nvidia,align-step-uv: Voltage increase in micro volts corresponding to a
> > +			1/33th increase in duty cycle. Eg the voltage for 2/33th
> > +			duty cycle would be:
> 
> Maybe consider 'pwm-voltage-step-microvolt'.
> 
> > +			nvidia,align-offset-uv + nvidia,align-step-uv * 2.
> > +- pinctrl-0: I/O pad configuration when PWM control is enabled.
> > +- pinctrl-1: I/O pad configuration when PWM control is disabled.
> > +- pinctrl-names: must include the following entries:
> > +  - dvfs_pwm_enable: I/O pad configuration when PWM control is enabled.
> > +  - dvfs_pwm_disable: I/O pad configuration when PWM control is disabled.
> 
> Please see Rob's feedback on the above [0].
> 
> Cheers
> Jon
> 
> [0] https://lore.kernel.org/patchwork/patch/885328/
> 
> -- 
> nvpublic
