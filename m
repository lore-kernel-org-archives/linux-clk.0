Return-Path: <SRS0=1SIp=RQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9949C43381
	for <linux-clk@archiver.kernel.org>; Wed, 13 Mar 2019 16:37:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 78A872171F
	for <linux-clk@archiver.kernel.org>; Wed, 13 Mar 2019 16:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1552495055;
	bh=u32E5a379asKhNhmA+n6oTLP9rU/qPWdvTTB3r4mnKg=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=gbEnv69TLckAxaEDoot/ZClzkBapF9r9Pm5oSVg6aKM/7RMwPTP7JrZahi1KB1io1
	 FmUzF1PHslB9XjzM33msM+meAN/p0b1/7WTLgvbt9sKZ22VqbVJicuuQ7H5qhe5T/B
	 BPEwZ3dfgn0/C5wfTlw52FY6ilcCh46kF+r3j1NA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbfCMQhe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Mar 2019 12:37:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:33226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725856AbfCMQhe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 13 Mar 2019 12:37:34 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 00EEB2147C;
        Wed, 13 Mar 2019 16:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1552495054;
        bh=u32E5a379asKhNhmA+n6oTLP9rU/qPWdvTTB3r4mnKg=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=wwRj3FSY1xpp1ufxHpdwRLT2hB+nMQCD+zk+DahZwLcVHW9qmIgsM39z6kK8djI/T
         UO0t5Wv8kPdYHkTvNw5JHNOjrHTMpIuRQvTSY82Ls21K+bTY/23waTEaKZHQ7/Pfit
         /BLejlt1d2NresguqtGApKj8m8pMTpCU1PZkcQco=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190312110016.29174-5-m.tretter@pengutronix.de>
References: <20190312110016.29174-1-m.tretter@pengutronix.de> <20190312110016.29174-5-m.tretter@pengutronix.de>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 4/5] clk: zynqmp: cleanup sizes of firmware responses
Cc:     kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Michael Tretter <m.tretter@pengutronix.de>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Message-ID: <155249505317.20095.16258634766892338311@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Wed, 13 Mar 2019 09:37:33 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2019-03-12 04:00:15)
> @@ -248,7 +251,8 @@ static int zynqmp_pm_clock_get_topology(u32 clock_id,=
 u32 index, u32 *topology)
>         qdata.arg2 =3D index;
> =20
>         ret =3D eemi_ops->query_data(qdata, ret_payload);
> -       memcpy(topology, &ret_payload[1], CLK_GET_TOPOLOGY_RESP_WORDS * 4=
);
> +       memcpy(topology, &ret_payload[1],
> +              CLK_GET_TOPOLOGY_RESP_WORDS * sizeof(*topology));

It would be even clearer to have a set of structs that encoded what the
responses looked like, instead of having to unmarshal the response
somewhat manually on top of a u32 buffer.

So something like

	struct topology_resp {
		u32 node[3];
	};

and then just use sizeof(*topology_resp). Also, it's odd that we make a
stack local variable for the response in this function and then copy it
onto the stack again for the caller of this function
(zynqmp_clock_get_topology()) and then pass it to the unmarshal function
that copies it the third time into the struct clk_topology. It would be
better to do the copy at most once into some structure that has the data
all packed together and then use the macros to access the fields
wherever the response is used.

