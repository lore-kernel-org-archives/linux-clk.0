Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C349C6FA89
	for <linux-clk@archiver.kernel.org>; Tue, 13 Sep 2022 12:26:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbiIMM0P (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Sep 2022 08:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbiIMM0O (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Sep 2022 08:26:14 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E0AA15833;
        Tue, 13 Sep 2022 05:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1663071973; x=1694607973;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SqOTgOuLTP/XHZhzLnF39DanQPgzEKUqFF/A9kYsZPY=;
  b=NcXHtTmDHfGzN42eNNEIK2xpXZ04kfB4fh48O+hQpC7QTKdBKfiKyC6r
   GQSTieZJU2vZEdw9cG0KACCzJ8PXAITb6wOJ+nIldmjj+2zsdrDOrTp4W
   BDD82QXHkuLn0KOBLJrxJ4pCCRb5VfAnrQEZTQmIKZN/kaw5/TB0I+FpU
   QHqMNSs9EIqAXY1YqJaDYkuN3O5Aj7z0HnkUfvvglS0NiPppHvsU6T01K
   foQLbo4PC8mBjQXNGYzRiSiotJcv1dwmdoJISrxlQPxJkZ7l1e5v7+Zn+
   V8Sk+9pIHZ34zujzA5BhVQBUpD0bYXaL/JJxtxbF0BuOhxeen1/U1JMNK
   w==;
X-IronPort-AV: E=Sophos;i="5.93,312,1654552800"; 
   d="scan'208";a="26150113"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 13 Sep 2022 14:26:11 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 13 Sep 2022 14:26:10 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 13 Sep 2022 14:26:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1663071971; x=1694607971;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=SqOTgOuLTP/XHZhzLnF39DanQPgzEKUqFF/A9kYsZPY=;
  b=LlmzZEEZLW9yctPd0crmQjRdHfkMPBZW64DBdjIU9j9SJQtyW8zPUrsW
   mwvmughC+jJAmwSBelzViF6JJoovbD19QBokOgrBcxgkfFymUP4h2oANl
   zVqFdsxZsWgOmH2S5jjkblxRNATI9qgTnnwnWa67wMqzDTAl83iXMi6WZ
   99GCffUtXE03abuCb5spC0RXuOeuNZTt/xR3kL+E59R0+BaEDg1K9YewD
   HBcxRKWe7pwmf+CGxDUwvKXxC2cAqQ4BF8rFCPIU2LMZCY+awTEuoYd5p
   c5JeM79z3cWJhv+CFC6dTBWpzPJ7+LAkWU5n0TWaN2JJeUG/Cz3u/e5Jo
   A==;
X-IronPort-AV: E=Sophos;i="5.93,312,1654552800"; 
   d="scan'208";a="26150112"
Subject: Re: [PATCH v2 1/2] dt-bindings: clocks: imx8mp: Add ID for usb suspend clock
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 13 Sep 2022 14:26:11 +0200
Received: from steina-w.localnet (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 83845280056;
        Tue, 13 Sep 2022 14:26:10 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Li Jun <jun.li@nxp.com>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-imx@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Date:   Tue, 13 Sep 2022 14:26:07 +0200
Message-ID: <8400769.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <1662547028-22279-1-git-send-email-jun.li@nxp.com>
References: <1662547028-22279-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am Mittwoch, 7. September 2022, 12:37:07 CEST schrieb Li Jun:
> usb suspend clock has a gate shared with usb_root_clk.
> 
> Fixes: 9c140d9926761 ("clk: imx: Add support for i.MX8MP clock driver")
> Cc: stable@vger.kernel.org # v5.19+
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  include/dt-bindings/clock/imx8mp-clock.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/imx8mp-clock.h
> b/include/dt-bindings/clock/imx8mp-clock.h index 9d5cc2ddde89..1417b7b1b7df
> 100644
> --- a/include/dt-bindings/clock/imx8mp-clock.h
> +++ b/include/dt-bindings/clock/imx8mp-clock.h
> @@ -324,8 +324,9 @@
>  #define IMX8MP_CLK_CLKOUT2_SEL			317
>  #define IMX8MP_CLK_CLKOUT2_DIV			318
>  #define IMX8MP_CLK_CLKOUT2			319
> +#define IMX8MP_CLK_USB_SUSP			320
> 
> -#define IMX8MP_CLK_END				320
> +#define IMX8MP_CLK_END				321
> 
>  #define IMX8MP_CLK_AUDIOMIX_SAI1_IPG		0
>  #define IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1		1

Together with the series [1] & [2] this fixes devices detection when the 
onboard hub is in runtime suspend. For both patches:

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

[1] https://lore.kernel.org/all/1663067426-29534-1-git-send-email-jun.li@nxp.com/
[2] https://lore.kernel.org/all/20220907144624.2810117-1-alexander.stein@ew.tq-group.com/



