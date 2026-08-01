Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2252C3B83E0
	for <linux-clk@vger.kernel.org>; Sat,  1 Aug 2026 17:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785605509; cv=none; b=DAX3vFHPfxTCu6eRnQ4wvqpW1+sBGTbSjcKU7AE2i4cgqQXxFtzNkbEENM88MVYVw7IOMDY7LchlWmbawLKY+PL5ILAPY9UcO4Lb0jWhYcXgxuF0P8PZxl59vvs/zRT2Ski1hxLvyiM3VEwX12VRoYK+W6OC00voCvBqpBkbQhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785605509; c=relaxed/simple;
	bh=H1mNg8gEHpjeg+Dw29F2Ce5I2PQAD2Ke3CzBqgLKtVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f58uhlgrT9AhLoFg04NKhxWUiI15GmMsWVu1rXx5C/R8FeQIcRdzwU4Gx/919kN9UgTFwCSe4C+NVgYNiJe/tYYASKVMoF5eIrdeA2rmvEUGZQ+sCbwxS6YGk8kGWl7bDqSif63OlXglks5UUh/OQWYCp1/1U930YxwF45dOLnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2Ud5j7i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dbp7xdN6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L2Ud5j7i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dbp7xdN6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671FaXLO294786
	for <linux-clk@vger.kernel.org>; Sat, 1 Aug 2026 17:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O51Fgg2/ZbyK/CWM7sBEU1xDckvgir7LEKryAan0C8I=; b=L2Ud5j7iSV4QGWb3
	GuYtQiw6MN3aALKpKTyN6VgzGcOcAH6WroPBQ8oqXoI58gaWaeRPwRneRBw93CIz
	6k8wjXb1lFnwfYGWgoZG/eZ7pKRiT0/RpEN1U1TOdYn1OTJhE0zujbmOhIGErRlo
	9LvTyIp2DOA2Ld0IuFhQrKn1HK/Ds7AYD6H5t7v0uh2JX7Xtpa/bk4Dg6+h0zFHl
	b2P2E+cvSifQJDtURzS3psX6QlL5/xiKZLfadmUloMxbYYlTprHZ/7dH8oOAazld
	Q4H5saJTj5BCRY1ZQotsmdU+jXwc3YBRxzt23Utx7J5JUAoEZwDIaTEaLbuAbppL
	/xTPfA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8pg1c04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 01 Aug 2026 17:31:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so5307811a91.0
        for <linux-clk@vger.kernel.org>; Sat, 01 Aug 2026 10:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785605507; x=1786210307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O51Fgg2/ZbyK/CWM7sBEU1xDckvgir7LEKryAan0C8I=;
        b=dbp7xdN6XPKuICO/yl/Ai0VjvYk9rbl4NZHwaV54PXhwOCtO/UC/t9/8AxcJZwgn20
         +Pag8v4JFy7XFnUfQDG+qlaB8tl+MMOwus73C++0QOl6J5YRH+NyDqLA/3GgYg7kRa+o
         +JSaulJDVaIcM66uNZCLU4BjhpOVC9Q1IK4MdzpNfEyszKpMFsdje1NV251vb0hT7LVS
         bCo+SwG0IIJ8lSpUyif8wpxzQDuUl/KL29ZNq+uJXRVcpQzhRxn43fyexijULzTqC53x
         mUeFPgitrmeZPf8OklwHL8Vw+nr/q2YmwzK3N6rvK9pTc8Ge7UXfTq2y/TQiSTIIDFXL
         O5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785605507; x=1786210307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O51Fgg2/ZbyK/CWM7sBEU1xDckvgir7LEKryAan0C8I=;
        b=fupLrGAkFZk4Q4s+2FXFrVEz49OFoGf+ODcR8t/+lKH2fIxTuKY3OPK0YIUEJHR96v
         nSe2ho/tbbuhupB0hjfNoaa2i1KxYK/EucdGyx3zUqWZO+zIKMiqBPLgz+5tnuMxXr6m
         uI11mCSO7XOzKJbmsO6j1/0F0WxZQhD15DPsT0PaDqoVsvwCqOe+TkdjBbYoqOm3Jh9Q
         kQe9IyLY4uIXoxxBetFjYc8NE8Wm2TEoYpATLrfVCGgybERmJmppmuSOCly1rLfbp+9o
         +WuGAjpV4GUiMoYVTSfk4zVRPZGET+1kcm4ybl7/M0fOt0hRXOpkBYMJvLg3p2lJdETK
         TLLA==
X-Forwarded-Encrypted: i=1; AHgh+RrcIDGVFU++qWILK4x5sl/PizR0tLPTxaNLnXCPFgPStXGAzS73wXwI9DobZsv8W2BqiLmibdHrNc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWjf1nrUeBilLmZxqOCNeQrqgO3Bnl560Hjl7TM3gJbkhwGrBj
	6HjJ15bTo3qxggMZRwPN9fNsnYeiYAMQAg6OCbnfnJgvH0wSwMaTOOxV2gl3Vt6VaBY8m0KLwak
	frfBJxP/1W1pVJgeSlgupJHDG4Dv61kymHqxOM/Z6f+gf3bXh2FwEbsAQoMnTL8g=
