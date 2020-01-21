Return-Path: <SRS0=oBAc=3K=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E446FC2D0CE
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jan 2020 08:36:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B6F7D24654
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jan 2020 08:36:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yxYl0mUg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727962AbgAUIgp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Jan 2020 03:36:45 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33531 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727813AbgAUIgp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Jan 2020 03:36:45 -0500
Received: by mail-wr1-f66.google.com with SMTP id b6so2181824wrq.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Jan 2020 00:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=2E9OJ489GWJVc5FM6n8yc+UA65Qb8uMh2b/3w3Id4J4=;
        b=yxYl0mUgSsKhvsfhG+eeiyIjBYQkhfbk6gP3eJYNe1dQoUPRLWVebYldlZ1slj42qp
         3UM1LWAFog0Ae819j4yX6Q68uzq+aEGrjTXFALzRmPfjXYBLEsQmGfszGUpIU44nIUmc
         3h08CS8bY3GsKm3uvjoVebGA4MOUmy8zGhCwPgjowdhv4V2csudp/lEjGcnR9NTiqWBV
         JQU2RecCCfNMVR5KQo0jmf8+I1DY8zTT9X/+sRG+WdAkqTi+etFRvpAds0xK68aB2web
         iBohO7Hovxv/+ucK50BhWxja3XcB3Ro1pgCcpmZeMJIDr5xUuCVYy2wgQiTLioOIxg7s
         SaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=2E9OJ489GWJVc5FM6n8yc+UA65Qb8uMh2b/3w3Id4J4=;
        b=qwtNzi+yaJKBhqO5Hkh4vTQBNUv+Qq2QGlGdRCdtfZ25ae7Bg0k8thX9lxa4H1w7+k
         QOLqooBxVhLOTP5u0nhBrVP726bKiON34phI43utFcUw7SOlMWr5222NHbvtPu1J3X8A
         4mcJZYncl9+ShhHbfHQBAOh8g+qgcvKDJQqyH2iUkpkRcUXyC0nwfTfh9NVBXOaL2bJe
         JUD9O2023tFQal/leiS5eFjvi+x/kPavKgdDi4EwPY5NJmY3DbccJ3lBK9vv4n5oazSN
         BsbgXA8hYvYYzm66fcvWONj1umrBENzRifQKdq298Ulj2Pc2YX2+c6Bge6xbJ5I5VXBy
         ui5g==
X-Gm-Message-State: APjAAAWDFKdZnQkze/jzP5IXG1bxGg9zmk1ha4rAAt1s0IdMTKYbUBU5
        bEbrMQT+yJ6EiAUJLlp+RLPFcw==
X-Google-Smtp-Source: APXvYqyu7hBQ9uhLqxJQ5JWViaS+lM5mRK0txUz5fTMW/JUrwaRk87pLMiRxDmRiQbW3UZk6QbeQbQ==
X-Received: by 2002:a05:6000:118e:: with SMTP id g14mr4101042wrx.39.1579595803230;
        Tue, 21 Jan 2020 00:36:43 -0800 (PST)
Received: from dell ([2.27.35.227])
        by smtp.gmail.com with ESMTPSA id v3sm50982790wru.32.2020.01.21.00.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 00:36:42 -0800 (PST)
Date:   Tue, 21 Jan 2020 08:36:58 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        mazziesaccount@gmail.com, Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-clk@vger.kernel.org, linux-gpio@ger.kernel.org
Subject: Re: [PATCH v13 00/11] Support ROHM BD71828 PMIC
Message-ID: <20200121083658.GH15507@dell>
References: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
 <20200120135446.GD6852@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200120135446.GD6852@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 20 Jan 2020, Mark Brown wrote:

> On Mon, Jan 20, 2020 at 03:40:20PM +0200, Matti Vaittinen wrote:
> > Patch series introducing support for ROHM BD71828 PMIC
> > 
> > ROHM BD71828 is a power management IC containing 7 bucks and 7 LDOs. All
> > regulators can be controlled individually via I2C. Bucks 1,2,6 and
> > 7 can also be assigned to a "regulator group" controlled by run-levels.
> 
> This is the *third* version of this you've sent today alone.  Please
> stop sending me this series until the MFD has been merged, perhaps just
> drop the subsystem patches while you resolve whatever the problems are
> that remain with the MFD?

> I'm pretty much just deleting these patches
> without even looking at them at this point

Don't do that please.  You are one of the reasons he's resending.

Please review Patch 3, or you will block the submission.

> it's a large series, it's
> getting huge numbers of resends and I don't think any version I've had a
> chance to look at before it got resent had a change in the one regulator
> patch that'd cause me to have to re-review it.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
