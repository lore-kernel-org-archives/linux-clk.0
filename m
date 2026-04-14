Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798D617A2EA;
	Tue, 14 Apr 2026 17:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776188085; cv=none; b=ZVao5RT7kqTBL+hCYS7psB4Ke7S+6OUbh31mS1TwrBgDicDwTCnsCLJd10mkiQVLKN/VZZ9VKcntRQadxxOXCxf9Je2Yf6A6J2kJHSllP6bvsCIVDjkQJcxYoPp521NV97BZcSawsNIo9Te64nCxoH4dSIKT937EfxnRmL5++uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776188085; c=relaxed/simple;
	bh=VJ+TAkF39F48iG/YXVuLe0DhjcocAQU2eKi5T9On9yQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m5P5hce5c8WeQBLtH375s0aL6UNxDi5E1s0ySQfoEIx2jPrYHcdbeV0vSAl6fD3vhoKq6HcS9zjBc/kELRxZUcEEFZLTShdpLMQgQXGBe8Mfe/sq5pzmn0im9/U8TQ6k1e/JaECSHKTW+mXodcBzJiHjNPnZVXhbRYhjXgW4zdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Z1YG22jF; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Z1YG22jF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776188074; x=1776447274;
	bh=7V06tulm8mBNi+TMta0rIfp/c2KhObNRHrzAk1IHbMY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Z1YG22jFN7LkGxXugpQRhsAckGm1MMsjTY7jPAaqNZc0mQshm0GDkg4YKG1PcfY3q
	 CTupq8OtdLYDA7m6MsdhjtMnJIo6dpont3Q7tty/Lv0cRedgQc4yFX8sOHzPhRPF7N
	 +0X2xUljS/wt1tFbzxO5omr+uBWo9u3efAUEMCLMghQy9JjkYSGhkBL/ZmPuOHyG6q
	 EAgyQXjETIYkTTVJfLQiR0iYmqHy2XgDAFqIKYfDCWUxLyI4YnvZpZoKrMpcEgGZao
	 TLRfK036hUobAUmCOVQVBKAM6NJiYg7SaXDbmOSb0yLLVOvPZQZeJxCY1ESQrrl9y0
	 VZOlTT97xSSUA==
Date: Tue, 14 Apr 2026 17:34:28 +0000
To: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v3] clk: qcom: clk-rpmh: Make all VRMs optional
Message-ID: <20260414-clk-rpmh-vrm-opt-v3-1-8ca21469ffbc@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 1907efc6c483ddce45d4d08946b783e061d0f51c
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

This resolves an issue seen on the Nothing Phone (4a) Pro (Eliza) where
probe fails due to RPMH_RF_CLK5 not being present on the board, this is
due to this device having a slightly different PMIC configuration from
the Eliza MTP.

This matches the downstream approach of marking all VRMs as optional
and makes the previous clka_optional handling redundant.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v3:
- Don't return ENOENT in of_clk_rpmh_hw_get (Konrad)
- Link to v2: https://lore.kernel.org/r/20260414-clk-rpmh-vrm-opt-v2-1-43c1=
073d109c@pm.me

Changes in v2:
- Squashed clka_optional revert into patch (Dmitry)
- Simplified patch by just checking if CLK_RPMH_VRM_EN_OFFSET (Konrad)
- Squashed cover into patch commit message and expanded on background
- Link to v1: https://lore.kernel.org/r/20260412-clk-rpmh-vrm-opt-v1-0-37c8=
90c420ff@pm.me
---
 drivers/clk/qcom/clk-rpmh.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 547729b1a8ee..3e0fb33628f4 100644
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
@@ -983,8 +978,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
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


