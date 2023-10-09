Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171DFE95A8E
	for <linux-clk@archiver.kernel.org>; Mon,  9 Oct 2023 11:14:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346139AbjJILOq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Oct 2023 07:14:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345822AbjJILOq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Oct 2023 07:14:46 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 648A194
        for <linux-clk@vger.kernel.org>; Mon,  9 Oct 2023 04:14:44 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B1D51FB;
        Mon,  9 Oct 2023 04:15:24 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0DD743F762;
        Mon,  9 Oct 2023 04:14:42 -0700 (PDT)
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     linux-arm-kernel@lists.infradead.org,
        Sudeep Holla <sudeep.holla@arm.com>
Cc:     Cristian Marussi <cristian.marussi@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: scmi: Free scmi_clk allocated when the clocks with invalid info are skipped
Date:   Mon,  9 Oct 2023 12:14:40 +0100
Message-ID: <169684987002.1328090.9182700357853271503.b4-ty@arm.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004193600.66232-1-sudeep.holla@arm.com>
References: <20231004193600.66232-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 04 Oct 2023 20:36:00 +0100, Sudeep Holla wrote:
> Add the missing devm_kfree() when we skip the clocks with invalid or
> missing information from the firmware.
>

Hi Stephen,

Since you have acked other changes in the same driver and agreed to take it
via SoC tree, I have applied this simple fix.

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] clk: scmi: Free scmi_clk allocated when the clocks with invalid info are skipped
      https://git.kernel.org/sudeep.holla/c/3537a75e73f3
--
Regards,
Sudeep

