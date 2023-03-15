Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730D9C7618B
	for <linux-clk@archiver.kernel.org>; Wed, 15 Mar 2023 14:30:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231806AbjCOOaB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Mar 2023 10:30:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233192AbjCOO36 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Mar 2023 10:29:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EBC01E5CB;
        Wed, 15 Mar 2023 07:29:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DCBAEB81E55;
        Wed, 15 Mar 2023 14:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF23C433EF;
        Wed, 15 Mar 2023 14:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678890594;
        bh=yeoozDGy68VvFH5vyT1Uvv1fHYGrzFSj4yfihcifBiM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=utJE/6cMb3JgVNikhj5KXIVkJUVGjnQTuG5xH5dZmoxVyKAdcIy/hSqgcp1/aYN2M
         kxWJIxUnljOpD9g4okXeDazyiP0QDyQAuXCmt6vC1++rJXFVn2xPRn0HZHk1CzIH4N
         I1th88B3Y8nlpEo2gQtMDfzDqcn81ylGhBfeB9970RHbhD1lRaPgOcEZ0HYK7i2S1+
         uQytbzX+AcsZiIjGqgkUaoaYV6jJiC5BMkMSNO1ngbH98gDnNfB35nJ1Ccz9pJWXXA
         EFjByt3yNEdc0yPnspX2BaOQC5YQdxRI4d1PPZVuXZNPY33tH/y6zNAofnij49a8ri
         e3av8CUdEUKhg==
From:   Conor Dooley <conor@kernel.org>
To:     linux-riscv@lists.infradead.org,
        Jesse Taube <mr.bossman075@gmail.com>
Cc:     conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jesse Taube <Mr.Bossman075@gmail.com>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v1] RISCV: CANAAN: Make K210_SYSCTL depend on CLK_K210
Date:   Wed, 15 Mar 2023 14:29:31 +0000
Message-Id: <167889030701.90562.14045600493618249277.b4-ty@microchip.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314211030.3953195-1-Mr.Bossman075@gmail.com>
References: <20230314211030.3953195-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=538; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=6lWFOE6LTt1oRZCLjVCboDlTzeAL/GgThgDMSLLR1N8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmC1zy2XghyrlbTZ4+vWbPxrvOPtxrfA/6n9GbVVywRn GgRVvG3o5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABN5c5+R4XgFf83F+cVr2S2i thqfnRP48bnsCbtWNSZ2e9V988oifBkZPnD90TKKuhx97VsHy/3YXdPTAm/8/P30vsPbB+9CrzT fYgcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

On Tue, 14 Mar 2023 17:10:30 -0400, Jesse Taube wrote:
> CLK_K210 is no longer a dependency of SOC_CANAAN,
> but K210_SYSCTL depends on CLK_K210. This patch makes K210_SYSCTL
> depend on CLK_K210. Also fix whitespace errors.
> 
> 

Applied to riscv-soc-for-next, thanks!

[1/1] soc: canaan: Make K210_SYSCTL depend on CLK_K210
      https://git.kernel.org/conor/c/49f965b6fbca63904d7397ce96066fa992f401a3

I dropped the common clk dependency down onto its own line & tweaked
the $subject a wee bit.

Thanks for the patch!

