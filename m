Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2321C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 22:29:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233852AbiAYW3u (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 17:29:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233859AbiAYW3t (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jan 2022 17:29:49 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C55CC06174E;
        Tue, 25 Jan 2022 14:29:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 352DC61851;
        Tue, 25 Jan 2022 22:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87BE8C340E0;
        Tue, 25 Jan 2022 22:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643149785;
        bh=66QiHBMlhG9aBFwCS+/Bd//tFZgUXLvIFkPD8QcNcmk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=JyjAJpY+18EZJAptzbG4KdpLW4eW+gwj4X+Zh++lLG6oP2bN9+TSpELUf4ar/OvGE
         bALtMtwqJ7JaVNL8cLQ8wZkctwuwfd8LT9gwh8nynh4HfHEqj/h1WJAZD61JLnwrP3
         bVAK4WXd+1j5zUQtoLRQKEKZ37E8hGcBlH5LLdY7w9yU9WcTSbSc17aXC8YrFnkI5C
         ESwlD27bse+LPInElM810Haqk6Q18RB3gEea4x+27CHYS9HL0Ikoo2VD31dbGm931p
         GhDl8bxO1Zo2UYEJW7PM8awjm5EGtG+PN+WOoTkbmbW/CTr/wrQx5HA03CrjUFtnDy
         6jLIDqBlC31rQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220125093336.226787-5-daniel@zonque.org>
References: <20220125093336.226787-1-daniel@zonque.org> <20220125093336.226787-5-daniel@zonque.org>
Subject: Re: [PATCH RESEND v4 4/9] dt-bindings: clock: cs2000-cp: document cirrus,dynamic-mode
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>, Rob Herring <robh@kernel.org>
To:     Daniel Mack <daniel@zonque.org>, mturquette@baylibre.com
Date:   Tue, 25 Jan 2022 14:29:43 -0800
User-Agent: alot/0.10
Message-Id: <20220125222945.87BE8C340E0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Daniel Mack (2022-01-25 01:33:31)
> This new flag exists to enable the dynamic mode of the hardware.
> When not given, the static mode is used.
>=20
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
