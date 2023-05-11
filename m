Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1C0C7EE22
	for <linux-clk@archiver.kernel.org>; Thu, 11 May 2023 13:44:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238205AbjEKNop (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 May 2023 09:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238379AbjEKNo2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 May 2023 09:44:28 -0400
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 719B1100EF;
        Thu, 11 May 2023 06:44:20 -0700 (PDT)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
        by mx.sberdevices.ru (Postfix) with ESMTP id E1E575FD13;
        Thu, 11 May 2023 16:44:17 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
        s=mail; t=1683812657;
        bh=zpRN19wKJWL95Pe9rYSROAJmHnQ4rR4hEcVtgRpKk68=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=LsEa5uuVVpI5U5qf/kO9mz6Kw6h0QV+TV7C0pfu4gmnlhZtecj13b0HrjlJiXZt4H
         XyL1v97e/SEtUCc1XXnFJcz1YQOrHokYsQS1x7qU3/ctsNcJEMRklgMSVdZSXXyjpJ
         h3E5o30imO2R1t17JImKYhIDzByfDqYeBQ3TQaucGshvbxSSQwQ8gNnHoEzZYXDXgx
         CpCFVGiUWsgZ9925kr0fMd2Z85SWnnedNpDnrBDRHay8mHx4nlRlRDzBMH5B1z/BGS
         +tPjXRY7yjpGklbGqC7V1K+reqsgmBoOjHGRpWRD43DIGuUdqk/OQ9OopDjOgCdQx8
         RKuOkISUjTWBg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
        by mx.sberdevices.ru (Postfix) with ESMTP;
        Thu, 11 May 2023 16:44:17 +0300 (MSK)
Date:   Thu, 11 May 2023 16:44:16 +0300
From:   Dmitry Rokosov <ddrokosov@sberdevices.ru>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC:     <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <khilman@baylibre.com>, <jian.hu@amlogic.com>,
        <kernel@sberdevices.ru>, <rockosov@gmail.com>,
        <linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v14 5/6] dt-bindings: clock: meson: add A1 Peripherals
 clock controller bindings
Message-ID: <20230511134416.pw4led274g72z7e6@CAB-WSD-L081021>
References: <20230426095805.15338-1-ddrokosov@sberdevices.ru>
 <20230426095805.15338-6-ddrokosov@sberdevices.ru>
 <CAFBinCCdoaNuQymcjp5j9MHn2jpPWMqXe-+EgBo=5Ot8Bwaofw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFBinCCdoaNuQymcjp5j9MHn2jpPWMqXe-+EgBo=5Ot8Bwaofw@mail.gmail.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/11 10:21:00 #21259776
X-KSMG-AntiVirus-Status: Clean, skipped
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Martin,

Sorry for the delayed response as I was on vacation without laptop.

On Mon, May 01, 2023 at 08:51:30PM +0200, Martin Blumenstingl wrote:
> Hi Dmitry,
> 
> On Wed, Apr 26, 2023 at 11:58 AM Dmitry Rokosov
> <ddrokosov@sberdevices.ru> wrote:
> >
> > Add the documentation for Amlogic A1 Peripherals clock driver,
> > and A1 Peripherals clock controller bindings.
> Maybe a native English speaker can comment on whether it's
> "peripheral" or "peripherals".
> 

Ok

> [...]
> > Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../bindings/clock/amlogic,a1-clkc.yaml       |  73 +++++++++++
> >  .../bindings/clock/amlogic,a1-pll-clkc.yaml   |   5 +-
> >  include/dt-bindings/clock/amlogic,a1-clkc.h   | 114 ++++++++++++++++++
> I have seen that Yu Tu named the S4 peripheral clock controller
> binding and driver "s4-peripherals-clkc" [0].
> Does it make sense to apply the same naming here as well?

Yes, it makes sense. I will prepare a new version with the necessary
renaming.

> 
> 
> Best regards,
> Martin
> 
> 
> [0] https://lore.kernel.org/linux-amlogic/20230417065005.24967-3-yu.tu@amlogic.com/

-- 
Thank you,
Dmitry
