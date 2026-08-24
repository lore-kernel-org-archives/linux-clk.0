Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6F841F5CA
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 13:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576714; cv=none; b=XPYPiJq6AiQGuLTzqFUsR7mmPBMo827gm6V/MFl+Zm34/SHkGp56Y+A3gtbhLky1fUwdIi3741+X5RnUER+l04Yli+02wYfvbft/4J2RwBuSFR3p7Lwb86iTDiavF84251V7Y59ccMkkzgZ2RLbkw/M+hB8ZrVf6nlPdZxxuoL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576714; c=relaxed/simple;
	bh=pbOuLnMdY2W+iCdw66yndLQjoRN+QvlknxTRrElQL8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hbVVUnL/3pk+LVJgrg/PspXJatzyRlFOV/lFf+pNz++JH639Nk5L2Q14yTjbP1hjLR/r1LorvCQb4pi6LTQ8o9QVlM7HmrPivzhkWCd9R8tiGBgAuuNh7TUH1GgavC0l08xO1Uc1SzcEGBULK0Gvm1qBrMM2EjLHPj6apB3XsMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDeBg8Hn; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDeBg8Hn"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e9f69ee6f4so4368904a34.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 06:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576711; x=1788181511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=068pYnBVpLmUX/vSkfsFSQIv11h+T+N0t9GB6UkmtgU=;
        b=HDeBg8Hna/geD1n1B3JgsT0q3KEg8go8efjdUh6y+LbzF0Jv2Eew/g21tYygLzLuKU
         NIQTSiRyC92o3VHcES50TLjmhu1BC6Dxhmn8EVTm5oSFZbhVsPF48/gJLRHmr6/DD9qr
         tcsr/KbgOFPHWHKGfJC8Dk5kcpcKhQ7KP1dr96vuZMIQmKD6ibxU1IiYxVPE7G56b9MG
         k7ULvlHSNpf/Q1Zf8eUJn1iLuVtAkcx+XqEcFzXotmgWcPgzQ5Kw0NnDCaTJz9NWz+iX
         DYd7PFQxoCXFIIPsJ0pGI0MwEF9yjfjJA5/FKgjrzVF1haYySujztV8VYAGMwtt6JD0K
         kKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576711; x=1788181511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=068pYnBVpLmUX/vSkfsFSQIv11h+T+N0t9GB6UkmtgU=;
        b=IYD38DYKgtmr2pg8fVLo+EtqNveLO323Ihabs+caE/AGciBCcdIgNlCzKvR8hDmyj5
         jhhWWnDlyYbYgYYO4fRXd82LzZpoTF6euvILbRctYnr2lLYLlo7X70UYKuFKpvXVn3Ho
         aGI21Nc+lhGiSVFFusClxqkBW7Mxh8UGA08Q63gGM1L1rvnGRPQRGjYqaDDcZGfdGHJW
         ERvic10Xa2UeJVqyMJ690dqDb1ueQ6tzrFRjzXQQjwoaeJDCms9P1DwgyH0TmCKCIKpS
         q7z39GO6IyesU8tNTCldUmyiGg/iY0m+BF583soZOTEgzEAUEPy9qj8EcL0AVobUfd/1
         ky0g==
X-Forwarded-Encrypted: i=1; AHgh+RpSYgsVb7z41OhFWcDXinWM9CFvxqzCdbck5uzQI2hCCANY1qjJeIhJdo7Hd0gHx55JnY8dGexjSNc=@vger.kernel.org
X-Gm-Message-State: AFuF++kq/IVqx25ljiAxdRmugKXs792lUbfT1UNfOiQw+uHQrrk7FzH8
	d/UQxHTimADq0k0UzANVunHr6nlvw84mzpqanr6UQLT77oajjGAujMYU
X-Gm-Gg: AR+sD13VDjiGAiShw1+QVq9ETOSz0i+MjAxmbdC9YWQ8/3OjuJmFLHEoTJEHcdyVu12
	gwqgY8rrNZdPjf9nndBq1LqSRKtq4dzkkWpa2KCJGjf+rbJ1xz4WkZarcHAqP7by9tnQ/vFM4qj
	WyezIJ/dbdIc5iP8QxoVmNcPAQaTCJVSyWNZe5iGkLW2MUCVX+DOJSpMF6Fv+hfydXoX43gD1ya
	Mm8OcdGTW2ZNoiRBvS7EmLobzSOpNR8JRFhiM5aaCnKOP84faMnEk6lNiFNOuvmV/oA14ycdQSE
	Y1wNa/eJvUYi2rFrMwWgJTByzvEzOSdu1TshEe8xpMRdBGrAbYXqmywOa6RRTLi2VaTGrghaL8u
	eDT0eVJ1jNz8TQRicALOgrMucC5U9MPbqTs8JfIawv6YHEc8BotUcrozTbSjfJM7TreOsntP4u5
	pFcdZc9RQ7VtQiXc+Zz7Ly3EaliuL7rXbJ2O+ZDxIGDt9Cxyxyamla7rzjkquvVCLOP39jvC4ug
	UD4zSE2jcv/v7f1i4xgQ94=
X-Received: by 2002:a05:6820:a50c:b0:6b1:5180:bc73 with SMTP id 006d021491bc7-6b15925dbc4mr18970135eaf.15.1787576711215;
        Mon, 24 Aug 2026 06:05:11 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:05:10 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 01/13] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Mon, 24 Aug 2026 13:04:25 +0000
Message-ID: <20260824130437.2771-2-sreeshankar0910@gmail.com>
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

Add the ID for the Qualcomm SM7250 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 2cf433f61..b63e4a0b8 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -209,6 +209,7 @@
 #define QCOM_ID_IPQ8172			397
 #define QCOM_ID_IPQ8173			398
 #define QCOM_ID_IPQ8174			399
+#define QCOM_ID_SM7250			400
 #define QCOM_ID_IPQ6018			402
 #define QCOM_ID_IPQ6028			403
 #define QCOM_ID_SDM429W			416
-- 
2.43.0

