Return-Path: <SRS0=sie6=WD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89B4C433FF
	for <linux-clk@archiver.kernel.org>; Wed,  7 Aug 2019 22:25:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7368221874
	for <linux-clk@archiver.kernel.org>; Wed,  7 Aug 2019 22:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565216715;
	bh=F20+T87YTszjNBAnSf+7/Z27tF/Qbs0QIlORuryWoH8=;
	h=In-Reply-To:References:From:Cc:To:Subject:Date:List-ID:From;
	b=SuAL9W2vUcK5mrjBfiQIgbAcNDw+dqJamKlrQJsJRJwezVMk2XRnHwoJvopJ2C0uy
	 JiBjM4ZowHDSRvPmKlRDJ/lhAni+OLoHSb9akQNQxUNhZGs/mphoWVns+xmY2yj9y6
	 YUs0siS7++q+wqPhd168i3tA33C/uhRSyeWmrOy8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388910AbfHGWZP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Aug 2019 18:25:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:53250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387999AbfHGWZP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Aug 2019 18:25:15 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 059A0214C6;
        Wed,  7 Aug 2019 22:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565216714;
        bh=F20+T87YTszjNBAnSf+7/Z27tF/Qbs0QIlORuryWoH8=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=XbvZbsOyk0mlG1vrkpLKuiPhU9EGL2Pgfpc6ufiYd0KWi36aZHDG/W5C+N8NOAbSJ
         IpsfTRdmI+UfTZbqwqOm0wTpaLpa7ldDzkE1jiAqYnkiVlWOtF7ZYSD6kGTCYK/OaG
         tPOODM+u24MHqYzzmNBb2Y0xOCS8r9NT6qVm6DSA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1565183079-27798-1-git-send-email-t-kristo@ti.com>
References: <1565183079-27798-1-git-send-email-t-kristo@ti.com>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-omap@vger.kernel.org, tony@atomide.com, s-anna@ti.com
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Subject: Re: [PATCH 0/3] clk: ti: couple of fixes towards 5.4
User-Agent: alot/0.8.1
Date:   Wed, 07 Aug 2019 15:25:13 -0700
Message-Id: <20190807222514.059A0214C6@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tero Kristo (2019-08-07 06:04:36)
> Hi,
>=20
> Here are some TI clock fixes which can be queued for 5.4. These are
> needed for getting remoteproc functionality working properly, as these
> depend on reset handling also and timing out with clocks is bad for
> them. The timer clock alias fix is needed for the same, as remoteprocs
> depend on certain HW timers for their functionality.
>=20

Looks ok to me. Are you going to add Fixes tags to any? Should I expect
a PR or you want me to pick them up directly?


