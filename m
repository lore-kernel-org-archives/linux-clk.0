Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D13A32C934
	for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 05:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770702056; cv=none; b=LUsDvvyYpdKsfRbEJKQB9GOdZ+xu7tNE0N+TmVFqwmPtKiFaiGG/LQBCFqbwoWFdbREMCyvyls4b4UMaI10qJT3GgS6llcm9fw8JU7SmfGO8+e+dljBvvVBH8b3/KtSvWl635y+N66BoP+JL2k1VditfOXUiLhA5H3nGcx86nZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770702056; c=relaxed/simple;
	bh=U8wca55btsKFDQUnnDtKXbB7ZWCD4W6LC1Ofp6cM+pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QbmnH93PTdvqmb4VwtMV6khSlhWcRa8eTiPyjDY8okHg5FLAY5efk4PrPhSQr4R+2DNrkEDQNB0wYC5Ed2qtOeMuczUGDeBA3GMuouc40n1MVdRXRyIltyOPtZChdpd43MI2fxrqbkI4KN6Li9apCeg0f084XjCt3ovu2iTBLVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKeuIM+z; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKeuIM+z"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-895071c5527so49137996d6.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Feb 2026 21:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770702054; x=1771306854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3yduzGv3F/417GuJBj4DmelW0B8eKJjBniawn3DCPw=;
        b=VKeuIM+zf2QQW+03NrKpOTqnZMc0K/mvJBvbx4XOye847UPGmX1Ye8l7hDDCJ9frVa
         lGFmyPN1qgMM1FZ9r4vYIDoJZaX2oS8XqgKe9jDPHA9+4TQz7alVUmYOAAHDNJ2K2KHF
         2x4A9BRLu8r+l3y+fIuUR0DSsoXBki+1vnZxO65h96D+1BklCs+cE5Q46mAj3wfbeg2O
         inYQt1Vw0LbaFBCifenXdxZaRDq1n4UzZSe6ruk1H6xAJiYwCQtVTSdqNJ3RaUAffLxP
         hNfD/7444g5uOE3xqjbH/1sfRlD/Goda0jnN4aziTl5ptDJHPUwkJt+Kt4ba9nXyFzmi
         1GZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770702054; x=1771306854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X3yduzGv3F/417GuJBj4DmelW0B8eKJjBniawn3DCPw=;
        b=gX7d8h4P5A53FMEkinaq/B63ygdQ2ZOekPwzeRPlXgQsBeHe7bFO3HIiNjiPJeUcWA
         NG2Mx0TdOpM3BxuKSBhpTrKXgAut1Zm/Yzo5eil/wMW+uRmZoBksPGO0cnMnlWodmG2q
         uK4QuKBDMVeavVQ9m8dxmqbKHfxaCDDWp2P3NPWvJSj73zLn7EYR3e6JAtd4kRylbQxo
         Qu6AwM6R6pZZ3+NHIiHxM1VqUt3VRHFeLLNPSNzhJiLpCTdNRJWoGdQAWH4M7zm+RVpZ
         u9GW59oiJT7KE4pnjRQ2JCvzB11Yi+Gdl6sTyqCuv0y4FvDRkBUxfQCKXGIr3SfXYBk8
         DSmg==
X-Forwarded-Encrypted: i=1; AJvYcCVAlP2U8OxmTIcAH1aWYNc0hgt53Ln0kZltnlFYtqX59a++om352FkOP0immKnvrzy/CQRqtEtNtJM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn5YId3wDdjPBdE9blNz1rAjSxYZ4OXn7ojkqBsttindMmreVl
	rE3A6rn32sOTxR3iF/O2HAWDd/W35JuDPK/5FwamHB6let1zKUd84O3p
X-Gm-Gg: AZuq6aJx5wBpdYT56MNHGYHLbyFBO5u4BY7tdDw0A2CBisjkZUJwoAgPgisuR5zdrkd
	OBMAwb1mw+ulKfjmxDC1+tK0BijwGi8d+SCgm2WOaN++rL/UYoldbPq8kO4Qi1UC5iSWJOV6fqB
	u7cbgo/BRojZcI2Wnk29pqCqV9iq/VIjlCZ8g8KornenzsLIokOesvvcIrn5oDgBNfki/KkiAGo
	zjsZOlJYe8UAlqy1glURZfB15jH5/G8yl7dq4VKaAdBiRunXgFML6gGuoSRABfjdUjsu6RUblVm
	Z6SshDS5GcTt6sKP5MNSUGSQS2SdqNrilaFwyB66/V70aA2k9WbACYXn79aka9mGd8L7CXz/f11
	iXWtiTEvUFrA9v+ngaqCSpAuz5X3zZLbHZOD7Q2dtyyPQQ7fgspy4oqwnH6tHwHb8lRP/fxofvX
	99zR5naagD0uhLbj9a8ZO1+tjS8aDX/pmrLl/4hiYF6pPlmRGPuwxAzMw5PtqXhEjM0kADUPib8
	Q==
