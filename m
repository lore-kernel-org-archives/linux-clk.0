Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F7AE95A8E
	for <linux-clk@archiver.kernel.org>; Mon,  9 Oct 2023 11:17:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346170AbjJILRg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Oct 2023 07:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345822AbjJILRf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Oct 2023 07:17:35 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E9D8E94;
        Mon,  9 Oct 2023 04:17:33 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D6271FB;
        Mon,  9 Oct 2023 04:18:14 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 75EA43F762;
        Mon,  9 Oct 2023 04:17:32 -0700 (PDT)
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Cristian Marussi <cristian.marussi@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 0/2] firmware: arm_scmi: clock: support parents commands
Date:   Mon,  9 Oct 2023 12:17:29 +0100
Message-ID: <169685012752.1328773.11061683004057797364.b4-ty@arm.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004-scmi-clock-v3-v5-0-1b8a1435673e@nxp.com>
References: <20231004-scmi-clock-v3-v5-0-1b8a1435673e@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 04 Oct 2023 07:42:22 +0800, Peng Fan (OSS) wrote:
> SCMI v3.2 spec adds parents commands, this patchset is to support them:
> CLOCK_POSSIBLE_PARENTS_GET
> CLOCK_PARENT_SET
> CLOCK_PARENT_GET
> 
> Besides firmware api clock driver update, the clk_scmi driver also
> updated to support set_parent and get_parent ops.
> 
> [...]

Hi Stephen,

Since you have acked other changes in the same driver and agreed to take it
via SoC tree, I have applied these changes as well.

Applied(with minor edits to the subject and the commit messages) to
sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/2] firmware: arm_scmi: clock: support clock parents
      https://git.kernel.org/sudeep.holla/c/77bbfe607b1d
[2/2] clk: scmi: add set/get_parent support
      https://git.kernel.org/sudeep.holla/c/65a8a3dd3b95
--
Regards,
Sudeep

