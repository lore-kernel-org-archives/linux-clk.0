Return-Path: <SRS0=h55i=QZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFBDC43381
	for <linux-clk@archiver.kernel.org>; Mon, 18 Feb 2019 20:34:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64B8A20700
	for <linux-clk@archiver.kernel.org>; Mon, 18 Feb 2019 20:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550522042;
	bh=P6lSUXknodIFXmFgoB/x2BT5r86NeJAHZReuyH6rTdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=0YxEe65oiWsJxSiLYodxjcyWbWOhDvEc5Ei7xCmgtCakFJ+vBR747qJWfDB996UCj
	 yGJRdYDQSmETQfbSYUIiP0xmILxqQd2YhWO6b8KNy62C7BThG+geCipIt2I/5sj5UV
	 LsaVeMfe29ATJdwJJIR10u6jSz8QBETioZ07JuGM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729653AbfBRUeA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Feb 2019 15:34:00 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40974 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726831AbfBRUd7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Feb 2019 15:33:59 -0500
Received: by mail-ot1-f65.google.com with SMTP id t7so14086158otk.8;
        Mon, 18 Feb 2019 12:33:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tI0tOm+JTfqXv6/Wd6g7Josnoz8kBg/ODVHIVdK6Mn4=;
        b=WBvFy4QZP5Rk3eKF0Pr8T21AvsflkjfBnAAlVmHySUH29rVnXDFjOCPmixfck0SSI7
         dVGtyYrdefObcSx159QmfcUqqzI1sPLXOMPckUSO8GAqI9iEhJ13IrXhL7dJuHfZjsAQ
         27bOLnl0iq5BPQFnmr7YtO5cQ3efpi6LzflQ94MIe4ZwXyhT0NDCEnpZzU+z1k7AiPXY
         ry3HP4PM1Qo71UH/7ZTi3ElMYLU3PZ2MVcKI2Kgp44uI9Ek1xpGegSbrn70PEc3nNtOo
         BWUSmfxS8pt2aYER03tfk/4QRCqdIa2/ZJta6llIG3NooMU/KpTHq/YHmGB2+TTjHX+j
         g+lQ==
X-Gm-Message-State: AHQUAuYm6gcQtYbGwekeuZ/QVMUK/OGZ2kvW0MSRtY0Y/GcPsmmB2lP9
        bbGqQOnjc6qO0rewctvitg+oIFfa4A==
X-Google-Smtp-Source: AHgI3IbpjZ1kD4A9v/21DquVqMuPSCJ9I6m6Oze8v0VxHEzoPK3kpDUo80wYDtAvHOEphl55r3jUYg==
X-Received: by 2002:a9d:27e6:: with SMTP id c93mr14901213otb.195.1550522038719;
        Mon, 18 Feb 2019 12:33:58 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l204sm6436492oia.54.2019.02.18.12.33.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Feb 2019 12:33:58 -0800 (PST)
Date:   Mon, 18 Feb 2019 14:33:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "David S. Miller" <davem@davemloft.net>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, linux-can@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: can: rcar_canfd: Document r8a774a1
 support
Message-ID: <20190218203357.GA19340@bogus>
References: <1547736856-16539-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547736856-16539-4-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1547736856-16539-4-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 17 Jan 2019 14:54:16 +0000, Fabrizio Castro wrote:
> Document support for rcar_canfd on R8A774A1 SoC devices.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> ---
> This patch depends on:
> https://patchwork.kernel.org/patch/10766781/
> 
>  Documentation/devicetree/bindings/net/can/rcar_canfd.txt | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
