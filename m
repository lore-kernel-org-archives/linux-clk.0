Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447683;
	b=z3OMTKy96gzLAqAQ+UDP7MqfOzPz4cUNcz3+YUpaDo0cYOyyEkJmPP2iXJ1+ILKBTXR8
	 m33c8m53M8XNU/5dhpXU28uR1oq172Frd2uwjdZogNRVoPRGU+rUsDjWH7qWMVY0qfzhC
	 r5yFd+1Q1h07wFH/3P9OlxLLCxeHx+rbRhl9zYBgz/wk9rLREnGpFJdq7QEWu5iQ1UBdN
	 TPgmzm0v/1LJCo7D16y8guIDOMZqKUgmb++G6b66+bM5uS40CQAuzFoSL5lnfQYF2CgJE
	 MljhFmCAg7J7g0ceTv52xOLPPpewZvqw4R6Kr+pyY3by6hcRseiAgcyQLrYjQV2xAKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c1EzffyQMBPdxbIZVJGcUzqBXPK2cayxcVlx4GrPO7w=;
	b=E08NOum7vxWppkoDwa85bztA9LzWhJolUs4u2XxEtvZn73kgQIFrazA6GNF57+bGUzWL
	 hhENhkUirZoI3JFRGe3XPZbkFR9oUbiIvudXVX8qD9R18VcBxloig/y+/uqY6DRwaFsC0
	 H/oEmF0Kj/bewE8f6cBY4RG+RlwEWydCgMkP/y808WLZMlq/uEJf4yzvQROCS3CXLAZ0Q
	 wyiGOsyqay7KBkirPtl110Qo9jmH7OQHCE8Xdmv/FCcQZY6PtjaGGl91uRouHpDwGeV4T
	 VRR1ZRwb/FtUbbs2SWqFnC4267NBKqUMoItOgPyK+5e2l1XACxzAk3SE1msoCHzb3gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tM7/Lb4o";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2E0606A339
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 15:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC2E0606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tM7/Lb4o
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33fb4680717so9393264eec.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 07:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447682; x=1796052482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1EzffyQMBPdxbIZVJGcUzqBXPK2cayxcVlx4GrPO7w=;
        b=tM7/Lb4ohN1rjBmrP/p4jsqauMxS8DlnR9uOt5WOXDONuj9gtBL24ThKjhYyUJ1osr
         DzqANDmyaqyQRIj9/WtIAT/2YNLsDbukMTF8CsLrlVLEEj1u79LxziKXkIVO0kuI3yvd
         ilvhELHyvShgLq2T3GfJ2xb3ebiLdSzv8fG/1WUouEulxQ2bjODdAQn++ALn6A5oRrdP
         gp7+Nu5zsnypVzDnLckDqxN6joBc14yqFTXBNPePxokmg2P15CstxQ+L4Hii3L+lJDFp
         UW9V1QtAegU0c2Ex964UbGyqVPZzoLvvZqPc/2zQWmZhYNNwMxGusYtW/O0GQnjuA8yN
         3YsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447682; x=1796052482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c1EzffyQMBPdxbIZVJGcUzqBXPK2cayxcVlx4GrPO7w=;
        b=07qOvo5rveLZqeBRHmoeQ87y3f3yEbDxhLq/Km1e2B+no/6fix3ieOMp8LaXioEExf
         kpHXrXI4aYWM+/uP1ELxTgasjN/by3HWXF5Hv/BiJYdheYmCcMEiaK92z25zmlRETs1D
         Ju3tY1jeeXv6+eU9LdTLtgowJD/+F0UgJ0rSzYCSORRWI1VWAkKotvzSLTO0Zxy9vXkO
         SgoKIK4IkLyhAyzJttBuv9dx6xOzVYdeOLzzOUGRy23gZFjWlo0XE38b2zkNCEd/6I1X
         Xz+/4GWmlodJF3TgvPsV9ak8XawEVl9qripflV7QieXBMkTaCnoGdNA1a1ltQBQqC0vz
         ffSQ==
X-Forwarded-Encrypted: i=1; AL+hErHM5Bz20D+9TNVdDWWvbTrDAUZUzVwi7asgoCPM3ojnB+Cfvt+ku32zJ2RnuJaJ3aw7j52/M9zrx7I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x8e4/iLAO8m3vow+vxpTFbzRZdaxfCn+PFQ4lfK4Z7zWqE675
	jivHs89UJlPWmzmHyVJ8bEc3BQBBNuSvdCTcivKS/SUwNiZMqHe7wGyQ
X-Gm-Gg: AZFdTZc7YUBB4z68EJVLLY4xr2tywazWatLDXEkN3AJd5adOm+QcQWK0oJ8ma+YtPR3
	pvzLHYoHjlCuhCQvFY4VMlj7SHY+rYVKb+adcLFoD+/g4Jw8PEeJP2nMekjh+1BljQWVHstYeMm
	r/U8jq1/8BNax4ynnVzklutHcMc8178B9Q4buff8W6Vo3QKTLwrva38iI5RJAqaWKzfl7aSA8Ur
	u0thNxMPb+2/+wKrrtck5+Xz+C2AOmpd5QPNpl4b8Ua5E0uKkb+mocaKogM3vYfQql79Q/nZZ2G
	tDNPHhiPAm7z+gl6Ry5E7d8Yr1rvqYRUBiQydNCfL3T1jTAaOfkxKpZ8Jyj7s3QcyHpKtPKN77k
	zlA3SxPLeuHvC/K6IfnFxAeNbG1X4vKiLQh1EtBe5RWQZ69WcaAeixnDMtXFn/sQwuRz7HBDzXv
	WAurVe6nZO7zcmemDyXvE0MuF7Didj509Em1txUOoxP7VMxyVp1dkgkjtKE2o9f6PP7IpcNH8dH
	QOCyvBvcCnyhrArPZKIrd7h4g0/C33jZujCQphotNJKh8cQJj2alCzq0FjX8xCAIn8t2M3/m4Wc
	OZ9pXu83xTCey+gFRtClDrijNuMNMP+WDIZPDoyjXkDY0w==
X-Received: by 2002:a05:693c:8801:10b0:386:b070:6f2b with SMTP id 5a478bee46e88-386b0707075mr3467857eec.36.1795447681882;
        Mon, 23 Nov 2026 07:28:01 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:28:00 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v3 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Mon, 23 Nov 2026 22:27:16 +0700
Message-ID: <20261123152722.168879-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123152722.168879-1-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2 with a divider of 4, which leaves gcc_camss_csi0phytimer_clk stuck off on MSM8953 platforms such as Xiaomi Mi A1 (tissot).

Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 drivers/clk/qcom/gcc-msm8953.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
index 8fe1d3e42144..8aec5600e837 100644
--- a/drivers/clk/qcom/gcc-msm8953.c
+++ b/drivers/clk/qcom/gcc-msm8953.c
@@ -964,7 +964,7 @@ static struct clk_rcg2 csi2p_clk_src = {
 };
 
 static const struct freq_tbl ftbl_csi_phytimer_clk_src[] = {
-	F(100000000, P_GPLL0_DIV2, 4, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
 	F(200000000, P_GPLL0, 4, 0, 0),
 	F(266670000, P_GPLL0, 3, 0, 0),
 	{ }
-- 
2.47.3

