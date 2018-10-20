Return-Path: <SRS0=uWeH=NA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E8DC67863
	for <linux-clk@archiver.kernel.org>; Sat, 20 Oct 2018 23:54:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE37720673
	for <linux-clk@archiver.kernel.org>; Sat, 20 Oct 2018 23:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE37720673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buserror.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbeJUIGV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 21 Oct 2018 04:06:21 -0400
Received: from baldur.buserror.net ([165.227.176.147]:48582 "EHLO
        baldur.buserror.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726624AbeJUIGV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 21 Oct 2018 04:06:21 -0400
Received: from [2601:449:8400:7293:12bf:48ff:fe84:c9a0]
        by baldur.buserror.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <oss@buserror.net>)
        id 1gE14C-0007fh-7b; Sat, 20 Oct 2018 18:54:00 -0500
Message-ID: <bb158670f1556156f17c3a9eefaa0a5e35c1591e.camel@buserror.net>
From:   Scott Wood <oss@buserror.net>
To:     andy.tang@nxp.com, mturquette@baylibre.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Date:   Sat, 20 Oct 2018 18:53:58 -0500
In-Reply-To: <20180919073906.34187-2-andy.tang@nxp.com>
References: <20180919073906.34187-1-andy.tang@nxp.com>
         <20180919073906.34187-2-andy.tang@nxp.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2601:449:8400:7293:12bf:48ff:fe84:c9a0
X-SA-Exim-Rcpt-To: andy.tang@nxp.com, mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
X-SA-Exim-Mail-From: oss@buserror.net
Subject: Re: [PATCH 2/3] powerpc: t102x: upgrade the legacy clock node
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 2018-09-19 at 15:39 +0800, andy.tang@nxp.com wrote:
> +clockgen: global-utilities@e1000 {
> +	compatible = "fsl,qoriq-clockgen";

Where does this compatible string come from?

> +		compatible = "fsl,t1023-clockgen";
>  	};

And here you overwrite it with only the chip-specific compatible?

Is t1023 incompatible with both fsl,qoriq-clockgen-1.0 and fsl,qoriq-clockgen-
2.0?  The existing dts says 2.0; is that wrong?

BTW, assuming it is 2.0 compatible and thus the use of qoriq-clockgen2.dtsi is
correct, the best course of action is probably to to remove the legacy stuff
from all fsl chips, rather than introduce a new dtsi.  In fact it'd be nice to
see it all removed in any case. :-)

Also, please post any patches that you want me to apply to the linuxppc-dev
mailing list.

-Scott

