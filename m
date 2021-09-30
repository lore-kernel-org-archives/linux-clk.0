Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A95C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 30 Sep 2021 15:51:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1BCA361267
	for <linux-clk@archiver.kernel.org>; Thu, 30 Sep 2021 15:51:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346571AbhI3Pxd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Sep 2021 11:53:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:39432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346501AbhI3Pxc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 30 Sep 2021 11:53:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E6B66120D;
        Thu, 30 Sep 2021 15:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633017110;
        bh=FWQpFZPZBLpdmTrrwsbPqNU5OTmgWjPWJZMzALECrJc=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=AuVtTU/f9thasFp2vN5QBbvZNV2GJ+MhaZ3qs5j1IRRuwP6BMiINBhrdOaHazPWFB
         BYpDiTaFJryPX9Wct1XN58ZrRHvCZpClrMuICrjQp0sPuzEyv1Y8XKZrzMvd/Oh8tM
         kItNkco0yR/7fOBmzPLwsBf18TBnRgGFWN5F5TxANR3NuYAUXCLa3qL8C/rXVcC0FK
         gU2UsHs8GPYXjfo4xOZEvt2iHLZJXOV4Iw60hQJ5krJ+rL+WB0cA2NN/sHkStCE9xF
         YGlPrDdaI8atyqeaGflz6OyNwZocNmhu8SGHP5ZJFRc/TrlyvJrL72BbDn+IXVddVi
         elidoLRVNfewg==
Message-ID: <d348a2dc080d24d43d55128223be6e4a88c73053.camel@kernel.org>
Subject: Re: [PATCH 3/5] drm/vc4: hdmi: Set a default HSM rate
From:   nicolas saenz julienne <nsaenz@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Michael Stapelberg <michael@stapelberg.ch>,
        Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 30 Sep 2021 17:51:45 +0200
In-Reply-To: <20210922125419.4125779-4-maxime@cerno.tech>
References: <20210922125419.4125779-1-maxime@cerno.tech>
         <20210922125419.4125779-4-maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 2021-09-22 at 14:54 +0200, Maxime Ripard wrote:
> When the firmware doesn't setup the HSM rate (such as when booting
> without an HDMI cable plugged in), its rate is 0 and thus any register
> access results in a CPU stall, even though HSM is enabled.
> 
> Let's enforce a minimum rate at boot to avoid this issue.
> 
> Fixes: 4f6e3d66ac52 ("drm/vc4: Add runtime PM support to the HDMI encoder driver")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
Tested-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Regards,
Nicolas

