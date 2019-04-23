Return-Path: <SRS0=Ati7=SZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4A4C282DD
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 17:38:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E1E8D217D9
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 17:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556041126;
	bh=Zy+CCWqqJ4AugKSL12VgkMnjIU56Ym4mmSnbNdQLmlU=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=Lg8wlhFC+waUlG3UC6D4guJ9QQFg/UZevOo8gYHBa70tALa3WzGHmAAVP9VHi0xv0
	 6pwOsXxTKx2o1VLGZOcuqvBl+JdJfJACTGYHzgbC2JgVteCTNgTRK7042JF2UbXti7
	 COH6OipJey4EnXBdOs7aSHd8Nwf4S/eyrkj5bhFg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729105AbfDWRio (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Apr 2019 13:38:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:33620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728594AbfDWRin (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 23 Apr 2019 13:38:43 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E352121738;
        Tue, 23 Apr 2019 17:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556041123;
        bh=Zy+CCWqqJ4AugKSL12VgkMnjIU56Ym4mmSnbNdQLmlU=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=zL2xHMxdmf4ZvHGtuZAKw6ecN30+iJ4wUWu5zIdaeMQDfLUpK0/6L/OjYz0G5+dQm
         GgosWx4815WJd9wO8ukrD6WGdtob1u61HtVxku3zjp2o19TEO+q4zau7zL3lB4Pcbr
         c9E033CexDTWFOB11xeeuk3Lz/YozEjE7Gwqy2Rc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190423155418.5dc40c48@litschi.hi.pengutronix.de>
References: <20190412095220.22855-1-m.tretter@pengutronix.de> <155570893975.15276.16952520187761883361@swboyd.mtv.corp.google.com> <20190423155418.5dc40c48@litschi.hi.pengutronix.de>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3] clk: zynqmp: use structs for clk query responses
To:     Michael Tretter <m.tretter@pengutronix.de>
Message-ID: <155604112205.15276.6904109270991370948@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Tue, 23 Apr 2019 10:38:42 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2019-04-23 06:54:18)
> On Fri, 19 Apr 2019 14:22:19 -0700, Stephen Boyd wrote:
> > Also, I was hoping to see the patch go further and make structures
> > instead of doing FIELD_GET on u32s. For example:
> >=20
> > #define CLK_PARENTS_ID                  GENMASK(15, 0)
> > #define CLK_PARENTS_FLAGS               GENMASK(31, 16)
> >=20
> > This could be a struct of two u16 in them (and quite possibly __le16).
> >=20
> >       u16 id;
> >       u16 flags;
>=20
> The error codes also do not fit into this scheme. For example, if no
> further parents are available, the response will contain the value
> 0xFFFFFFFF in the response. The value may occur at any position in the
> parents array and should not be interpreted as a struct with two u16 in
> it, but should be seen as a single value on its own.
>=20
> Therefore, I think the abstraction using a u32[] and bitfields is better
> than defining a struct for unmarshalling the response.

We have union for that?

	union {
		struct resp {
			u16 id;
			u16 flags;
		};
		u32 error;
	};

>=20
> >=20
> > with __packed on it. This one is weird though:
> >=20
> > #define CLK_ATTR_NODE_INDEX             GENMASK(13, 0)
> > #define CLK_ATTR_NODE_TYPE              GENMASK(19, 14)
> > #define CLK_ATTR_NODE_SUBCLASS          GENMASK(25, 20)
> > #define CLK_ATTR_NODE_CLASS             GENMASK(31, 26)
> >=20
> > The bits are really packed in there. I guess we can't win this one.
>=20
> Actually, the CLK_ATTR_NODE_INDEX is not a field in the response, but a
> field in the clock id. The driver needs to use the index from the query
> to set the index field in the clock id. Only the bits 2 and 0 in bits
> 13..0 carry actual meaning.
>=20
> Not sure if I should amend this patch or have a separate patch for
> that, because this is in fact an issue in the "drivers: clk: Update
> clock driver to handle clock attribute" patch.
>=20

I'd just send a follow-up patch if something is wrong.

