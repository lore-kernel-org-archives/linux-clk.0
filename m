Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9B7C07545
	for <linux-clk@archiver.kernel.org>; Tue, 24 Oct 2023 18:28:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344016AbjJXS2D (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Oct 2023 14:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343918AbjJXS2C (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Oct 2023 14:28:02 -0400
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41CD510D0;
        Tue, 24 Oct 2023 11:27:58 -0700 (PDT)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5820299b99cso21786eaf.1;
        Tue, 24 Oct 2023 11:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698172077; x=1698776877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNng016sWlIYuCE41qXO+ZMCuxWjt/SPYUfNc1rT6qY=;
        b=ik/553zb1evi4APqNyK1rARicGq6vrnYhVvJDaj9j+rLlBPk5XHSvfcjzv4oUUy1a8
         3uE1O7IkKDLfoM0BGqjaFGEHyZCVhtChTzFb588TksSPV+UvpGFaeQ8uWlEuBk8n8BiW
         ce9p4aJG75pH/zY17+a/uYn6+BB9IqZgn3iw2fkmUi+GCr9PAG1J+ooDul87vIkPRjCh
         gztgT4C2C0kSBK/wupUAeQCdLG275QQxhCsLa72lBQ1OgSWcPsmSV7Y2hf9zHkiN/rDY
         pW+KeAf6njxUruAzFW63X7Zv9pHHF19qwNfca6zUL1Q0wYwxG2hjY8aKJ+DmsFD+m8Ca
         JlvQ==
X-Gm-Message-State: AOJu0YwakbTc6909Fb2PynZ2E7D7PAJ3d60zQ/Z04cm4X/RPo8YHft/j
        XgLyE9wD1lCO8BZu6PTPVQ==
X-Google-Smtp-Source: AGHT+IF4Mo7SI7+Mkd9TqQMoBcw8WQzBGoqowxfYx/0ojUXzi24Q6N3YSxHT8mMusatDWtCimTP/wg==
X-Received: by 2002:a05:6870:13c6:b0:1e9:b5d7:4000 with SMTP id 6-20020a05687013c600b001e9b5d74000mr6763342oat.7.1698172077184;
        Tue, 24 Oct 2023 11:27:57 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id cj19-20020a05687c041300b001c02f12abd0sm2231435oac.38.2023.10.24.11.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 11:27:56 -0700 (PDT)
Received: (nullmailer pid 243306 invoked by uid 1000);
        Tue, 24 Oct 2023 18:27:55 -0000
Date:   Tue, 24 Oct 2023 13:27:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Chris Morgan <macromorgan@hotmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chris Morgan <macroalpha82@gmail.com>,
        linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        sebastian.reichel@collabora.com, sboyd@kernel.org,
        mturquette@baylibre.com, daniel@ffwll.ch, airlied@gmail.com,
        sam@ravnborg.org, neil.armstrong@linaro.org, heiko@sntech.de,
        conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH 1/5] dt-bindings: display: panel: Update NewVision
 NV3051D compatibles
Message-ID: <20231024182755.GA215478-robh@kernel.org>
References: <20231018161848.346947-1-macroalpha82@gmail.com>
 <20231018161848.346947-2-macroalpha82@gmail.com>
 <e684983a-9399-4fd7-8fe5-41faeabbfab1@linaro.org>
 <SN6PR06MB534271680DB8A3A3F0A1A31CA5D4A@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR06MB534271680DB8A3A3F0A1A31CA5D4A@SN6PR06MB5342.namprd06.prod.outlook.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Oct 19, 2023 at 09:50:38AM -0500, Chris Morgan wrote:
> On Thu, Oct 19, 2023 at 11:22:19AM +0200, Krzysztof Kozlowski wrote:
> > On 18/10/2023 18:18, Chris Morgan wrote:
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > > 
> > > Update the NewVision NV3051D compatible strings by adding a new panel,
> > > the powkiddy,rk2023-panel, and removing another entry, the
> > > anbernic,rg353v-panel. The rg353v-panel is exactly identical to the
> > > rg353p-panel and is not currently in use by any existing device tree.
> > > The rk2023-panel is similar to the rg353p-panel but has slightly
> > > different timings.
> > 
> > This still does not explain me why do you want to remove old panel.
> 
> When I originally wrote the driver I only had one piece of hardware
> and I set the compatible string in the driver as newvision,nv3051d.
> Unfortunately since then I've found 2 more devices in use that are
> *just* different enough to require the driver to do things a bit
> differently. In the case of the anbernic,rg351v-panel I need to
> enable a new DSI flag; in the case of the powkiddy,rk2023-panel I need
> to decrease the vertical back porch and drop the higher frequency
> timings.
> 
> The best way to accomplish this was to change the strategy from having
> a single binding in the driver of newvision,nv3051d to a binding for
> each distinct hardware where the differences apply. 

Exactly why the DT maintainers annoyingly ask for specific compatible 
strings which may not be used immediately.

> Note that I've
> looked at querying the DSI panel ID, but for each device the value
> is identical (so it can't be used to differentiate the hardware sadly).
> So the driver now has 3 different compatible strings. I could in this
> case add a 4th compatible string of anbernic,rg353v-panel but it would
> be identical to anbernic,rg353p-panel. For the moment we are using
> anbernic,rg353p-panel everywhere (including the rg353v), so it makes
> sense to drop this unused value while we can, at least to me.

Your reasoning is the compatible string is unused, so remove it. 

If there's some reasoning about how the 2 panels are the same hardware 
or the rg353v is never going to be used or show up at some point, then 
that would be a reason to remove.

You could also say the rg353v is just wrong because it should have a 
fallback compatible to rg353p and rather than fix it, just remove it 
for now since there are no known users of it.

Rob
