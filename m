Return-Path: <SRS0=Ck/k=OT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A40C04EB8
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 19:10:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A718D2082F
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 19:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544469037;
	bh=3unglAccUj5JwCzmdrV/ptHDARWQs2ni8Jxc9gi0dgw=;
	h=In-Reply-To:To:Subject:From:References:Cc:Date:List-ID:From;
	b=xNMhy1ihbotxf6DyrCdgUE74Id3hoxncv/AwkPdvto0RD71qfYa8dBfuL7oz/R5Jy
	 MMmjVVeb+fAjojEnLIinMT0EQf07DOUfLvUlzX1cuvT9spEDdIruPbG9nOiWdba+K7
	 RoAmXeGkwajbLf9mr0f6foKDhACDBCwefBvQzWD4=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A718D2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729253AbeLJTKh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 14:10:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:38606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729249AbeLJTKg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 10 Dec 2018 14:10:36 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4B06D2082F;
        Mon, 10 Dec 2018 19:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544469036;
        bh=3unglAccUj5JwCzmdrV/ptHDARWQs2ni8Jxc9gi0dgw=;
        h=In-Reply-To:To:Subject:From:References:Cc:Date:From;
        b=GU31rFtc+o26QTxUuwp4ZmvLZrwAHMl9ZrvcZPFxAUCvM4j5NQ6hZ0q8DT2MSvyax
         x4lwnHou6DuQQMrsgxAJRNTuOeW8VM46eiL7pvAwLlBqEk5Z3q2xVTiREgcYv5uwI5
         /H41bTDfXb9KP8gKtjqo8N37dJAuoRgojtNVB8I4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1543832921-11661-1-git-send-email-jonathanh@nvidia.com>
Message-ID: <154446903563.17204.4474332644824804669@swboyd.mtv.corp.google.com>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RESEND PATCH 1/2] clk: tegra: Fix maximum audio sync clock for Tegra124/210
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.7
References: <1543832921-11661-1-git-send-email-jonathanh@nvidia.com>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 10 Dec 2018 11:10:35 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jon Hunter (2018-12-03 02:28:40)
> The maximum frequency supported for I2S on Tegra124 and Tegra210 is
> 24.576MHz (as stated in the Tegra TK1 data sheet for Tegra124 and the
> Jetson TX1 module data sheet for Tegra210). However, the maximum I2S
> frequency is limited to 24MHz because that is the maximum frequency of
> the audio sync clock. Increase the maximum audio sync clock frequency
> to 24.576MHz for Tegra124 and Tegra210 in order to support 24.576MHz
> for I2S.
>=20
> Update the tegra_clk_register_sync_source() function so that it does
> not set the initial rate for the sync clocks and use the clock init
> tables to set the initial rate instead.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---

Applied to clk-next

