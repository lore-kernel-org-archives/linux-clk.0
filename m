Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BC6C77B7C
	for <linux-clk@archiver.kernel.org>; Thu,  4 May 2023 20:37:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbjEDUg6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 May 2023 16:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbjEDUg2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 May 2023 16:36:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1832213C03
        for <linux-clk@vger.kernel.org>; Thu,  4 May 2023 13:29:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DB3B8616F2
        for <linux-clk@vger.kernel.org>; Thu,  4 May 2023 20:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11AAC433D2;
        Thu,  4 May 2023 20:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683232062;
        bh=OibrI2sQXPTEySu7ns9/uWCTEEglAJHiieCCCAkCdl4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=iQwuawPHTLugedtJxUuF9P1oagmM4vrotAh4Na347EJD78F++M6O+OBx1IWNv/5Or
         2gdsRnm3a/YugdPV3gzsdlxMef9WMPGv79DJLpttz1PkyRBLUTUguotfe8817caK7d
         bGD+a/DMSIS3WMLCosyAWVYt+H4Kn8BbBRZhFs847jFLmLDC4gz+FdybtJvHxaEfJD
         RLnTm98svLty66/B3D3JhGTcEP9xiEd+CepgxpYTP2z4Tj3ElKmmaNmZMRoszVvf3O
         vNO0OsPigPqJAes06d3ONonYifl/WHYwcDjBcHtZEuV8fwO43XzrWECoA4cLwU0fcE
         j6s8WcYGJ+yZg==
Date:   Thu, 4 May 2023 13:27:40 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Vadim Fedorenko <vadfed@meta.com>
Cc:     Jiri Pirko <jiri@resnulli.us>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [RFC PATCH v7 2/8] dpll: Add DPLL framework base functions
Message-ID: <20230504132740.30e19bba@kernel.org>
In-Reply-To: <ZFOUmViuAiCaHBfc@nanopsycho>
References: <20230428002009.2948020-1-vadfed@meta.com>
        <20230428002009.2948020-3-vadfed@meta.com>
        <ZFOUmViuAiCaHBfc@nanopsycho>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 4 May 2023 13:18:49 +0200 Jiri Pirko wrote:
> >diff --git a/include/uapi/linux/dpll.h b/include/uapi/linux/dpll.h
> >index e188bc189754..75eeaa4396eb 100644
> >--- a/include/uapi/linux/dpll.h
> >+++ b/include/uapi/linux/dpll.h
> >@@ -111,6 +111,8 @@ enum dpll_pin_direction {
> > 
> > #define DPLL_PIN_FREQUENCY_1_HZ		1
> > #define DPLL_PIN_FREQUENCY_10_MHZ	10000000
> >+#define DPLL_PIN_FREQUENCY_10_KHZ	10000
> >+#define DPLL_PIN_FREQUENCY_77_5_KHZ	77500  
> 
> This should be moved to patch #1.
> please convert to enum, could be unnamed.

+1, you can't edit the YNL-generated files at all.
