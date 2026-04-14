Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE1738BF61
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 11:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776166475; cv=none; b=soWN9NDHi0+01YL3815l2bnXLN1dC7KRlGTDuV3F5MhqORZT4BWkuk2M1N7bEmljDuasRGlzd0w3CIY8QigOLxW4xa7S9hODM8nQ88jMvX+4/dWwaDtjo1idTqyfDUZlFkwN5yhtTltms6MEuo00xflY2tK2VMQkrd4kv0uzWSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776166475; c=relaxed/simple;
	bh=IPuuAZ3QUI3kISr5bIPWEgCRk/JGcfrG69DwgS20bhA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DcmdhiXo9z4wxcItRBYdBeax3OPytAQW8UYFPw9Az7Pjc7HwL7A6xJj4SJsVhTILjpdP26xkG6gu2O2tYs4iP/wDvsOuGFDBOtdClmHRelELnG0MgTeX5VJ7st4JT3yMnY3LGMxQyyYe9MMeZQ1RFHsdk8DLWhamfcgJsP3IrMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=U1wX3Fk5; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="U1wX3Fk5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776166465; x=1776425665;
	bh=1kT/8BpbyfAuxwonp0SoeLu9NuLOa9DfbsfgXCmDFiA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=U1wX3Fk5zR4MoPp0rbZHCO81exOXxDkrYxLNmZaj1n8odp8jCugS+WrqT1yl6CUvo
	 g6vZvc5MlAThMwrb26r5xsf74vXE9ZzExIr61aVsOmUm5PD/W8wu5V11ewAb0HfEpW
	 Nuw3+jgkoquec09ujq5PDycIb7oUR/bT6VwWen+/jdP12OUwehH0EhfDKSbEF+PX0n
	 /6iTHFsZZOffFdGW2dLtv77CCfkm1L3iXS0o11acC/O0IKGbVgVdz6n/Njrkddvlhv
	 1S/p8m3djUDh9CAAl8P89kaaVW8HVIeD5jYty/uSzOPrY/FqcgbfVkD8PM6f5B3FdY
	 SoKYUO6Is2/WA==
Date: Tue, 14 Apr 2026 11:34:18 +0000
To: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v2] clk: qcom: clk-rpmh: Make all VRMs optional
Message-ID: <20260414-clk-rpmh-vrm-opt-v2-1-43c1073d109c@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: add7ccb1faf82968a2ac848ba218a272aaf978bf
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Some VRMs aren't present on all boards, so mark them as optional. This
prevents probe failures on boards where not all VRMs are present.

This resolves an issue seen on the Nothing Phone (4a) (Eliza) where
probe fails due to RPMH_RF_CLK5 not being present on the board, this is
due to this device having a slightly different PMIC configuration from
the Eliza MTP.

This matches the downstream approach of marking all VRMs as optional
and makes the previous clka_optional handling redundant.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v2:
- Squashed clka_optional revert into patch (Dmitry)
- Simplified patch by just checking if CLK_RPMH_VRM_EN_OFFSET (Konrad)
- Squashed cover into patch commit message and expanded on background
- Link to v1: https://lore.kernel.org/r/20260412-clk-rpmh-vrm-opt-v1-0-37c8=
90c420ff@pm.me
---
 drivers/clk/qcom/clk-rpmh.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 547729b1a8ee..269a884645b4 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -66,8 +66,6 @@ struct clk_rpmh {
 struct clk_rpmh_desc {
 =09struct clk_hw **clks;
 =09size_t num_clks;
-=09/* RPMh clock clkaN are optional for this platform */
-=09bool clka_optional;
 };
=20
 static DEFINE_MUTEX(rpmh_clk_lock);
@@ -691,7 +689,6 @@ static struct clk_hw *sm8550_rpmh_clocks[] =3D {
 static const struct clk_rpmh_desc clk_rpmh_sm8550 =3D {
 =09.clks =3D sm8550_rpmh_clocks,
 =09.num_clks =3D ARRAY_SIZE(sm8550_rpmh_clocks),
-=09.clka_optional =3D true,
 };
=20
 static struct clk_hw *sm8650_rpmh_clocks[] =3D {
@@ -723,7 +720,6 @@ static struct clk_hw *sm8650_rpmh_clocks[] =3D {
 static const struct clk_rpmh_desc clk_rpmh_sm8650 =3D {
 =09.clks =3D sm8650_rpmh_clocks,
 =09.num_clks =3D ARRAY_SIZE(sm8650_rpmh_clocks),
-=09.clka_optional =3D true,
 };
=20
 static struct clk_hw *sc7280_rpmh_clocks[] =3D {
@@ -893,7 +889,6 @@ static struct clk_hw *sm8750_rpmh_clocks[] =3D {
 static const struct clk_rpmh_desc clk_rpmh_sm8750 =3D {
 =09.clks =3D sm8750_rpmh_clocks,
 =09.num_clks =3D ARRAY_SIZE(sm8750_rpmh_clocks),
-=09.clka_optional =3D true,
 };
=20
 static struct clk_hw *glymur_rpmh_clocks[] =3D {
@@ -951,6 +946,9 @@ static struct clk_hw *of_clk_rpmh_hw_get(struct of_phan=
dle_args *clkspec,
 =09=09return ERR_PTR(-EINVAL);
 =09}
=20
+=09if (!rpmh->clks[idx])
+=09=09return ERR_PTR(-ENOENT);
+
 =09return rpmh->clks[idx];
 }
=20
@@ -983,8 +981,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 =09=09if (!res_addr) {
 =09=09=09hw_clks[i] =3D NULL;
=20
-=09=09=09if (desc->clka_optional &&
-=09=09=09    !strncmp(rpmh_clk->res_name, "clka", sizeof("clka") - 1))
+=09=09=09if (rpmh_clk->res_addr =3D=3D CLK_RPMH_VRM_EN_OFFSET)
 =09=09=09=09continue;
=20
 =09=09=09dev_err(&pdev->dev, "missing RPMh resource address for %s\n",

---
base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
change-id: 20260412-clk-rpmh-vrm-opt-78b97cf451ba

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>


