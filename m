Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55405C67839
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 01:37:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1C39420811
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 01:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544751427;
	bh=ibV8eyfgsVfH1f5cpbensDp++iJLMkuduArHM03ZmNw=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=HPqg6ZVMbMe82sufBxB2LlSE74+lxW7E1gIfQainKoHBZBO3FZSYANvlxHST67mN6
	 dX0k3tRtWERLWXgACteEn/Yx0gc/ozZ+XeKtNaMUBPkX8W3N3kWKnY/ajOzNMCyEST
	 B1kre1WSD6VN0dxHlL4Popvncn4dRSIu5p8UylbY=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C39420811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729164AbeLNBhG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 20:37:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:33664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728203AbeLNBhG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 20:37:06 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CD3C920811;
        Fri, 14 Dec 2018 01:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544751425;
        bh=ibV8eyfgsVfH1f5cpbensDp++iJLMkuduArHM03ZmNw=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=hXyNYWsVavR19y/cU84PAzzerIWu2LqSKieESg32pzYrSxvdLrLlAnlu2HvG5v6YE
         gCTvCyhJHCJUzIwXKeaVUSDJgTV7B6lLW/POjeo9f4OMlbHU1T5sR3tGxJMRGnSksB
         UqBBkz2MLX7AtaV3qiSpzbaXdK2CsLEAoUL75RRI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181210232203.16561-1-dinguyen@kernel.org>
Subject: Re: [PATCH] clk: socfpga: stratix10: fix naming convention for the fixed-clocks
To:     Dinh Nguyen <dinguyen@kernel.org>, linux-clk@vger.kernel.org
References: <20181210232203.16561-1-dinguyen@kernel.org>
Message-ID: <154475142505.19322.5301231555488286179@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     dinguyen@kernel.org, mturquette@baylibre.com
Date:   Thu, 13 Dec 2018 17:37:05 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dinh Nguyen (2018-12-10 15:22:03)
> The fixed clocks in the DTS file have a hyphen, but the clock driver has
> the fixed clocks using underbar. Thus the clock driver cannot detect the
> other fixed clocks correctly. Change the fixed clock names to a hyphen.
>=20
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---

Any fixes tag? Should it go back to stable trees?
