Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807288;
	b=Tw1sSFMJQwKuz7jqNEojmYrEPsbYcqUd1KtsuPfn375I+mWES23G2Yb03e7pAKMUwyaq
	 uwEpNeY0G/3P3T8dxgahtwS5cEQOjp8kZLH99RQ4ytBFcouEl4/EwNfqK59kCL7Vog3Io
	 3s87bhmv3GxEidouQKOb78N8HLhRTLaVMxkrbctPJJKiL+yhirnkdHAbqk4NMkaCJiKJr
	 1cFU9qtmnts9F5+kjVyOBAc4NHfwteFPwGsPfFD1YiC3mJP2wtsPOw+pE8bZEkNfTkADS
	 6uua+mDDSnEvIqWzJBsvXz5d24iLMjrGUrNDnueoVaivjEADX9OkdRuyKLvogo3CUXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=5rM15kA/3Ad56jxYSDQHLL64BhEdYv0msAd9naeCreY=;
	b=KzZfBmZT/pm+KbyvPhHRzvTiMz6BLWUjnF99Ia0WX/LCuwpThMiU8V7UfWUmlrAgMP9s
	 jgiIDMu01oNcSNDPlA/J4Z9//lhAlzwC+6EHvQV+8S+eZmixB2lGm9kWlUeF0vO2r0zc+
	 m3+yagQ47eobY4N2Wrc4t8dwsZWR4dyAJ78jmKGenDAHDoS5Z02UO90kYSizv/oNZfXke
	 wOu6uci6MO4bLlR/jweuLrPAHx9aVkJCOrnHr6f/9GVKnfIHCMMTHpyTLD6e1HVq866HY
	 g403AfR/CM+dTbvuX+kpm56TukSlK+oes/EFTg8Ai82sVlnkh3Ym4tlppF4Eabr92qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n+2iokkR;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F56606A32A
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 05:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37F56606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n+2iokkR
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so3399592c88.0
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 21:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794807287; x=1795412087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5rM15kA/3Ad56jxYSDQHLL64BhEdYv0msAd9naeCreY=;
        b=n+2iokkRZK+TEW9Uoe26sTwdl6Bu2lE99yd52n8ChO4uZf/u1bHjSHp9yfWrGO+EJv
         TyBoKf5NgbgZmI2rrUP37IdSsFFGvHtw2Il30IWRQMQ0THhAI889Np7KNzJziB0B8GSf
         dwUwgj8GGLSzqPEDC+lRKzbY+m0+IPxIou/SLQxGSMaONwaWCGWJznb/uDeYBS+DFFrU
         zIAT4/l/1rBUEMkQ1w7uHPVEdNhbMTGN2PeaaQ5ZJCTz6jI8TiALOncGRYpE0dDQgqTu
         xkMsBK1BKkC3f6hx+mqGYqDFRtZgXQBEiVJZLnnkFByT6qnL0bNKZ8FoUERnH/xFLJOC
         T2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794807287; x=1795412087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5rM15kA/3Ad56jxYSDQHLL64BhEdYv0msAd9naeCreY=;
        b=XObaWdccj9UpRE7gILCZUxqZDbMK5Iovu84nX10X5cvjQ0ucl1TkeArijd2dhyQXjV
         4a9+4ADIHJjH7uA5UddATUyG2vKBM0UZNc2/HptsM915x6ZqnVohB6hxuyQ46HMCVaNY
         r8MSa/Gz/wt3xFGJoQnLjqbloT1JrSL7fjAwurJDqGlo/FLXaU9sBr6WR03BLhxSe4Rb
         2uvLy6CYtHXZbhYARsobhMZRkx5eb3cMCYNQyudT2kQ5vrleiClixJPbD1zMS5TVcz9J
         cOvwjBC3W2ZMQ4MJeRW9HBNpkueeFj3lIcTss4rBBTRlBXCp2FGmUZ2gqq+1a29/TEix
         htVw==
X-Forwarded-Encrypted: i=1; AL+hErF7d/Qf54H2dA9dtwc1pUBEi/YJ6FCfEr1BFdWKY40BJYYgSwkBp8humEQ2iwRSzM+hSwgxURdctDU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tQA5n80M2/chnXKOn73q2A7lrUneXFd8IcbTAL/RWVxfnQ3XF
	M7Pgdo/S6pYK+Ijl8Lcce7K7V2ohYjw7qNJUVLo2PFnbBtXw1na/cjAm
