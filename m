Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BFFC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 22:29:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233820AbiAYW3T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 17:29:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233815AbiAYW3S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jan 2022 17:29:18 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5340DC06173B;
        Tue, 25 Jan 2022 14:29:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1BCD1B819BE;
        Tue, 25 Jan 2022 22:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA12EC340E0;
        Tue, 25 Jan 2022 22:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643149755;
        bh=ctxsnhkMQ8849ZuTTlMg+U0svbrZGUiET1EQR1Y8I0Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RdRNGqVPeMWEB3rdeiascJ0nUbXlPIp8qOPJUlxB2wOUFFIE//0s5Jxq6L5BSENrR
         pnlshsrwNHRVYlEc7p3YfcrTc9A9ElvASgEpedZdd1027r5mB7sPmRtUN2uxVfMl88
         u2nQM/pCEpbfzcUuWjNZwP2srTskdiq6t9rEk0eUOtr/QA1m4Fjibd0Mkn3O3WW1PJ
         THAlJxsQ/HxG4uYUcHq/u03ZNCuyXff6qzEU8uYgdHC1XrDNQYy2GGyTAyIZwN+onn
         5petrzyy9zxH/8e5sdGZU+8Pfbo/qP7E1EvZ2PHy4nnXUEc2qo1WFEU4oOq+iv+SXQ
         RcLrZqjVzJdBQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220125093336.226787-3-daniel@zonque.org>
References: <20220125093336.226787-1-daniel@zonque.org> <20220125093336.226787-3-daniel@zonque.org>
Subject: Re: [PATCH RESEND v4 2/9] dt-bindings: clock: cs2000-cp: document aux-output-source
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>, Rob Herring <robh@kernel.org>
To:     Daniel Mack <daniel@zonque.org>, mturquette@baylibre.com
Date:   Tue, 25 Jan 2022 14:29:14 -0800
User-Agent: alot/0.10
Message-Id: <20220125222915.BA12EC340E0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Daniel Mack (2022-01-25 01:33:29)
> This new optional property can be used to control the function of the
> auxiliary output pin. Introduce a new dt-bindings include file that
> contains the numerical values.
>=20
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
