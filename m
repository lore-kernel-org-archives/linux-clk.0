Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFB1CA4E;
	Sun, 12 Apr 2026 15:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776007859; cv=none; b=LCQxH7TH4MGeWFpL7urz2LFfsXaLWNqE9fidKmMLrtHHLytwRVZn/t95SOlRnM2unONVeZcnwzUrQpbuBl5bfWPXjUOEFpf9hRw9EkPRaRXsnCeNrLJiT47/A2Mg0SziwpoeNgrMgL/d+QaIIrCOFyeLYhYXyAjboqxsZZctHAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776007859; c=relaxed/simple;
	bh=0wfKZ1XsWLq4O8YXlheThr87U+vbrgynfRN59nNik2Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JHTB+L34Ut0KiaIwvmFN7kqD/q3+zxTqclcjkdhiPMU4cTDoWkSTA7b5xZ4kBn5iDQ+KSZoVR2yTq96+YvpTzejjFmnospp/qBkR2RhbAmq5KcYcSo+yy9H7acXbxIK2xB6MO1wH8vBjzPYGuYLT13TBGkQ9o1NtAzv/KaNJi7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=czrfQYCK; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="czrfQYCK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776007855; x=1776267055;
	bh=EwPgZdkR3n111ITFHye+yYyNnOLCYX9in8OTHGIBdPw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=czrfQYCKjlHuXZsk4b1OFn0OZXtZsiyYXz3tVMypxXELu3oazFgGLuyAmbeBInNbs
	 3dRP0oTzXmrPcFCUrT+pOS2LbUtH+tCRtkknxx9t7zWKBux8QXV0IRuCVo1IPQ7qBP
	 fRJiyHGYA2mON5OZOqHVSDO7oeVYAxCRmUQKfv5TA6jMdXB1NPG/g+ol4zvvZGIAaq
	 YWAQ/9eGJgXOPa61tp0NdoTPvTvOXpYTMfQt91hs/XAn8TLzjKnAK0GTqVZU1UMLjW
	 2lYegFttxmrx0JEvbUCfRHHn3r1AuBOqhurG0eEYcRYNESt1NzRzjiJ7zVYRWwOiSx
	 +CFOpUJDidY+Q==
Date: Sun, 12 Apr 2026 15:30:52 +0000
To: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 1/2] Revert "clk: qcom: rpmh: make clkaN optional"
Message-ID: <20260412-clk-rpmh-vrm-opt-v1-1-37c890c420ff@pm.me>
In-Reply-To: <20260412-clk-rpmh-vrm-opt-v1-0-37c890c420ff@pm.me>
References: <20260412-clk-rpmh-vrm-opt-v1-0-37c890c420ff@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 6ce20891b82e63e05c7088087cf76529cfcf18d1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This reverts commit 166e65bc6ce317be41368d9340b870edbdbaa2aa.

Reason for revert: Better handled by just marking all VRMs as optional,
instead of needing to mark for each platform, done in follow up change.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/clk/qcom/clk-rpmh.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 547729b1a8ee..fc99c2c305da 100644
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
@@ -981,12 +976,6 @@ static int clk_rpmh_probe(struct platform_device *pdev=
)
 =09=09rpmh_clk =3D to_clk_rpmh(hw_clks[i]);
 =09=09res_addr =3D cmd_db_read_addr(rpmh_clk->res_name);
 =09=09if (!res_addr) {
-=09=09=09hw_clks[i] =3D NULL;
-
-=09=09=09if (desc->clka_optional &&
-=09=09=09    !strncmp(rpmh_clk->res_name, "clka", sizeof("clka") - 1))
-=09=09=09=09continue;
-
 =09=09=09dev_err(&pdev->dev, "missing RPMh resource address for %s\n",
 =09=09=09=09rpmh_clk->res_name);
 =09=09=09return -ENODEV;

--=20
2.53.0


