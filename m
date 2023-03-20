Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E717EC6FD1C
	for <linux-clk@archiver.kernel.org>; Mon, 20 Mar 2023 21:45:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbjCTVpQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Mar 2023 17:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231236AbjCTVpO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Mar 2023 17:45:14 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28C701A959;
        Mon, 20 Mar 2023 14:44:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E7E76B810F8;
        Mon, 20 Mar 2023 21:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A30AC433D2;
        Mon, 20 Mar 2023 21:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679348650;
        bh=AHvvSnceV6SHFDFf6KJisr7H53JnJSp5GyA5Dex99BY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KuhWHgoIBSPPGodsFnt8k7GoulNe4CvpjK4TGGNzSDHmi+jcn1y1atPQSy1DNRF8A
         mwJthk/DZiVFSGormubf5QKXuxIkKDHQXK9y7IW2jdRWruYSrAlJ6w4+0smA9wmCzV
         yDbebPSvnGGdeVwPWAtLNPJvndMvxkMkUH0DgmrOArI/fsQrWGFPm86yE2/oI6wuyp
         LKpYWD17pqq7I/692rZx0a/phObJEQMjByhUJg7V0gBw1c6gDmy6J1dIUsESp6o50Q
         2eq63eRn6sk3aovmsRJL1E6umGEhHSIvVIDSf3xut42M+rh0tpNDOlcagevSR96VYB
         S2QQhbTJUS7sg==
Message-ID: <84fa06c37e06a01b4d80d5e2fb896b6d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221219015130.42621-1-qinjian@cqplus1.com>
References: <20221219015130.42621-1-qinjian@cqplus1.com>
Subject: Re: [RESEND PATCH v2] clk: Add Sunplus SP7021 clock driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Qin Jian <qinjian@cqplus1.com>,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
To:     Qin Jian <qinjian@cqplus1.com>
Date:   Mon, 20 Mar 2023 14:44:08 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Qin Jian (2022-12-18 17:51:30)
> Add clock driver for Sunplus SP7021 SoC.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Qin Jian <qinjian@cqplus1.com>
> ---

Applied to clk-next
