Return-Path: <SRS0=5IOi=M5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9852DECDE30
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 10:42:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50E7B214AB
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 10:42:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HehSbvKO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50E7B214AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbeJQShr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 14:37:47 -0400
Received: from mail-qk1-f171.google.com ([209.85.222.171]:32891 "EHLO
        mail-qk1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726904AbeJQShr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Oct 2018 14:37:47 -0400
Received: by mail-qk1-f171.google.com with SMTP id 84-v6so16142565qkf.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Oct 2018 03:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=fXXM60XUaK4o+KboKU1lSAg3zPyVoBHZVwlGB9jm3i4=;
        b=HehSbvKO5mVR/plzDdgaWJbL2dk/pgUP00KJ+OOX7IsR9wyY4qsLkD/fYHiB3v64xj
         lxpUsXWVZ3dtQO2XZWOwT1V3r4jwwpApE8BP8GKWHTFkLhb+Tck7xuOLuqOpXpyRM4wc
         6OhvNkjZ8uup5bEDXdmAFaNy8Bj7GeYnRYwVHqaLjrK5CrhZXG5aCskAXSDxX9rzyLV7
         +jJZ8dF2n9IFFXVZsp2tMyUYxghzKN+Iy+VGpLtWNlc+7sFp3zyRLGJwom/9NWmrjcqw
         WMqQmUoWHksCkclIajImKEjUC1uZ1u6zdG/nUDesqGgeQXnFbue1/GgeHA/84bk3Xnw4
         NKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=fXXM60XUaK4o+KboKU1lSAg3zPyVoBHZVwlGB9jm3i4=;
        b=GlDvcEDg2gzdyqAmt+IGUgcrdBHY+b7roWNWeoZCzUerdntryqjPP33IvwpcqLcjj5
         +x7+1HFHgg223gyvvPhZtSYLS6SHWgXX7amZ7RWZFkxbisZQVlDtKSa3tyZVegXKmirv
         Ak1pvgTFefy04q+VEH2Cb0pljqZjdiOWwfBmCcjQQyVy1FSmCkfZh/BTITab3awftxyY
         TKBAGU260qD+Rtgp65e7XtrJ0BxtHO/9Ezj4I/gND+iHV4lV0dG4oEGaMY0MANXMzN0j
         9ep7SNHH7GhAGCLkYFEOuhLwlUzIFEygEvdJvEFB56k1817EsRrZuppGqBWWT1kn44fT
         6lYA==
X-Gm-Message-State: ABuFfogxHNhGJgN8oFH4atBx84DPS3o59rmke1/mhoVh9F+PPP8MQTfz
        JX9Zn4UOKkHK2qlKR5kwixNqm60pyJWe2F7XXYy64A==
X-Google-Smtp-Source: ACcGV6039ex+iZ1g3cc2DeY62FGuPCqYS7jzK9DD8Z01aPDWQBRuBIcJKy9IDTmWLuE4Xl5ZnKQa7UfzY4kNbAJSPfA=
X-Received: by 2002:a37:dc47:: with SMTP id v68-v6mr476928qki.109.1539772960238;
 Wed, 17 Oct 2018 03:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAGkQfmNuROsD29jR_7opiXcfPB6=FuaoxaK-hF5Ezz7r-1pBZA@mail.gmail.com>
In-Reply-To: <CAGkQfmNuROsD29jR_7opiXcfPB6=FuaoxaK-hF5Ezz7r-1pBZA@mail.gmail.com>
From:   Romain Izard <romain.izard.pro@gmail.com>
Date:   Wed, 17 Oct 2018 12:42:28 +0200
Message-ID: <CAGkQfmMphvck9rraYq+o8zA254q7ETYyniiUV-QBsUR9X+OFKQ@mail.gmail.com>
Subject: Re: Clock configuration for the SAMA5D2 NAND controller
To:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-mtd <linux-mtd@lists.infradead.org>,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

+linux-mtd, linux-clk

Le mer. 10 oct. 2018 =C3=A0 19:05, Romain Izard
<romain.izard.pro@gmail.com> a =C3=A9crit :
>
> Hello,
>
> While evaluating a new flash memory chip for my product based on a SAMA5D=
2
> chip, I tried to update my software to use the latest device tree binding=
s.
>
> Until now, I was using the legacy bindings for the NAND controller, that
> preserved the timings configured by the bootloader in the EBI registers. =
The
> bindings introduced in Linux 4.13 are used together with the NAND driver =
to
> reconfigure the timings of the memory interface to match the speed profil=
e
> declared by some NAND components.
>
> However, when comparing the timings in the registers, there was a large
> difference between what I calculated by hand in the past and the values
> configured by the drivers. The difference was in fact a 2 factor.
>
> For me, the issue is due to the clock configuration declared in the SAMA5=
D2
> device tree: The reference clock used by the nand-controller driver is th=
e
> clock for its parent node, which is directly the Master Clock. And on my
> end, what I understood when writing the clock settings for my bootloader =
was
> that the reference clock was the HSMC clock, which derives from the H32MX
> clock, which runs at half the rate of the Master Clock.
>
> The documentation for the SAMA5D2 is not very precise on this topic, so I
> would like to have some feedback. Is the clock used as a reference for th=
e
> chip select configuration registers the Master Clock itself, or is it the
> peripheral clock for the HSMC module ?
>
>
> Best regards,
> --
> Romain Izard
