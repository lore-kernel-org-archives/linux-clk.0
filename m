Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567D0C433C1
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 02:32:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21502619D3
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 02:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233083AbhCaCcG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Mar 2021 22:32:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:57806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233405AbhCaCbv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 30 Mar 2021 22:31:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D7AE619C5;
        Wed, 31 Mar 2021 02:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617157911;
        bh=Jq+urPA7tR5lBamzzhMtFyoFPVRJenIyJj95XWAWsPg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mbE/9gFCi3wiTUJKvuUUxi5pCDZ3Ucrfu7xXWK0thvfeg12IJ62pF9DbwTfDTpCML
         J7t2wCSeohKgjZZGbSD5gYSIYR/H2vX/js54R1IWfDn2Nur8aYThVt6NaDF2Jilbt5
         YeQwEJFpt+RaAakC6IIEypsACa1Wg+VlYKVGz0Clw7cmPPc3xPfSJNrDT74DmY7BmW
         acUcrfybClIVCjxIzueK+01voBiZqqIgQosgEb+QcPlkVsQT9RDv0PJKuFY2wWTBG9
         1phgACslQjfH29D/FjFO/f1WeZiI/MgUjtp/wPkOX78B8ESXvNIuHALk0spr2wJPgD
         uuUlyQVerHD1Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210302214151.1333447-1-dinguyen@kernel.org>
References: <20210302214151.1333447-1-dinguyen@kernel.org>
Subject: Re: [PATCH 1/3] clk: socfpga: use clk_hw_register for a5/c5
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     dinguyen@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Dinh Nguyen <dinguyen@kernel.org>
Date:   Tue, 30 Mar 2021 19:31:50 -0700
Message-ID: <161715791030.2260335.4564887946747756314@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dinh Nguyen (2021-03-02 13:41:49)
> As recommended by Stephen Boyd, convert the cyclone5/arria5 clock driver
> to use the clk_hw registration method.
>=20
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---

Applied to clk-next
