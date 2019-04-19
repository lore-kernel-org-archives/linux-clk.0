Return-Path: <SRS0=/mgL=SV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 750AFC282E0
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 21:22:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3870E217FA
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 21:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555708942;
	bh=3vn1x9h00HJjRtVOEMLdRX15ToemDjcE/6FO6ZVxRuA=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=TnfhdoE6uMZKnu+HT0qY7ijzYb+NtX0xy7o1H+tTWlZCX+3tyEVWYVo5Rxjxy/diH
	 IVPuwrSY9I8iftDQ7e80m5dr3WnyNTXe6HXRGthp1iYzMEP4Clu/gMcSaG32q/DwlO
	 PO0xu5rdSf2RfaGJT8OuZVUX1yR62TAbjWHMiN7o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbfDSVWV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Apr 2019 17:22:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:50650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725932AbfDSVWV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Apr 2019 17:22:21 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 89F16217F9;
        Fri, 19 Apr 2019 21:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555708940;
        bh=3vn1x9h00HJjRtVOEMLdRX15ToemDjcE/6FO6ZVxRuA=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=DWhgw5tCbn88rdteUDRsZG8nveK3Nea41++dMDWzrsB9W81Kgzy/RHeO+fAwDhP7Q
         s2+bSwI/K6kqLhFN26SyEyS/ZaIAygQ5YfST79Eo2Zhw3NPBc0LY04sm1Q4zo3o6eZ
         gNGxtn2G+owIfoUEEw/7X2i/7EnYYyrTvdQhBZKw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190412095220.22855-1-m.tretter@pengutronix.de>
References: <20190412095220.22855-1-m.tretter@pengutronix.de>
Cc:     kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Michael Tretter <m.tretter@pengutronix.de>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3] clk: zynqmp: use structs for clk query responses
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Message-ID: <155570893975.15276.16952520187761883361@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Fri, 19 Apr 2019 14:22:19 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2019-04-12 02:52:20)
> The driver retrieves the clock try by querying the ATF for the clock
> names, the clock topology, the parents and other attributes. The driver
> needs to unmarshal the responses.
>=20
> The definition of the fields in the firmware responses to the queries is
> inconsistent. Some are specified as a mask, some as a shift, and by the
> length of the previous field.
>=20
> Define C structs for the entire firmware responses to avoid passing
> pointers to arrays of an implicit size and make the format of the
> responses to the queries obvious.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---

Applied to clk-next but I had to apply this to make sparse happy.

diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
index fb2dbd556f9e..8febd2431545 100644
--- a/drivers/clk/zynqmp/clkc.c
+++ b/drivers/clk/zynqmp/clkc.c
@@ -416,7 +416,7 @@ static int zynqmp_clock_get_topology(u32 clk_id,
 				     u32 *num_nodes)
 {
 	int j, ret;
-	struct topology_resp response =3D {0};
+	struct topology_resp response =3D { };
=20
 	*num_nodes =3D 0;
 	for (j =3D 0; j <=3D MAX_NODES; j +=3D ARRAY_SIZE(response.topology)) {
@@ -482,7 +482,7 @@ static int zynqmp_clock_get_parents(u32 clk_id, struct =
clock_parent *parents,
 				    u32 *num_parents)
 {
 	int j =3D 0, ret;
-	struct parents_resp response =3D {0};
+	struct parents_resp response =3D { };
=20
 	*num_parents =3D 0;
 	do {


Also, I was hoping to see the patch go further and make structures
instead of doing FIELD_GET on u32s. For example:

#define CLK_PARENTS_ID                  GENMASK(15, 0)
#define CLK_PARENTS_FLAGS               GENMASK(31, 16)

This could be a struct of two u16 in them (and quite possibly __le16).

	u16 id;
	u16 flags;


Similarly:

#define CLK_TOPOLOGY_TYPE               GENMASK(3, 0)
#define CLK_TOPOLOGY_FLAGS              GENMASK(23, 8)
#define CLK_TOPOLOGY_TYPE_FLAGS         GENMASK(31, 24)

	u8 type;
	u16 flags;
	u8 typeflags;

with __packed on it. This one is weird though:

#define CLK_ATTR_NODE_INDEX             GENMASK(13, 0)
#define CLK_ATTR_NODE_TYPE              GENMASK(19, 14)
#define CLK_ATTR_NODE_SUBCLASS          GENMASK(25, 20)
#define CLK_ATTR_NODE_CLASS             GENMASK(31, 26)

The bits are really packed in there. I guess we can't win this one.

