Return-Path: <SRS0=M83Q=VJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC47C742D2
	for <linux-clk@archiver.kernel.org>; Fri, 12 Jul 2019 18:13:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9068205ED
	for <linux-clk@archiver.kernel.org>; Fri, 12 Jul 2019 18:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562955209;
	bh=vy70ZCADAa8XqPLpwqzkVYFPc3I5xkZ7yX6y1hoW1hA=;
	h=In-Reply-To:References:From:To:Cc:Subject:Date:List-ID:From;
	b=AoFWRyYGaDtXX/Fv004AtHhWZjTsAzG0iQHiSb14yPpKnmNaWPcIgvXl8wcOJosDE
	 PTLbbpFtNGr1OP/LD7qSqFWcgmbzTTu97GavZNShqBb6oBnTuBEBqs/W14kVcsROeG
	 +q1P730P/ndt5s0qognQW02vyj4u8APQs+IXgOlQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbfGLSN3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Jul 2019 14:13:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:58752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727028AbfGLSN3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 12 Jul 2019 14:13:29 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 46C4B205C9;
        Fri, 12 Jul 2019 18:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562955208;
        bh=vy70ZCADAa8XqPLpwqzkVYFPc3I5xkZ7yX6y1hoW1hA=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=KSXgTFqlAJKChFysyzaafI5QOcT08gAcILu0tSKNujV+7YbVr3ODXyu+JA6GF8MsF
         G7G+51uiIScsM6u42mHMjo5iap2eV0b0VeTy/bYcB3NR9Sf8KBmki2G6Gnmes8YkC5
         9QK6YhVUR3CXeO9Wkvy8uzm1hJx3/xFKbuiphFIA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3855405.N158XnxgeL@phil>
References: <3855405.N158XnxgeL@phil>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip clock updates for 5.3
User-Agent: alot/0.8.1
Date:   Fri, 12 Jul 2019 11:13:27 -0700
Message-Id: <20190712181328.46C4B205C9@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2019-07-01 02:36:17)
> Hi Mike, Stephen,
>=20
> please find below rockchip clock changes for 5.3
>=20
> Please pull
>=20
> Thanks

Ok. Pulled into clk-next for 5.3.
