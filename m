Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218F0C48BD5
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 12:25:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB995215EA
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 12:25:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MRAi30L3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfFYMZ2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jun 2019 08:25:28 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45699 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730309AbfFYMZ2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jun 2019 08:25:28 -0400
Received: by mail-lf1-f67.google.com with SMTP id u10so12445006lfm.12
        for <linux-clk@vger.kernel.org>; Tue, 25 Jun 2019 05:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VXFxBqw289PiWNcgire0HT3ql8msXi7Wbz9KDkqpi9s=;
        b=MRAi30L3bCnSstOAPK/5ckcFQXdc0wInrW51IaGWdmmXBFt61il5F8ZihENHrES6Sz
         A2gfTv6F6/mUQ1hGF0IliwV+O0FoVXmnwA27MN1197oDkrwe0Hi/euIeh0I/e8zRwLgI
         B96q10pu6xOvJvT96ewCQmj7xRCeReAq/kigc7RqYiguG/g1LmS2U+Jqm5eZcB10V30P
         n1xKUvlYhN7Wnj+Yn6gNqa//q0nip2EJKCYm4ov9IZvxiKcc17gouzhVRXMZya7Iff4C
         lW2YQjDxDHSucaIJuJ9qvDTzQoa0DUBHFUUnsRd1LRv4Ks9d9wHsSNTg7RA2sbTLxnRZ
         +rTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VXFxBqw289PiWNcgire0HT3ql8msXi7Wbz9KDkqpi9s=;
        b=t53GWHRvt60iDwmM2Pjvv94UoNwjvX/F0Y+ebC4foP8XbGpGnDz5ZtswkoQzr7wevE
         SnKkfoFIwkLlldF0MMZn+RmrHfJ3AEaEw46xx919rd0l5sBYOE89bUgeIA+nNRr/SrLK
         XLu/aTce2CnPdLsJqO47rL5TNooE42A5Nn6d4Jd/z7Z+kyUaUiaREkjgoeQ0qPT8SWi4
         C6+SFuIfTojvMim3UthFjUZ1C2HuZaRFOFhzi49LZ7LCaaNPce+P2jpVxecKDO92UxJV
         Bb2NDVQ3QxzsHwEwiVgL+rwjBGb52T1kajbml1sz6S1MJHAMXskiF2Sb5bwYNEHW1nIA
         oXwQ==
X-Gm-Message-State: APjAAAVormdcWQO6lbv6qp8eFio/Pqc/pbGsrRfyfVaRqe5waJeaNyTj
        P8VAjWpGVAv1f3vXOMMXiN5ErP7uBNobEhZ3lSnD7g==
X-Google-Smtp-Source: APXvYqwMJafEsEK9ql82gdFybiq+Gag7JQbBkAhot7eiscPpABkzdiTqqeOrWV0XFwZvPlNTuzHyscjkjG+lDDOrlRA=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr13951212lfu.141.1561465526510;
 Tue, 25 Jun 2019 05:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190617215458.32688-1-chris.packham@alliedtelesis.co.nz> <20190617215458.32688-2-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20190617215458.32688-2-chris.packham@alliedtelesis.co.nz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 14:25:15 +0200
Message-ID: <CACRpkdbg3ewD0gexLk3+nF0ihyhnPPpWj13YDqxgvT_4urhbzg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: pinctrl: mvebu: Document bindings for 98DX1135
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jun 17, 2019 at 11:55 PM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:

> The 98DX1135 is similar to the 98DX4122 except the MPP options differ.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Patch applied as uncontroversial.

Yours,
Linus Walleij
