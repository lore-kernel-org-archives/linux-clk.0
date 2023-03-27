Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB07C6FD1D
	for <linux-clk@archiver.kernel.org>; Mon, 27 Mar 2023 20:20:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232787AbjC0UUN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Mar 2023 16:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232798AbjC0UUK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Mar 2023 16:20:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD8CF4214;
        Mon, 27 Mar 2023 13:20:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EEA4D6131A;
        Mon, 27 Mar 2023 20:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568EBC433D2;
        Mon, 27 Mar 2023 20:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679948407;
        bh=zbuq9N2k6S/WAMDi40GnbfhC0hVsMsnt93oq7hFZd8g=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pcFD3HQS1yRkT3RIJvcj14QVCFI+tCLKfChZxycHokmCW3LrslLeVOf6+6CqUJWJy
         8SvAxYBgaKtPf3RgYGg+qN7jF/n1RzIf7R5fcLDbmF0EEThmKYIVkWi/YMMngbulSv
         lhvW4tC8SNJEUclqhxwmYX9cfOJINfqfbu3ipk4dPh6H+JkGRMwoId1XzboxqbbMZk
         Drwa8VrI7IXL4yW2lWkUNgNcpHLKnZYoxB8KsDZZWjbdd3HyTRMfq0xvghXxHLxYKX
         UigZP18W4NlzBYTNoIkAq2AFZHehhtIUYr6C/rXmRWgT6Pgq/hGxqJvxc1woVKnI8O
         8NPD2tjPQCl/w==
Message-ID: <49db3b91838a48846557cc40b64a4ad7.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230322171515.120353-4-noltari@gmail.com>
References: <20230322171515.120353-1-noltari@gmail.com> <20230322171515.120353-4-noltari@gmail.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: clock: Add BCM63268 timer binding
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez?= Rojas <noltari@gmail.com>,
        Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, krzysztof.kozlowski+dt@linaro.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, p.zabel@pengutronix.de,
        robh+dt@kernel.org, william.zhang@broadcom.com,
        =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez?= Rojas <noltari@gmail.com>
Date:   Mon, 27 Mar 2023 13:20:05 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting =C3=81lvaro Fern=C3=A1ndez Rojas (2023-03-22 10:15:14)
> Document the Broadcom BCM63268 Clock and Reset controller.
>=20
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
