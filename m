Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C97041D22B
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 08:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040567; cv=none; b=QszOkIQ1pdBv5cDaVUto5Tp9Ljr6wJU07e4GRH6lb0Y6VoK3rQXt/R7UrMnlG03cQBue1Np7tQwCWfXthE4KySHF0LSeXQSfvkR9ANdu/QlHm9etVFDNzvyEdWMqBXLbO1jo/3L0Qhimftb7p+IgVGinF2xLAbTNbtWjnSPk74k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040567; c=relaxed/simple;
	bh=WQnQ6/awaqesyO4FuxnwtkQQVd/qID9Itar1frdoCTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KEAuXSJFQq3oD2+VFSBMXJ9sxfmGScjx+qYM5+FNjUgtZup6wTMl5PY9fO7UzJS7TsumhX1EtOb0vGjT++oKaSqGpl/yOlrn1ScV/03WGlFM3Q6e+1DnF+qYYUZrB8LnsqsRP+lkdzY3UvpTjfexGK+MjBbFSfMyAEcfR/HoVUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s9wSldjb; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s9wSldjb"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso3069525a12.1
        for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 01:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040565; x=1787645365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iuOxCh9qY6VsPX+/asBmCdWifj8i9okEwYPqtY8odhc=;
        b=s9wSldjbks3MfCo+8vm1hxSmEmAAB/txoB4gFiYiRNrHVnJM1HIY1YEg5L5BxOkXUV
         ZrT1lLOH+CQxSqnDy/6vj7gIHDBwjqatAamXFVgb3N6sxHcW3Zz61TNPWBPbCsffDr5T
         Vp8W3zizV0EzMRwh6kaoMJH/Bkhs6trLuBsjEsDGdZcqMXtoctDuwiSPTyw+u/a0qMwX
         m+dvdxpfjoG5OaJ4pRkTYSJGk3fwExd5pLgGiDC/u4DPcbeqjdu+cVDYXHEZfIOBUCr4
         MfqZjfiK2m1Qfq3Fmsi0bMe1opD39BvudrRi0KZSESysYlu/JirR76VWHw7c1bKEaHeN
         sQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040565; x=1787645365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iuOxCh9qY6VsPX+/asBmCdWifj8i9okEwYPqtY8odhc=;
        b=cbqP5jc6XF+7HQOik498GIlORGKxD856Z7A1cjHSWP/w/8T+xJ8Vg3y+pMkroPnmGb
         pdszOAB/4ZmGZnre2CvC/ptIosb87JhskKtO59wyg4K8InKNw8HBlsh7UhBikNf4FXhj
         gPkobVR4ypuywDiw34ynX5i3IAaQJTZgaBXUF6bYvCmWVCZhfPzYFD4fwONF/0jJnsaj
         OphN5RUc6vSs04jSo2iDK3W+5h98YXYAKok5sKJVik5/XlPt1lkh5t/6g2DSHeP3td/U
         dv6io0XHPuWIJ6ZB+tOJDrbi/taCVh8fg3Sfyehcap0RBLeD0A6AZFvyblXmBuyPzvUr
         O8OA==
X-Forwarded-Encrypted: i=1; AHgh+RpQQLtnaDQJubGiuTJJT4zfIgTl+0ScpUmtKl6N5x7KWgWB8CxErcu6BMV+9n1YtSAddBkScY3SeS8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3vuGsruugwTvr/P/1wg1JxTiMO+pm3B9Fgnn1AgD0q7Ivv/ko
	zttpo0C4Z0hc94GwDotGG+uOYkX7jQCCJpy0B0sHnkIBUD2LMUgabMEY
X-Gm-Gg: AR+sD10nYnUPc2LIuGWq9OaYJTi6uobVJh0HwX0ZQWFT9kcglILeFI6IS/SoAtIRKRJ
	TXA7HdzykiHAulJPWlI0GM9k/VEBvR77lgTzMzsie/egws/cRlwDEByu5SUE1qZGSBJGfw5n5bx
	Mpc2ruFzmQjvu66PN322qrEcDxSnQ8qbImJR0GQ0ML7jreTiXxJ/2IT1dhW7zL28ILCMeZsLJ3W
	0t1xWMQZFbb/B56KfGq768rkd15YBHFtoyANVtZnZPzmNKcriuAbGSZFniI1rPlwM1clvYP1aHA
	5rizmZ8CcG7Ux4/sKmQyCU/e3oXFcmEqYTcwLdM/9gY8CW2yadh5lXyODm/yPmfHgvOxWPopc5E
	ybmjdOx7gCXiLss/eJeiRK93p8qgUTUby1ejw5toUIL4Jd6xXXk+fM6nEMT6F41R2RCQwa9bBj7
	PxrSrYIg95XBHY4NXj6iPmhJAGwyBbsihrDIyeQVEepA9Oad743DohvU1W+YprOEiUtI1NY3rhK
	nIUAQG2fp4=
X-Received: by 2002:a05:6a21:7d0c:b0:3c3:a3fd:db0a with SMTP id adf61e73a8af0-3ccdaa0da04mr9243528637.16.1787040565566;
        Tue, 18 Aug 2026 01:09:25 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:09:24 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 07/12] dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
Date: Tue, 18 Aug 2026 08:07:49 +0000
Message-ID: <20260818080754.4362-8-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818080754.4362-1-sreeshankar0910@gmail.com>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
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
index 0744a867c..427953913 100644
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

