Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BC0EB64DB
	for <linux-clk@archiver.kernel.org>; Thu, 15 Jun 2023 01:29:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjFOB3P (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Jun 2023 21:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236211AbjFOB3O (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Jun 2023 21:29:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 222C326A8;
        Wed, 14 Jun 2023 18:29:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B28A063081;
        Thu, 15 Jun 2023 01:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B17C433C8;
        Thu, 15 Jun 2023 01:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686792550;
        bh=52VHT5u3jfsi5GIq4jRjeOT/n/zezUlxEAea8q8MJ5Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Tr5nh7UaGoG7RI5Amvh/Em8Ia1n8zNFP1zJui6kpVAtLpsk6ZKpG0GjuClXm8sBf7
         hMool+0BHNtOhxCIk6lE2CcX3phRDSReOHBpGQqJXebf8rS27kRtKor/htFzok3hbN
         3/x1RWpMK5NVXC/jtOfnOewr4bzPU+AfPlzG0W/2B619Z+8dXQCQ6lx7ipgd0g0XIG
         mlZBTPIueWQhfLmhSE0bdIdEiruRIOh8h/4UtImbPuUH89WN287b7U66NtS2jRAC4O
         ZsPcTTCUFEsNIPitW2iZ/PPvhiXXA1C027AFEd91UHsbVZZeAdPpsiSyIjaN8yQIQD
         pB7PjZUc/9BMw==
Message-ID: <0f041c132a4388cad6ce87a2c0bced08.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230406010738.1269781-1-robh@kernel.org>
References: <20230406010738.1269781-1-robh@kernel.org>
Subject: Re: [PATCH] clk: mvebu: Use of_address_to_resource()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Date:   Wed, 14 Jun 2023 18:29:07 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Rob Herring (2023-04-05 18:07:38)
> Replace of_get_property() and of_translate_address() calls with a single
> call to of_address_to_resource().
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
