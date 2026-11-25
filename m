Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640076;
	b=i3BexRx0WSQ5YjEFuNCs8L8gJX6FEn8msuNfRs3H5vB7HGgidwiYuOWXVx1F2hKptinw
	 Q0vPnsW8Ex+WuNEpAQKHNbYOvTD+52TCRto7KpbMGP31h1GoM47Mp8+Rrn2qm7r55Bk3l
	 l4pVD/NvPkgWw1de0Xs0rEQToyhvPfro3x2Po/2BZtT1MSNnqGjiUs6S+mrIzuHe1AZfM
	 wx0pICJiV1NbfOVfw5fOpGJTm61mGLKEPQsvUIN3eMfjodTlmutgR142jd8KB35QFfZNT
	 agLa872iQj0a5Bf1VVlWxszcWbARHkKfQlKJRh1qZmnImwKh61jkgwyIlxMYfUTityQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QufEL77KFv/8bAd7CFpTzBwtbJF17sNvAMP+Mxwo/G4=;
	b=FqQjA70ZSMAIo8W6T2qgF0v1aGgGmqI2n9/t53tAxXH27IxhPv4MQr/JBK+6Z5SRHijK
	 bYaH2f29JXtmXVzlQwHshl/fYMN8cnAQMlMC6/ZPi9pPBpRUmbtXGG2l681Ej0uFut0Sl
	 WDdFcQUWhlrqsaenSQ2V/EzETimZbfAESIgzWZ60oVfKI5Mx//OTpIJ+404H5b0f1Y0Qo
	 2DEZPxSsCJJYhrLOU5C0It7UlABT42TpVoMHPksvZVNuKWhvxSad2p9hlJY2dzGUzyjQT
	 2a587rpCpc4EoVcNSpG91wrDWfkg+iU9E5snWRAIqkpo6kgNe+oLxk7upL9Vbwp9vPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UCWZumXN;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D570606A32E
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 20:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D570606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UCWZumXN
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab30d04674so6414001fa.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 12:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640074; x=1796244874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QufEL77KFv/8bAd7CFpTzBwtbJF17sNvAMP+Mxwo/G4=;
        b=UCWZumXNKB7VpKk1OEd6h86HAysZ3yO9N1YHh9rN/RWOjFzEKHU3RdQd9bpuGHpWOB
         MH3ZWC6SbRKqo/IiFV03pxOJYJt2iDPhmzSR1lq7IClpAxp5PodIJ3hG4NF0v8bKMF5g
         d/MtsTBs6dn8JAcP6w0BVM7Ws9eA3y5QjAAzNWD83WROs239zVht81+FBZHPr+Znfwzt
         g2qFFJDQcfGTdu5dEozMOVoHbD4+eeJXf/6UrX/qxS6XXL2yIjqEwTsqPg4ota8PUgbw
         wYX4CnGVGlagdHq+3LaIdd55pNqB3vw2ehY9wEO+LRqwRSHF2jgllbiyttSOOgEmC0J+
         QPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640074; x=1796244874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QufEL77KFv/8bAd7CFpTzBwtbJF17sNvAMP+Mxwo/G4=;
        b=u2nf+rGH73R5k++OZj9FwTUhC3CTo3yMqSKfc/jq56wDZOcEpgsgrXf09CKiNg3m26
         H+1Mafwlzezoc8fwmi32ivUFaKUydJnEE8xnfMFVUDSXpWPI/wWtYBhURNwWZDf8u59N
         pSf7h5wfO0Omyfj3TAZ8fkQ9reCGxVUlVL2vYNaGyWzSL7w2duTdsAvN6NE/Z65H2BwY
         cK2ngbcgVSDO+SizxMSTEeY1yp7+kEYzbwuNostOjkOxvfzwDQWf94ZzMEx4ZovFMcyQ
         Jvuc4PhLdB++36q2I0VkN8UoDxyKlUFIpuUoranqbnV2PrrU00CKy5+ROn5gyRkTYxUp
         s0Ew==
