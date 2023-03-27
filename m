Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7E0C6FD1D
	for <linux-clk@archiver.kernel.org>; Mon, 27 Mar 2023 20:20:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232620AbjC0UUC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Mar 2023 16:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232508AbjC0UUA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Mar 2023 16:20:00 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E60EC3C02;
        Mon, 27 Mar 2023 13:19:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8DAEDB817B1;
        Mon, 27 Mar 2023 20:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49AACC433EF;
        Mon, 27 Mar 2023 20:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679948396;
        bh=VUA7G1qc10rl/AUX3Ka2UQJX//SOu/LlX8o38eXEuYU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qFsXaaTYXUKLWU3hPcQZxAO4Ysu4oS78ylllTR0SBp0SoDMK2pRJSX9nVTo4k2dEg
         7jbVr8fqOdnr805S14ggtQ1q7pf+dL4z4+zRntVY1+ydQKxwYVu/fCVt5AGQqX7tFa
         umsBcxzr0sZ3TLzlJYC+iSpWlaJ45OrKj5Jpae8pzQdGrIX3xuPEpUH1mkflx6i/Kp
         SfQn+EZwf0b4yHiDndZgsFjkI31pOE/2WxyPqwcrF2ULYgsye4guKPl04S+EXLx1hr
         IVx8hlDIQp5g4tD3I5T6tdod4HcEiXKGmVKA3zWjmJy0EnynuMiOBX9P6lYgiGbY3k
         Q3762soZBtZeQ==
Message-ID: <dc3171280bda07096976e61194968aa7.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230322171515.120353-3-noltari@gmail.com>
References: <20230322171515.120353-1-noltari@gmail.com> <20230322171515.120353-3-noltari@gmail.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: reset: add BCM63268 timer reset definitions
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez?= Rojas <noltari@gmail.com>,
        Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, krzysztof.kozlowski+dt@linaro.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, p.zabel@pengutronix.de,
        robh+dt@kernel.org, william.zhang@broadcom.com,
        =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez?= Rojas <noltari@gmail.com>
Date:   Mon, 27 Mar 2023 13:19:53 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting =C3=81lvaro Fern=C3=A1ndez Rojas (2023-03-22 10:15:13)
> Add missing timer reset definitions for BCM63268.
>=20
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
