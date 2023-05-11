Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A4BC77B7D
	for <linux-clk@archiver.kernel.org>; Thu, 11 May 2023 01:27:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232848AbjEKB1e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 May 2023 21:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbjEKB1d (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 May 2023 21:27:33 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 849C84EE8;
        Wed, 10 May 2023 18:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
        Content-Type; bh=nRiWGp52ftlfW8uMdyTbOyMwGQ0nyy4tXUjVPjkaNKI=;
        b=hxGfT+r8XUR/NfkrPRyXguLG2DBK40+RZFu3yZo2C9G6gU+DvfQgm39lFz1e9q
        SHbXTwgdRFKik8Idjh4KrpqAlyBOCTNxcgSOLDUlC1SzGxhkyYOQpuQ8i1fowEhN
        4hLEF5UtDYiKGUkLdQgSrQHNOu0HhezXC6Y7sLuHocEGQ=
Received: from haoge-QiTianM428-A376 (unknown [116.128.244.169])
        by zwqz-smtp-mta-g3-2 (Coremail) with SMTP id _____wCnVuNfRFxk2VIuBg--.37991S2;
        Thu, 11 May 2023 09:26:55 +0800 (CST)
Date:   Thu, 11 May 2023 09:26:54 +0800
From:   Hao Ge <gehao618@163.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Hao Ge <gehao@kylinos.cn>, angelogioacchino.delregno@collabora.com,
        matthias.bgg@gmail.com, mturquette@baylibre.com,
        wenst@chromium.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mediatek/clk-mt8173-apmixedsys: use devm_of_iomap to
 avoid resource leak in clk_mt8173_apmixed_probe
Message-ID: <20230511092654.6d8fab41@haoge-QiTianM428-A376>
In-Reply-To: <b35458250af972d95c708792633c9a58.sboyd@kernel.org>
References: <20230509021214.17105-1-gehao@kylinos.cn>
        <b35458250af972d95c708792633c9a58.sboyd@kernel.org>
Organization: 123
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wCnVuNfRFxk2VIuBg--.37991S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrWxAF4kWF17tr4ruw1UAwb_yoW3Grc_ua
        1ku3Z7uw4UZFs7GwsIkr9Fk342y3s8Wr98tF95Za4fta9IgryavFW8C3y3ArZ8Wa48Kr98
        Ga9Yga1kZF1SkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU3xhJUUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: 5jhkt0qwryqiywtou0bp/xtbBaQRsFlXlz21ORwAAsM
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 10 May 2023 14:18:08 -0700
Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Hao Ge (2023-05-08 19:12:14)
> > Use devm_platform_ioremap_resource to take the place of of_iomap for
> > avoid that we don't called iounmap when return some error or remove
> > device.
> > 
> > Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock
> > drivers and allow module build") Signed-off-by: Hao Ge
> > <gehao@kylinos.cn> ---  
> 
> Is this v3?
Hi Stephen

yes,Perhaps you are too busy,I have not received a response
in the future, so you are unsure about the status of V2.
So I adjusted the code and title make changes smaller and
sent V3 for it.It is precisely because of these that I did 
not continue the original mail thread.

Best regards
Hao


