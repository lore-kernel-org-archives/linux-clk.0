Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9CBC4646B
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 03:01:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF1F82077C
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 03:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561431703;
	bh=O/Rl98hz9ieqZmp7Iv9AyRHq2sgebPoQ1bto4qjumRw=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=1pyYhGo4O9XYXyjkVp/vh/+x4Ij9uksOPVhzh3H7SAAvurkO6Jz1Ax0w/g9a54LJh
	 GIkvp1/5FneoKUdKyCO1iADhVrNm+jJG/+YdnvQKAVSRXIyMNJQBOKoXs3gsZLqX3H
	 mc4Gqk96iaghR3qFuWH1uMzBiyfZ7ziICYm5lpvk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730658AbfFYDBm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jun 2019 23:01:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:37096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730654AbfFYDBm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 24 Jun 2019 23:01:42 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D26320652;
        Tue, 25 Jun 2019 03:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561431701;
        bh=O/Rl98hz9ieqZmp7Iv9AyRHq2sgebPoQ1bto4qjumRw=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=feSGfW41RThsnzcfmtVcGbco3VIDoEmSMnvFNcX7UbfsUw8jB70sQo7iRmZQdS4JM
         Y6vphDv0atiamoB1hPQ2/KoGbkC7RYU9Y4vbBLTEYOXrRtuhqqF2z73i3UW6eCi8PA
         yf8QZ2I0D1CDouHjPW8gjZBaJQU669bv3IyGS7D8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190622022254.GA7789@wens.csie.org>
References: <20190622022254.GA7789@wens.csie.org>
To:     Chen-Yu Tsai <wens@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] clk: sunxi-ng: clk parent rewrite part 1 - take 2
Cc:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
User-Agent: alot/0.8.1
Date:   Mon, 24 Jun 2019 20:01:40 -0700
Message-Id: <20190625030141.0D26320652@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chen-Yu Tsai (2019-06-21 19:22:54)
> Hi,
>=20
> Take 2 has build errors in drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
> fixed.
>=20
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0eb=
d9:
>=20
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi-n=
g-parent-rewrite-part-1-take-2
>=20
> for you to fetch changes up to 89f27fb2dd348d8d52a97e6ebec15c64fe461a25:
>=20
>   clk: sunxi-ng: sun8i-r: Use local parent references for SUNXI_CCU_GATE =
(2019-06-22 10:13:16 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next. I applied this patch on top though to
clean up the debugfs patch. A newline was missing. Does it make sense? I
haven't tested it at all.

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 093161ca4dcc..09d8e84a1968 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2997,11 +2997,10 @@ static int clk_flags_show(struct seq_file *s, void =
*data)
 }
 DEFINE_SHOW_ATTRIBUTE(clk_flags);
=20
-static int possible_parents_show(struct seq_file *s, void *data)
+static void possible_parent_show(struct seq_file *s, struct clk_core *core,
+				 unsigned int i, char terminator)
 {
-	struct clk_core *core =3D s->private;
 	struct clk_core *parent;
-	int i;
=20
 	/*
 	 * Go through the following options to fetch a parent's name.
@@ -3015,22 +3014,6 @@ static int possible_parents_show(struct seq_file *s,=
 void *data)
 	 * specified directly via a struct clk_hw pointer, but it isn't
 	 * registered (yet).
 	 */
-	for (i =3D 0; i < core->num_parents - 1; i++) {
-		parent =3D clk_core_get_parent_by_index(core, i);
-		if (parent)
-			seq_printf(s, "%s ", parent->name);
-		else if (core->parents[i].name)
-			seq_printf(s, "%s ", core->parents[i].name);
-		else if (core->parents[i].fw_name)
-			seq_printf(s, "<%s>(fw) ", core->parents[i].fw_name);
-		else if (core->parents[i].index >=3D 0)
-			seq_printf(s, "%s ",
-				   of_clk_get_parent_name(core->of_node,
-							  core->parents[i].index));
-		else
-			seq_puts(s, "(missing) ");
-	}
-
 	parent =3D clk_core_get_parent_by_index(core, i);
 	if (parent)
 		seq_printf(s, "%s", parent->name);
@@ -3045,6 +3028,19 @@ static int possible_parents_show(struct seq_file *s,=
 void *data)
 	else
 		seq_puts(s, "(missing)");
=20
+	seq_putc(s, terminator);
+}
+
+static int possible_parents_show(struct seq_file *s, void *data)
+{
+	struct clk_core *core =3D s->private;
+	int i;
+
+	for (i =3D 0; i < core->num_parents - 1; i++)
+		possible_parent_show(s, core, i, ' ');
+
+	possible_parent_show(s, core, i, '\n');
+
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(possible_parents);

