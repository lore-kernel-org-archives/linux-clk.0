Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8782CC4320A
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 07:01:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6468460F39
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 07:01:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234753AbhH2HCX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Aug 2021 03:02:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:50172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229889AbhH2HCX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 29 Aug 2021 03:02:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C42D5601FF;
        Sun, 29 Aug 2021 07:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630220491;
        bh=oX2SABA6r0uXCUoRojYB/nwQNa2hWNAO/WJFf8mBQRA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RCRo2Awv2zQNZDxbHMTYwxMQviBCzRnFt07NAyYIr9/u45H3ToTI4xNHCjMtAKpsv
         lindadw0qwANrfZFMNKQ+Y8KTFLofMZ2RBBPjsC62Z10vdVZzjFU/4w8HVu5lo6b6g
         58+DC+wzgD2Z0tVGPcbvV2p07cgDKg3Z15furg8J16UgcOP5c3l/RwiGQ5i4S5oUik
         C4zG3K1CIYKOQ3tQAonLq12GsyDioRTc9xbGVOsuyvc1U2C2Xwfw9bm/WtqXE6IH1S
         TtZ+t3InyCE0K+9rn8u5zBaTOqqGo033A57y6XaWWURB/4FB01p00zfpeOYaGCL9k9
         ERuwxEDF+GEmQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210809223813.3766204-1-sean.anderson@seco.com>
References: <20210809223813.3766204-1-sean.anderson@seco.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: clk: vc5: Add properties for configuring the SD/OE pin
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sean Anderson <sean.anderson@seco.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Sean Anderson <sean.anderson@seco.com>,
        linux-clk@vger.kernel.org
Date:   Sun, 29 Aug 2021 00:01:30 -0700
Message-ID: <163022049050.2676726.15613187261220975339@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sean Anderson (2021-08-09 15:38:11)
> These properties allow configuring the SD/OE pin as described in the
> datasheet.
>=20
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---

Applied to clk-next
