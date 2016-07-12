Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:53444 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751887AbcGLJvQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 12 Jul 2016 05:51:16 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Wan Zongshun <vw@iommu.org>, devicetree@vger.kernel.org,
	jason@lakedaemon.net, Wan Zongshun <mcuos.com@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	p.zabel@pengutronix.de, Thomas Gleixner <tglx@linutronix.de>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 06/10] soc: Add SoC specific driver support for nuc900
Date: Tue, 12 Jul 2016 11:50:28 +0200
Message-ID: <1510379.YVtTfMI32O@wuerfel>
In-Reply-To: <5784B302.80307@iommu.org>
References: <1468135649-19980-1-git-send-email-vw@iommu.org> <4765191.NGpMC1JR46@wuerfel> <5784B302.80307@iommu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tuesday, July 12, 2016 5:06:10 PM CEST Wan Zongshun wrote:
> On 2016年07月11日 16:03, Arnd Bergmann wrote:
> > On Sunday, July 10, 2016 3:27:26 PM CEST Wan Zongshun wrote:
> > I'm still a bit unsure about the set of attributes here.
> >
> > - The "soc_id" is read from the device tree from the field that contains
> >    the board name, I think for consistency you should try to map the
> >    GCR_CHIPID to the name of the SoC and assign that here
> >
> > - The "machine" is hardcoded to "NUC900EVB", which in turn looks like
> >    a particular board but not the one you are running on. Maybe read
> >    that from the DT instead?
> >
> > - The "revision" is not filled at all, I would suggest using something
> >    derived from the GCR_CHIPID register here
> >
> > - you have two nonstandard attributes "chipid" and "version", which
> >    I'd hope to avoid -- the set of standard attributes is supposed to
> >    give enough information about the machine, and platform independent
> >    user space will never read those.
> 
> So, Maybe I can remove those two codes, no need push those information 
> to user space?
> 
> device_create_file(soc_device_to_device(soc_dev), &nuc900_chipid_attr);
> device_create_file(soc_device_to_device(soc_dev), &nuc900_version_attr);
> 

Yes, that would be good.

	Arnd
