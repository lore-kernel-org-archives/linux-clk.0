Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB8FC6FD1D
	for <linux-clk@archiver.kernel.org>; Wed, 15 Mar 2023 00:56:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbjCOA4L (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Mar 2023 20:56:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjCOA4K (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Mar 2023 20:56:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE7619C72
        for <linux-clk@vger.kernel.org>; Tue, 14 Mar 2023 17:56:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0667E619E0
        for <linux-clk@vger.kernel.org>; Wed, 15 Mar 2023 00:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C323C433D2;
        Wed, 15 Mar 2023 00:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678841768;
        bh=p41osdXnYdgw2Hzjzy+bKSt/TZ05h3ok4H/WhbjJsTU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=b6Q+iuTEdFPCkI3a7+ACD09ODJMf9oEBp2cxxG3RmXtTlOhnd1X+u3wZkhKIyLvNw
         PHXVDyzgEn2W6IiuhCJKH9t71Vob+OOD8T4cF+dj6qLk07LSTZy3fiEWMAHGPP0vgg
         kVkru4xkCD0wXcNj5VxXdsV8EoHWpHRFZbScbVObJEL2R1ZTvW8P3n8Z1gfM1mAVBx
         KxFlpVjBSymcn0fk2/7wN5FFs2Q6HEnDiAm+6CLao6ILnYJmhGpFBHcaahn59/LWhl
         uI4Rt/LD+SfXSh5Q8bmaIqxzl85GnxzivErvSles1ZwQA3EU9qQuxcYZ29ZaTSs748
         tleDnC8EG+Yog==
Message-ID: <56745d9024b0b75e5c6863b43b4a58df.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221229092946.4162345-1-yangyingliang@huawei.com>
References: <20221229092946.4162345-1-yangyingliang@huawei.com>
Subject: Re: [PATCH] clk: mediatek: clk-pllfh: fix missing of_node_put() in fhctl_parse_dt()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     johnson.wang@mediatek.com, edward-jw.yang@mediatek.com,
        angelogioacchino.delregno@collabora.com, wenst@chromium.org,
        yangyingliang@huawei.com
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org
Date:   Tue, 14 Mar 2023 17:56:06 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Yang Yingliang (2022-12-29 01:29:46)
> The device_node pointer returned by of_find_compatible_node() with
> refcount incremented, when finish using it, the refcount need be
> decreased.
>=20
> Fixes: d7964de8a8ea ("clk: mediatek: Add new clock driver to handle FHCTL=
 hardware")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/clk/mediatek/clk-pllfh.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-=
pllfh.c
> index f48780bec507..bc2b30a55f60 100644
> --- a/drivers/clk/mediatek/clk-pllfh.c
> +++ b/drivers/clk/mediatek/clk-pllfh.c
> @@ -75,13 +75,13 @@ void fhctl_parse_dt(const u8 *compatible_node, struct=
 mtk_pllfh_data *pllfhs,
>         base =3D of_iomap(node, 0);
>         if (!base) {
>                 pr_err("%s(): ioremap failed\n", __func__);
> -               return;
> +               goto out_node_put;
>         }
> =20
>         num_clocks =3D of_clk_get_parent_count(node);
>         if (!num_clocks) {
>                 pr_err("%s(): failed to get clocks property\n", __func__);
> -               return;
> +               goto out_node_put;

This leaks the of_iomap() mapping still.

I folded this in.

---8<--
diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pl=
lfh.c
index bc2b30a55f60..f135b32c6dbe 100644
--- a/drivers/clk/mediatek/clk-pllfh.c
+++ b/drivers/clk/mediatek/clk-pllfh.c
@@ -81,7 +81,7 @@ void fhctl_parse_dt(const u8 *compatible_node, struct mtk=
_pllfh_data *pllfhs,
 	num_clocks =3D of_clk_get_parent_count(node);
 	if (!num_clocks) {
 		pr_err("%s(): failed to get clocks property\n", __func__);
-		goto out_node_put;
+		goto err;
 	}
=20
 	for (i =3D 0; i < num_clocks; i++) {
@@ -105,6 +105,10 @@ void fhctl_parse_dt(const u8 *compatible_node, struct =
mtk_pllfh_data *pllfhs,
=20
 out_node_put:
 	of_node_put(node);
+	return;
+err:
+	iounmap(base);
+	goto out_node_put;
 }
=20
 static void pllfh_init(struct mtk_fh *fh, struct mtk_pllfh_data *pllfh_dat=
a)