X-Received: by 2002:a05:620a:404f:b0:8c7:16fb:ed49 with SMTP id af79cd13be357-8caf15f3e50mr1692101885a.63.1770702054094;
        Mon, 09 Feb 2026 21:40:54 -0800 (PST)
Received: from aford-System-Version.lan (c-68-46-10-116.hsd1.mn.comcast.net. [68.46.10.116])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9ee9fbasm978632285a.39.2026.02.09.21.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:40:53 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: angelogioacchino.delregno@collabora.com,
	Adam Ford <aford173@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Laura Nao <laura.nao@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 2/5] clk: mediatek: Fix MT8196 topckgen2 orphan clocks
Date: Mon,  9 Feb 2026 23:37:02 -0600
Message-ID: <20260210053708.17239-2-aford173@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260210053708.17239-1-aford173@gmail.com>
References: <20260210053708.17239-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are a few clocks with names spelled incorrecly, so when a child tries
to associate itself to a parent, there isn't a parent.  Fixing the names
restores the proper parent-child relations of these clocks and eliminates
the orphaned clocks.

Fixes: b093e0f17099 ("clk: mediatek: Add MT8196 topckgen2 clock support")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 drivers/clk/mediatek/clk-mt8196-topckgen2.c | 92 ++++++++++-----------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8196-topckgen2.c b/drivers/clk/mediatek/clk-mt8196-topckgen2.c
index 6df93d7fbf91..a260366ae9f9 100644
--- a/drivers/clk/mediatek/clk-mt8196-topckgen2.c
+++ b/drivers/clk/mediatek/clk-mt8196-topckgen2.c
@@ -147,13 +147,13 @@ static const struct mtk_fixed_factor top_divs[] = {
 
 static const char * const seninf_parents[] = {
 	"clk26m",
-	"ck_osc_d10",
-	"ck_osc_d8",
-	"ck_osc_d5",
-	"ck_osc_d4",
+	"osc_d10",
+	"osc_d8",
+	"osc_d5",
+	"osc_d4",
 	"univpll2_d6_d2",
 	"mainpll2_d9",
-	"ck_osc_d2",
+	"osc_d2",
 	"mainpll2_d4_d2",
 	"univpll2_d4_d2",
 	"mmpll2_d4_d2",
@@ -166,10 +166,10 @@ static const char * const seninf_parents[] = {
 
 static const char * const img1_parents[] = {
 	"clk26m",
-	"ck_osc_d4",
-	"ck_osc_d3",
+	"osc_d4",
+	"osc_d3",
 	"mmpll2_d6_d2",
-	"ck_osc_d2",
+	"osc_d2",
 	"imgpll_d5_d2",
 	"mmpll2_d5_d2",
 	"univpll2_d4_d2",
@@ -185,24 +185,24 @@ static const char * const img1_parents[] = {
 
 static const char * const ipe_parents[] = {
 	"clk26m",
-	"ck_osc_d4",
-	"ck_osc_d3",
-	"ck_osc_d2",
+	"osc_d4",
+	"osc_d3",
+	"osc_d2",
 	"univpll2_d6",
 	"mmpll2_d6",
 	"univpll2_d5",
 	"imgpll_d5",
-	"ck_mainpll_d4",
+	"mainpll_d4",
 	"mmpll2_d5",
 	"imgpll_d4"
 };
 
 static const char * const cam_parents[] = {
 	"clk26m",
-	"ck_osc_d10",
-	"ck_osc_d4",
-	"ck_osc_d3",
-	"ck_osc_d2",
+	"osc_d10",
+	"osc_d4",
+	"osc_d3",
+	"osc_d2",
 	"mmpll2_d5_d2",
 	"univpll2_d4_d2",
 	"univpll2_d7",
@@ -219,8 +219,8 @@ static const char * const cam_parents[] = {
 static const char * const camtm_parents[] = {
 	"clk26m",
 	"univpll2_d6_d4",
-	"ck_osc_d4",
-	"ck_osc_d3",
+	"osc_d4",
+	"osc_d3",
 	"univpll2_d6_d2"
 };
 
@@ -239,7 +239,7 @@ static const char * const dpe_parents[] = {
 
 static const char * const vdec_parents[] = {
 	"clk26m",
-	"ck_mainpll_d5_d2",
+	"mainpll_d5_d2",
 	"mainpll2_d4_d4",
 	"mainpll2_d7_d2",
 	"mainpll2_d6_d2",
@@ -256,9 +256,9 @@ static const char * const vdec_parents[] = {
 
 static const char * const ccusys_parents[] = {
 	"clk26m",
-	"ck_osc_d4",
-	"ck_osc_d3",
-	"ck_osc_d2",
+	"osc_d4",
+	"osc_d3",
+	"osc_d2",
 	"mmpll2_d5_d2",
 	"univpll2_d4_d2",
 	"mmpll2_d7",
@@ -273,8 +273,8 @@ static const char * const ccusys_parents[] = {
 static const char * const ccutm_parents[] = {
 	"clk26m",
 	"univpll2_d6_d4",
-	"ck_osc_d4",
-	"ck_osc_d3",
+	"osc_d4",
+	"osc_d3",
 	"univpll2_d6_d2"
 };
 
@@ -309,14 +309,14 @@ static const char * const dp0_parents[] = {
 	"tvdpll1_d16",
 	"tvdpll1_d8",
 	"tvdpll1_d4",
-	"ck_tvdpll1_d2"
+	"tvdpll1_d2"
 };
 
 static const char * const disp_parents[] = {
 	"clk26m",
-	"ck_mainpll_d5_d2",
-	"ck_mainpll_d4_d2",
-	"ck_mainpll_d6",
+	"mainpll_d5_d2",
+	"mainpll_d4_d2",
+	"mainpll_d6",
 	"mainpll2_d5",
 	"mmpll2_d6",
 	"mainpll2_d4",
@@ -326,7 +326,7 @@ static const char * const disp_parents[] = {
 
 static const char * const mdp_parents[] = {
 	"clk26m",
-	"ck_mainpll_d5_d2",
+	"mainpll_d5_d2",
 	"mainpll2_d5_d2",
 	"mmpll2_d6_d2",
 	"mainpll2_d9",
@@ -342,13 +342,13 @@ static const char * const mdp_parents[] = {
 
 static const char * const mminfra_parents[] = {
 	"clk26m",
-	"ck_osc_d4",
-	"ck_mainpll_d7_d2",
-	"ck_mainpll_d5_d2",
-	"ck_mainpll_d9",
+	"osc_d4",
+	"mainpll_d7_d2",
+	"mainpll_d5_d2",
+	"mainpll_d9",
 	"mmpll2_d6_d2",
 	"mainpll2_d4_d2",
-	"ck_mainpll_d6",
+	"mainpll_d6",
 	"univpll2_d6",
 	"mainpll2_d5",
 	"mmpll2_d6",
@@ -361,14 +361,14 @@ static const char * const mminfra_parents[] = {
 
 static const char * const mminfra_snoc_parents[] = {
 	"clk26m",
-	"ck_osc_d4",
-	"ck_mainpll_d7_d2",
-	"ck_mainpll_d9",
-	"ck_mainpll_d7",
-	"ck_mainpll_d6",
+	"osc_d4",
+	"mainpll_d7_d2",
+	"mainpll_d9",
+	"mainpll_d7",
+	"mainpll_d6",
 	"mmpll2_d4_d2",
-	"ck_mainpll_d5",
-	"ck_mainpll_d4",
+	"mainpll_d5",
+	"mainpll_d4",
 	"univpll2_d4",
 	"mmpll2_d4",
 	"mainpll2_d3",
@@ -381,17 +381,17 @@ static const char * const mmup_parents[] = {
 	"clk26m",
 	"mainpll2_d6",
 	"mainpll2_d5",
-	"ck_osc_d2",
-	"ck_osc",
-	"ck_mainpll_d4",
+	"osc_d2",
+	"ulposc",
+	"mainpll_d4",
 	"univpll2_d4",
 	"mainpll2_d3"
 };
 
 static const char * const mminfra_ao_parents[] = {
 	"clk26m",
-	"ck_osc_d4",
-	"ck_mainpll_d3"
+	"osc_d4",
+	"mainpll_d3"
 };
 
 static const char * const dvo_parents[] = {
-- 
2.51.0

