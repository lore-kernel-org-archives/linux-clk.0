Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE321C54EAA
	for <linux-clk@archiver.kernel.org>; Tue, 24 Jan 2023 08:14:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbjAXIOM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Jan 2023 03:14:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjAXIOI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Jan 2023 03:14:08 -0500
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E74B3EFF4;
        Tue, 24 Jan 2023 00:13:20 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 9DBAA60004;
        Tue, 24 Jan 2023 08:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1674547959;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Am7QwC61FfDMKvryD0YanvfmZ7u+Yfxg+KRfwF9AvJY=;
        b=gr8LYT0P5FKtDIANqIOHFlYb/X6ChUVG02o/eykUiSIn0oaPiYm2bRN5K5ed4D9vj0+nCI
        fR7ha3hJsjVlg0/6Qg2vx9IlzFzlieIJSiySi6C4YvLIxLZNZ2sgqCcTRRne0kwyPzTUws
        q6n90zXVMo7bQxgdTimsD8I3bcenMq4Tpf4bh1caChMuHtKet2yedfZE0HlVVFzBM4pCmy
        CY5HGzPRK5RGPp+b6zWpgWvDT6XgF3Caof3t+JQN0SXB5X5vKqFJ9D9AJH6Z86PQlXLQsf
        zf638ESTYpvjJvm8Z+BalyiWapP0SEMx7l3JJOXu7y8QSuaKs9IhtMRQSHH4AA==
Date:   Tue, 24 Jan 2023 09:12:36 +0100
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Sean Anderson <sean.anderson@seco.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-reneas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clk: vc5: Make SD/OE pin configuration
 properties not required
Message-ID: <20230124091236.1bf8c6da@booty>
In-Reply-To: <5da02a9b-3d42-a26f-0d18-29a6b5b181e5@seco.com>
References: <68037ad181991fe0b792f6d003e3e9e538d5ffd7.1673452118.git.geert+renesas@glider.be>
        <5da02a9b-3d42-a26f-0d18-29a6b5b181e5@seco.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Sean, Geert,

On Thu, 19 Jan 2023 14:27:43 -0500
Sean Anderson <sean.anderson@seco.com> wrote:

> On 1/11/23 10:55, Geert Uytterhoeven wrote:
> > "make dtbs_check":
> > 
> >     arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: clock-generator@6a: 'idt,shutdown' is a required property
> > 	    From schema: Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> >     arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
> > 	    From schema: Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > 
> > Versaclock 5 clock generators can have their configuration stored in
> > One-Time Programmable (OTP) memory.  Hence there is no need to specify
> > DT properties for manual configuration if the OTP has been programmed
> > before.  Likewise, the Linux driver does not touch the SD/OE bits if the
> > corresponding properties are not specified, cfr. commit d83e561d43bc71e5
> > ("clk: vc5: Add properties for configuring SD/OE behavior").
> > 
> > Reflect this in the bindings by making the "idt,shutdown" and
> > "idt,output-enable-active" properties not required, just like the
> > various "idt,*" properties in the per-output child nodes.  
> 
> IMO we should set this stuff explicitly.

I took a moment to think better about this and I think I get your point
Sean in preferring that the hardware is described in detail.

However I'm still leaning towards approving Geert's proposal.

I'm based on the principle that DT is there to describe the aspects of
the hardware that the software needs _and_ it is unable to discover by
itself.

Based on that, does the software need to know SD/OR configuration? If
they are already written in the OTP then it doesn't. Also if the chip
default is the use that is implemented on the board, it also doesn't
(like lots of optional properties, especially when in most cases a
given chip is used in the default configuration but not always).

To some extent, writing settings in an OTP is similar to producing a
different chip where these values are hard-coded and not configured.

I'm wondering whether Geert has a practical example of a situation
where it is better to have these properties optional.

Best regards.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
