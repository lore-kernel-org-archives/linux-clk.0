Return-Path: <SRS0=vytI=PR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB89C43387
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 18:54:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6431A214C6
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 18:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547060066;
	bh=JAyHTHDxHbS05ObHgzrV7yd6yPTKQQdN2LOtB2RrBbI=;
	h=Subject:Cc:To:In-Reply-To:From:References:Date:List-ID:From;
	b=vOAUye+7u7B670Jc4qUPUbtb0/kKZUML/JIVUtK399itzS5T7kTN8OTRVxpkNifSy
	 pr+xlFnkPAzagLO4AvuwciwVXsnw+9qw1S2JI9f6MokPUNYuD9uls82GrySXcjckbi
	 m+eSNXuhYzB4Brvvs/wLyVBJ/GbMHFqElpJv1RDw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbfAISy0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Jan 2019 13:54:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:52808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727286AbfAISy0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 9 Jan 2019 13:54:26 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5954720859;
        Wed,  9 Jan 2019 18:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1547060065;
        bh=JAyHTHDxHbS05ObHgzrV7yd6yPTKQQdN2LOtB2RrBbI=;
        h=Subject:Cc:To:In-Reply-To:From:References:Date:From;
        b=c6ND2WtSTg7Il/my5hdjeeCmsX0xhHcChK+PAYoNomdvV9Z5/YPfaTP7hkTbvUbh5
         e5NYYJbQg0QhuXM6uvSJMYovtJ9zfjJhHzO4S21tBlXgGwMAAhrEDIkoG7heIgDfsg
         XSl59Fz/fV4W7oRKM30rv9VqDMLEypgOigAgRo1Q=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: vc5: Abort clock configuration without upstream clock
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marek.vasut@gmail.com>, linux-clk@vger.kernel.org
In-Reply-To: <20181215005519.3695-1-marek.vasut+renesas@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
References: <20181215005519.3695-1-marek.vasut+renesas@gmail.com>
Message-ID: <154706006447.15366.17768068514421647549@swboyd.mtv.corp.google.com>
Date:   Wed, 09 Jan 2019 10:54:24 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2018-12-14 16:55:19)
> In case the upstream clock are not set, which can happen in case the
> VC5 has no valid upstream clock, the $src variable is used uninited
> by regmap_update_bits(). Check for this condition and return -EINVAL
> in such case.
>=20
> Note that in case the VC5 has no valid upstream clock, the VC5 can
> not operate correctly. That is a hardware property of the VC5. The
> internal oscilator present in some VC5 models is also considered
> upstream clock.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Alexey Firago <alexey_firago@mentor.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-renesas-soc@vger.kernel.org
> ---

Applied to clk-fixes