X-Gm-Gg: AYBFou3bfNmnL3b117BN8x9tHFw+TDGRgX6QDEtaJkw2wtRrF/UODxstI8yZXvlh6A/
	HuOiT2f4C2I7bpH58syo7cS84tVj1cEbP0/7zfpNr3uJiKJ2kn5dQPzDGdvtPgLZhe/uUfriarp
	GaL8ET3Y1NxAAWdKsj7mXsQRNU66TiyVoll9bu/qMUUpDMVtgkyGqBCbexxEI+9U4TQVr7I4uvY
	xC5n3XRK4nqlmUV236RvfNXuF/468Ipe7YE9w8UAxk/VIb9Tfzt19g2vrGsIPp8PRWKASFx54eD
	W3prk2MOQkajH7J/xvGTlzjKHOnTGlwH8DVca/nckmeavG9RqVONm9e8ye5heZQuTvYpekaCfE4
	jXi2lmduFOV+UT4a4+kjRRJSfSo7pbnoaJ893HhDFiMKcwljU7ck0hZB5O51k7XsOCdoQYMrygN
	bslMO8JtrF+QzBLbJOfOJ/9OE4q2vH2xYk9+/PmmuD2hIPsSd+ZiylXWKcF//RYL1ZiOrZnOqNL
	aAfuOM2+QJBJr+6G0SzdJXx0QCrNWhm51jxWR/RDO80Z89JZOZUnOunbGr7cHtUUnybcn/ygrFZ
	ePLeetEMv66cD0otLtb++0kVNR/GqhM1qLOzYhbguGAlld/c9muPTtPv4J5PygGB5cYlKhHPsIj
	aj7nEsQ==
X-Received: by 2002:a05:701a:8148:20b0:143:8860:afa1 with SMTP id a92af1059eb24-1b50316df64mr9955968c88.46.1794807287090;
        Sun, 15 Nov 2026 21:34:47 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.206.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm33463380c88.5.2026.11.15.21.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:34:46 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 16 Nov 2026 05:33:49 +0000
Subject: [PATCH v15 5/8] thermal/qcom/lmh: Add support for Qualcomm SM7250
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-sm7250-v15-5-6acbb232fef8@gmail.com>
References: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
In-Reply-To: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794807229; l=1844;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=0aHr8uXlv4TK4AaeOqsI9fktXurd8KpAEVij0MwE3+4=;
 b=oyZWGR5pSPPZX77WXX7hnPsAue8+y2mhe7hy1SG9KxFMmCj1J3kYO2QrQMMnapinDlETzfF4o
 2MdgrgZPGK5Alfe5SOZj3BGrFM1mZYVwWDCY4CWaT3pkEyqJeLR3wgt
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Qualcomm SM7250 features an asymmetric 6+2 core topology where the
Silver cluster consists of CPU 0 to CPU 5 and the Gold/Prime cluster
starts at logical CPU 6.

Add the SoC match data defining the CPU-to-node mapping (CPU 0 to
LMH_CLUSTER0_NODE_ID, and CPU 6 to LMH_CLUSTER1_NODE_ID), and register
the "qcom,sm7250-lmh" compatible string so both LMh cluster instances
can probe and register their respective DCVSh interrupt domains.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/thermal/qcom/lmh.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
index 9d66d75d8..cfb498f69 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -110,12 +110,22 @@ static const struct lmh_soc_map sdm845_map[] = {
 	{ .cpu_id = 4, .node_id = LMH_CLUSTER1_NODE_ID },
 };
 
+static const struct lmh_soc_map sm7250_map[] = {
+	{ .cpu_id = 0, .node_id = LMH_CLUSTER0_NODE_ID },
+	{ .cpu_id = 6, .node_id = LMH_CLUSTER1_NODE_ID },
+};
+
 static const struct lmh_soc_data sdm845_data = {
 	.map = sdm845_map,
 	.num_nodes = ARRAY_SIZE(sdm845_map),
 	.flags = LMH_ENABLE_ALGOS,
 };
 
+static const struct lmh_soc_data sm7250_data = {
+	.map = sm7250_map,
+	.num_nodes = ARRAY_SIZE(sm7250_map),
+};
+
 static const struct lmh_soc_data sm8150_data = {
 	.map = sdm845_map,
 	.num_nodes = ARRAY_SIZE(sdm845_map),
@@ -266,6 +276,7 @@ static int lmh_probe(struct platform_device *pdev)
 static const struct of_device_id lmh_table[] = {
 	{ .compatible = "qcom,sc8180x-lmh", .data = &sm8150_data },
 	{ .compatible = "qcom,sdm845-lmh", .data = &sdm845_data },
+	{ .compatible = "qcom,sm7250-lmh", .data = &sm7250_data },
 	{ .compatible = "qcom,sm8150-lmh", .data = &sm8150_data },
 	{}
 };

-- 
2.43.0

