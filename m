Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0C1C4321E
	for <linux-clk@archiver.kernel.org>; Mon,  7 Nov 2022 18:05:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232280AbiKGSFV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Nov 2022 13:05:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232387AbiKGSFA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Nov 2022 13:05:00 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22462252A9;
        Mon,  7 Nov 2022 10:01:17 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id l11so18855599edb.4;
        Mon, 07 Nov 2022 10:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75rd0nxoknxf0qfQbRb/8Y9yf4jaHg7t68qk6D5sD+0=;
        b=No3yWU+ZvUWANbDZ+qjs/d41PUWLkEp3ZQntEBUKqTP9nEE6l7iPGQIpcKobc7rXHn
         de2ajss8UoYWFGc3vNShutT1wi2TOkRQ4ctRlkw8WQJ3/gd/AJ8rN0F3XIK6QtK4ZGUf
         5Cayx1tSCGnsQrzFxwKGcH9OqLJVf5DtcDPX76MVmhGAZJBbTdK80c/OyeE6FzFKPWMv
         ZbvvJtIMz3KH647cTvs70qQTddp4zWU4TAhvcg7382Fj2VnlUn4zSDer4hB2yvI9lFN6
         lGBFwi+DMAotesVVNwC02gxfoaecU1TqfMiZUGCYGeo3fcx9p4C63gY+daSUf5GB9ckE
         Q9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75rd0nxoknxf0qfQbRb/8Y9yf4jaHg7t68qk6D5sD+0=;
        b=PDSCLqj7XZfrk98Ge6QrdaJ9GSrm8N14JDv7SDw0tgtUxPSBh0jIOXVdnoRrJNlRHz
         YKdCms8mP72MYFsXFdciFbXO+Yg8eeQmxy31h7a/U5P81twSsvS//Hw91fuHR9qWUg4i
         uzP6/fcVihIDTgd5Is68jL2nVpm+CLwfezUPB6X6FPuzAtOJyqs9sgz+hi7fxNY34E7x
         qV4ccp4E8nrgp3WfPtDzWcL8H0Ei9uaBvAl+bty7e18qQfhratogGBXGRxe7OrqFriCB
         FBmS2laKWmmK/t8dxuOJ7L9MABoES9wN1xHOtUwBVuEpmxhWFvGl16iN6mRzCEyn1De2
         2RLA==
X-Gm-Message-State: ACrzQf20f9NPqulR3g+/uWNwB88Q/EIjf+/8ACO/FR4zWfkJGj2u2pjk
        AOpSoui35t4PQLy8A4rMRNM=
X-Google-Smtp-Source: AMsMyM5eKPdfYS+IlAZoU0ygqoUgIXnHcMzzWVgZewDNf9rtC0lNn5Px5RhiHcRAVwr9tZ6aB5+WNg==
X-Received: by 2002:a05:6402:2804:b0:439:83c2:8be2 with SMTP id h4-20020a056402280400b0043983c28be2mr52629025ede.292.1667844075676;
        Mon, 07 Nov 2022 10:01:15 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id 20-20020a170906319400b007ae38d837c5sm3802633ejy.174.2022.11.07.10.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 10:01:15 -0800 (PST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
        Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 04/10] clk: sunxi-ng: f1c100s: Add IR mod clock
Date:   Mon, 07 Nov 2022 19:01:12 +0100
Message-ID: <3461540.iIbC2pHGDl@kista>
In-Reply-To: <20221107005433.11079-5-andre.przywara@arm.com>
References: <20221107005433.11079-1-andre.przywara@arm.com> <20221107005433.11079-5-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Dne ponedeljek, 07. november 2022 ob 01:54:27 CET je Andre Przywara 
napisal(a):
> For some reason the mod clock for the Allwinner F1C100s CIR (infrared
> receiver) peripheral was not modeled in the CCU driver.
> 
> Add the clock description to the list, and wire it up in the clock list.
> By assigning a new clock ID at the end, it extends the number of clocks.
> 
> This allows to use the CIR peripheral on any F1C100s series board.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


