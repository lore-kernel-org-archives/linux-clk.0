Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26F7C636CC
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 03:54:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbjBMDyg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 12 Feb 2023 22:54:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjBMDyg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 12 Feb 2023 22:54:36 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFE02D50F;
        Sun, 12 Feb 2023 19:54:34 -0800 (PST)
Received: from [172.16.71.140] (unknown [49.255.141.98])
        by mail.codeconstruct.com.au (Postfix) with ESMTPSA id EF8332003E;
        Mon, 13 Feb 2023 11:54:32 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1676260473;
        bh=mUfFYcXZpoqiWPyS7snd3gAYhXm4wWJgRfkE2yTX8pA=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References;
        b=PUObLmv5nRKC+i6HNjXqn82vFp4X4/cgfM9luCZm0CYPnWBDo5pk0/6T9muxgWfpq
         MG7hbRrVjnGI/BSOGyM0idC3vPipFjH9PekiH+CO/GS0+c5J68eZSwy+WLMZdM5JR1
         2FDZnjBCHp5vrcLPo9/gkhsdgB05QIsp31ipaaIr+br/hiMxq8AQp6A/ULqv+zx4Fm
         hjKrJG+8Ql+d9wRnMPyTdz1WwQCXQtQXQxGXRHMDVvSV6CkSZ6CsZ+/CAAyNF8qRVH
         XNpbI7lQuNugFjuEa4WoHe9qw+Fk+7/e+1b30SBWixeCK6p+St7yXlQyEjbLrg5EgU
         FS10HRY2OUskA==
Message-ID: <7b98182e6ebbfe63aa327f363bd288b9e1736a6d.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/2] Add definitions for AST2600 i3c clocks and resets
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Date:   Mon, 13 Feb 2023 11:54:32 +0800
In-Reply-To: <cover.1676259904.git.jk@codeconstruct.com.au>
References: <cover.1676259904.git.jk@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi all,

> This series adds some base configuration for the i3c controllers on
> ast2600 hardware. We'll use the reset and clock definitions in the
> proposed dt binding example, hence sending these first.

Looks like I had Joel's address incorrect there; fixed in this reply.

Joel, let me know if you'd like a re-send (but you should also have a
copy through linux-aspeed?).

Cheers,


Jeremy
