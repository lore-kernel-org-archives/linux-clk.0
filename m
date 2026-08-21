Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCE036C9D0
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 15:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326927; cv=none; b=T4ecOVv+8IGABQGd5fMNd+2afQy2sCkG8EydVNmVAfxrOTDgUsUEErPeeKRvXT12vYtJcfV4V7NBsNwajL4rqBmOi2JYVY9n1GGDu7rTCxlFQavrbe9d2/3lyEDkmF+BqBrHarCfbuEEiIFINf/fX/QddoXZVpvch7XAwzuJGhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326927; c=relaxed/simple;
	bh=jKh+XPUoJmr7fIpNbx8/2EaPd/67MsZW4ebNDZ/8MPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ED0OnNaaz9crOMCeGJPBLOfQgS99B9xL3MGtzsxmVKeX0kFKs1RGslPwC6EpwrqvSw1hWhhmRro+vcmcRXK84RCl9/XEgl1xJ5NqYuTbHw72h9lXZ8kEPFfZL148xLEGXsSZYNDChSW3FKneW8qOWEMRR3z+ee/NA90Fc9SjC9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/4jkxkW; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/4jkxkW"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e347638adso1019626a91.0
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 08:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787326924; x=1787931724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQnqfdvjWzHpIFqKpmfnZN4AvVDc8IQ+C2JI25EK8GQ=;
        b=J/4jkxkWBvSQGMF3DzBFLupkWH8JYQIuiOmzEoBQcIDk8TAyhRcAwFwF78mWw+HJlc
         h2wufJAGQg0HHegQ9AsyXQg3RnIjl3qjVzHuc/vY0ZVds/f+lR6TwUU611OVgsxwLIFq
         l8G6bZREYTV5m3XYQY08GH5CjJKIWU2bk7PGV0iwpFTfZ8GgYSzuf14HxyUtaMxh9ORM
         zqIr/i/RdQaP3d4m6oP4G//o4ICn8VRFpxMZBj0Fow3LttgH+qgLlZLdNIBbDAOGC8Wm
         BoeEHNl+Kwb9bv8NFEuAKxHUNQbIny3Gb+Up8MUpZCOiPWoYfQF3c6FOThwVK28GemAR
         UMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326924; x=1787931724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QQnqfdvjWzHpIFqKpmfnZN4AvVDc8IQ+C2JI25EK8GQ=;
        b=kx3iUr10if6ERz65Mm9i4DZ+8WV+O/8EEWIA8aK+TpSxDR2Xe7SytK+n4r2rCqpWVk
         JzTbRpQy7ff/krK34Us9jMilM3T3llk308zQaakzGWgZP5s3H38hc3sGxc3bYzvoxaat
         kXyI4fKiLM/+oie1LAiL5RuLtmJzV467dQDInxpDtVfTAWOHLac+6XSTagHR2Op0tiqC
         9GHCvcBkIRwksjV/7rRMriD+6Gyqtobe9Elqix9y8vAhevB9S2SMaFxl0YHAZh6qQTt+
         /BugljTIS3p1WbJ5tJUCrIjP82bgqghqwK71qTOEJVmQ6XO7l0i8dVgVRr60P0kEcrH9
         0EZQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnKoDOQ7cmEdeqStTtuI3AlDPdZVY5Zyh0K+EPJap9H642U8pcAgsNiE00TGYnzR6ykP3pZVQTwsU=@vger.kernel.org
X-Gm-Message-State: AFuF++meqlz6WFwKkTfydtGjPALtoWDjkH/RYRR1xEY83oKZTVGRUeZu
	cDtBL4WPNjZmYi9wpcGcKUCw/oEbDM8hErc722jjF4m+0AoLZ+Mu93WZ
X-Gm-Gg: AR+sD10MnVJBQxgan9Xu3zhfC/LP8KoaYcxcLj7V7NbaKu+GPNnWNLToDkEGs+CBAtS
	p8GDiWTOCSXb1SQupmzb0nsWea3tT/8d5hTwtAzDByLNjZhHdKn73e1XeB3Ur1hjTf7JM5Noe98
	zLhywrgCg9EGOcH5JjwzVpS6LcBQ2eYdhZEP+JKC159t/5hvz7Di8+m8bNPPRiOKhj+AKYhuMOB
	lwPbjSU8RbZu4LIrIyhfQ23LXUnzNk1adaca4IplHx4Ma2W5R92rUHXlVc+C7Om9JBu2z+hsYUP
	6CgwFew71IWZB/Rf3BPfsTQMpHudVBy2OOCjhZqi1eXjUNkjjRaziiucdEQzgEx0lHILeW/MQt6
	vmi8duUoNsR0QJqJg5oSabKuHL4mscta31CpfA3eMPKeCH4zvRStA3TcjOEYMB+Hl+BJOgWuBo/
	d+6qFo2qf8j4upI/IeaW91mrLkWeQqFNrnLB8ySEqup9nK7m5+f1nN9BSsjyYHP/8obOLDjhfNQ
	2f5WJap/uS2
X-Received: by 2002:a17:90a:e7c3:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-395c37130d0mr12860660a91.12.1787326924462;
        Fri, 21 Aug 2026 08:42:04 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm42903185c88.13.2026.08.21.08.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:42:04 -0700 (PDT)
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
	quic_tdas@quicinc.com,
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
Subject: [PATCH v4 07/13] dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
Date: Fri, 21 Aug 2026 15:40:24 +0000
Message-ID: <20260821154030.2514-8-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821154030.2514-1-sreeshankar0910@gmail.com>
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
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

