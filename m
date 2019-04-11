Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26023C10F13
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 18:32:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E81472173C
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 18:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555007567;
	bh=bnaK2ph1z18jBKO65oM+P5eeGJFvE7nj+sWrpyDm6fY=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=i9kjdJ6NFukqf4ZFTGm64QgyTnVRXXOcPNTPHX2q7SR12kKk5YB4TAXMRgpAfcudC
	 8zpwBr3RLdXTI7fWuYGUT42vXWBJ/Epb8td1fu8wQYs+/p14LGkAa+LjV8oZXZ820t
	 O4LSS6j9vaWdKmBI7RUG/PeVjKc09lDTZxHx+NnI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbfDKScq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 14:32:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:49750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726536AbfDKScq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Apr 2019 14:32:46 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B813C2083E;
        Thu, 11 Apr 2019 18:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555007565;
        bh=bnaK2ph1z18jBKO65oM+P5eeGJFvE7nj+sWrpyDm6fY=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=Xep8/hxvsyE36rMvyka0fERYf5S1phsLidA1tRmuMqSiYWNaIvmfAZ+02kqc0DAwd
         cTZNx30lZJg83edglbe+kl8FvfhfFYT/fflOE4ub2R74/Gm13wOkC4B+J9144me/Ae
         uC4xaEjVvsgQYVnfVSLfeguj0VUBXy9yhhiB4ogs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1551742066-10825-1-git-send-email-jollys@xilinx.com>
References: <1551742066-10825-1-git-send-email-jollys@xilinx.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] drivers: clk: zynqmp: Allow zero divisor value
Cc:     rajanv@xilinx.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Rajan Vaja <rajan.vaja@xilinx.com>,
        Jolly Shah <jollys@xilinx.com>
To:     Jolly Shah <jolly.shah@xilinx.com>, linux-clk@vger.kernel.org,
        michal.simek@xilinx.com, mturquette@baylibre.com,
        sboyd@codeaurora.org
Message-ID: <155500756492.20095.7980404191794562567@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 11 Apr 2019 11:32:44 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jolly Shah (2019-03-04 15:27:46)
> From: Rajan Vaja <rajan.vaja@xilinx.com>
>=20
> Zero divider is valid and default for some of ZynqMP
> clocks. Allow zero divisor when CLK_DIVIDER_ALLOW_ZERO
> for the clock is set.
>=20
> Signed-off-by: Rajan Vaja <rajanv@xilinx.com>
> Signed-off-by: Jolly Shah <jollys@xilinx.com>
> ---

Applied to clk-next

