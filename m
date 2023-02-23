Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F17C6379F
	for <linux-clk@archiver.kernel.org>; Wed, 22 Feb 2023 02:02:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjBVCCG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Feb 2023 21:02:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjBVCCF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Feb 2023 21:02:05 -0500
Received: from mail.nfschina.com (unknown [42.101.60.237])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 296CD30B16;
        Tue, 21 Feb 2023 18:02:03 -0800 (PST)
Received: from localhost (unknown [127.0.0.1])
        by mail.nfschina.com (Postfix) with ESMTP id C643C1A00A79;
        Wed, 22 Feb 2023 10:02:41 +0800 (CST)
X-Virus-Scanned: amavisd-new at nfschina.com
Received: from mail.nfschina.com ([127.0.0.1])
        by localhost (localhost.localdomain [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id BH1cUgyYyBEG; Wed, 22 Feb 2023 10:02:41 +0800 (CST)
Received: from localhost.localdomain (unknown [219.141.250.2])
        (Authenticated sender: zeming@nfschina.com)
        by mail.nfschina.com (Postfix) with ESMTPA id F00111A0098C;
        Wed, 22 Feb 2023 10:02:40 +0800 (CST)
From:   Li zeming <zeming@nfschina.com>
To:     sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, michal.simek@xilinx.com,
        mturquette@baylibre.com
Subject: Re: [PATCH] zynq: clkc: Add kmalloc allocation flag
Date:   Fri, 24 Feb 2023 02:33:11 +0800
Message-Id: <20230223183312.2759-1-zeming@nfschina.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <1e05156120fdfd79ed267f44fe7f3491.sboyd@kernel.org>
References: <1e05156120fdfd79ed267f44fe7f3491.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


hello senior:
  I observed that some other variable assignments in this function are basically judged by the if statement, while clk_name does not make an if branch statement, and I think clk_name is also relatively important, increasing __GFP_NOFAIL flag ensures that the assignment can succeed under any circumstances.

