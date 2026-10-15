Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E882E3E2ACC
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 05:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041663; cv=none; b=bc/pIbY33pkT/JsbZ13fMD0ZUKbjs4WebXq2/MaXQq5FJD1a7oIOoZzM01URTOOhIBDC1SocHhqz/MdnXcHcx/Ym4ZyfUndHElS3zdjXiBhYE4j2ll9yO9ntYoqtWY+YNYr6U++sxxiX4iy7GEwf2byOafOHEQI+IwnCDbDrKqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041663; c=relaxed/simple;
	bh=0S9ZiRaNeD0ONuhBWck3LZ15qfVQqVd9GHb68v++sEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GHqiku1GmA0VCeYK0UxKcHKk04UL+VsufeHvPtaH3MTY84RuPsjJTk5UqJ60O5Nj/w5sdSn7/jh0JxpYL72ebIwhrllAJbfEU94xTYVBP8iQriKj85UXsYltKQWMejbr8Q+xH+JufzVpzzadVuNNme7+JPJnT3wRQW63L1i99X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOKD6Gr6; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOKD6Gr6"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3035021eec.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 22:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792041661; x=1792646461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=rOKD6Gr6B9cKASFZKkpoO0knCcBMFoWivRGhQI7EMtT8PxvUVMicfWU8FeuERHfksr
         kV5mJ+lTv/QK8zY0G5af5Hqkk3iF4zLNQPhMszW2fzmyMohgZJUfWMPLOHlBNqBOsfV1
         4GdMjJgi4m+21sN5VZhtDSjzn2e27MQQpLaAo/eKvmWOdiVKplmiWGdrbQl4NpLAYmWO
         NAdqyUx7gk+l566C1UHDVXld6+IcdrBSYBTnBuHRqoF5Gp+2/k6mC5SDmAwEevvF0ZFm
         JEsBFUwYTm4CKD845YV8BSpMYj+9wQpxlY70v7Mi2/1hJxR6oEkeqwY5076k9N+Zjuao
         YTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041661; x=1792646461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=uzV43ULcFhM7gi++6wL09hvQ5dxbYjevyjRw7XhcqyRzGyl5B4/oYPWbe1XhPLI+Sz
         raN0cD844qxqcQYV6/UhGqs9uV5+zI0qqt6wzWex5VHUg8oE1ySgehX3OYHdArYxrgrl
         u3zLDGVr7ioeQNiKu9CizuhR2yG0cVNfiwny8HDS1/NFEr40ocdLzyouZ6S0A8Yy2avx
         BffM5g8VnFeYDJM4f5sUUxKFWSMGf/aPYyzc+UU+VscSbysYKBQLg2PJoIpb+SepoKWW
         xI6/YUM1GrZQPl12M5VC0KpW2pfxHGE84V1L0H3Ze5q2qvtlrHtHl/Wooi7TpZ+Oa8h3
         JR5Q==
X-Forwarded-Encrypted: i=1; AKwUvBySMsYR2PsrQNnk3AvutvokQ4024n9KTky+vE6RV1NHUdhwnrep+N2qXqprUe4QUC9MbcL9KAndkj0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIio2GSaBumfrymc3SejKL4Z5JBQR4O5GcUcrbJHy1JY473gY2G
	xwh1CXighsSxw5/G62muj/i4HqYLde7uexii1A0HxKjHzAQ7PRfzCOLJ
X-Gm-Gg: AYBFou2fDCMhjD/TsqL80pT3dQHcV5hpjMGG1APGQlYhj+zR4pI/5aS7upKH360BG4t
	M11Qa+a1UTlG83JpFxWN4g0zBxDPmtgkt4WeqTVti+rRG/CMB60JhDerdvRSnGYr+pKNEygtL8p
	QXYcxr2WhfWPBd7SPo/mmFn1X70MIL0qv6BvJcAT0h04IxR6ljVAzdV6P4rgZMpqueQBpU+/SL6
	tbyhCrLvFrR6kKdWazscezs6asrSAka7sU4FjmB8U2UGWClbkpnxgfCcxMr2CiLsGC6UBlEJ5iH
	TlzS0M8LHMv4gxExfzwVHuOWBktipqHWdeQd6OojVM1Szy7gB5HRoMyejqcE9saOdzbmxTWNtvm
	EqaSc6rh1IEYOs0Pkt+W/UHkFpm3oMEf92XA800Rof+EFIkKq5WkgzoiFcrANf7gJzb+q1LtJCm
	7YOe0rKcjSAcc0G8qNstPp68yr+K108r4kaxhkPvyFVLbYpqBHMWaPtoebrqg96VwW08TAedYQ7
	dRtnSay5z5zAfn1O4H4eD91Vd9sAoi0quu74MJ59jnncYj5svXCtq4=
X-Received: by 2002:a05:7300:e5c2:b0:355:cd68:6f03 with SMTP id 5a478bee46e88-355cd687760mr24635134eec.33.1792041660810;
        Wed, 14 Oct 2026 22:21:00 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35de709d928sm12923112eec.25.2026.10.14.22.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:21:00 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 5/6] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
Date: Thu, 15 Oct 2026 05:19:25 +0000
Message-ID: <20261015051926.13752-6-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015051926.13752-1-sreeshankar0910@gmail.com>
References: <20261015051926.13752-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the cpufreq hardware on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..2dc2c265c 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 
-- 
2.43.0

