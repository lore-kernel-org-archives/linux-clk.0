Return-Path: <SRS0=hoZU=QU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74AAEC282C2
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 17:09:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F1DD2075C
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 17:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550077788;
	bh=zLgtUmUW10DVXZeanZL8BHYBbRtGzPuWhu+4tmVWzaM=;
	h=To:In-Reply-To:Subject:References:Cc:From:Date:List-ID:From;
	b=cndQJuWLv9syCyG/UbwbRVLfbNKA2DRtM0qsTAfCGhcKwlQM/DlQuL3Pm+fbowTkr
	 ODC6WLkCHIofvOqkPVbdNrUnpSvfl3TfmK/pVblptW8dyFMhvw2MF/NZjmxyLCi6P3
	 2BMUAOclWeuVHtIqVCfagS3Tz2c65HwRsK5/AJlg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391723AbfBMRJl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Feb 2019 12:09:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:47352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391657AbfBMRJl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 13 Feb 2019 12:09:41 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7F7A32070B;
        Wed, 13 Feb 2019 17:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550077780;
        bh=zLgtUmUW10DVXZeanZL8BHYBbRtGzPuWhu+4tmVWzaM=;
        h=To:In-Reply-To:Subject:References:Cc:From:Date:From;
        b=dsQXE6Gb7jeH54YIpX6GG9p/W3Z/RhnFDG0jMHhD4La//sj4Ci86/9bABiiLm6BYM
         RPRjvACu2JxmY0u5FZo3m5i1zjzWdmPlwppe1oC1xb9aRiAj1lqbF7/uP5IsWJmGnM
         Rw4C+Wt69mYsrle7nnFQxDqYijwF2f7u0rL3MZ/w=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        kevin-cw.chen@mediatek.com, mars.cheng@mediatek.com,
        matthias.bgg@kernel.org, mturquette@baylibre.com
In-Reply-To: <9db1f94f-7edd-73a1-fb09-9499c5f8cfcb@gmail.com>
User-Agent: alot/0.8
Subject: Re: [PATCH v3 3/3] clk: mediatek: Mark bus and DRAM related clocks as critical
Message-ID: <155007777974.115909.3599235649247866271@swboyd.mtv.corp.google.com>
References: <20190108121208.2473-1-matthias.bgg@kernel.org> <20190108121208.2473-4-matthias.bgg@kernel.org> <9db1f94f-7edd-73a1-fb09-9499c5f8cfcb@gmail.com>
Cc:     sean.wang@mediatek.com, jasu@njomotys.info,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
From:   Stephen Boyd <sboyd@kernel.org>
Date:   Wed, 13 Feb 2019 09:09:39 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Matthias Brugger (2019-02-08 05:39:02)
> Steven, Mike, any comments on that?

I was waiting for Mediatek to review. I thought I said that last time?
I suppose if they're not going to review it I'll just throw it into
clk-next and people can fix problems if they see them.

Would you mind resending one more time with a comment in the code where
CLK_IS_CRITICAL is used indicating why it's critical so that we know
what's going on without having to dig into the git history?

