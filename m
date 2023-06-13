Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F10C7EE2E
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 01:06:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234271AbjFMBGb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 21:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232574AbjFMBGa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 21:06:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38ECD3
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 18:06:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7766762C99
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 01:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE00C433EF;
        Tue, 13 Jun 2023 01:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686618388;
        bh=+zttTJLFniMHAb54GyKrL5R5BjLoU/2jNy216kjYbK4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Si94vaJe7VQDSSUiRD0BVoL1X4G2hCCtsvpFW4Yf1sEubDi24mmMrl/+U71nD5q0P
         M/GX7upUFdVph8EQ3oyp1Hiua+0mC1fXLCk/qnrVCa8pmuH6d9MMf47WjqTxoml8T1
         3fMjREoXSd7XI81xZ86CdtUfF3LuemJbgm4yz5+GXE9H+iv5SUrGXaYlL3YzU+5fu3
         vkxbnbNavNqjdv2uCxOAYq/NN/4EXwgsEDpRrckphWTKgHAArdhcpUqyMaw1p9TtSw
         qi434drqtnZbNZrP+MmYD54SIwZ7L/TvbDB3cUZi8j1o0hBL/rt20QcAbDT511zdVO
         gUy5cAdQGhY0A==
Message-ID: <6f8ca3a44de72e21b16a85f65b001de4.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202306101217.08CRVGcK-lkp@intel.com>
References: <202306101217.08CRVGcK-lkp@intel.com>
Subject: Re: [clk:clk-determine-rate 66/68] sound/soc/codecs/tlv320aic32x4-clk.c:219 clk_aic32x4_pll_determine_rate() warn: unsigned 'rate' is never less than zero.
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
To:     Maxime Ripard <maxime@cerno.tech>,
        kernel test robot <lkp@intel.com>
Date:   Mon, 12 Jun 2023 18:06:26 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting kernel test robot (2023-06-09 21:38:56)
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk=
-determine-rate
> head:   326cc42f9fdc3030676e949d5cea3ccc923fd1de
> commit: 25d43ec352eaefbfaee0912d02b6f10ea606931f [66/68] ASoC: tlv320aic3=
2x4: pll: Switch to determine_rate
> config: x86_64-randconfig-m001-20230608 (https://download.01.org/0day-ci/=
archive/20230610/202306101217.08CRVGcK-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306101217.08CRVGcK-lkp=
@intel.com/
>=20
> smatch warnings:
> sound/soc/codecs/tlv320aic32x4-clk.c:219 clk_aic32x4_pll_determine_rate()=
 warn: unsigned 'rate' is never less than zero.
>=20
> vim +/rate +219 sound/soc/codecs/tlv320aic32x4-clk.c
>=20
>    206 =20
>    207  static int clk_aic32x4_pll_determine_rate(struct clk_hw *hw,
>    208                                            struct clk_rate_request=
 *req)
>    209  {
>    210          struct clk_aic32x4_pll_muldiv settings;
>    211          unsigned long rate;
>    212          int ret;
>    213 =20
>    214          ret =3D clk_aic32x4_pll_calc_muldiv(&settings, req->rate,=
 req->best_parent_rate);
>    215          if (ret < 0)
>    216                  return -EINVAL;
>    217 =20
>    218          rate =3D clk_aic32x4_pll_calc_rate(&settings, req->best_p=
arent_rate);
>  > 219          if (rate < 0)
>    220                  return rate;
>    221 =20
>    222          req->rate =3D rate;
>    223          return 0;
>    224  }
>    225 =20

Should we just apply this patch?

---8<---
diff --git a/sound/soc/codecs/tlv320aic32x4-clk.c b/sound/soc/codecs/tlv320=
aic32x4-clk.c
index a7ec501b4c69..c116e82f712d 100644
--- a/sound/soc/codecs/tlv320aic32x4-clk.c
+++ b/sound/soc/codecs/tlv320aic32x4-clk.c
@@ -208,18 +208,14 @@ static int clk_aic32x4_pll_determine_rate(struct clk_=
hw *hw,
 					  struct clk_rate_request *req)
 {
 	struct clk_aic32x4_pll_muldiv settings;
-	unsigned long rate;
 	int ret;
=20
 	ret =3D clk_aic32x4_pll_calc_muldiv(&settings, req->rate, req->best_paren=
t_rate);
 	if (ret < 0)
 		return -EINVAL;
=20
-	rate =3D clk_aic32x4_pll_calc_rate(&settings, req->best_parent_rate);
-	if (rate < 0)
-		return rate;
+	req->rate =3D clk_aic32x4_pll_calc_rate(&settings, req->best_parent_rate);
=20
-	req->rate =3D rate;
 	return 0;
 }
