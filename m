Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81686BFCE
	for <linux-clk@vger.kernel.org>; Sun, 12 Apr 2026 15:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776007862; cv=none; b=hqYNYl7n79dTRqgIcBPvOPEfdSnlPAPBGvx36lNS5lp582CJ9UeJqE4SXvaXEiVR1qDShMSQyZXBHA6bpCHroDZRAMIGgqbFihFdBbrv2rzajUcXbT9GdwbcbdfKK/8Asq2rS6VdDGOFj9QXGZx7Xu84p6fF8bXgY8fTBTqA5/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776007862; c=relaxed/simple;
	bh=XggJd0e86ykAt4dKAnnY/6BR3Qb1DgKVf+hF8fuC3oY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OsQGArp/J0X980UqB0acoK0wnIYIaiqfBGGdATLo+Fh5R1WX9ZqnDXuvc4zYRj5ZRvn0wl1HVnq7iTSLGaaLV6/0YiGqYb5MY3HnA/AirU3EMzrHIYFS5buwdZXUYYKeXPMZQmkTdaxNnZFesMfkJJZ9Y95HA3J05t3W514o/jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=kt44Z/Lp; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="kt44Z/Lp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776007858; x=1776267058;
	bh=EnyWghpvtGuuiAWGwtxbsibEM57ZqhgLXNuJkGlp/pU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=kt44Z/LpqWUXAGfuv53jEOeK+oRIqRf5GhLmpvDIJoDgAzwMfdxFXRocPtAO8NA+Q
	 uPdv41lXe5sjw7427H7hDq5rs4OCzA2Ju5iFAXDo21uMg3v0ZJOWevhOiETqEalvQC
	 YbdZKCkfEhU226eRt6fdebEtvC2D9KiawLjP8tnrbKmdhDhQgViKJiPDzCTa1FyZX4
	 6Ms0ZMd7ZTY2X93COGryJUN38GBfhnYB2SWtwc6u8030i6wlXOQEMdo5SxvZ0icIQd
	 by2CUMOP9hd4D4Sy3cSJxEgKhuuZH4AEY+m5iFY8oZ84VQeTja+vF6WjPPZps172qM
	 GdtCrPHytxqJw==
Date: Sun, 12 Apr 2026 15:30:56 +0000
To: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 2/2] clk: qcom: clk-rpmh: Make all VRMs optional by default
Message-ID: <20260412-clk-rpmh-vrm-opt-v1-2-37c890c420ff@pm.me>
In-Reply-To: <20260412-clk-rpmh-vrm-opt-v1-0-37c890c420ff@pm.me>
References: <20260412-clk-rpmh-vrm-opt-v1-0-37c890c420ff@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 42cbca3d6a675ee1b3f0a3f069f83c4d1dd2eeb1
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

This mirrors the downstream approach for this issue.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/clk/qcom/clk-rpmh.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index fc99c2c305da..3e029d82e733 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -52,6 +52,7 @@ struct clk_rpmh {
 =09struct clk_hw hw;
 =09const char *res_name;
 =09u8 div;
+=09bool optional;
 =09u32 res_addr;
 =09u32 res_on_val;
 =09u32 state;
@@ -71,13 +72,14 @@ struct clk_rpmh_desc {
 static DEFINE_MUTEX(rpmh_clk_lock);
=20
 #define __DEFINE_CLK_RPMH(_name, _clk_name, _res_name,=09=09=09\
-=09=09=09  _res_en_offset, _res_on, _div)=09=09\
+=09=09=09  _res_en_offset, _res_on, _div, _optional)=09\
 =09static struct clk_rpmh clk_rpmh_##_clk_name##_ao;=09=09\
 =09static struct clk_rpmh clk_rpmh_##_clk_name =3D {=09=09=09\
 =09=09.res_name =3D _res_name,=09=09=09=09=09\
 =09=09.res_addr =3D _res_en_offset,=09=09=09=09\
 =09=09.res_on_val =3D _res_on,=09=09=09=09=09\
 =09=09.div =3D _div,=09=09=09=09=09=09\
+=09=09.optional =3D _optional,=09=09=09=09=09\
 =09=09.peer =3D &clk_rpmh_##_clk_name##_ao,=09=09=09\
 =09=09.valid_state_mask =3D (BIT(RPMH_WAKE_ONLY_STATE) |=09\
 =09=09=09=09      BIT(RPMH_ACTIVE_ONLY_STATE) |=09\
@@ -97,6 +99,7 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 =09=09.res_addr =3D _res_en_offset,=09=09=09=09\
 =09=09.res_on_val =3D _res_on,=09=09=09=09=09\
 =09=09.div =3D _div,=09=09=09=09=09=09\
+=09=09.optional =3D _optional,=09=09=09=09=09\
 =09=09.peer =3D &clk_rpmh_##_clk_name,=09=09=09=09\
 =09=09.valid_state_mask =3D (BIT(RPMH_WAKE_ONLY_STATE) |=09\
 =09=09=09=09=09BIT(RPMH_ACTIVE_ONLY_STATE)),=09\
@@ -113,11 +116,11 @@ static DEFINE_MUTEX(rpmh_clk_lock);
=20
 #define DEFINE_CLK_RPMH_ARC(_name, _res_name, _res_on, _div)=09=09\
 =09__DEFINE_CLK_RPMH(_name, _name##_##div##_div, _res_name,=09\
-=09=09=09  CLK_RPMH_ARC_EN_OFFSET, _res_on, _div)
+=09=09=09  CLK_RPMH_ARC_EN_OFFSET, _res_on, _div, false)
=20
 #define DEFINE_CLK_RPMH_VRM(_name, _suffix, _res_name, _div)=09=09\
 =09__DEFINE_CLK_RPMH(_name, _name##_suffix, _res_name,=09=09\
-=09=09=09  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
+=09=09=09  CLK_RPMH_VRM_EN_OFFSET, 1, _div, true)
=20
 #define DEFINE_CLK_RPMH_BCM(_name, _res_name)=09=09=09=09\
 =09static struct clk_rpmh clk_rpmh_##_name =3D {=09=09=09\
@@ -946,6 +949,9 @@ static struct clk_hw *of_clk_rpmh_hw_get(struct of_phan=
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
@@ -976,6 +982,11 @@ static int clk_rpmh_probe(struct platform_device *pdev=
)
 =09=09rpmh_clk =3D to_clk_rpmh(hw_clks[i]);
 =09=09res_addr =3D cmd_db_read_addr(rpmh_clk->res_name);
 =09=09if (!res_addr) {
+=09=09=09hw_clks[i] =3D NULL;
+
+=09=09=09if (rpmh_clk->optional)
+=09=09=09=09continue;
+
 =09=09=09dev_err(&pdev->dev, "missing RPMh resource address for %s\n",
 =09=09=09=09rpmh_clk->res_name);
 =09=09=09return -ENODEV;

--=20
2.53.0


