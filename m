Return-Path: <SRS0=LMZy=WR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678E4C3A59E
	for <linux-clk@archiver.kernel.org>; Wed, 21 Aug 2019 21:13:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3749F206DD
	for <linux-clk@archiver.kernel.org>; Wed, 21 Aug 2019 21:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566422005;
	bh=fijuuQb22nIjd7MQ2KQXNDXm2IFUgI3e6ymXES629RQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=c/28WUoQp6TVH9AR2JXmOqvKL9DhmmgTjL1QAJ2WxATOOfzaa9kl2cldt/Zn8U/io
	 oVG/wWxt9jGXAMr4ovzArtQi0rrX/pRwKQECkXr6EBJzIbH73KIkR/kCUDs5cKR+c5
	 m/DYfx0JpHFb1bqwcX2XyhsjeSAnHkK9n5O2uMf4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730744AbfHUVNZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Aug 2019 17:13:25 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42872 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728050AbfHUVNY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Aug 2019 17:13:24 -0400
Received: by mail-ot1-f66.google.com with SMTP id j7so3431359ota.9;
        Wed, 21 Aug 2019 14:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DlphJMx4PV9qLWiQ86VK3TgLQxXCfQ+knFHYAIuA5Ik=;
        b=ms0iIEd8Q3F2zyjvKoJwxsEviTb1g84AcQ/kxaGRebPaVy4Op6drC6rmcgA/5inDra
         u25WwI3x+I+WmW3zeBDC94GO2W13eiR0qEw2t3fKMd1cnO+gDrddnTUNar0gApKxoCvl
         2l+zz2D2JzgtiRwBlgiKfaJlXhYgIk0UPylUaQtRJZotbnKxkNvfiTI5Go5VXOPXLH8n
         dsnJO/dTuqRPswvInPib14PO7ivyOZsurh1hApAG1W7HoO0nUvN/iAPJuJ94b48uRpC/
         U+xeM+iwKJ3K1gdQTMESdi6KVVHS4ylpDEQUFF5S0qvJtI5DksrOXkoNC6tKLJLgWrVy
         Y+ZA==
X-Gm-Message-State: APjAAAV2n77O+nV4bAiMoCy/y7A456AYSZ4EdPVHeeIN5OGbEe9hQkGt
        p4DPBShEV3y4842j4ZdcVg==
X-Google-Smtp-Source: APXvYqxe6j0dbYUWNdi9Juyx9Aja0v51eVfa9yGrlfykgD7zu1GxDpXPwvZ2wbOONxfzCfKKid12kA==
X-Received: by 2002:a05:6830:1018:: with SMTP id a24mr1654419otp.191.1566422003778;
        Wed, 21 Aug 2019 14:13:23 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t10sm8052271otb.13.2019.08.21.14.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 14:13:23 -0700 (PDT)
Date:   Wed, 21 Aug 2019 16:13:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Olof Johansson <olof@lixom.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Russell King <linux@armlinux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 04/19] dt-bindings: phy-mmp3-usb: Add bindings
Message-ID: <20190821211322.GA12457@bogus>
References: <20190809093158.7969-1-lkundrak@v3.sk>
 <20190809093158.7969-5-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809093158.7969-5-lkundrak@v3.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Aug 09, 2019 at 11:31:43AM +0200, Lubomir Rintel wrote:
> This is the PHY chip for USB OTG on MMP3 platform.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  .../devicetree/bindings/phy/phy-mmp3-usb.txt     | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-mmp3-usb.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-mmp3-usb.txt b/Documentation/devicetree/bindings/phy/phy-mmp3-usb.txt
> new file mode 100644
> index 0000000000000..b9623b98151bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-mmp3-usb.txt
> @@ -0,0 +1,16 @@
> +Marvell MMP3 USB PHY
> +--------------------
> +
> +Required properties:
> +- compatible: must be "marvell,mmp3-usb-phy"
> +- #phy-cells: must be 0
> +
> +Example:
> +	usb-phy: usbphy@d4207000 {

usb-phy@...

> +		compatible = "marvell,mmp3-usb-phy";
> +		reg = <0xd4207000 0x40>;
> +		#phy-cells = <0>;
> +	};
> +
> +This document explains the device tree binding. For general information
> +about PHY subsystem refer to Documentation/phy.txt

Drop this statement.


> -- 
> 2.21.0
> 
