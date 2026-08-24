Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925CE41F35C
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 13:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576724; cv=none; b=VOE5CuOjn94+kqQ2TTFbxs3Em0LaeP8kzl+lQtl8jKTQLieGv/afWASysM3m3OJTPMGRl+IAqoPMYUsJ1N9a0ti12AbUOyuFyU0RDsILvwX41ridnxobuUVSAd2K/FVVaf2i2MnFHgIqM74nyOIRZ/XMIwjpsRwrLA+Z37y5ATw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576724; c=relaxed/simple;
	bh=0wB3huwwaG49ycl517NSgfQ5t7SptdZ6MYz/Al88uo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qEdgmbvPzBV+BSKwJhnQenKfKMAJRleOQrfnnOijKdEVJiqFeMsVeOWzQ7cnBwerpSePfW2HNqT812qcbjq8ixdVR+rAzAP+6nxSzlzQou3yYimQcO5GeaEF/tDqc3U3Ktz9ZqbHW/4bZfhvOy34L+SG/CuaG4WAUItktIY7mAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQ5hszws; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQ5hszws"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-455ca262ccbso2820922fac.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 06:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576721; x=1788181521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvJP88qTTuZPBMVLY1eZgRPCHAr9o03VzsEiEHnDVHs=;
        b=TQ5hszwsadExAZ/HgzBagiaYn1wZ2NWrPaj8sBg36pMmNwsmhWLSS5qIBL3Ls3tMsf
         wVmBlq5gGEMy+CbP3tXZTb3J7uIpRxlW3aZ/moH1cVCDCS94RTMeyCGKoJ0OjYkC4G9l
         Gsv6c0RgCKM9bafNWC3FmcRL3vN8H3yhj7n+anve+JH8meFARlwsjt/7ptiPSxjorNXW
         OwiBvruGYrU/Bo7EACrx/NTejhIHFaO4gzaprT0QIb9Tfu/FzofwxDxiNnMQ9aS0Ue9k
         i2IGMQ4tMQeSz6J0UBJFVvM2VsAcpluiTbUlm5RMqsJKkRsdy322dsRySdFkPz0EGpCZ
         sADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576721; x=1788181521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mvJP88qTTuZPBMVLY1eZgRPCHAr9o03VzsEiEHnDVHs=;
        b=KFD9PksELJjMcoCXm/asQ1lnJSDceWE19f3Z+or8MCCm5o1aJkQ2Z6yOrKIYJ5pYqw
         DVf3CpdOqlYJTUaGr8g2NcCD5U54PhOQK13aotpV1sqWRE8PZmBVGkCJRd9wxszC62g8
         tZKmQJkvMzr47fckY7AmegwErR7b4yykhgN/T/Yp8WKR7486MoAIRCRdU4mTHhm/CXrs
         pVzlNRiMZhJDNnPmgF9Zz9MDJxZl3AXaxiQeO6TH14avpUaHtANx5L1slXXKr5i7qX5l
         sa2g9p/u2IP34LwpU9/fGFM3kto7srBbwJyG9lHh8JqM/BdNYkKJmFs9v+NpP9fZpdif
         91tA==
X-Forwarded-Encrypted: i=1; AHgh+RoMUph186x5FVOCr3oBvci7fEG0/utoqqLkEwndlNkrv0Hkuvm6/Iznjvho2iF3XnzeAEDNcGJvyTA=@vger.kernel.org
X-Gm-Message-State: AFuF++kwkSdaRtIAEBNGCcOlEF60dLZjFt4T4+bEZ1yNUrui3ftJXuRf
	P3TsmrbtNOkxZTETELEzLp17b5DAild72EDOQjmz35oSBB47YZtrFrxt
X-Gm-Gg: AR+sD12IKKJTEGy2rmkO/dw11bQAVw5tXdqseA4BLtKKOt0VzIUz4KSBpzD07bUZWzp
	DArpUEO4vTOMchRoMhxuhwLquwUYkxGAsqhb7Z14ZC7f92pYRQwXJAGDvUWV8QVMqS6QOlQ+0mZ
	yH0pVh789GQFU3e1qzkM7lXKFRnYnoZMdvApNhUK0a/WEO5zLIybr015CsETxi+VNoV78XCJzg7
	lW72zy8fqC6PkqlIRCEI3yo26ixHPMI8Jmnrmz24tUNYS1SIgiNZcjBgPk6Wr5xMqdJ1QdDowHO
	iNmfUix17y7JCXV8QNoF4yVELq7goQTmbSrSiFLgN7NeXirMLZj0xOkHA6tVauFL21aqAs5Yr8I
	Qf5xTSK8lsT2fX5mrU6tpr7tgu840gMTqoOQlaOAFLzAFmhPb7G8J5zDNLhOs2oqoA7TcNCxlUD
	qCVWP+bQ6tKLVBGjW2oENCUEFesEBi2++9isZ6irEW9Z/ZzTExJl+1URcC5VHZmfWt69H3i2zFD
	aNDTYqInoB1
X-Received: by 2002:a05:6820:1629:b0:6b1:7ee2:6d42 with SMTP id 006d021491bc7-6b17ee28ef3mr6476143eaf.27.1787576721331;
        Mon, 24 Aug 2026 06:05:21 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:05:20 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 02/13] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Mon, 24 Aug 2026 13:04:26 +0000
Message-ID: <20260824130437.2771-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824130437.2771-1-sreeshankar0910@gmail.com>
References: <20260824130437.2771-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC ID for Qualcomm SM7250 SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 1836e226a..63ee5cd56 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -450,6 +450,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ8172) },
 	{ qcom_board_id(IPQ8173) },
 	{ qcom_board_id(IPQ8174) },
+	{ qcom_board_id(SM7250) },
 	{ qcom_board_id(IPQ6018) },
 	{ qcom_board_id(IPQ6028) },
 	{ qcom_board_id(SDM429W) },
-- 
2.43.0

