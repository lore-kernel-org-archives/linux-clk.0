Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4001B3BBFDF
	for <linux-clk@vger.kernel.org>; Fri,  5 Jun 2026 00:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780620960; cv=none; b=dwHfldgbJp6+k5ppGsnx7z7IMh2U622YogMBBmhXClVlrGGRc8sxoS6LMh1OhEQ3SawF+/TVIInyVjkqS06aq4CefN4nryFnwJya2p0Nb8JU4gtWiI1qSiCIDE0hup3dmheYUvdtShTXFWeMGlVteZrDun4Y4DTVfnere8gowPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780620960; c=relaxed/simple;
	bh=sxquBZx0t5h7mUqD4ZdzXSu4g7vPg1HNi1UCLHJlBQ4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EVcgKlLNZ/z+sv/SpS+zalVSHg49gpg4Zobw9Ofq2SIcq4aDzWVpXMLDPjILw6kpTLgl/V6BOgabBG6h7ahePQRcCU+FRuUAkAcczu7hjlHHjeG0VIfCcOnVyaM/Pugyd/loMYjKONvOr9vjnz2PR9panqDimcbceBRj9aonln4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=B6dlvx61; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="B6dlvx61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1780620951; x=1780880151;
	bh=pXWjnuE5TYeSrab+2gCEGBFcQs2drj3wOwPxsv+Rz+Q=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=B6dlvx61Fj99Lgh0CAfO8AwpikHHy25KeMdCYXA93svM/6muJwUtlv3P67J0zeYoF
	 VgAl8qCbjwsqfhDqH766PNqI+OLgGbotKFLeGqdVhgfmzhYsbsK1oFwTNFnLeFM8Y4
	 uFjOzhN8lEChRfsJfosKoYtWHwcm+73gPL0T7DegsDf1E/niXC4Qq0jbFMsVOAVa2z
	 yPl6v5EYdF+FEUiVVK1IhJ/fHCW7lQmhIT4LkMvv8xU8ImtNH2kTj6P7cH0uHn25m+
	 +L+O4yzuuRVjhBIv4k1DnQiSeC5/PrLa8AarYC5HxuiiErtsy8mbGMiY1mQIkH8/Ck
	 ZFJeLM6GB0WJg==
Date: Fri, 05 Jun 2026 00:55:45 +0000
To: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org
From: Phillip Varney <pbvarney@protonmail.com>
Cc: bmasney@redhat.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Phillip Varney <pbvarney@protonmail.com>
Subject: [PATCH] clk: qcom: a53: Corrected frequency multiplier for 1152MHz
Message-ID: <20260605005502.313928-1-pbvarney@protonmail.com>
Feedback-ID: 5539158:user:proton
X-Pm-Message-ID: 0a985e75bfc505b31fd0aedcf509c13f245e84ec
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The 1152MHz frequency entry for the a53 currently selects a multiplier of 6=
2, giving 1190MHz. This changes the mulitiplier to 60 giving the intended 1=
152MHz.

Signed-off-by: Phillip Varney <pbvarney@protonmail.com>
---
 drivers/clk/qcom/a53-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
index 724a642311e5..0549b214fcfc 100644
--- a/drivers/clk/qcom/a53-pll.c
+++ b/drivers/clk/qcom/a53-pll.c
@@ -20,7 +20,7 @@
 static const struct pll_freq_tbl a53pll_freq[] =3D {
 =09{  998400000, 52, 0x0, 0x1, 0 },
 =09{ 1094400000, 57, 0x0, 0x1, 0 },
-=09{ 1152000000, 62, 0x0, 0x1, 0 },
+=09{ 1152000000, 60, 0x0, 0x1, 0 },
 =09{ 1209600000, 63, 0x0, 0x1, 0 },
 =09{ 1248000000, 65, 0x0, 0x1, 0 },
 =09{ 1363200000, 71, 0x0, 0x1, 0 },
--=20
2.54.0


