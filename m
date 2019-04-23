Return-Path: <SRS0=Ati7=SZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E9DC10F14
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 13:54:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E52620643
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 13:54:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfDWNyY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Apr 2019 09:54:24 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51853 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727695AbfDWNyY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Apr 2019 09:54:24 -0400
Received: from litschi.hi.pengutronix.de ([2001:67c:670:100:feaa:14ff:fe6a:8db5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1hIvsJ-0002AY-Br; Tue, 23 Apr 2019 15:54:19 +0200
Date:   Tue, 23 Apr 2019 15:54:18 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>
Subject: Re: [PATCH v3] clk: zynqmp: use structs for clk query responses
Message-ID: <20190423155418.5dc40c48@litschi.hi.pengutronix.de>
In-Reply-To: <155570893975.15276.16952520187761883361@swboyd.mtv.corp.google.com>
References: <20190412095220.22855-1-m.tretter@pengutronix.de>
 <155570893975.15276.16952520187761883361@swboyd.mtv.corp.google.com>
Organization: Pengutronix
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:feaa:14ff:fe6a:8db5
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 19 Apr 2019 14:22:19 -0700, Stephen Boyd wrote:
> Quoting Michael Tretter (2019-04-12 02:52:20)
> > The driver retrieves the clock try by querying the ATF for the clock
> > names, the clock topology, the parents and other attributes. The driver
> > needs to unmarshal the responses.
> > 
> > The definition of the fields in the firmware responses to the queries is
> > inconsistent. Some are specified as a mask, some as a shift, and by the
> > length of the previous field.
> > 
> > Define C structs for the entire firmware responses to avoid passing
> > pointers to arrays of an implicit size and make the format of the
> > responses to the queries obvious.
> > 
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---  
> 
> Applied to clk-next but I had to apply this to make sparse happy.

Thanks.

> 
> diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
> index fb2dbd556f9e..8febd2431545 100644
> --- a/drivers/clk/zynqmp/clkc.c
> +++ b/drivers/clk/zynqmp/clkc.c
> @@ -416,7 +416,7 @@ static int zynqmp_clock_get_topology(u32 clk_id,
>  				     u32 *num_nodes)
>  {
>  	int j, ret;
> -	struct topology_resp response = {0};
> +	struct topology_resp response = { };
>  
>  	*num_nodes = 0;
>  	for (j = 0; j <= MAX_NODES; j += ARRAY_SIZE(response.topology)) {
> @@ -482,7 +482,7 @@ static int zynqmp_clock_get_parents(u32 clk_id, struct clock_parent *parents,
>  				    u32 *num_parents)
>  {
>  	int j = 0, ret;
> -	struct parents_resp response = {0};
> +	struct parents_resp response = { };
>  
>  	*num_parents = 0;
>  	do {
> 
> 
> Also, I was hoping to see the patch go further and make structures
> instead of doing FIELD_GET on u32s. For example:
> 
> #define CLK_PARENTS_ID                  GENMASK(15, 0)
> #define CLK_PARENTS_FLAGS               GENMASK(31, 16)
> 
> This could be a struct of two u16 in them (and quite possibly __le16).
> 
> 	u16 id;
> 	u16 flags;

The error codes also do not fit into this scheme. For example, if no
further parents are available, the response will contain the value
0xFFFFFFFF in the response. The value may occur at any position in the
parents array and should not be interpreted as a struct with two u16 in
it, but should be seen as a single value on its own.

Therefore, I think the abstraction using a u32[] and bitfields is better
than defining a struct for unmarshalling the response.

> 
> Similarly:
> 
> #define CLK_TOPOLOGY_TYPE               GENMASK(3, 0)
> #define CLK_TOPOLOGY_FLAGS              GENMASK(23, 8)
> #define CLK_TOPOLOGY_TYPE_FLAGS         GENMASK(31, 24)
> 
> 	u8 type;
> 	u16 flags;
> 	u8 typeflags;
> 
> with __packed on it. This one is weird though:
> 
> #define CLK_ATTR_NODE_INDEX             GENMASK(13, 0)
> #define CLK_ATTR_NODE_TYPE              GENMASK(19, 14)
> #define CLK_ATTR_NODE_SUBCLASS          GENMASK(25, 20)
> #define CLK_ATTR_NODE_CLASS             GENMASK(31, 26)
> 
> The bits are really packed in there. I guess we can't win this one.

Actually, the CLK_ATTR_NODE_INDEX is not a field in the response, but a
field in the clock id. The driver needs to use the index from the query
to set the index field in the clock id. Only the bits 2 and 0 in bits
13..0 carry actual meaning.

Not sure if I should amend this patch or have a separate patch for
that, because this is in fact an issue in the "drivers: clk: Update
clock driver to handle clock attribute" patch.

Michael
