Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60109C32792
	for <linux-clk@archiver.kernel.org>; Mon, 22 Aug 2022 23:59:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235313AbiHVX7N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Aug 2022 19:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231396AbiHVX7M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Aug 2022 19:59:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B54DCCE7
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 16:59:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4F52660909
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 23:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A31CAC433C1;
        Mon, 22 Aug 2022 23:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661212750;
        bh=cW4kN4y5xFisk77eVYsxuQ6SxJT4lN25fIfw1lv8Mdw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gNEEcLY6qluE7bs7JSFaOnkwtBSLZTF94Pr/51WryrzhZQknpJRKBWmbzz1hQ52Cg
         EiVWowG7/qw0Dl9DXV++mLgAh2nofvuUQqwW5tI2gXQoGvO7XyCAdLeVNZ/HXYZBcl
         m/9uqR1cppuusZPD1FCLk9M5UU3PbvkZk8OW6/TnbQCNp0t6YBZjU6ZMu5RaKefTG2
         18TwOzNqTiwQBtP1x+eznz2VPeqDbb1WY5ioDsQ1HP6BBxMwPIa1ysR8kVCMlmsG+M
         0iiYGw8h7R90N8X1H1uGcYuGg/Tv5eAp5zal3MqB3ZrJzYUF+eR1RzW9S/nFZSbwKV
         2Clg9f9l95Oew==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220518055314.2486-1-shubhrajyoti.datta@xilinx.com>
References: <20220518055314.2486-1-shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH] clk: zynqmp: Add a check for NULL pointer
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, michal.simek@xilinx.com, git@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-clk@vger.kernel.org
Date:   Mon, 22 Aug 2022 16:59:08 -0700
User-Agent: alot/0.10
Message-Id: <20220822235910.A31CAC433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2022-05-17 22:53:14)
> Add a NULL pointer check as clk_hw_get_parent can return NULL.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---

Applied to clk-next