X-Forwarded-Encrypted: i=1; AL+hErEtqCW8DDuOMcnVP99dmZ8dxQo2ZFlIj4iDFCkzvgUkm1ZR/7WMXq4ZIaixdJkTYzHNT0cvYcC74Xo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sOuFDoxD6CfTC0YrYWLxJt2qbj2TFxQq4sAhkrkbxnAgoSGYK
	r1B8ng09cMtbtNEFTXemRcVH/pPxj2H7j1yMtUGU2Xz38wzxy/R1t7tJj5ePzklejGs=
X-Gm-Gg: AZFdTZdH4C3t/V6+5WF0d8GpxvK/OuUFYV+wMnpVfGqnxiixS6fZ7ZQ8d1GOIgIsYW0
	CeKnJgnfDOJAuEf7Yy3p+6OHlhuKnmDUF8ys+hAlQHyQ1V4eY7xHCIDYGnpqGq/cSmPOx22AadW
	ntkYx9FGaTIPIveMHItG3R6bR4jS+UyKSObvpV+LG7CMgiRy3QfPl61KiiSjhISEI3CLGF+mUpK
	Tbjv0ZKaQA3KYBZNd/ZUpwyonC8ReNmg9NbLRk13mgxoVXOJIbOA1bdKpKoImK6t16+T1s23/3f
	8OTVMjDg1ZMO93oXYCSWf5qNi96Axk5vJQeeLAiwnuiQDeSUlk7NDe3wMuUFRD7Nm9whEidd/As
	vQt0ocbLsFOnlK5D/Ur07k+mgF1N3z9Dse/v48Sg3mOCK0qhJ7HeTGyWKSyJa+R5kRO+x/snyjh
	0y25247Rgdg8n+xlcqwKcSN2ClgPor2rB8T/+NLbDBnguRWB5rlYCAAanqXPD+zIBcnpNYPc3WT
	zzjxZ6WJa8dyWPBzExUXkHSKPDHhnumkaTYx6hPHuk3pEFO1wg/KvOnhHHIXM7GzVfqKc5Y48Mn
	q8N6LkvAMUHNF1vmMFDE1qnXOJEoEeEBQVP0P56JAMnBOuPH9gVy+6iX6+QxN3LWNtS/Hg==
X-Received: by 2002:a05:651c:e0cf:10b0:3ae:11a4:22e8 with SMTP id 38308e7fff4ca-3ae7f9b4af3mr40150491fa.1.1795640074317;
        Wed, 25 Nov 2026 12:54:34 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805751f4sm50871441fa.40.2026.11.25.12.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:54:34 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: qcom,sm8450-camcc: Require required-opps on SM8650
Date: Wed, 25 Nov 2026 22:54:16 +0200
Message-ID: <20261125205417.1437355-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125205417.1437355-1-vladimir.zapolskiy@linaro.org>
References: <20261125205417.1437355-1-vladimir.zapolskiy@linaro.org>
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

SM8650 camera clock controller PLLs are powered by MXC rail, CAM_CC_PLL0
runs at 1200MHz and it requires SVS_L1 level of MXC rail. Without
required-opps property the MXC rail is voted at its lowest level only.

Commit db30c1160ca5 ("dt-bindings: clock: qcom: Drop required-opps in
required on SM8650 camcc") dropped the requirement, because the lowest
MMCX level is sufficient, and at that time the MXC power domain was not
described. Require required-opps property on SM8650 again.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml          | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index 64f5002931f2..666d2addfc85 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -87,9 +87,7 @@ allOf:
         compatible:
           not:
             contains:
-              enum:
-                - qcom,sm8475-camcc
-                - qcom,sm8650-camcc
+              const: qcom,sm8475-camcc
     then:
       required:
         - required-opps
-- 
2.53.0

