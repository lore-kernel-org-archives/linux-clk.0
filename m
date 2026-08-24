Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9497A42C51B
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 15:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583820; cv=none; b=LZl82JurU0RC1XAjQhboy3kmzKSI5BUm8U/mkCD0HosCtBeJ6zGJrhzhd7CMpp6h+7/LYM7cbyvXa9LJy1AqOc8JJhfknOVQCbZKh/Z9+hknYcqbvJXYj5PulZQVcCpHA6NiJRJb61j/JwSZBwNBiH8dQeL68SAIkHBueK57fr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583820; c=relaxed/simple;
	bh=jKh+XPUoJmr7fIpNbx8/2EaPd/67MsZW4ebNDZ/8MPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBWgy39szuVBKRtnmmMn7rnVxQCkFmQ3U4zdt4lQEqRYUFasGL8m0B23BYd3ePZwamYVDKVKJNXOuzZYspQN+zgcvgU2uDCKUXDmrPmELWSE80xiJjo5q6fC3x9PzPWCtnw3XXvSeFOVIEKWQT8mp8/Ru91cCYJ+zsL/FpNl9kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AllZ3pxt; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AllZ3pxt"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-45e2fd33133so2552647fac.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583817; x=1788188617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQnqfdvjWzHpIFqKpmfnZN4AvVDc8IQ+C2JI25EK8GQ=;
        b=AllZ3pxtD6h27T4HEHXep8mB2/RMKUx6IV559NoJnnklENcXMvKQuvoSjumQG8sPC4
         brIDIlibXMiuCnKDGjWJdbrHSO9Tak3xyCP2I9VHPLHvQuOtOKnoiaTHTFtBVZ+YzJ/z
         ibpilitEFi49VmhtQBke7sCROB2xBwmGgEe0DjDABHWfWZudgwdwF90OdAcOtmvOo/bL
         XJZp+5MbXegAhpUAirb3cHylk9Aa1fIKrz/jdd0mwUFnvsz4NWKc5MmaU3ixhn8bmkp4
         eXJ0qguZpWDs6AFzbspfXzEUbY0iyP6h9XJigpK4W7P73tWcEFOg8oEkQQWB66M9mG8m
         V5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583817; x=1788188617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QQnqfdvjWzHpIFqKpmfnZN4AvVDc8IQ+C2JI25EK8GQ=;
        b=fS1VVZDOQF50olY3UKMMrYtWgXwnFufmx7sHhw99Iv9KD8zhIocTDjWuwtgx2BL74U
         STmSUtOiKwQMj2TWnNKfY4u72el1tDjPZQZyI6UHe0GbZPszcBiDp2jgBm0e+nSiccEE
         ysBN6KaBLWw+c5qAg4ZUp8Jju2sPpxUjLs7o3+p3yMDx5iD3QDhD6a+d/enePNpQ9mVy
         ykz/oOAb+JeS4lSjSUzEggKf6UfN2tn77U9d5Aij2t1Csd89ua8jtMyzoGAIQ+yGmo2j
         +96I1PErD7hS3Sxwzs9oNid8zo6islIj7g35l9MEZQXMHJVelGBySOImcZOxb0wYWZU8
         K/zQ==
X-Forwarded-Encrypted: i=1; AHgh+RpjHFo66afjURYOQ4rdPBRrONFTyjyn8nC2u2zVR31IGOOca3pCd/OlNh6DpVpMb3nXL4oQzwZKls8=@vger.kernel.org
X-Gm-Message-State: AFuF++nswSda1m2e0fcRcES6zamO7TjB0vhWLNRWsNHUtsJHMtrvIUDB
	0RQ4iXagcuAyNYPwo7CcbEvnoz8B8tCZliF78On6NuJ1Obg7/k1f8leZ
X-Gm-Gg: AR+sD13gldTgi4updRv+REQ4Tbe1BFOHC5u7TrxvczVntnZ2zhUIp2nheo/gvjOHO9K
	wJPASswBlNZtnD3A42cIWPpOyV4AJ9CAJfG3ZEEEIZ0Uo4X5bliZ9m8n8/5yw010qY5ESwBJ0l4
	FqJq8N4q0d0Hk3JcAKmlKqzgdH9BECsa9LLucY1MAx0y7SkcLPtrikYZNcsfuLYv3+A7mrF/cm5
	M5ZfAXSOubA2kJL10Luo4BNF6OVtddydpZPBJyj3z339p9xKjCJv0kaxWJXDu7iZ/QXn7VDoyno
	bXa0q1Ynp0vJekjzHsEo2IpHB7QLcOsvT78yQgVxW7sIu+9PWrNb2HvwjyyJ9mv1Dt+DbSj/n+4
	jwdd7e8L8xlxWHj5b7hXw0tkWGXZD9a9wAdxcWup156x59gFGOIfqJUN5gn22XBnyCXWKgRC6YJ
	x+Ph1pZhQ6HileH+vKQsX+KRbXTCSsrt3RJF+2O16xRAkJWG7QmjJ0EcAyUDuYrO2oqKNc9IUE9
	dREMTQ1tpvK
X-Received: by 2002:a4a:ec4b:0:b0:69d:e4c8:86f6 with SMTP id 006d021491bc7-6b1592b8c96mr26911121eaf.15.1787583817353;
        Mon, 24 Aug 2026 08:03:37 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d381csm30035247eec.19.2026.08.24.08.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:03:36 -0700 (PDT)
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
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v6 07/13] dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
Date: Mon, 24 Aug 2026 15:01:50 +0000
Message-ID: <20260824150156.1310-8-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824150156.1310-1-sreeshankar0910@gmail.com>
References: <20260824150156.1310-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the RPMh power domain for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55..e08441915 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -63,6 +63,7 @@ properties:
           - qcom,sm6350-rpmhpd
           - qcom,sm6375-rpmpd
           - qcom,sm7150-rpmhpd
+          - qcom,sm7250-rpmhpd
           - qcom,sm8150-rpmhpd
           - qcom,sm8250-rpmhpd
           - qcom,sm8350-rpmhpd
-- 
2.43.0

