Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC04147ACFB
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 09:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254826; cv=none; b=Fqw/qyUzbE50WLjU/T8VpEkhAg44k5bXaa36jqT2yeUvmaRYce5IHBTrVgSiX7X3GF9BtUeLMM8zqbxKbJ9J6n/6hi47Um+jfdSsomD9vjL3yvlUIykhP8t68djQY19RuF+h8Jm7ieC0m1XkIuB8Lz7YgNXhca0L9N/4B/MpszY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254826; c=relaxed/simple;
	bh=0S9ZiRaNeD0ONuhBWck3LZ15qfVQqVd9GHb68v++sEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WezXbzm/NR5Pi+4LnJDnyuk+0wtT+R1/5pd8vpGF5UQK7woDXjd6dG3YXghTiuMskFBmqzxxxn0z6Aecdg6CAIVeY3gTnWzX9eAkx3ry9Zr2aJuwotvgaAoFx343gjqqecfqf7pSF3VG17ycJQ9ADbwJdl/afmh6/lhz6JG1/9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4RabrIH; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4RabrIH"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso4019815a12.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 02:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254823; x=1788859623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=j4RabrIHhYV1Ub35pUQn41n1e6SX+9SUSz3Dmaqb7/V9p/jlYlcdOGlG8r+VYxK33W
         CqMcMhm6r20R2s/3Xdz92Or4lYLEAvH89AQmsSo0R++pl9FUppc5O8IEcsUy5Vr9Y2P1
         grDHpRYBT35lLiNAlwNI6REnAmY1Pa3YO0XzimZcUDJ57jjSfv6veYrlCJy3xYRZarrs
         rVFv7sX9Pix99fzmQNx0U8Vr7FivCzEjFj1auQsWcK+WRr+vkgjpS5/M8TMbO7rZHGAo
         gPHk0qzWrj/M165K1qo0UG/VzVVt/jqBhVJ1CNTY1o51lj1zymxwUqPHYzJDh5JR240h
         re6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254823; x=1788859623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=dhv0L7XYQUuFELImNm5j8Sfz4P4p2u/vHbnWZRQ0gEXmF76uKnXxR22bq5KdoXy9fX
         4+mNNaHEcaTUI0hllWlF2gPEs4rlYRD7Rua1Rc72JMcaVySAoNOVNZ/NLf75nB13nzEP
         rjLcWFRhEUZEi+1w9WZ4GD+u39/vnrJMsQ4H4OHhiVaQFBbcFRBlrfwTa65fmtQSWvuJ
         U6ug5z0ZrMJbUZqVA5UVf+HVQgaCCZjXbVPzyVDpxkdqDsNFpswF5oiT8ysW9NIRh5RF
         rMIyc7AgRoiKlTLW+/E5LfYa0j5asd8PoHp8S5Y/nP+IB5cdOD3Q0rUp6PpFyybvmUL/
         mZBA==
X-Forwarded-Encrypted: i=1; AHgh+RpqwtEbP6h7m46bHJPrqhXcubGfCo0pcYsirp0Jd0DxXZr8gGoNg3vCfqYJiQTH8XYLcnmuVDK6aNI=@vger.kernel.org
X-Gm-Message-State: AFuF++lldC0hSe9B33a1R9ZZOma1g9U7jjg1OfvHIAQmvv0eRYFqro5N
	kOyCdwzjU5VMokHDxgCuPCwgyqaK39mD8JYh0P6ZfQUrJdKpKq82cYXB
X-Gm-Gg: AR+sD10dqs/at//UOdGr1d+jjsv+qWxDoSYceSVSzthQ+6aj7i+HdQDlObsmFXEL9fi
	hSys4u5clgj5ztBnKoZtcfyqeYOu+wGlkbgz9Nw7cxgzAktcyDhBccQS6+Z+lzB3f9HDncKrtf1
	aYXbJWQn97LAVbfgKLkJWp6BQxwmC1bVbZp2Jx38ZK5pCLfvFiCvOLyq8o2vDB2ToAvGmtR5qmo
	TG7qCMIvTTSYMAzaXXGotJX9l5hxDgUCMVoIVSIFQ7Y6gST/jboYfERYf4gxqwrXSiv+1fumTGX
	G2Z/CFBH045nUrLhMi6yCpIdt30oYoLorNl6h2DB4c33M9I9TY/GnYF0yPNMqgxGmvpQnxNpj8s
	qdwkGdcuFwxm/vlnUUR2K9+ZzErJhkiSc6HXmcYKBWABL7DcgBHWUmIvTTI4GLCxjTlcTWIodcI
	5NvW5XAgaB9NUMcryG6PwJCft0yUIJMJ+Cu1rZnjR2WMHjh75vLNyATSUdJeX+jkPPqOBb3nZiW
	8yYooNqp5FP
X-Received: by 2002:a05:6a21:7a97:b0:3c4:2b8b:e88f with SMTP id adf61e73a8af0-3d7ad992574mr11465441637.5.1788254823231;
        Tue, 01 Sep 2026 02:27:03 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:27:02 -0700 (PDT)
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
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
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
Subject: [PATCH v9 11/12] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
Date: Tue,  1 Sep 2026 09:24:46 +0000
Message-ID: <20260901092447.3028-12-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
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

