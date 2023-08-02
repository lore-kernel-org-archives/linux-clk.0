Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B35C001DF
	for <linux-clk@archiver.kernel.org>; Wed,  2 Aug 2023 19:12:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjHBTL7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Aug 2023 15:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjHBTL7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Aug 2023 15:11:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51B5926A6;
        Wed,  2 Aug 2023 12:11:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DACC761AB0;
        Wed,  2 Aug 2023 19:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF9BC433C8;
        Wed,  2 Aug 2023 19:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691003517;
        bh=qd9IKHdNBAlAr/GT5Kctp54et5v6K1KuzStaN2J4xwc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RaWhoOghrwgGhgRLaEAYdBpZoqIQnfKntdQaNtKHizOnkw5aFYN2IAEYtRirsqrqs
         bcJc1n4CUTt+swIcTAt/pUwsvuRMTLNd/lds6FJaKU03n7RnRmq0sF0m8+grTs/Pe4
         Uj4qKLTOhgNt9WGBx9+bIxjztEaF2T2CXEcp1Ayd5sTzu6YUHsXfl689/aCgntx5xz
         naX+pMgST9NOwvWuLmRGZ+SS5/tQl6NaQZ2LgzTKBmWHxtmVNBasGqQgmDxr8iJ60Y
         wh+DJzKvZ1VRDdg1F3TSGPhS6qRX1/YBcy7Aj2Sm3j1dMu8s1JNp2cuVf4NoSXynEk
         224vuai3j4MHg==
Message-ID: <066cf778bf09a42d77afa3232966c885.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230802043557.26478-1-shubhrajyoti.datta@amd.com>
References: <20230802043557.26478-1-shubhrajyoti.datta@amd.com>
Subject: Re: [PATCH v4] dt-bindings: clock: versal: Convert the xlnx,zynqmp-clk.txt to yaml
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     git@amd.com, linux-clk@vger.kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, michal.simek@amd.com
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        devicetree@vger.kernel.org
Date:   Wed, 02 Aug 2023 12:11:55 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2023-08-01 21:35:57)
> Convert the xlnx,zynqmp-clk.txt to yaml.
> versal-clk.yaml already exists that's why ZynqMP is converted and
> merged.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---

Applied to clk-next
