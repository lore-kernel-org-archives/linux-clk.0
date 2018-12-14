Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27618C43444
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 21:57:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 63480208C2
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 21:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544824661;
	bh=nyH2qJmg0Khu8gqmBPMWJHpztywGLumowDszfV9I0lI=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=WRVI5eKn97T642RjjDCQi+KkHUBU2GvnJqUmx3+SpYC0rhaChRLsH/xQDBq98/v35
	 GlB1fNI0OxrXLKbmZ6+3m0rwdDWIq4U2qrFHETvvVJue/fngm8V/z7si8tFSzqeYpM
	 xMTDDl5iyiMA6ll3wKjReZw6BSdCaGp9emE4T9HU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731180AbeLNV5k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Dec 2018 16:57:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:51776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731020AbeLNV5j (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 14 Dec 2018 16:57:39 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BF6F32080F;
        Fri, 14 Dec 2018 21:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544824659;
        bh=nyH2qJmg0Khu8gqmBPMWJHpztywGLumowDszfV9I0lI=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=dCUiBZXbBLqIntfGQnqgIQLszmVe5L8JTXil0FfLrHqzGxJ0oUziocv/dWnME3sg8
         QUJSNwhUUjNLh37lkb8NZCZNNIdOb9fNGGNbFsdfSWN1VOwYStFmdIZq3YYpuBiQww
         2wCOFEpMwpXX6s97a/8viIGLE59LDh7Lzp9QSPwI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181210073240.32278-3-weiyi.lu@mediatek.com>
Subject: Re: [PATCH v3 01/12] clk: mediatek: fixup: Disable tuner_en before change PLL rate
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Weiyi Lu <weiyi.lu@mediatek.com>
References: <20181210073240.32278-1-weiyi.lu@mediatek.com> <20181210073240.32278-3-weiyi.lu@mediatek.com>
Message-ID: <154482465853.19322.3763394015657394960@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     James Liao <jamesjj.liao@mediatek.com>,
        Fan Chen <fan.chen@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        srv_heupstream@mediatek.com, stable@vger.kernel.org,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Owen Chen <owen.chen@mediatek.com>
Date:   Fri, 14 Dec 2018 13:57:38 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Why is "fixup" in the subject of this patch?

Quoting Weiyi Lu (2018-12-09 23:32:29)
> From: Owen Chen <owen.chen@mediatek.com>
>=20
> PLLs with tuner_en bit, such as APLL1, need to disable
> tuner_en before apply new frequency settings, or the new frequency
> settings (pcw) will not be applied.
> The tuner_en bit will be disabled during changing PLL rate
> and be restored after new settings applied.
> Another minor change is to correct the macro name of pcw change bit
> to CON1_PCW_CHG because PCW_CHG(BIT31) is on CON1.
>=20
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Owen Chen <owen.chen@mediatek.com>

So there should be some Fixes: tag here too so we know what commit is
being fixed?

