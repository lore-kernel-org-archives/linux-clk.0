Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B73C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 03:26:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356211AbiAYD0I (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jan 2022 22:26:08 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:33202 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S3409514AbiAYA0h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Jan 2022 19:26:37 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 68338B81229;
        Tue, 25 Jan 2022 00:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16C42C340E4;
        Tue, 25 Jan 2022 00:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643070393;
        bh=aoKzkc7anyXT7Y6fKPYFjdWVeGFeRLKDqWmnSy5nbHU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=aXAQ4slrDeQlo0cHfxwvpUdn5I/krO3FaZtb3J1TNMPJGwcyL50e1GXx2/f7PJqKr
         U66wRnMe9UG/SsytAz6RzrM9giaMBWF6eJkbsxx8+ZEF/XOeSCWCDCU8N07bG7RtsQ
         1hQ7t1B6CRGq8VY9H4WLEzRSWb6i83dXQ4Paurd6FKSvawJUqQjcGk0gd/xgcmJU+P
         c/hXW3VpXZAYOzBJfYUd6nLK/d4BeU1bRbQmpm/ZrWq8njnyAlbsTeTOw2W1JIx9RU
         R/RyQOhshJ4KRf1zI42S/PKG6FTbQVw2MD6lMlLL06/oLOpxageV7w6DSxbkF0nh4+
         k936vaTwGOiaA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211216140022.16146-2-conor.dooley@microchip.com>
References: <20211216140022.16146-1-conor.dooley@microchip.com> <20211216140022.16146-2-conor.dooley@microchip.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: clk: microchip: Add Microchip PolarFire host binding
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     krzysztof.kozlowski@canonical.com, geert@linux-m68k.org,
        david.abdurachmanov@gmail.com, palmer@dabbelt.com,
        daire.mcnamara@microchip.com, cyril.jean@microchip.com,
        conor.dooley@microchip.com, Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Mon, 24 Jan 2022 16:26:31 -0800
User-Agent: alot/0.10
Message-Id: <20220125002633.16C42C340E4@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting conor.dooley@microchip.com (2021-12-16 06:00:21)
> From: Daire McNamara <daire.mcnamara@microchip.com>
>=20
> Add device tree bindings for the Microchip PolarFire system
> clock controller
>=20
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
>=20
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-next
