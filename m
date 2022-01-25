Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C4B0C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 22:29:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233816AbiAYW3I (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 17:29:08 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:50778 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233815AbiAYW3H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jan 2022 17:29:07 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 61E18B81B7D;
        Tue, 25 Jan 2022 22:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14377C340E0;
        Tue, 25 Jan 2022 22:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643149745;
        bh=DJdc8kbVjyK4XzQs3F72bUTLIOhFtBaogGQ5YO5QV/g=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rDWMW0a5C7+Mni1Xc53asshQxRs3a+6J2aZxZQ5UecdDybcWVstrVFNc8ETX1vD2L
         TK1Jx/56vrSsodhmK5quz05xqipk5W6KRkV3ALQRqmzy+0ui785b9dI4W+dQeyUSjY
         VMLV9scHHEs2o10X8snC2dCzTi0l/XUjkCiWiGzo4xTGvBIx9AW5Mu+C2jh8FbilxR
         rF5/FBgo+1nEHtDqoQX6L28NzOWlgsJgAY62qMXOqT1FVyPONYzMKsdRzMMWjwyBNK
         E5vfanQ1D9We6KuluUTfPZ30pC1q1JHgr36gAu2Mp22LQxt2EAiYvbufC/xmkE/wTN
         lS+GaFWGvC+hg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220125093336.226787-2-daniel@zonque.org>
References: <20220125093336.226787-1-daniel@zonque.org> <20220125093336.226787-2-daniel@zonque.org>
Subject: Re: [PATCH RESEND v4 1/9] dt-bindings: clock: convert cs2000-cp bindings to yaml
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>, Rob Herring <robh@kernel.org>
To:     Daniel Mack <daniel@zonque.org>, mturquette@baylibre.com
Date:   Tue, 25 Jan 2022 14:29:03 -0800
User-Agent: alot/0.10
Message-Id: <20220125222905.14377C340E0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Daniel Mack (2022-01-25 01:33:28)
> The original author of the file was added as maintainer.
>=20
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
