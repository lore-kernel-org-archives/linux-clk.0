Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5EABC76195
	for <linux-clk@archiver.kernel.org>; Mon, 27 Mar 2023 19:09:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjC0TJ4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Mar 2023 15:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjC0TJz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Mar 2023 15:09:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80B9C10E5
        for <linux-clk@vger.kernel.org>; Mon, 27 Mar 2023 12:09:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2EEDDB818A4
        for <linux-clk@vger.kernel.org>; Mon, 27 Mar 2023 19:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8042C433D2;
        Mon, 27 Mar 2023 19:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679944191;
        bh=lGZh4cOI7IjG4MobZQIQzhtjV/IMNyctq0FBthlwFF8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RMN3Ve8ZEovRFHgAR3KB1zWI4055lCQMAWXcSWYStx4jr2+1G3gEykKCjGWmGhI8e
         4CSDri3NwQx979yVhwzMXXsXb6qqpPZ64xr++2hd0SAYwR3UclwFUU/OQN7CA3k5x/
         B5YCsjCvjnOsHhAYsQUorNXwBZtYf28Un3hWLqGQQ46rJIZtUVB/3rcBu+cOFJCMP3
         Qn4N3c0yIqpwAJT8YaGN3/aKeGmKY/P+hq04sWjtvIBPCcUaFwA2Lk+It3PHvA4mKK
         GbC+kVzrpZXM6Ja6IrVUfExyvwEG3MvX8nPyl7GPkgcJvUQhlAyrj+poKDx1fqOjiu
         dS3hK6lx6tHEg==
Message-ID: <a7775aace9b6c8f8256c9b87179d448e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230327062637.22237-1-shubhrajyoti.datta@amd.com>
References: <20230327062637.22237-1-shubhrajyoti.datta@amd.com>
Subject: Re: [PATCH v4] clocking-wizard: Support higher frequency accuracy
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     git@amd.com, mturquette@baylibre.com, michal.simek@xilinx.com
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-clk@vger.kernel.org
Date:   Mon, 27 Mar 2023 12:09:49 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2023-03-26 23:26:37)
> Change the multipliers and divisors to support a higher
> frequency accuracy if there is only one output.
> Currently only O is changed now we are changing M, D and O.
> For multiple output case the earlier behavior is retained.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---

Applied to clk-next
