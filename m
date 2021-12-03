Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172BDC433FE
	for <linux-clk@archiver.kernel.org>; Fri,  3 Dec 2021 14:15:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381403AbhLCOTF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Dec 2021 09:19:05 -0500
Received: from mail-0301.mail-europe.com ([188.165.51.139]:35257 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244622AbhLCOTE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Dec 2021 09:19:04 -0500
Date:   Fri, 03 Dec 2021 14:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wujek.eu;
        s=protonmail; t=1638540937;
        bh=LcPPdCgL5aGQN92Z/ZpQSAiXoGD4oTZimSgmScFjJF0=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:From:To:Cc;
        b=WOGK/BBp21RpZbbX6yADEUtPusvnWhOJZkzImDUrFz85knPcmyp51jyUnDNtfOEI5
         5Rf6mTnF3G30FGgYWqDhSjFPrtkWimfwgWn0flcb2o2NZiuidnJ5YdgszRMa05jUlR
         +R9MDrMAsg/o9SaqONRJ57KOL0htN7LA/UnI9qLTG03IBMBscNOG105bpSffiozMUk
         CKGJ9Y1Fzkk+W0IVOWcGa8A28EjgQoH0zGilRkRmYJUBLSoro40IZDm/NJW1mKRsnb
         kpqrHfNdVBv7CbekqR7DDuTkygHsS40JlmFGtpnnC8PAYRpd3qdKCWK4/SlDxsrhvA
         Sx0bY/JpaBQBg==
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
From:   Adam Wujek <dev_public@wujek.eu>
Cc:     Adam Wujek <dev_public@wujek.eu>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Adam Wujek <dev_public@wujek.eu>
Subject: [PATCH] clk: si5341: Add sysfs property to check selected input
Message-ID: <20211203141515.2448129-1-dev_public@wujek.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a sysfs property to check the selected input.
<input_num> <input_name> <input_name_from_DTB>
E.g.:
cat input_selected
0 in0 WR25M

Signed-off-by: Adam Wujek <dev_public@wujek.eu>
---
 drivers/clk/clk-si5341.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 57ae183982d8..b7641abe6747 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -1536,12 +1536,31 @@ static ssize_t clear_sticky_store(struct device *de=
v,
 }
 static DEVICE_ATTR_WO(clear_sticky);

+static ssize_t input_selected_show(struct device *dev,
+=09=09=09       struct device_attribute *attr,
+=09=09=09       char *buf)
+{
+=09struct clk_si5341 *data =3D dev_get_drvdata(dev);
+=09int res =3D si5341_clk_get_selected_input(data);
+=09const char *input_name_dtb;
+
+=09if (res < 0)
+=09=09return res;
+=09input_name_dtb =3D  __clk_get_name(devm_clk_get(dev,
+=09=09=09=09=09=09si5341_input_clock_names[res]));
+=09/* input id, input name, input name from DTB */
+=09return snprintf(buf, PAGE_SIZE, "%d %s %s\n", res,
+=09=09=09si5341_input_clock_names[res], input_name_dtb);
+}
+static DEVICE_ATTR_RO(input_selected);
+
 static const struct attribute *si5341_attributes[] =3D {
 =09&dev_attr_input_present.attr,
 =09&dev_attr_input_present_sticky.attr,
 =09&dev_attr_pll_locked.attr,
 =09&dev_attr_pll_locked_sticky.attr,
 =09&dev_attr_clear_sticky.attr,
+=09&dev_attr_input_selected.attr,
 =09NULL
 };

--
2.17.1


