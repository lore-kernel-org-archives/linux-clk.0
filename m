Return-Path: <SRS0=Db4S=ZG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EAA1C432C3
	for <linux-clk@archiver.kernel.org>; Thu, 14 Nov 2019 12:22:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB036206DA
	for <linux-clk@archiver.kernel.org>; Thu, 14 Nov 2019 12:22:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/3xPO5k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfKNMWc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Nov 2019 07:22:32 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54470 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbfKNMWc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Nov 2019 07:22:32 -0500
Received: by mail-wm1-f68.google.com with SMTP id z26so5448475wmi.4
        for <linux-clk@vger.kernel.org>; Thu, 14 Nov 2019 04:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8bzVgw88CaLy2KUogwITc+dBMd5fiNXna9S1N2mnVQs=;
        b=X/3xPO5kuNrBJLKweoYmYcyV8zgmox/eflPhHwsYyXS7FILfmGbQgR4HDTanXXJT2z
         cdfY65Mu6DedGpHOS6jdMXRXK1WI7U6pGhqmAcN5GDQOPrhCLiqgIA996toqyUiS5svY
         AdpWBzI74pB4lhMhd1s6OzuxLCNzSQDRK+g7vCWBsu7PVyCoUrbBlPhZUwlMRvyRbDRh
         q9GmBslOQBthGM9f6pLnp6HupTVFxlWHg6/8KjsKlOhL+m2hTxDhMsUm8YKc6an1iw0I
         z13yn63SLPoqPN88ZXRzZ3a0bqxUx+NnqcANLWRNr9ah6pTibe2jsH5Jb0stN/hFzIHr
         LW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8bzVgw88CaLy2KUogwITc+dBMd5fiNXna9S1N2mnVQs=;
        b=hwLI1GGPBtntJqUYVevMmqChLJekNOZFOW2V1riDK5REJJ1Sprpa9eqcqbAO7vMWv1
         pwoBcwgM7M5uJ0DJeMZgrJBw3rEzbCTFN9Pw0ZIZ+BwrhlCwOUwsOV+W5ZnBcCZfj0Bb
         p9o6f16P6CeBz5oDgdWvpT83VkwflQRTsJB0822zH1xAXysQN74uRIJGdwjQ2CRvAWN7
         YYYWKsCQw8xJzmJdSUoaDzEhm7MJR+FH8cgONDqEC8W92DXqVASEnwXHZMJibIGnw/qg
         pCwfHEPnq+Wx97NLFgV2TufVuKRHbtcabA3E4d5D2kjTsz0dfpodX/X2uH6B3Mlhb+vC
         OaPg==
X-Gm-Message-State: APjAAAXJ8JCdN0oQKxC+84mqbL+wqPeRfcTrtQHKlvh22yCIccsCLEMk
        8/2VtBW0QjJD5ijs7yDDSto=
X-Google-Smtp-Source: APXvYqzq0axH9K1SI9aOBmROdq4m8CEr9kfWQqSRK/gLkmHzB7mxHgdPrRx65210ZXzqZgEsaNpR3Q==
X-Received: by 2002:a1c:dc44:: with SMTP id t65mr7881852wmg.169.1573734150490;
        Thu, 14 Nov 2019 04:22:30 -0800 (PST)
Received: from localhost ([193.47.161.132])
        by smtp.gmail.com with ESMTPSA id 76sm6493422wma.0.2019.11.14.04.22.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2019 04:22:29 -0800 (PST)
Date:   Thu, 14 Nov 2019 13:22:28 +0100
From:   Oliver Graute <oliver.graute@gmail.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, linux-imx@nxp.com, kernel@pengutronix.de,
        fabio.estevam@nxp.com, shawnguo@kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V5 00/11] clk: imx8: add new clock binding for better pm
 support
Message-ID: <20191114122228.GI4147@optiplex>
References: <1568081408-26800-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568081408-26800-1-git-send-email-aisheng.dong@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/09/19, Dong Aisheng wrote:
> This is a follow up of this patch series.
> https://patchwork.kernel.org/cover/10924029/
> [V2,0/2] clk: imx: scu: add parsing clocks from device tree support
Hello Aisheng,

will there be an updated version of this two patch series for recent
linux-next? Then I can test it on my two imx8qm boards.

Best regards,

Oliver
