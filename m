Return-Path: <SRS0=EEPi=MY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2693C6786C
	for <linux-clk@archiver.kernel.org>; Fri, 12 Oct 2018 14:44:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BCEB2098A
	for <linux-clk@archiver.kernel.org>; Fri, 12 Oct 2018 14:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BCEB2098A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729051AbeJLWRB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Oct 2018 18:17:01 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45721 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729044AbeJLWRA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Oct 2018 18:17:00 -0400
Received: by mail-ot1-f67.google.com with SMTP id u22so12560079ota.12;
        Fri, 12 Oct 2018 07:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=e3Hz1KFTtH63iZ1zyrzdwpkzyf1dzBzM4cSfQDU0Q0Y=;
        b=IFa8zhQ+jbEAwgl5DCtZspVV4yvEZgdJN4nRntYNwkaUk0TuASp4jKrXwB7FWUaJor
         e/BoRqI/NbVaVcxKEOblgL/LX5WzcMK+Nlj42ytAQrn1CT22B6GK59zQScUC9AqxlWC5
         RFgCt29zcKAGyshK0Yyyx+uYSVicka2Rpkp+xW18mQuIq2fPydxSGISczPKiHzvd4nB2
         1QVubTWpugXAuftU5S3bF7qpB2tGjvl0+yejOcqQFs+5WjuQ6jlNDTEHzBatFw6HKF0E
         joOh+TEfyNP2/dQ00TV8pYt9pInozIGtvFAeipdCN2ASnT3KK5ep6fBWxX02wAS7B48d
         5pzw==
X-Gm-Message-State: ABuFfoh3wpN9EaPL4Rs7qsrS4gM5t1+VTyK4YXAGIcdSUn8Oyq6p0QEK
        +AAc3jXfDl6fZVWBjte3UP1EEvI=
X-Google-Smtp-Source: ACcGV62oHPOF+x3RpNzvISnJccfK2YaJih4u4KyfE5ZxeHWAJoF6aAJHGebTd4EFls0JLhmTw68v1Q==
X-Received: by 2002:a9d:5758:: with SMTP id x24mr3763673oti.85.1539355453738;
        Fri, 12 Oct 2018 07:44:13 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c62sm354800otb.60.2018.10.12.07.44.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Oct 2018 07:44:13 -0700 (PDT)
Date:   Fri, 12 Oct 2018 09:44:12 -0500
From:   Rob Herring <robh@kernel.org>
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: Re: [PATCH v4 3/3] dt-bindings: mmc: tmio_mmc: Document Renesas
 R7S9210
Message-ID: <20181012144412.GA29337@bogus>
References: <20181012122924.5543-1-chris.brandt@renesas.com>
 <20181012122924.5543-4-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181012122924.5543-4-chris.brandt@renesas.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 12 Oct 2018 07:29:24 -0500, Chris Brandt wrote:
> Document support for the RZ/A2 (R7S9210) SoC.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>  * Documented that R7S9210 has 2 clocks
> ---
>  Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
