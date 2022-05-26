Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD3DC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 26 May 2022 11:36:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbiEZLgV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 May 2022 07:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiEZLgT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 May 2022 07:36:19 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAD40140E6
        for <linux-clk@vger.kernel.org>; Thu, 26 May 2022 04:36:18 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 7DFDF21A4F;
        Thu, 26 May 2022 11:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1653564977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ns+wnQxEawLT8A3DMpgDcFnqs12/2ed0iZ+HVkNrC+s=;
        b=Vmv09bpwfl2V0Ig6JR3GpHFJtPkgWEETJAerrUWxdf69c61IxjhW5cZCLRcv0Z7fA9MXJl
        ZOQDEsrlagtqYP4eC7JfTyPvOgzI3AZekVoSR+43Fo0NNTzJCuWveQQaPR4sp0sHPleNhh
        QS+0/Th/kA4hYUVV9PiBjezutqQuNW8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1653564977;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ns+wnQxEawLT8A3DMpgDcFnqs12/2ed0iZ+HVkNrC+s=;
        b=n4JRjLIPvsFBLa/o6Nma8SAgPLEsyPrUKr3rUUNcFxHtlrYScgeNrhtqGvxSJsCkjpZoAN
        UIFm3anhw5lrNACQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 63E5013B05;
        Thu, 26 May 2022 11:36:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id dWI6GDFmj2KpPwAAMHmgww
        (envelope-from <iivanov@suse.de>); Thu, 26 May 2022 11:36:17 +0000
Date:   Thu, 26 May 2022 14:36:16 +0300
From:   "Ivan T. Ivanov" <iivanov@suse.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Guillaume GARDET <guillaume.gardet@arm.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/3] clk: bcm: rpi: Add support for three more clocks
Message-ID: <20220526113616.aqpzj4ojseeropjz@suse>
References: <20220428065743.94967-1-iivanov@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428065743.94967-1-iivanov@suse.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04-28 09:57, Ivan T. Ivanov wrote:
> Date: Thu, 28 Apr 2022 09:57:40 +0300
> From: "Ivan T. Ivanov" <iivanov@suse.de>
> To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
>  <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
> Cc: Maxime Ripard <maxime@cerno.tech>, Dave Stevenson
>  <dave.stevenson@raspberrypi.com>, Guillaume GARDET
>  <guillaume.gardet@arm.com>, bcm-kernel-feedback-list@broadcom.com,
>  linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
>  linux-arm-kernel@lists.infradead.org, "Ivan T. Ivanov" <iivanov@suse.de>
> Subject: [PATCH v4 0/3] clk: bcm: rpi: Add support for three more clocks
> Message-Id: <20220428065743.94967-1-iivanov@suse.de>
> 
> Add missing clock required by RPiVid video decoder and provide more
> reliable and accurate source for HDMI pixel and video encoder clocks.
> 

Hi Stephen, Michael. What is the plan for this series of patches?

Regards,
Ivan

> Changes since v3
> - Put back support for VEC clock, which was actually one of
>   reasons for this patch-set [1]. I mixed "HEVC" vs. "VEC", sorry.
> 
>   [1] https://bugzilla.suse.com/show_bug.cgi?id=1198942
> 
> Changes since v2
> - Added Acks from Maxime Ripard and Dave Stevenson
> 
> Changes since v1
> - Drop RPI_FIRMWARE_VEC_CLK_ID clock it doesn't seems to be used.
> - Rework downstream changes on top of recent Maxime changes.
> 
> Dom Cobley (1):
>   clk: bcm: rpi: Add support for VEC clock
> 
> Ivan T. Ivanov (2):
>   clk: bcm: rpi: Add support HEVC clock
>   clk: bcm: rpi: Handle pixel clock in firmware
> 
>  drivers/clk/bcm/clk-raspberrypi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> -- 
> 2.34.1
> 
