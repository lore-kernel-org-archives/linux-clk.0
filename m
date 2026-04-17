Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBA833B6D0
	for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 07:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409675; cv=none; b=l1KQHHeP1gjGXqiM8UpvRU8uZ0qJDzlPR2nXbUMDqOydQRg1Ifkyl0JI/NjAt3yIEnooBEOMVX1Ny9oCotor9XmqOyWlO23Yv0vhHJJHfEsr99wbcOh1lLDVpS4YmOUeoDumhryVl43/MSXC6TPN15tv9D1nPoK9xG5Cm5iqAx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409675; c=relaxed/simple;
	bh=CxKlaHXcmKClm+BXYNnlDwRO4wTrssG9zSsFyKBZQhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VNKSLXdDOSFUhEFqmUkMXZWVuX/UVdBcla3DzpJLytHIyYY0ma3GU7ArNvexEZ4RRz9VcbHYcyIO4TOlk07w8M/+sHnsFUy8mtvL68rhQJ8BYfbf3PW9QWM+XECLPMV5YtPjoVhKK+yPEX9iNhmgCHVeDxMDZLPRDJFPNQseA9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=T353sbhp; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="T353sbhp"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8f9568e074so67289966b.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 00:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1776409672; x=1777014472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=px6notIASYyhd4u2NhurwBZM5A/O4xi/Kse0UeP1iUQ=;
        b=T353sbhpS+lNjOkgF7NyeFa3EHFZiQPiyMP8n+iJAV/kFjVKOTGJ9fKDTW/wO52mDA
         p+HrfP0SfdMHRY9kgjiyQMIsDwThz9Sbrpm+Z8OibvCCbsqIlr/pI9IGtXczfFP+evKl
         +3DUSOCO7svG3/BNP2plZCa/7St3U3Dpu6LmPr1FaboNN0gO8OGkpbLU450URpiVMnhW
         oZrwt2NkIGlnznbqpMzgGu0EXVu32TYad0pHjd7gW22aDtYTUBFyAVFr4caIOPhqPdyQ
         lMMXs37Di5HTzW/lnxFdn5XNxwb9MR2F59l9R1tYXZOFPpyTWwcliqX4s1+BxsK0BU3q
         68IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409672; x=1777014472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=px6notIASYyhd4u2NhurwBZM5A/O4xi/Kse0UeP1iUQ=;
        b=h1h0Ho8OJf0x86dpBHYRzmENAhnlosqwBcB4I+VwRRUndOi0InvD9rI2+7gMj6suNm
         EK0rT7Cm9PVRuFdbT+EcCgG+Hq4Nrw0/p6/3QxH2sGmg4j7HUTbaOc2anR4iFriw0NLq
         xLjW/ZyAAJdMWE/GFW1yOR9SsFjid//br1pU9WkzhrAgV3EJ6u5kmrp33EsGqddSEBlS
         WA4ANgs+1oIJvkFgLW/apXAqbvWbeM+YMMAYBhmxDMOuHXodr2IL12eRFG4cEFLteTPs
         h/wi7dgktApEfhhcseM0xhSqyaNzWXXDm9J82MmJMtFE14dQJ7Ip/RaQJEOCVLZwT9i2
         PfHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8he5vibsjOtr1OXxCSji0H8KKAsswqcoE+unqHipEEAptiQdYKe1m1fEKEZaihRu8WgK+TewsR/ho=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxfzq8sDSS/W/3G5JLQohlliaZFfAK9zPu2rKvwOJiKAFBLAtj
	hTYPtHV43xaKHAKhM/NyNHjLfVbhxoqudU3munqsx8c1CcPV9VrOzxKTA+pZmLvM+Xk=
X-Gm-Gg: AeBDiescuHqHHznvMdwO6bzIb4ib9oWH3ct1qWQtiPbaaZNcQznHrPpVNIvU9YR5A4R
	eMzIUa8pq1Rf3whG88Sgm2mheNVt6YaiYudwLp6ZS197eVehvSlP7e74QYqPKv1hLL8y4EFk8N0
	c6DJxO3k6phb2UPRSO7ySfCR6So6tgrkh+2lTeFnOvd8MddWnTE0Zml2wJaBIViZ2LwRwPTDHHM
	xrtXHK60oJLCn5G7y1p9NJlT+MKdagl25Zg3/e5tH6TCTyAI6lhO2K9HueuPLX+qxeVbPu9HjiR
	zolF5xHwZpEOPuTmSVQmW1SNYNwFln7DROoLYodXcq0nxy7sYgHPdxwqKGj/JT7uXPdmXMup0NA
	sCa/7p05qawAJa3eT96sdnsP/LFSg4iPpJKbTAyeall6KG+OaV9UQUW+vx+OfYD3ukVl/xGB4Ef
	lQDN0tJBoJjrqcSKkjvddM+RDpgarxbUOdf/wXj4jdWgRVfSjCSp75k/jQSaOIT6C6Wx8wSygTK
	MpSQrBZ76e+fdiE
X-Received: by 2002:a17:907:849:b0:b9c:69df:4d7b with SMTP id a640c23a62f3a-ba41aeefa42mr87927366b.39.1776409672385;
        Fri, 17 Apr 2026 00:07:52 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cdfd27sm26448466b.26.2026.04.17.00.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:07:51 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 17 Apr 2026 09:07:45 +0200
Subject: [PATCH v3 2/3] clk: qcom: Add support for GXCLK for Milos
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-milos-gxclkctl-v3-2-08f5988c43a2@fairphone.com>
References: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
In-Reply-To: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776409667; l=2067;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=CxKlaHXcmKClm+BXYNnlDwRO4wTrssG9zSsFyKBZQhI=;
 b=D1Q+NSNmBB5WEGCN3xpZmWLXLC0ji06xpDbVD0s5K0mlHcPmHDp0OIJIvcmuHELDdefVf2PIA
 BpHzZnehC+uCT/qY2Kt9FKSzS8FAQoPtZmCSxNVaig4NgT41gr0UF+Z
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

GXCLKCTL (Graphics GX Clock Controller) is a block dedicated to managing
clocks for the GPU subsystem on GX power domain. The GX clock controller
driver manages only the GX GDSC and the rest of the resources of the
controller are managed by the firmware.

We can use the existing kaanapali driver for Milos as well since the
GX_CLKCTL_GX_GDSC supported by the Linux driver requires the same
configuration.

Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/Makefile             | 2 +-
 drivers/clk/qcom/gxclkctl-kaanapali.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 89d07c35e4d9..462c7615a6d7 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -189,7 +189,7 @@ obj-$(CONFIG_SM_GPUCC_8450) += gpucc-sm8450.o
 obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
 obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
 obj-$(CONFIG_SM_GPUCC_8750) += gpucc-sm8750.o gxclkctl-kaanapali.o
-obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o
+obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o gxclkctl-kaanapali.o
 obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
 obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
 obj-$(CONFIG_SM_TCSRCC_8650) += tcsrcc-sm8650.o
diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
index 40d856378a74..7b0af0ba1e68 100644
--- a/drivers/clk/qcom/gxclkctl-kaanapali.c
+++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
@@ -53,6 +53,7 @@ static const struct qcom_cc_desc gx_clkctl_kaanapali_desc = {
 static const struct of_device_id gx_clkctl_kaanapali_match_table[] = {
 	{ .compatible = "qcom,glymur-gxclkctl" },
 	{ .compatible = "qcom,kaanapali-gxclkctl" },
+	{ .compatible = "qcom,milos-gxclkctl" },
 	{ .compatible = "qcom,sm8750-gxclkctl" },
 	{ }
 };

-- 
2.53.0

