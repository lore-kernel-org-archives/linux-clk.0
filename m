Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BD8C7EE22
	for <linux-clk@archiver.kernel.org>; Thu, 11 May 2023 01:57:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbjEKB5V (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 May 2023 21:57:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjEKB5U (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 May 2023 21:57:20 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.214])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 67B1E5B89;
        Wed, 10 May 2023 18:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Content-Type:From:Mime-Version:Subject:Message-Id:
        Date; bh=TCXfahH34hYJqqM1SC8s3Anj/uF5zt4/S2+/aK5TN+I=; b=lYFYwiP
        rORVUhXZD/CUiM4kmhoO3M+EWN1NOs6+lYJ6oOfi1P2OPnoYs1MTEDRgFg/LyS5G
        zQniEN2HYeVQF6wbFXKkeUPadp/QGfUEKY5rSd7Sxx8MVbCrJIRDKSMgo4jy4l4f
        EQ9LA/kBePjJTIN4jaV6NAzpzByBfreTBDXo=
Received: from smtpclient.apple (unknown [223.148.153.92])
        by zwqz-smtp-mta-g3-4 (Coremail) with SMTP id _____wB3n4ddS1xkRp4sBg--.9829S2;
        Thu, 11 May 2023 09:56:46 +0800 (CST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Hao Ge <gehao618@163.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] mediatek/clk-mt8173-apmixedsys: use devm_of_iomap to avoid resource leak in clk_mt8173_apmixed_probe
Message-Id: <7F568F0F-1F19-4302-8BBB-556146B3C521@163.com>
Date:   Thu, 11 May 2023 09:56:35 +0800
Cc:     Hao Ge <gehao@kylinos.cn>, angelogioacchino.delregno@collabora.com,
        matthias.bgg@gmail.com, mturquette@baylibre.com,
        wenst@chromium.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
To:     Stephen Boyd <sboyd@kernel.org>
X-Mailer: iPhone Mail (20E252)
X-CM-TRANSID: _____wB3n4ddS1xkRp4sBg--.9829S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrZw4rGw1xCr45Ar1fKr1UGFg_yoW8Jr1kpF
        ykKFWqkFWkJFy2ka1vva18tay5Aws8ZrZ3Z3Wagr9Ivan8Zry5u34rKFs5XF48trW3Gr4Y
        qrZ8K3s7KFW7ZaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jI5lbUUUUU=
X-Originating-IP: [223.148.153.92]
X-CM-SenderInfo: 5jhkt0qwryqiywtou0bp/1tbiNB9sFlaECrAlcAAAss
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

=EF=BB=BF

> On May 11, 2023, at 09:27, Hao Ge <gehao618@163.com> wrote:
>=20
> =EF=BB=BFOn Wed, 10 May 2023 14:18:08 -0700
> Stephen Boyd <sboyd@kernel.org> wrote:
>=20
>> Quoting Hao Ge (2023-05-08 19:12:14)
>>> Use devm_platform_ioremap_resource to take the place of of_iomap for
>>> avoid that we don't called iounmap when return some error or remove
>>> device.
>>> Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock
>>> drivers and allow module build") Signed-off-by: Hao Ge
>>> <gehao@kylinos.cn> --- =20
>> Is this v3?
> Hi Stephen
>=20
> yes,Perhaps you are too busy,I have not received a response
> in the future, so you are unsure about the status of V2.
> So I adjusted the code and title make changes smaller and
> sent V3 for it.It is precisely because of these that I did=20
> not continue the original mail thread.
>=20
> Best regards
> Hao
Hi Stephen

I made a few typos in my previous email. To avoid misunderstandings, I corre=
cted them and sent a new one.

Yes,Perhaps you are too busy,I have not received a response in the future, s=
o I am unsure about the status of V2.So I adjusted the code and title make c=
hanges smaller and
sent V3 for it.It is precisely because of these that I did not continue the o=
riginal mail thread.

Best regards
Hao=

