Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B0B3C48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 03:02:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E3F661C2F
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 03:02:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232066AbhF1DFJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 23:05:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:60544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232033AbhF1DFJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 23:05:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9820D61C2A;
        Mon, 28 Jun 2021 03:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624849364;
        bh=fn7yOpqH5uSuy8NX+h/aG5syAJiYlxwBwDyKyjj/Sxk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LrG1mhNts/WzTEZMDAD4j+VYIiJDsR9tNJJm1IVpupDsg2wlTfCaMIacXx69VdiSx
         oyzqhCkBOtIWHGdnKlDGjTuYfiKzhkVHavHJbFjjbkJWbV3+joiOGWzZWbvtKleAhS
         HmEGoj5T4urRZ1GFYJyMgm2ymdxvogi5eYXg2byUdr7kzXCeT1bd1rbWHihhHWXwyf
         9S7Qwou6mVJCzSq978sKVpZNuqITGkGiaSDc0VMZe9hKvNp2vgL9pDXTFcjjIjHOoE
         w2JX02Ga9wJiYXOt7nu6KbQMhABxhpPf36bfIF4nExXeFsXh80W7+vY7/fkbu2qirP
         avNBkY8QXVQ4Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210325192643.2190069-6-robert.hancock@calian.com>
References: <20210325192643.2190069-1-robert.hancock@calian.com> <20210325192643.2190069-6-robert.hancock@calian.com>
Subject: Re: [PATCH v3 5/9] clk: si5341: Update initialization magic
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mike.looijmans@topic.nl, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
To:     Robert Hancock <robert.hancock@calian.com>, mturquette@baylibre.com
Date:   Sun, 27 Jun 2021 20:02:43 -0700
Message-ID: <162484936303.2516444.10031854158241516427@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Robert Hancock (2021-03-25 12:26:39)
> Update the default register settings to include the VCO_RESET_CALCODE
> settings (set by the SiLabs ClockBuilder software but not described in
> the datasheet). Also update part of the initialization sequence to match
> ClockBuilder and the datasheet.
>=20
> Fixes: 3044a860fd ("clk: Add Si5341/Si5340 driver")
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---

Applied to clk-next
