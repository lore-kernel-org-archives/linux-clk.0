Return-Path: <SRS0=klTJ=DV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B0FC433E7
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 17:07:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69D0B21D7F
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 17:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602695237;
	bh=1j68IInfFMzISlMm5G1Uz+Xp8Oykr8F5iO85SNVoQxg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=OkcplD3V8TPwKChc5MLilTxH5OiJH3CfPTT0jrHt03Qi9NkDvAHIs2x0ohNkQU/rZ
	 DgZlKf6bIsLaIkqjWwqKrri8e9Jv2qjY9jsCukdV4EAV1TlQ/bZD+GqfvXXtQWY9B9
	 krDIL96GA9aO8SggGoV2D/Wcovpjdh0CQSwz5ZxU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730924AbgJNRHR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Oct 2020 13:07:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:45398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728955AbgJNRHQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 14 Oct 2020 13:07:16 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1DF692173E;
        Wed, 14 Oct 2020 17:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602695236;
        bh=1j68IInfFMzISlMm5G1Uz+Xp8Oykr8F5iO85SNVoQxg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hogGLwiRNYu/XXTYO2J2ghIivS+2DiaHv8o5CVDWp8iSzEyCtt/0ZYZkt4FZ6lVOX
         8oXw76Lnfi3bUIkTiM91Et1dSHVV+1lyRQUmA6PNGOHnRzHckeRXSFFobK/l9YE8go
         eIttcv11rlVu1TFrcz6+AfTPKXinAFeXTJC1r/hY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1602686072-28296-1-git-send-email-claudiu.beznea@microchip.com>
References: <1602686072-28296-1-git-send-email-claudiu.beznea@microchip.com>
Subject: Re: [PATCH] clk: at91: sam9x60: support only two programmable clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        mturquette@baylibre.com, nicolas.ferre@microchip.com
Date:   Wed, 14 Oct 2020 10:07:14 -0700
Message-ID: <160269523470.884498.16312912738130213211@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Claudiu Beznea (2020-10-14 07:34:32)
> According to datasheet (Chapter 29.16.13, PMC Programmable Clock Register)
> there are only two programmable clocks on SAM9X60.
>=20
> Fixes: 01e2113de9a5 ("clk: at91: add sam9x60 pmc driver")
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---

Applied to clk-next
