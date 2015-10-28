Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:34878 "EHLO
	mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751526AbbJ1D5v (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 27 Oct 2015 23:57:51 -0400
Received: by vkex70 with SMTP id x70so11705909vke.2
        for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2015 20:57:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BY1PR0301MB13039481CB958A3323FB03B2823E0@BY1PR0301MB1303.namprd03.prod.outlook.com>
References: <1444891672-32117-1-git-send-email-bhupesh.sharma@freescale.com>
	<1444891672-32117-6-git-send-email-bhupesh.sharma@freescale.com>
	<5383901.aC2HYopUNW@wuerfel>
	<BY1PR0301MB13039481CB958A3323FB03B2823E0@BY1PR0301MB1303.namprd03.prod.outlook.com>
Date: Wed, 28 Oct 2015 09:27:48 +0530
Message-ID: <CAHM4w1=-qF_JL-PbyNerzRrAVfapswmaZkcqQWeoMxWbV=ghKQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] doc/bindings: Update Layerscape PCIe devicetree
 binding to be more flexible
From: Pratyush Anand <pratyush.anand@gmail.com>
To: Sharma Bhupesh <bhupesh.sharma@freescale.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Pratyush Anand <panand@redhat.com>,
	Gabriel Fernandez <gabriel.fernandez@linaro.org>,
	"fabrice.gasnier@st.com" <fabrice.gasnier@st.com>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"bhupesh.linux@gmail.com" <bhupesh.linux@gmail.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"Catalin.Marinas@arm.com" <Catalin.Marinas@arm.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	Stuart Yoder <stuart.yoder@freescale.com>,
	Scott Wood <scottwood@freescale.com>,
	"Lian M.H." <Minghuan.Lian@freescale.com>,
	"olof@lixom.net" <olof@lixom.net>, Li Leo <LeoLi@freescale.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Bhupesh,


On Fri, Oct 16, 2015 at 1:41 AM, Sharma Bhupesh
<bhupesh.sharma@freescale.com> wrote:
> I think this can be moved to the generic bindings for DWC3 PCIe driver. However
> I cannot vouch if the same is true for usage of this IP in other SoCs and it
> will not break existing drivers if this property is not defined in their SoC DTSI.
>
> So adding a few old ST colleagues (Pratyush, Gabriel, Fabrice), who I am sure have used this IP in ST SoCs
> for their comments as well.

Sorry for delayed response. Was on leave and away from internet.

>
> So the question would be - do you think it will be ok to make the clock related
> properties optional in 'designware-pcie.txt' rather than required.

I think they should have been optional.

~Pratyush
