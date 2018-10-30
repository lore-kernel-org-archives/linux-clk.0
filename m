Return-Path: <SRS0=0weS=NK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B0EC2BC61
	for <linux-clk@archiver.kernel.org>; Tue, 30 Oct 2018 13:10:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7838720831
	for <linux-clk@archiver.kernel.org>; Tue, 30 Oct 2018 13:10:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="f9KNOo5A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7838720831
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbeJ3WEH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Oct 2018 18:04:07 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34704 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727863AbeJ3WEH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Oct 2018 18:04:07 -0400
Received: by mail-lf1-f68.google.com with SMTP id n26-v6so8826966lfl.1
        for <linux-clk@vger.kernel.org>; Tue, 30 Oct 2018 06:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XrC8xFPbeEz5GfOc49fkwQzNqK0r/X7Qxa9aNATtfSU=;
        b=f9KNOo5AAxX8B4e+6fkpEqkh/rqYSiMQ0CLhSXOl8wzHFK8nT+nO3/yoJNmH6zNYEQ
         qS3xhqU7cY42MoQtv5yfh4JzIwWYCnYRZXBWRpOFs7+cpGiO2KN6mCy22+5PK5jOjHX8
         Zk/y/XweOoXubwPHX5ysFZJ88WqlHrVmi6Wcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XrC8xFPbeEz5GfOc49fkwQzNqK0r/X7Qxa9aNATtfSU=;
        b=gXD/GAHf0sHwcVCzHDRvBNRwyCJGddgz/U7T21vjcopINm3keqseUx72tO9tV+p6B0
         tnu0R9wU91R9AFXTD3M6J805EiRPwKaEsetk5Zw4IR/114ITZPT8cJ5Hm6fALHV2nq5T
         IEmFSGkxl5a9qm+5a7ulZRnBT0ZhATIiRViNZ2VzvhTQKpdJowmFG8Wov8y+3cE9d1EH
         Cht4vm7UyX7DOYyqWTf4edCdiUaJaP2Awtbc7HrhnIvM21kcnqHmP+C51ggMyn5TZ1W3
         J0naCrkuVB5FVGL12OWsXxawYB5jNvnDME1egHFgV29vxY7B1M82b0bzpPS7eyINMI6e
         hhzA==
X-Gm-Message-State: AGRZ1gIxnZRYIudjB0fVe1dkSHVV4KCHD/urMUtuQFZCPKgogTlzvNcn
        9p5Bf/0Goq9cyqhbpzsEsBdBfGcZn0bH0ayZhNyHAQ==
X-Google-Smtp-Source: AJdET5cnATZ4mzxgB5njx6Q7bd+9l9/6OoRDiP0aNGn1Blecs6hNCYOP+n9JQozCD40/3BYqFa9Y1HfPVh27Atuib/w=
X-Received: by 2002:a19:2095:: with SMTP id g143-v6mr1827691lfg.62.1540905042408;
 Tue, 30 Oct 2018 06:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20181019095003.26046-1-ckeepax@opensource.cirrus.com>
In-Reply-To: <20181019095003.26046-1-ckeepax@opensource.cirrus.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 30 Oct 2018 14:10:30 +0100
Message-ID: <CACRpkdZGsD2uRmz3XL59KrLij6tFo0pT6rqVR99qFGxvitTUdQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] mfd: lochnagar: Add initial binding documentation
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patches@opensource.cirrus.com,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Oct 19, 2018 at 11:50 AM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> +      gf-aif2-txdat, usb-aif1, usb-aif2, adat-aif, soundcard-aif,
> +
> +  - aif-master : Specifies that an AIF group will be used as a master
> +    interface (either this or aif-slave is required if a group is
> +    being muxed to an AIF)
> +  - aif-slave : Specifies that an AIF group will be used as a slave
> +    interface (either this or aif-master is required if a group is
> +    being muxed to an AIF)

This is not properly described as pin config parameters, but that is how
they are used in the driver. Please describe that this is supposed to
augment the pin config of the pins.

But I think it looks bogus. If the pins are already mixed to groups
like that:

> +       pin-settings: pin-settings {
> +               ap-aif {
> +                       aif-slave;
> +                       groups = "gf-aif1";
> +                       function = "codec-aif3";
> +               };
> +               codec-aif {
> +                       aif-master;
> +                       groups = "codec-aif3";
> +                       function = "gf-aif1";
> +               };
> +       };

OK so what the "special properties" above indicates is really the
direction of the pins, whether out (master) or in (slave".

Just use the standard bool pin config properties:
input-enable;
output-enable;

Reference
Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt

For this. If you want users to see that this is master and slave,
just /* Write a comment */ in the device tree.

Yours,
Linus Walleij
