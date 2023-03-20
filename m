Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA96C7619A
	for <linux-clk@archiver.kernel.org>; Mon, 20 Mar 2023 21:30:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbjCTVaN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Mar 2023 17:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230477AbjCTV3v (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Mar 2023 17:29:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 796E9CA1E;
        Mon, 20 Mar 2023 14:29:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 950D860FCD;
        Mon, 20 Mar 2023 21:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E201BC433D2;
        Mon, 20 Mar 2023 21:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679347679;
        bh=Czz2lOpjYznlx84DXGNKjKPYgnYqwp5VFR9kQnyx3D0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OJ5xv2RbK7j6lZgGfsoO41rrYjBGn5TJxEHB3ZPdbwtPKBmiwMB1FOnpROYG88UgB
         1zNHVUVp4djBj2i8IyZ2673s/0CBmN8wplCOVk82mNGKkUnXdW8lq8HBkMhtEIrpbW
         oMh4ZLrBxCAXEYgGOjwVegMamWRFUK0Tc5BjyhlmmORkhsmDUTpqovYAZ5gYj836K0
         macGQhxr5ctJNEPxHNmOJ7kGEmP5haPWTp28o3rBIdZSjiSa7aUX3BVIYPS1TwCpZP
         bT0MCsnY3zfpn+6nN1HUtFjeahtg1bVLGAMQybC2lA1h+QytH0/t8t0IYz8RQ4G04I
         324EnuPn8Am6A==
Message-ID: <83f4f33ebd3706ec7d35acd807b1e44b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <232f59aa-704b-a374-6a78-469156ccdbea@seco.com>
References: <68037ad181991fe0b792f6d003e3e9e538d5ffd7.1673452118.git.geert+renesas@glider.be> <5da02a9b-3d42-a26f-0d18-29a6b5b181e5@seco.com> <20230124091236.1bf8c6da@booty> <CAMuHMdV8_+dF03VD6mST2zMDQ68cgsLLRQi6UeXK2jH-eWqWZg@mail.gmail.com> <232f59aa-704b-a374-6a78-469156ccdbea@seco.com>
Subject: Re: [PATCH] dt-bindings: clk: vc5: Make SD/OE pin configuration properties not required
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-reneas-soc@vger.kernel.org
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Sean Anderson <sean.anderson@seco.com>
Date:   Mon, 20 Mar 2023 14:27:56 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sean Anderson (2023-01-24 08:23:45)
> On 1/24/23 03:28, Geert Uytterhoeven wrote:
> > Hi Luca,
> >=20
> > On Tue, Jan 24, 2023 at 9:12 AM Luca Ceresoli <luca.ceresoli@bootlin.co=
m> wrote:
> >> On Thu, 19 Jan 2023 14:27:43 -0500
> >> Sean Anderson <sean.anderson@seco.com> wrote:
> >> > On 1/11/23 10:55, Geert Uytterhoeven wrote:
> >
> >> I'm wondering whether Geert has a practical example of a situation
> >> where it is better to have these properties optional.
> >=20
> > My issue was that these properties were introduced long after the
> > initial bindings, hence pre-existing DTS does not have them.
> > Yes, we can add them, but then we have to read out the OTP-programmed
> > settings first. If that's the way to go, I can look into that, though...
>=20
> FWIW I think there's no need to update existing bindings which don't
> have this property. The required aspect is mainly a reminder for new
> device trees.
>=20

Is there any resolution on this thread? I'm dropping this patch from my
queue.
