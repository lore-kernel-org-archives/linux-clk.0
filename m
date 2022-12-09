Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F113CC4332F
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 01:19:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbiLIBTr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Dec 2022 20:19:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbiLIBTj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Dec 2022 20:19:39 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3607AC6F4;
        Thu,  8 Dec 2022 17:19:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 901B0B826B7;
        Fri,  9 Dec 2022 01:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED4AC433F0;
        Fri,  9 Dec 2022 01:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670548772;
        bh=VBi+JU6f+3IN3dtVUvOzl3A1bhvK0xhJ6N+t5YBtYqc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=L9HYrUSO+cIKifGCuS3CQOOuUkma8I0Ch/5ra3bouEdA2qQtwyHxR8JR1iltF1sWt
         NBjq/ubfSywR4R1W4NpSyoKURZD/8nDyYA+UM8NqS5W5pXXtSa/Tbf0G4kH5JmWEqt
         XAaTbQkBsTOg9MpsUGpo8h7+ZYUC4011QjZX/Uj/VYhauhzCOUaj7WAYZSS8yOVojn
         VI2LpCt1UfhjoTgbE3eijeZV5YQJ9JloNhKBUDCuQKd608lTOgx5ROMux8i0HVm55s
         5x0H2jIv/gWw1R+TsAWX6H4wTF6UvLlL4G/P+vn9qaLiRzatv7DQfuzFUSp0f7GP/b
         ZZ2PqB398507g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221120030257.531153-4-liambeguin@gmail.com>
References: <20221120030257.531153-1-liambeguin@gmail.com> <20221120030257.531153-4-liambeguin@gmail.com>
Subject: Re: [PATCH v1 3/4] clk: lmk04832: drop superfluous #include
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
To:     Liam Beguin <liambeguin@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 08 Dec 2022 17:19:30 -0800
User-Agent: alot/0.10
Message-Id: <20221209011932.4ED4AC433F0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Liam Beguin (2022-11-19 19:02:56)
> iwyu warnings: (new ones prefixed by >>)
> >> drivers/clk/clk-lmk04832.c:15:1: iwyu: warning: superfluous #include <=
linux/debugfs.h>
> >> drivers/clk/clk-lmk04832.c:20:1: iwyu: warning: superfluous #include <=
linux/uaccess.h>
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/all/202107110620.926Sm95z-lkp@intel.com/
> Signed-off-by: Liam Beguin <liambeguin@gmail.com>
> ---

Applied to clk-next