X-Gm-Gg: AR+sD103rP+4aL/YmDhHrDVBDXK+EgMvm+XJ4LgX8uoIaWiKWEJ53LnuXVtP5DKWhBx
	3UnpBfJDMFiDv/7awz4h6Znrecv4Bzu53qfYmnMnI3IvTIBb7uIxIlr4GHGFc91I/r4TITAp2cv
	8GRY7eYndGeB54gAVBzKobXdjnLbcApis5geRi+JNT1fPLFWW6FXYihIj+IyDdoWcz60qvx++0Z
	XmJrw3FbrKPfWvFyEg3an+KvNtpW4Nvx+8UkZt5I+/9oImi8ulxsEfPXeEkCecPfkJXBc5ab6pk
	egmnCiAHa5FGtGovABrEou+HgTk9YguUGImr49OcF73b6WmhZPk3bleulHsnf/tupZV7MCvPusY
	40Xk1yo5VGiiPgw/tlo3OR9Bl
X-Received: by 2002:a17:90b:1b46:b0:387:e0db:3faa with SMTP id 98e67ed59e1d1-38fbc560f00mr3142331a91.35.1785605506653;
        Sat, 01 Aug 2026 10:31:46 -0700 (PDT)
X-Received: by 2002:a17:90b:1b46:b0:387:e0db:3faa with SMTP id 98e67ed59e1d1-38fbc560f00mr3142314a91.35.1785605506190;
        Sat, 01 Aug 2026 10:31:46 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e44bcsm21865553c88.12.2026.08.01.10.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 10:31:45 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 23:01:18 +0530
Subject: [PATCH 2/2] clk: qcom: gpucc-kaanapali: Mark the GPU CX GDSC as
 votable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-kaanapali-gpu-voteable-v1-2-fe804d24d2e9@oss.qualcomm.com>
References: <20260801-kaanapali-gpu-voteable-v1-0-fe804d24d2e9@oss.qualcomm.com>
In-Reply-To: <20260801-kaanapali-gpu-voteable-v1-0-fe804d24d2e9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: oxct346K45fdIwuzGUnztYexMZdsXmBl
X-Proofpoint-ORIG-GUID: oxct346K45fdIwuzGUnztYexMZdsXmBl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE0MSBTYWx0ZWRfXyeKya/1tYBcX
 Jvgsym24I7SNg+15k4lMgIOCFXEpvp/PdFmtQ+xMlsPL9gMoou+Fk922qLX2TTmsn2TvbneAaPn
 tnUUaNaLzHgcQF/Zu3cWb7ybxPnYoao=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE0MSBTYWx0ZWRfX6U78BXSPBeWl
 y9cPUOBst4ROxu0lamgBzKB4w2KE0tKlAqvXE8+aVU8HW996mkcxuOuC3Doaxk15Fihoa12+yPd
 D/60Pa01kYxA//1yvR0LjsTT7wKh4Hq2XvRSpgEjIn8bSyyeFcoC8dnurqWR4IQdBayFgs0Licg
 XP6QCh0N9OeqIHcfdjcN8YXlM7ky1N+oKTWEXUTGN1/fUFbF63Tv2YNtLwmck+49A7eJ6O6gu/x
 F4UKrMef2WjAl8j9rZSvD7v4TXq2rJkym0MxjxAMrtH8vnALaYctrZ0T6E7SQEOXDvqZbCyk6vk
 46Kl4Zouv5WXILXp0bOswbcKyj07JY1omBNh6RgF/HlUOEr0a3g9edsr706UOH6Z3vjRFU9YEuK
 8INec2KlJ7TY/ZG5z4xfkmjNI6bMJC9lyt/6/VIIBRLbAls+iT4mtA38zn/hSLxPKtCeQWNglOz
 J7GhouhwSJigqOhi/EQ==
X-Authority-Analysis: v=2.4 cv=U4Oiy+ru c=1 sm=1 tr=0 ts=6a6e2d83 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1GDNdKNvGV4VtvgizQsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010141

The GPU CX GDSC on Kaanapali is a votable power domain and hence
should not be polled for power-off status during GDSC disable. Also,
its power-on status should be read from the GDS hardware control
register.

Accommodate this by removing POLL_CFG_GDSCR and adding the VOTABLE
flag for the GPU CX GDSC, similar to other platforms (e.g. SM8750 and
Milos).

Fixes: 685ec348339b ("clk: qcom: Add support for GPUCC and GXCLK for Kaanapali")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-kaanapali.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-kaanapali.c b/drivers/clk/qcom/gpucc-kaanapali.c
index ae5563e516f6770adfcd52252a1712dde2c80b9a..f75f2caa2205c4720f7510c9226b4f91a5403d52 100644
--- a/drivers/clk/qcom/gpucc-kaanapali.c
+++ b/drivers/clk/qcom/gpucc-kaanapali.c
@@ -380,7 +380,7 @@ static struct gdsc gpu_cc_cx_gdsc = {
 		.name = "gpu_cc_cx_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.flags = RETAIN_FF_ENABLE | VOTABLE,
 };
 
 static struct clk_regmap *gpu_cc_kaanapali_clocks[] = {

-- 
2.34.1

