Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5669AC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 22:30:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233861AbiAYWah (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 17:30:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233824AbiAYWah (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jan 2022 17:30:37 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5973DC06173B;
        Tue, 25 Jan 2022 14:30:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 176EEB81B81;
        Tue, 25 Jan 2022 22:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B319EC340E0;
        Tue, 25 Jan 2022 22:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643149834;
        bh=DfeAcVSHh0D/zOGjKbpcXxRj2uI6oo/nO/77qFXGj+g=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jQrshj8vNJjmBMnHQ11PMeAFIR/LprUxiDCryjDO9ZHI7FsN28kAt8h/6tFmOH97m
         mskf0pIW/ZXKPvWDfhRK0lN/33rNob56FS4SQv7kLGke5fEin+mmJdWi+qcoDRKtvZ
         jhbJjr0rj/Q2ho6OPlbHsbvV9E09WQzWIN6C7K1If+RV+ROQEClR9P2GVxjyZaNRwu
         NAmFmd+RiceaohBs38/bUtkSnrGgO0/SfuDe9b1VC5T6UfkL7kUTTV9jy7HylsIwYu
         /re0ch1iEt647p93DUM2kQAWuqqmKyb9XwCHngV7iTyZ5PlyxXiFuohdIRAjRAoBVI
         6yZr+VCYWhJBA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220125093336.226787-10-daniel@zonque.org>
References: <20220125093336.226787-1-daniel@zonque.org> <20220125093336.226787-10-daniel@zonque.org>
Subject: Re: [PATCH RESEND v4 9/9] clk: cs2000-cp: convert driver to regmap
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>
To:     Daniel Mack <daniel@zonque.org>, mturquette@baylibre.com
Date:   Tue, 25 Jan 2022 14:30:33 -0800
User-Agent: alot/0.10
Message-Id: <20220125223034.B319EC340E0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Daniel Mack (2022-01-25 01:33:36)
> Regmap gives us caching, debugging infrastructure and other things for
> free and does away with open-coded bit-fiddling implementations.
>=20
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---

Applied to clk-next
