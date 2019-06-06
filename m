Return-Path: <SRS0=srpp=UF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67725C04AB5
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jun 2019 17:57:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 43C282083E
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jun 2019 17:57:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITY+t8MK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729313AbfFFR5T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Jun 2019 13:57:19 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45756 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728762AbfFFR5T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Jun 2019 13:57:19 -0400
Received: by mail-lj1-f194.google.com with SMTP id m23so2869485lje.12;
        Thu, 06 Jun 2019 10:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ly20pHKe/5BQV2Vy9frpSyFeR9fKetS/f45r9cdaGWM=;
        b=ITY+t8MKpFEUvhwatodiixs2GT4hQZoNa5Nt7USHWQ6q8J1rB2QKmLVAem0OUSjlPh
         4fNPfxXeaMiVCTcBCoueZ2bw7Ow1QdH+ETuOt+sLRoBCAVGJijjxMdCLvaQ5Ug+d/HuF
         I4D+ixvHrK49c2UYD8TD/8p4/R3o+6VmPYBwrI8ioUilAq1MV47B/5atcqacyg5mO4Gd
         aOhlZeQzzUM5+I+iugxlHGIEi85LTGj3svOw4/OIY4JBtcsGGG28O8VQ7ENIUhrtd0Hp
         oEUDQrklRnU1Epe4dy6XNYcSsBC9qGR0+PFWjP3tzYEFpfmW3OPGdrBg5APMjqL0yXgJ
         VGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ly20pHKe/5BQV2Vy9frpSyFeR9fKetS/f45r9cdaGWM=;
        b=JBVNqv1E2ZyvT6DXFiCAyVB9qGGBuFv/7aSceg9cmaDHtzkef1mR2lYe2xcOT5j/D3
         tZ8Ao7ZM1Vz00WKLHRqd4S7onNmfXeWHChOOkdz6/pqK5lW+9yToRzb/LPYiks9HoNY3
         BEDCx0XBl8g4fQYfibQCcT+HwJ5QtXe7MAQwwgNoL+C7XAfbDpYIxbhPlRME3qLkuqt1
         AEyxvaVeiWcT11i00EiqBhklE5XN965HEWhv8jgFappAwf6e2VY9fDb3JZu6UPvdOy0x
         QYCYHFpO8LUL7hrXWE1BZG0vu7mkQO89KWfl15z8CiRGHogLgOTNulQT4vU+3ylHggn6
         R7HQ==
X-Gm-Message-State: APjAAAXtlDA6Rxxooyy+7JpDFxM6wi1M09LUtZw4Of4Qkh+WWmXSld8s
        6//MZ1NYlXube38AAZO+zvOR4cnME9SUvSHKTwY=
X-Google-Smtp-Source: APXvYqzM7F60xHXjH/n+f9YefH8IZW+j2LC3XzqKZlkKZuPT+kxy/2UcmD51IyRqDMuLh8bt43jI2IG9DTNJGJifaQ4=
X-Received: by 2002:a2e:995a:: with SMTP id r26mr4912366ljj.107.1559843837436;
 Thu, 06 Jun 2019 10:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190606164443.6991-1-festevam@gmail.com> <20190606165546.6675520693@mail.kernel.org>
 <VI1PR04MB5055C4B288BC19F6E1EF9D65EE170@VI1PR04MB5055.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB5055C4B288BC19F6E1EF9D65EE170@VI1PR04MB5055.eurprd04.prod.outlook.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 6 Jun 2019 14:57:10 -0300
Message-ID: <CAOMZO5Dt+3FOdvkWTGdLet8r9C1MPia=uwODNYc7T7k2EDdO-Q@mail.gmail.com>
Subject: Re: [PATCH] clk: imx8qxp: Use devm_platform_ioremap_resource()
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Anson Huang <anson.huang@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jun 6, 2019 at 2:15 PM Leonard Crestez <leonard.crestez@nxp.com> wrote:

> An extremely similar patch was already submitted and then reverted
> because it breaks boot:
>
>      https://patchwork.kernel.org/patch/10908807/
>
> I tested and this new patch also breaks boot.

Ops, sorry about that!
