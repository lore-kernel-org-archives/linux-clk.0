Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B8BC0015E
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jul 2023 20:09:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjGSUJe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Jul 2023 16:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbjGSUJb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jul 2023 16:09:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 350881FDC;
        Wed, 19 Jul 2023 13:09:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8F47461802;
        Wed, 19 Jul 2023 20:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0975C433C7;
        Wed, 19 Jul 2023 20:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689797368;
        bh=25xwms1S/OC5iANi0Ovz8sIyMsTKpjQx+C3T8b6Pk4E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dejKANI9G+WwwCGsfOYKUCoBwpt929bvBtgov6IC2UcK7+v1aObQTQNrQmOCpjA42
         N6aSy0Gsfu6mN4pAGoJLQitGGv6dfa7lXS/bYXp4KhbEgmVWJBhQCwfvvFxYGoefOg
         Tu6xMJMW3FAdxL3/gw/Srqg1UpI/bVzp1mAqm6cgi4p3dMrHTyI+SQHdQwMokhgfxI
         ljoeOD3r7KOyrk8HnxnipN1rKw7mI0GSTb+GPFid5Wf6jqTlU+jE+8jOrSxJYCP25C
         yIYSS6YrvjtoZ3YSNuP8UqpnqWaRgDicfC/0am8FvqrhzsnjhkFPKQrvEnN6DsQ4YX
         YwknjKoOtPgSQ==
Message-ID: <1d7cb663f4400dcf5661fb3ef9ab710d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230620110137.5701-1-shubhrajyoti.datta@amd.com>
References: <20230620110137.5701-1-shubhrajyoti.datta@amd.com>
Subject: Re: [PATCH v4] dt-bindings: clock: versal: Add versal-net compatible string
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     git@amd.com, mturquette@baylibre.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-clk@vger.kernel.org
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        devicetree@vger.kernel.org
Date:   Wed, 19 Jul 2023 13:09:25 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2023-06-20 04:01:37)
> Add dt-binding documentation for Versal NET platforms.
> Versal Net is a new AMD/Xilinx  SoC.
>=20
> The SoC and its architecture is based on the Versal ACAP device.
> The Versal Net  device includes more security features in the
> platform management controller (PMC) and increases the number of
> CPUs in the application processing unit (APU) and the real-time
> processing unit (RPU).
>=20
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@xilinx.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>=20
> ---

Applied to clk-next
