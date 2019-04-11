Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 622D7C10F13
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 17:15:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 31BDE2146F
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 17:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555002939;
	bh=/ZdguX7vhCcwbbq969NUNJC73hqeOwYsaMLqBnL0nks=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=YXr9C0zIm/ozUe/Ppb8dnas2qWhJMLRtMDsdAFoePbd8K2GA+4Fwg3Qahx1sMSGc0
	 TtdU8NwuR23vzcA41c+8RklrbcDWb3eOhfPq5U6bdhVEibGDvoNhKcEGp5c7s8HcCQ
	 0Y3JNqRiFA8XCpXpanbK4V/6MIjLCpHSaTky/qcA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbfDKRPi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 13:15:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:55484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726538AbfDKRPi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Apr 2019 13:15:38 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2C85720693;
        Thu, 11 Apr 2019 17:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555002938;
        bh=/ZdguX7vhCcwbbq969NUNJC73hqeOwYsaMLqBnL0nks=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=F2SfCDTpJQomvZVh7IaRn0yoAhOx3q6mJLgUsRPJd/FRF2yAE2OiAs4og1Kyur3aS
         bNC6F2d6XvOAnRMN6+w7333mbpbMz5MQr5uu+d6U5yLEAEb5ABQzLg87fY/ia0j3Vv
         naHZfzM4t5X5eh/+iTM/OjCJy1Ys+alhGL1fLk0g=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e659729f-31a4-76c1-84a0-3fd441aa23b2@baylibre.com>
References: <e659729f-31a4-76c1-84a0-3fd441aa23b2@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] clk: meson: updates for v5.2
Cc:     linux-clk@vger.kernel.org,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
To:     Neil Armstrong <narmstrong@baylibre.com>, mturquette@baylibre.com
Message-ID: <155500293733.20095.2204484444156049859@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 11 Apr 2019 10:15:37 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Neil Armstrong (2019-04-01 04:42:08)
> Dear clock maintainers,
>=20
> Below is a request to pull updates for Amlogic clocks.
>=20
> It covers essentially new VPU and Video clocks for Meson8b and new
> PCIE, CPU and Video Decoder clocks for G12a.
> The remaining meson8b "ABP" ID is finally removed, and 2 clocks IDs
> of the G12A AO clock controllers are re-exported.
> Thanks,
> Neil
>=20
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa23=
1b:
>=20
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://github.com/BayLibre/clk-meson.git tags/meson-clk-5.2
>=20

Thanks. Pulled into clk-next.
