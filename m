Return-Path: <SRS0=o7Wn=UM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13746C31E45
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jun 2019 15:31:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DDDF62082C
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jun 2019 15:31:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="IdBPbj97"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbfFMPbw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jun 2019 11:31:52 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:7937 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728603AbfFMK7d (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jun 2019 06:59:33 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d022c950000>; Thu, 13 Jun 2019 03:59:33 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 13 Jun 2019 03:59:32 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 13 Jun 2019 03:59:32 -0700
Received: from tbergstrom-lnx.Nvidia.com (172.20.13.39) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Thu, 13 Jun 2019 10:59:31 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id A8822428B8; Thu, 13 Jun 2019 13:59:29 +0300 (EEST)
Date:   Thu, 13 Jun 2019 13:59:29 +0300
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     JC Kuo <jckuo@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
Subject: Re: [PATCH] clk: tegra210: fix PLLU and PLLU_OUT1
Message-ID: <20190613105929.GK29894@pdeschrijver-desktop.Nvidia.com>
References: <20190612031434.10055-1-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190612031434.10055-1-jckuo@nvidia.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560423573; bh=v1py7QTFG2BKEopwknS7L1WP+gICKc/O7CX2E1acTto=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
         X-NVConfidentiality:User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=IdBPbj97CJzu0vlq3e8mL9BTpjCv/QW0hFG2i09Kmp2cff5l2IiUFHmefH/NL+OdK
         j9J5QW394DzaIMyFs3YrNmAvx/RdYX6n3/GH1kt7PZPExmuVNP3uZSkIeFu1yZke+l
         ULWF/IuvB5GDIC9kVT0wkDsFOF/uSKrEdXjgGiAxKHqdJrQqlmXAmlRGVNUF8/RoRa
         NcpfR3SXpf0J2b0mfagGNcaQDBge8NmSKbs31Xkj3Yc3AGfY7nbhfPFBhrXC7236AM
         A8GYAycHaYdx/3Ilm+YNOYd5yuMYPXdwO4WFlPE/qBjvr8BhLnJFNSPojiiqmLpr5d
         G/A57X+FL3MBw==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jun 12, 2019 at 11:14:34AM +0800, JC Kuo wrote:
> Full-speed and low-speed USB devices do not work with Tegra210
> platforms because of incorrect PLLU/PLLU_OUT1 clock settings.
> 
> When full-speed device is connected:
> [   14.059886] usb 1-3: new full-speed USB device number 2 using tegra-xusb
> [   14.196295] usb 1-3: device descriptor read/64, error -71
> [   14.436311] usb 1-3: device descriptor read/64, error -71
> [   14.675749] usb 1-3: new full-speed USB device number 3 using tegra-xusb
> [   14.812335] usb 1-3: device descriptor read/64, error -71
> [   15.052316] usb 1-3: device descriptor read/64, error -71
> [   15.164799] usb usb1-port3: attempt power cycle
> 
> When low-speed device is connected:
> [   37.610949] usb usb1-port3: Cannot enable. Maybe the USB cable is bad?
> [   38.557376] usb usb1-port3: Cannot enable. Maybe the USB cable is bad?
> [   38.564977] usb usb1-port3: attempt power cycle
> 
> This commit fixes the issue by:
>  1. initializing PLLU_OUT1 before initializing XUSB_FS_SRC clock
>     because PLLU_OUT1 is parent of XUSB_FS_SRC.
>  2. changing PLLU post-divider to /2 (DIVP=1) according to Technical
>     Reference Manual.
> 
> Fixes: e745f992cf4b ("clk: tegra: Rework pll_u")
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>
