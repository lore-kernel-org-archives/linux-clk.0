Return-Path: <SRS0=kEw8=AB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB5A0C433DF
	for <linux-clk@archiver.kernel.org>; Sat, 20 Jun 2020 02:37:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BF6722DBF
	for <linux-clk@archiver.kernel.org>; Sat, 20 Jun 2020 02:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592620670;
	bh=E1AMB5sn5QISBAlyRbmYKm1mSWO/4np4K5eE1/U8h7Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=N7fvOKFddg9uPIfWKwIN/n4EJsgJVj/e7kWzOCwFA8xPCWQv3atHRFJCUXazW01Gl
	 nzJXK3iEp5e+dI+C4H5/YoI7PDTmZWPORCOhjMA7K5chTfFF6CoLcaz/6g6k0n8Hk8
	 /GGzeA6pWlgqBrMpATJ474vpIDitl6TJDEzoLW4s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731964AbgFTChu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Jun 2020 22:37:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:60298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731846AbgFTChu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Jun 2020 22:37:50 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8E36722DBF;
        Sat, 20 Jun 2020 02:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592620669;
        bh=E1AMB5sn5QISBAlyRbmYKm1mSWO/4np4K5eE1/U8h7Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZcRAZS8t3Myw9jU777cbTjOY4gZ6dhT9hDX3wejyoUsXBPL9pR+FZcbdSgRBBLhCF
         WPNG6G1a0QpU+vyNWUDpz3MRUGFMRxNfcG74HwLjSNf///NmXdfrEWcUjtoZkandOd
         iBiCCZU4QSk8wb0HXjx74VVGJsQMA7aPXGW/US5Q=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200616202417.14376-2-dinguyen@kernel.org>
References: <20200616202417.14376-1-dinguyen@kernel.org> <20200616202417.14376-2-dinguyen@kernel.org>
Subject: Re: [PATCH 2/3] clk: socfpga: agilex: add nand_x_clk and nand_ecc_clk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     dinguyen@kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org
To:     Dinh Nguyen <dinguyen@kernel.org>, linux-clk@vger.kernel.org
Date:   Fri, 19 Jun 2020 19:37:48 -0700
Message-ID: <159262066893.62212.6968385322684864@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dinh Nguyen (2020-06-16 13:24:16)
> And the nand_x_clk and nand_ecc_clk. Make the nand_x_clk be the main
> clock that is feeding the NAND IP and correct it's parent to be the
> l4_mp_clk.
>=20
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---

Applied to clk-next
