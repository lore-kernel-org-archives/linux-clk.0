Return-Path: <SRS0=CNvH=EI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC54C00A89
	for <linux-clk@archiver.kernel.org>; Mon,  2 Nov 2020 21:45:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1308C22245
	for <linux-clk@archiver.kernel.org>; Mon,  2 Nov 2020 21:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604353527;
	bh=+7gvdJF1UAaIA40tazIbJ0iA3Pmj9YKkQHVdU9vKclc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=Iqck+ZviNIvvMVGePpBpCHCYuRQESDc0NfNlK890AFmpHsTw1MwlFkfWUOwZZ5fMm
	 Jtvk2KehuTG/1TRegOTBNgMWfyZ9V+GBi0/NBeBmnFMgonmhNo4RaJA4qodldVIg0a
	 8hgYvfrDz2boY3zuX+eldPrAw9WKsZR59AxX3bkU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725777AbgKBVp0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 Nov 2020 16:45:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:59580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725766AbgKBVp0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 2 Nov 2020 16:45:26 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AED4B21D40;
        Mon,  2 Nov 2020 21:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604353525;
        bh=+7gvdJF1UAaIA40tazIbJ0iA3Pmj9YKkQHVdU9vKclc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=k1uUGUyhY9vbasjf+NXXIWTbV3omJVRDhyM6MtKFtngdaZxZx61th5HzJxvyedQV/
         h6tKXR7a09mKSxQp2DUeFlKquQymuYsfquG571rSVj6FNhHjxHJn2NO8DN/qKa4TQ4
         o14O/6BT0JCNj+G96K9TCN1+1lVP0zcbAbLNc5qQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAFr9PX=Ac6yzR31uzK=6WmnbznUm_FzVRs+v2D3ONfX4UCY_QQ@mail.gmail.com>
References: <CAFr9PX=Ac6yzR31uzK=6WmnbznUm_FzVRs+v2D3ONfX4UCY_QQ@mail.gmail.com>
Subject: Re: Acceptable format for clock cells.
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>, Daniel Palmer <daniel@0x0f.com>
To:     Daniel Palmer <daniel@0x0f.com>, linux-clk@vger.kernel.org
Date:   Mon, 02 Nov 2020 13:45:24 -0800
Message-ID: <160435352432.884498.6877160797327752107@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Daniel Palmer (2020-10-30 04:52:31)
> Hi all,
>=20
> I'm writing a clock driver for a PLL unit in an ARM SoC that I hope to
> wrap up and send the patches for in the next few days.
>=20
> This PLL unit has one PLL and then a series of dividers. Then each
> divider apparently has between 0 and 3 dividers coming off of it.
>=20
> As there is no documentation for this thing and I'm not sure what the
> logical output numbers are or even if I know all of them I was
> considering making the number of clock cells 2 and having the first be
> the first divider (i.e. the divide by 2 output would be 2) and the
> second cell the chained divider or 0 for no divider.

Does the PLL need to be expressed anywhere in the binding?

>=20
> If I should just decide the order of the outputs and come up with
> indexes for them would it still be ok to nest them like the first cell
> is the index of the divider and then the second cell is the index of
> the chained divider?
>=20

Generally we try to encourage one-cell or zero-cell bindings because
they're simple. A two cell binding is possible if you really want but
I'd say do a one-cell binding and make up some numbering scheme for the
different clks. A one cell binding also makes it easy to populate an
array of clk_hw pointers that the DT xlate function can pick from. When
it gets to two cells or more it gets complicated, but still doable.

It would be great if clk hardware started numbering the clks instead of
naming them specific names but this almost never happens. It would
certainly make life easier if the datasheet said "Use clk #25 for the
uart" but usually SoC hardware engineers give them names and don't
consider a pinout scheme. I'd say this is mostly because the engineers
control the connections between their clk controller and the consumers.

Finally, if you don't have a datasheet then think about the person who
has to write the DT. Are they going to know the details of the clk tree
inside the PLL unit to know that they need the third divider underneath
the second divider? Or are they going to know they need the "uart clk"
and that can be some friendly #define that hides this detail from them?
